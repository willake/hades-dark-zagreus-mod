if not DarkZagreus.Config.Enabled then return end 

function DarkZagreusBowAI( enemy, currentRun )
    return DZAIDoBowAILoop( enemy, currentRun )
end

function DZAIDoBowAILoop(enemy, currentRun, targetId)
    local aiState = DZAIGetCurrentState(enemy)
    local actionData = DZAIMakeActionData(aiState, enemy.DZ.LastActions)

    -- select a weapon to use if not exist
    enemy.WeaponName = DZAISelectBowWeapon(enemy, actionData)
    
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
        
        -- define charge time
        local percentageCharged = DZAIMakeBowChargeTime()

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

        if weaponAIData.GiveupDistanceBasedOnCharge then
            local hasLineOfSight = HasLineOfSight({ Id = enemy.ObjectId, DestinationId = targetId, StopsProjectiles = true, StopsUnits = true, PreferAvoidUnits = false })
            local distance = GetDistance({ Id = enemy.ObjectId, DestinationId = targetId })

            local rangeMax = weaponAIData.Range * weaponAIData.ChargeRangeMultiplier
            local giveupDistance = percentageCharged * rangeMax
            
            if distance > giveupDistance or hasLineOfSight == false then
                return true
            end
        end

        -- Attack
		local attackSuccess = false

        while not attackSuccess do
            attackSuccess = DZAIDoBowAttackOnce( enemy, currentRun, targetId, weaponAIData, actionData, percentageCharged)

            if not attackSuccess then
				enemy.AINotifyName = "CanAttack"..enemy.ObjectId
				NotifyOnCanAttack({ Id = enemy.ObjectId, Notify = enemy.AINotifyName, Timeout = 9.0 })
				waitUntil( enemy.AINotifyName, enemy.AIThreadName )
			end
        end
    end

    return true
end

function DZAIDoBowAttackOnce(enemy, currentRun, targetId, weaponAIData, actionData, percentageCharged)
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

    if not DZAIFireBowWeapon( enemy, weaponAIData, currentRun, targetId, actionData, percentageCharged) then
        return false
    end
    
    return true
end


-- not sure how to best handle the bow charge, the changes of speed & velocity confused me
function DZAIFireBowWeapon(enemy, weaponAIData, currentRun, targetId, actionData, percentageCharged)

    if ReachedAIStageEnd(enemy) or currentRun.CurrentRoom.InStageTransition then
        weaponAIData.ForcedEarlyExit = true
        return true
    end

    if not CanAttack({ Id = enemy.ObjectId }) then
        return false
    end

    -- Prefire

    DZAIDoPreFire(enemy, weaponAIData, targetId)

    -- Prefire End

    -- Fire
    if weaponAIData.IsRangeBasedOnCharge then
        -- DZDebugPrintString("Charge: " .. tostring(actionData.ChargeTime))
        DZAIDoChargeDistanceFire(enemy, weaponAIData, targetId, percentageCharged)
    else
        DZAIDoRegularFire(enemy, weaponAIData, targetId)
    end

    enemy.DZ.LastActionTime = _worldTime
    -- save both which action is used and the charge time
    DZAIEnqueueLastAction(enemy, { Action = enemy.DZ.TempAction })

    -- Fire end

    if ReachedAIStageEnd(enemy) or currentRun.CurrentRoom.InStageTransition then
		weaponAIData.ForcedEarlyExit = true
		return true
	end

    return true
end

function DZAISelectBowWeapon(enemy, actionData)
    local total = actionData.Attack + actionData.ChargeAttack 
        + actionData.SpecialAttack + actionData.DashToward + actionData.DashAway + actionData.ManualReload
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

    -- use attack weapon
    -- if the last action is dash, do dash attack
    enemy.DZ.TempAction = 1
    
    if (lastAction.Action == 0 or lastAction.Action == 3) and _worldTime - enemy.DZ.LastActionTime < 0.3 then
        enemy.WeaponName = actionConfig.DashAttackWeapon
        enemy.ChainedWeapon = nil
        return enemy.WeaponName
    end

    -- do a regular attack
    enemy.WeaponName = actionConfig.PrimaryWeapon
    enemy.ChainedWeapon = nil
    return enemy.WeaponName
end

-- logic for deciding the charge time
function DZAIMakeBowChargeTime()
    return math.random(0.3, 1.0)
end