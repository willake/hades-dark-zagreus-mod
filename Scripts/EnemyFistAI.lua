if not DarkZagreus.Config.Enabled then return end 

function DarkZagreusFistAI( enemy, currentRun )
    enemy.ComboThreshold = 12 -- for AspectofDemeter
    return DZAIDoFistAILoop( enemy, currentRun )
end

function DZAIDoFistAILoop(enemy, currentRun, targetId)
    local aiState = DZAIGetCurrentState(enemy)
    local actionData = DZAIMakeActionData(aiState, enemy.DZ.LastActions)

    -- select a weapon to use if not exist
    enemy.WeaponName = DZAISelectFistWeapon(enemy, actionData)
    
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
            attackSuccess = DZAIDoFistAttackOnce( enemy, currentRun, targetId, weaponAIData, actionData )

            if not attackSuccess then
                DZDebugPrintString("Attack failed. Gonna try again.")
				enemy.AINotifyName = "CanAttack"..enemy.ObjectId
				NotifyOnCanAttack({ Id = enemy.ObjectId, Notify = enemy.AINotifyName, Timeout = 9.0 })
				waitUntil( enemy.AINotifyName, enemy.AIThreadName )
			end
        end
    end

    return true
end

function DZAIDoFistAttackOnce(enemy, currentRun, targetId, weaponAIData, actionData)
    if targetId == nil then
        targetId = currentRun.Hero.ObjectId
    end
    weaponAIData.LastTargetId = targetId

    if weaponAIData == nil then
        weaponAIData = enemy
    end

    -- PRE ATTACK

    -- if not CanAttack({ Id = enemy.ObjectId }) then
	-- 	return false
	-- end

    Stop({ Id = enemy.ObjectId })

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
			waitUntil( enemy.AINotifyName, enemy.AIThreadName )
		end
	end

    -- PRE ATTACK END

    -- ATTACK

    -- if not CanAttack({ Id = enemy.ObjectId }) then
	-- 	return false
	-- end

    if not DZAIFireFistWeapon( enemy, weaponAIData, currentRun, targetId, actionData ) then
        return false
    end
    
    return true
end

function DZAIFireFistWeapon(enemy, weaponAIData, currentRun, targetId, actionData)

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

    DZAIDoPreFire(enemy, weaponAIData, targetId)

    -- Prefire End

    -- if not CanAttack({ Id = enemy.ObjectId }) then
    --     return false
    -- end

    -- Fire
    
    DZAIDoRegularFire(enemy, weaponAIData, targetId)

    -- aspect of talos has special rush weapon
    if enemy.DZ.TempAction == 0 and weaponAIData.AddRush then
        local dashData = weaponAIData.AddRush
        local dashFunction = _G[dashData.FunctionName]
        if dashFunction ~= nil then
            thread( dashFunction, enemy, dashData.FunctionArgs )
        end
    end

    enemy.DZ.LastActionTime = _worldTime
    -- save both which action is used and the charge time
    DZAIEnqueueLastAction(enemy, { Action = enemy.DZ.TempAction })

    -- for AspectofDemeter
    -- the original implementation is only available for player
    -- so I implement it here
    if weaponAIData.CheckComboPowerReset then
        -- local sourceWeaponData = GetWeaponData( attacker, weaponAIData.WeaponName )
        DZAICheckComboPowerReset(enemy, weaponAIData)
    end

    -- Fire end

    if weaponAIData.Cooldown then
        wait(weaponAIData.Cooldown, enemy.AIThreadName)
    end

    if ReachedAIStageEnd(enemy) or currentRun.CurrentRoom.InStageTransition then
		weaponAIData.ForcedEarlyExit = true
		return true
	end

    return true
end

function DZAISelectFistWeapon(enemy, actionData)
    local total = actionData.Attack + actionData.ChargeAttack 
        + actionData.SpecialAttack + actionData.DashToward + actionData.DashAway + actionData.ManualReload
    local r = math.random() * total
    -- init combo weapon to nil
    -- enemy.PostAttackChargeWeapon = nil
    enemy.DZ.TempAction = 0
    enemy.DZ.FireTowardTarget = true

    local lastAction = DZAIGetLastAction(enemy)

    -- use special attack
    if r < actionData.SpecialAttack then
        enemy.DZ.TempAction = 2

        -- fist weapon special has dash attack version
        if (lastAction.Action == 0 or lastAction.Action == 3) and _worldTime - enemy.DZ.LastActionTime < 0.3 then
            enemy.WeaponName = enemy.SpecialDashAttackWeapon
            enemy.ChainedWeapon = nil
            return enemy.WeaponName
        end

        enemy.WeaponName = enemy.SpecialAttackWeapon
        enemy.ChainedWeapon = nil
        return enemy.WeaponName
    end

    -- use dash
    if r < actionData.SpecialAttack + actionData.DashToward then
        enemy.DZ.TempAction = 0
        enemy.WeaponName = enemy.DashWeapon
        enemy.ChainedWeapon = nil
        return enemy.WeaponName
    end

    if r < actionData.SpecialAttack + actionData.DashToward + actionData.DashAway then
        enemy.DZ.TempAction = 3
        enemy.WeaponName = enemy.DashWeapon
        enemy.ChainedWeapon = nil
        enemy.DZ.FireTowardTarget = false
        return enemy.WeaponName
    end

    -- use attack weapon
    enemy.DZ.TempAction = 1

    -- if the last action is dash, do dash attack
    if (lastAction.Action == 0 or lastAction.Action == 3) and _worldTime - enemy.DZ.LastActionTime < 0.3 then
        enemy.WeaponName = enemy.DashAttackWeapon
        enemy.ChainedWeapon = nil
        return enemy.WeaponName
    end

    -- if the last action is also attack, do weapon combo
    if lastAction.Action == 1 then
        if enemy.ChainedWeapon ~= nil and _worldTime - enemy.DZ.LastActionTime < 0.3 then
            enemy.WeaponName = enemy.ChainedWeapon
            enemy.ChainedWeapon = nil
            return enemy.WeaponName
        end
    end

    -- or just do a regular attack
    enemy.WeaponName = enemy.PrimaryWeapon
    enemy.ChainedWeapon = nil
    return enemy.WeaponName
end