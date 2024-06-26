if not DarkZagreus.Config.Enabled then return end 

function DarkZagreusGunAI( enemy, currentRun )
    enemy.DZ.ShouldPreWarm = false
    return DZAIDoGunAILoop( enemy, currentRun )
end

-- The engine code covers ammo management already, i don't wanna mess it up
-- so maybe no manual reload in this code 

function DZAIDoGunAILoop(enemy, currentRun, targetId)
    local aiState = DZAIGetCurrentState(enemy)
    local actionData = DZAIMakeActionData(aiState, enemy.DZ.LastActions)

    -- select a weapon to use if not exist
    enemy.WeaponName = DZAISelectGunWeapon(enemy, actionData)
    
    if enemy.WeaponName == nil then
        return true -- continue to next action
    end

    if DZTemp.AI.Reloading then
        return true
    end
    -- DebugAssert({ Condition = enemy.WeaponName ~= nil, Text = "Enemy has no weapon!" })
    
    -- table.insert(enemy.WeaponHistory, enemy.WeaponName)

	local weaponAIData = GetWeaponAIData(enemy)

    -- pass ChainedWeapon to enemy object
    if weaponAIData.ChainedWeapon ~= nil then
		enemy.ChainedWeapon = weaponAIData.ChainedWeapon
	end

    -- use original getTargetId function to get target
    if targetId == nil then
		targetId = GetTargetId(enemy, weaponAIData)
	end

    -- if there is a target
    if targetId ~= nil and targetId ~= 0 then

        -- do manual reload here so the AI can reload while walking
        if enemy.DZ.TempAction == 5 then
            DZAIManualReload(enemy)

            enemy.DZ.LastActionTime = _worldTime
            -- save both which action is used and the charge time
            DZAIEnqueueLastAction(enemy, { Action = enemy.DZ.TempAction })
            return true
        end
    
        -- Movement
        if not weaponAIData.SkipMovement then
			local didTimeout = DZAIDoMove( enemy, currentRun, targetId, weaponAIData, actionData, 0)

			if didTimeout and weaponAIData.SkipAttackAfterMoveTimeout then
				return true
			end
		end

        if weaponAIData.GiveupDistance then
            local hasLineOfSight = HasLineOfSight({ Id = enemy.ObjectId, DestinationId = targetId, StopsProjectiles = true, StopsUnits = true, PreferAvoidUnits = false })
            local distance = GetDistance({ Id = enemy.ObjectId, DestinationId = targetId })
            
            if distance > weaponAIData.GiveupDistance or hasLineOfSight == false then
                return true
            end
        end

        -- Attack
		local attackSuccess = false

        while not attackSuccess do
            attackSuccess = DZAIDoGunAttackOnce( enemy, currentRun, targetId, weaponAIData, actionData )
            
            if not attackSuccess then
				enemy.AINotifyName = "CanAttack"..enemy.ObjectId
				NotifyOnCanAttack({ Id = enemy.ObjectId, Notify = enemy.AINotifyName, Timeout = 5.0 })
				waitUntil( enemy.AINotifyName, enemy.AIThreadName )
			end
            
            if DZTemp.AI.Ammo <= 0 then
                DZAIReloadGun(enemy)
            end
        end
    end

    return true
end

function DZAIDoGunAttackOnce(enemy, currentRun, targetId, weaponAIData, actionData)
    if targetId == nil then
        targetId = currentRun.Hero.ObjectId
    end
    weaponAIData.LastTargetId = targetId

    if weaponAIData == nil then
        weaponAIData = enemy
    end

    -- PRE ATTACK

    if not CanAttack({ Id = enemy.ObjectId }) then
		return false
	end

    -- Stop({ Id = enemy.ObjectId })

    -- don't know what does it do but better just keep it
    if weaponAIData.TrackKillSteal then
		currentRun.Hero.KillStolenFromId = enemy.ObjectId
		currentRun.Hero.KillStealVictimId = targetId
	end

    if weaponAIData.AngleTowardTarget then
		AngleTowardTarget({ Id = enemy.ObjectId, DestinationId = targetId })

		if not weaponAIData.SkipAngleTowardTargetWait then
			enemy.AINotifyName = "WaitForRotation"..enemy.ObjectId
			NotifyOnRotationComplete({ Id = enemy.ObjectId, Cosmetic = true, Notify = enemy.AINotifyName, Timeout = 9.0 })
			waitUntil( enemy.AINotifyName, enemy.AIThreadName )
		end
	end

    -- PRE ATTACK END

    -- ATTACK

    -- if not CanAttack({ Id = enemy.ObjectId }) then
	-- 	return false
	-- end

    if not DZAIFireGunWeapon( enemy, weaponAIData, currentRun, targetId, actionData ) then
        return false
    end

    return true
end

function DZAIFireGunWeapon(enemy, weaponAIData, currentRun, targetId, actionData)

    if ReachedAIStageEnd(enemy) or currentRun.CurrentRoom.InStageTransition then
        weaponAIData.ForcedEarlyExit = true
        return true
    end

    -- if not CanAttack({ Id = enemy.ObjectId }) then
    --     return false
    -- end

    if weaponAIData.AIAngleTowardsPlayerWhileFiring then
        AngleTowardTarget({ Id = enemy.ObjectId, DestinationId = targetId })
    end

    -- Prefire

    -- Aspect of Lucifer has a prewarm when first fire the weapon
    if weaponAIData.NeedPreWarm then

        if enemy.DZ.ShouldPreWarm then
            if weaponAIData.PreWarmAnimation then
                SetAnimation({ DestinationId = enemy.ObjectId, Name = weaponAIData.PreWarmAnimation })
            end
    
            if weaponAIData.PreWarmDuration then
                wait( weaponAIData.PreWarmDuration, enemy.AIThreadName )
            end 
        end
    else
        DZAIDoPreFire(enemy, weaponAIData, targetId)
    end

    -- Prefire End

    if not CanAttack({ Id = enemy.ObjectId }) then
        return false
    end

    -- Fire
    
    DZAIDoRegularFire(enemy, weaponAIData, targetId)

    enemy.DZ.LastActionTime = _worldTime
    -- save both which action is used and the charge time
    DZAIEnqueueLastAction(enemy, { Action = enemy.DZ.TempAction })

    if enemy.DZ.TempAction == 1 and DZTemp.AI.HasPowerShot then
        DZTemp.AI.HasPowerShot = false
        ClearEffect({ Id = enemy.ObjectId, Name = "DZManualReloadBonus" })
    end

    if enemy.DZ.TempAction == 1 then
        DZTemp.AI.Ammo = DZTemp.AI.Ammo - 1
    end

    -- Fire end

    -- if not CanAttack({ Id = enemy.ObjectId }) then
    --     return false
    -- end

    -- if ReachedAIStageEnd(enemy) or currentRun.CurrentRoom.InStageTransition then
	-- 	weaponAIData.ForcedEarlyExit = true
	-- 	return true
	-- end

    -- Stop({ Id = enemy.ObjectId })

    if ReachedAIStageEnd(enemy) or currentRun.CurrentRoom.InStageTransition then
		weaponAIData.ForcedEarlyExit = true
		return true
	end

    return true
end

function DZAISelectGunWeapon(enemy, actionData)
    local total = actionData.Attack + actionData.ChargeAttack 
        + actionData.SpecialAttack + actionData.DashToward + actionData.DashAway + actionData.ManualReload
    local r = math.random() * total
    -- init combo weapon to nil
    -- enemy.PostAttackChargeWeapon = nil
    -- use attack weapon
    enemy.DZ.TempAction = 0
    enemy.DZ.FireTowardTarget = true
    enemy.DZ.ShouldPreWarm = false
    enemy.ChainedWeapon = nil

    local lastAction = DZAIGetLastAction(enemy)
    local actionConfig = enemy.DZActionConfig

    -- use special attack
    if r < actionData.SpecialAttack then
        enemy.DZ.TempAction = 2
        enemy.WeaponName = actionConfig.SpecialAttackWeapon
        return enemy.WeaponName
    end

    -- use dash
    if r < actionData.SpecialAttack + actionData.DashToward then
        enemy.DZ.TempAction = 0
        enemy.WeaponName = actionConfig.DashWeapon
        return enemy.WeaponName
    end

    if r < actionData.SpecialAttack + actionData.DashToward + actionData.DashAway then
        enemy.DZ.TempAction = 3
        enemy.WeaponName = actionConfig.DashWeapon
        enemy.DZ.FireTowardTarget = false
        return enemy.WeaponName
    end

    if r < actionData.SpecialAttack + actionData.DashToward + actionData.DashAway + actionData.ManualReload then
        enemy.DZ.TempAction = 5
        enemy.WeaponName = actionConfig.ReloadWeapon
        return enemy.WeaponName
    end

    -- attack 
    enemy.DZ.TempAction = 1

    if lastAction.Action ~= 1 then
        enemy.DZ.ShouldPreWarm = true
    end

    -- if the last action is dash, do dash attack
    if (lastAction.Action == 0 or lastAction.Action == 3) and _worldTime - enemy.DZ.LastActionTime < 0.45 then

        if DZTemp.AI.HasPowerShot then
            enemy.WeaponName = actionConfig.DashAttackPowerWeapon
            return enemy.WeaponName    
        end

        enemy.WeaponName = actionConfig.DashAttackWeapon
        return enemy.WeaponName
    end

    -- or just do a regular attack

    if DZTemp.AI.HasPowerShot then
        enemy.WeaponName = actionConfig.PrimaryPowerWeapon
        return enemy.WeaponName    
    end

    enemy.WeaponName = actionConfig.PrimaryWeapon
    return enemy.WeaponName
end

function DZAIReloadGun(enemy)
    -- if SetThreadWait( "ReloadGun" .. enemy.ObjectId, weaponData.ActiveReloadTime ) then
	-- 	return
	-- end
    -- DZTemp.AI.Reloading = true
    local weaponData = GetWeaponData( enemy, enemy.PrimaryWeapon )

    if weaponData == nil then
        return
    end

    -- SharedAmmoWeapon is not working, so I can only handle ammo by myself
	RunWeaponMethod({ Id = enemy.ObjectId, Weapon = enemy.PrimaryWeapon, Method = "EmptyAmmo" })
    RunWeaponMethod({ Id = enemy.ObjectId, Weapon = enemy.DashAttackWeapon, Method = "EmptyAmmo" })
    if enemy.PrimaryPowerWeapon then
        RunWeaponMethod({ Id = enemy.ObjectId, Weapon = enemy.PrimaryPowerWeapon, Method = "EmptyAmmo" }) 
    end
    if enemy.DashAttackPowerWeapon then
        RunWeaponMethod({ Id = enemy.ObjectId, Weapon = enemy.DashAttackPowerWeapon, Method = "EmptyAmmo" }) 
    end
    DZAIReloadPresentationStart( enemy, weaponData, presentationState )
    wait(weaponData.ActiveReloadTime, enemy.AIThreadName)
    if enemy.HandlingDeath then
        return false
    end
    DZAIReloadPresentationComplete( enemy, weaponData, presentationState )
    RunWeaponMethod({ Id = enemy.ObjectId, Weapon = enemy.PrimaryWeapon, Method = "RefillAmmo" })
    RunWeaponMethod({ Id = enemy.ObjectId, Weapon = enemy.DashAttackWeapon, Method = "RefillAmmo" })
    if enemy.PrimaryPowerWeapon then
        RunWeaponMethod({ Id = enemy.ObjectId, Weapon = enemy.PrimaryPowerWeapon, Method = "RefillAmmo" }) 
    end
    if enemy.DashAttackPowerWeapon then
        RunWeaponMethod({ Id = enemy.ObjectId, Weapon = enemy.DashAttackPowerWeapon, Method = "RefillAmmo" }) 
    end
    DZTemp.AI.Ammo = enemy.DZActionConfig.MaxAmmo
    DZTemp.AI.Reloading = false
    return true
end

function DZAIManualReload( enemy )
	local weaponData = GetWeaponData( enemy, enemy.PrimaryWeapon )
    if weaponData ~= nil and weaponData.ActiveReloadTime ~= nil then
        if enemy.Reloading then
            return
        end

        local weapon = DZTemp.AI.Weapon

        if DZTemp.AI.Ammo == enemy.DZActionConfig.MaxAmmo then
            -- aspect of hestia can reload whenever
            if weapon and (weapon.WeaponName ~= "GunWeapon" or weapon.ItemIndex ~= 3) then
                return
            end 
        end

        DZAIReloadGun( enemy )

        if weapon and weapon.WeaponName == "GunWeapon" and weapon.ItemIndex == 3 then
            EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DZManualReloadEffectApplicator" })
            ApplyEffectFromWeapon({ Id = enemy.ObjectId, DestinationId = enemy.ObjectId, WeaponName = "DZManualReloadEffectApplicator", EffectName = "DZManualReloadBonus" })
        end

        return
    end
end