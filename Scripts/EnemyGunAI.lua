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

    DZDebugPrintString(string.format("Decision is made %d", enemy.DZ.TempAction))
    
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
            return true
        end
    
        -- Movement
        if not weaponAIData.SkipMovement then
			local didTimeout = DZAIDoMove( enemy, currentRun, targetId, weaponAIData, actionData, 0)

			if didTimeout and weaponAIData.SkipAttackAfterMoveTimeout then
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

    if weaponAIData.SkipAngleTowardTarget then
		--DZDebugPrintString("Skipping default AngleTowardTarget")
	else
		AngleTowardTarget({ Id = enemy.ObjectId, DestinationId = targetId })

		if not weaponAIData.SkipAngleTowardTargetWait then
			enemy.AINotifyName = "WaitForRotation"..enemy.ObjectId
			NotifyOnRotationComplete({ Id = enemy.ObjectId, Cosmetic = true, Notify = enemy.AINotifyName, Timeout = 9.0 })
			waitUntil( enemy.AINotifyName )
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

    DZDebugPrintString("FireWeapon")
    
    DZAIDoRegularFire(enemy, weaponAIData, targetId)

    DZDebugPrintString("End")

    enemy.DZ.LastActionTime = _worldTime
    -- save both which action is used and the charge time
    DZAIEnqueueLastAction(enemy, { Action = enemy.DZ.TempAction })

    if DZTemp.AI.NextIsPowerShot then
        DZTemp.AI.NextIsPowerShot = false
        ClearEffect({ Id = enemy.ObjectId, Name = "DZManualReloadBonus" })
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

    -- use special attack
    if r < actionData.SpecialAttack then
        enemy.DZ.TempAction = 2
        enemy.WeaponName = enemy.SpecialAttackWeapon
        return enemy.WeaponName
    end

    -- use dash
    if r < actionData.SpecialAttack + actionData.DashToward then
        enemy.DZ.TempAction = 0
        enemy.WeaponName = enemy.DashWeapon
        return enemy.WeaponName
    end

    if r < actionData.SpecialAttack + actionData.DashToward + actionData.DashAway then
        enemy.DZ.TempAction = 3
        enemy.WeaponName = enemy.DashWeapon
        enemy.DZ.FireTowardTarget = false
        return enemy.WeaponName
    end

    if r < actionData.SpecialAttack + actionData.DashToward + actionData.DashAway + actionData.ManualReload then
        enemy.DZ.TempAction = 5
        enemy.WeaponName = enemy.ReloadWeapon
        return enemy.WeaponName
    end

    -- attack 
    enemy.DZ.TempAction = 1

    if lastAction.Action ~= 1 then
        enemy.DZ.ShouldPreWarm = true
    end

    -- if the last action is dash, do dash attack
    if (lastAction.Action == 0 or lastAction.Action == 3) and _worldTime - enemy.DZ.LastActionTime < 0.45 then

        if DZTemp.AI.NextIsPowerShot then
            enemy.WeaponName = enemy.DashAttackPowerWeapon
            return enemy.WeaponName    
        end

        enemy.WeaponName = enemy.DashAttackWeapon
        return enemy.WeaponName
    end

    -- or just do a regular attack

    if DZTemp.AI.NextIsPowerShot then
        enemy.WeaponName = enemy.PrimaryPowerWeapon
        return enemy.WeaponName    
    end

    enemy.WeaponName = enemy.PrimaryWeapon
    return enemy.WeaponName
end