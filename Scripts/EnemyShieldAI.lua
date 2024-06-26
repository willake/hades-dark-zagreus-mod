if not DarkZagreus.Config.Enabled then return end 

function DarkZagreusShieldAI( enemy, currentRun )
    return DZAIDoShieldAILoop( enemy, currentRun )
end

function DZAIDoShieldAILoop(enemy, currentRun, targetId)
    local aiState = DZAIGetCurrentState(enemy)
    local actionData = DZAIMakeActionData(aiState, enemy.DZ.LastActions)

    -- select a weapon to use if not exist
    enemy.WeaponName = DZAISelectShieldWeapon(enemy, actionData)

    if enemy.WeaponName == nil then
        return true -- continue to next action
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

        local percentageCharged = DZAIMakeShieldChargeTime(enemy.DZ.TempAction)
        
        -- Movement
        if not weaponAIData.SkipMovement then
			local didTimeout = DZAIDoMove( enemy, currentRun, targetId, weaponAIData, actionData, percentageCharged)

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
            attackSuccess = DZAIDoShieldAttackOnce( enemy, currentRun, targetId, weaponAIData, actionData, percentageCharged)

            if not attackSuccess then
				enemy.AINotifyName = "CanAttack"..enemy.ObjectId
				NotifyOnCanAttack({ Id = enemy.ObjectId, Notify = enemy.AINotifyName, Timeout = 9.0 })
				waitUntil( enemy.AINotifyName, enemy.AIThreadName )
			end
        end
    end

    return true
end

function DZAIDoShieldAttackOnce(enemy, currentRun, targetId, weaponAIData, actionData, percentageCharged)
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

    Stop({ Id = enemy.ObjectId })

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

    if not CanAttack({ Id = enemy.ObjectId }) then
		return false
	end

    if not DZAIFireShieldWeapon( enemy, weaponAIData, currentRun, targetId, actionData, percentageCharged) then
        return false
    end

    return true
end

function DZAIFireShieldWeapon(enemy, weaponAIData, currentRun, targetId, actionData, percentageCharged)
    local chargeTime = 0.0

    if weaponAIData.PostFireChargeStages ~= nil then
        chargeTime = percentageCharged * weaponAIData.MaxChargeTime
        -- DZDebugPrintString("Set chargeTime to " .. chargeTime)
    end

    if ReachedAIStageEnd(enemy) or currentRun.CurrentRoom.InStageTransition then
        weaponAIData.ForcedEarlyExit = true
        return true
    end

    if not CanAttack({ Id = enemy.ObjectId }) then
        return false
    end

    if weaponAIData.AIAngleTowardsPlayerWhileFiring then
        AngleTowardTarget({ Id = enemy.ObjectId, DestinationId = targetId })
    end

    -- Prefire

    DZAIDoPreFire(enemy, weaponAIData, targetId)

    -- Prefire End

    if not CanAttack({ Id = enemy.ObjectId }) then
        return false
    end

    -- Fire
    
    if weaponAIData.IsZeusShieldThrow and ProjectileExists({ Names = { "DarkZeusShieldThrow" }}) then
        -- try return the shield
        RunWeaponMethod(
            { Id = enemy.ObjectId, Weapon = weaponAIData.WeaponName, Method = "RecallProjectiles" })
    else
        DZAIDoRegularFire(enemy, weaponAIData, targetId)
    end

    -- Fire end

    -- shield will fire a rush weapon after primary attack
    if weaponAIData.PostFireChargeWeapon ~= nil then
        local postFireWeaponAIData = 
            DZAIGetWeaponAIData(enemy, weaponAIData.PostFireChargeWeapon)

        DZAIDoPreFire(enemy, postFireWeaponAIData, targetId)

        DZAIDoChargeDistanceFire(enemy, postFireWeaponAIData, targetId, percentageCharged)
    end

    enemy.DZ.LastActionTime = _worldTime
    -- save both which action is used and the charge time
    DZAIEnqueueLastAction(enemy, { Action = enemy.DZ.TempAction })

    if enemy.DZ.TempAction == 4 then
        if DZTemp.AI.Weapon.ItemIndex == 2 then
			FireWeaponFromUnit({ Weapon = "DZShieldThrowProjectileBonusApplicator", Id = enemy.ObjectId, DestinationId = enemy.ObjectId })
		end
    end

    if ReachedAIStageEnd(enemy) or currentRun.CurrentRoom.InStageTransition then
		weaponAIData.ForcedEarlyExit = true
		return true
	end

    return true
end

function DZAISelectShieldWeapon(enemy, actionData)
    local total = actionData.Attack + actionData.SpecialAttack 
        + actionData.DashToward + actionData.DashAway + actionData.ManualReload
    local r = math.random() * total
    -- init combo weapon to nil
    -- enemy.PostAttackChargeWeapon = nil
    enemy.DZ.TempAction = 0
    enemy.DZ.FireTowardTarget = true

    local lastAction = DZAIGetLastAction(enemy)
    local actionConfig = enemy.DZActionConfig

    -- use special attack
    if r < actionData.SpecialAttack then
        enemy.DZ.TempAction = 2
        enemy.WeaponName = actionConfig.SpecialAttackWeapon
        enemy.ChainedWeapon = nil
        return enemy.WeaponName
    end

    -- use dash
    if r < actionData.SpecialAttack + actionData.DashToward then
        enemy.DZ.TempAction = 0
        enemy.WeaponName = actionConfig.DashWeapon
        enemy.ChainedWeapon = nil
        return enemy.WeaponName
    end

    if r < actionData.SpecialAttack + actionData.DashToward + actionData.DashAway then
        enemy.DZ.TempAction = 3
        enemy.WeaponName = actionConfig.DashWeapon
        enemy.ChainedWeapon = nil
        enemy.DZ.FireTowardTarget = false
        return enemy.WeaponName
    end

    if r < actionData.SpecialAttack + actionData.DashToward + actionData.DashAway + actionData.ChargeAttack then

        enemy.DZ.TempAction = 4

        -- if the last action is dash, do dash attack
        if (lastAction.Action == 0 or lastAction.Action == 3) and _worldTime - enemy.DZ.LastActionTime < 0.3 then
            enemy.WeaponName = actionConfig.DashAttackWeapon
            enemy.ChainedWeapon = nil
            return enemy.WeaponName
        end

        -- or just do a regular attack
        enemy.WeaponName = actionConfig.PrimaryWeapon
        enemy.ChainedWeapon = nil
        return enemy.WeaponName
    end

    -- use attack weapon
    enemy.DZ.TempAction = 1

    -- if the last action is dash, do dash attack
    if (lastAction.Action == 0 or lastAction.Action == 3) and _worldTime - enemy.DZ.LastActionTime < 0.3 then
        enemy.WeaponName = actionConfig.DashAttackWeapon
        enemy.ChainedWeapon = nil
        return enemy.WeaponName
    end

    -- or just do a regular attack
    enemy.WeaponName = actionConfig.PrimaryWeapon
    enemy.ChainedWeapon = nil
    return enemy.WeaponName
end

-- logic for deciding the charge time
function DZAIMakeShieldChargeTime(action)

    if action == 4 then -- charge attack
        local r = math.random()

        -- higer chance to do small charge, low chance do full charge
        if r < 0.7 then
            return 0.33 + math.random() * 0.33
        elseif r < 0.9 then
            return 0.66 + math.random() * 0.22
        else
            return 0.88 + math.random() * 0.12
        end
    end

    -- else, like charge special attack
    return 0.0
end