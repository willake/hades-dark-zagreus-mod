if not DarkZagreus.Config.Enabled then return end  

function DarkZagreusSwordAI( enemy, currentRun )
    return DZAIDoSwordAILoop( enemy, currentRun )
end

function DZAIDoSwordAILoop(enemy, currentRun, targetId)
    local aiState = DZAIGetCurrentState(enemy)
    local actionData = DZAIMakeActionData(aiState, enemy.DZ.LastActions)

    -- select a weapon to use if not exist
    enemy.WeaponName = DZAISelectSwordWeapon(enemy, actionData)

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

        -- Attack
		local attackSuccess = false

        while not attackSuccess do
            attackSuccess = DZAIDoSwordAttackOnce( enemy, currentRun, targetId, weaponAIData, actionData )

            if not attackSuccess then
				enemy.AINotifyName = "CanAttack"..enemy.ObjectId
				NotifyOnCanAttack({ Id = enemy.ObjectId, Notify = enemy.AINotifyName, Timeout = 9.0 })
				waitUntil( enemy.AINotifyName, enemy.AIThreadName )
			end
        end
    end

    return true
end

function DZAIDoSwordAttackOnce(enemy, currentRun, targetId, weaponAIData, actionData)
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

    if not DZAIFireSwordWeapon( enemy, weaponAIData, currentRun, targetId, actionData ) then
        return false
    end
    
    return true
end

function DZAIFireSwordWeapon(enemy, weaponAIData, currentRun, targetId, actionData)

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

    -- if not CanAttack({ Id = enemy.ObjectId }) then
    --     return false
    -- end

    -- Fire
    
    DZAIDoRegularFire(enemy, weaponAIData, targetId)

    -- Fire end

    -- AspectofArthur will fire an area after special attack
    if weaponAIData.PostFireWeapon ~= nil then
        local postFireWeaponAIData = 
            DZAIGetWeaponAIData(enemy, weaponAIData.PostFireWeapon)

        DZAIDoRegularFire(enemy, postFireWeaponAIData, targetId)
    end

    enemy.DZ.LastActionTime = _worldTime
    -- save both which action is used and the charge time
    DZAIEnqueueLastAction(enemy, { Action = enemy.DZ.TempAction })

    if ReachedAIStageEnd(enemy) or currentRun.CurrentRoom.InStageTransition then
		weaponAIData.ForcedEarlyExit = true
		return true
	end

    return true
end

function DZAISelectSwordWeapon(enemy, actionData)
    local total = 
        actionData.Attack + actionData.SpecialAttack 
        + actionData.DashToward + actionData.DashAway + actionData.ManualReload
    local r = math.random() * total
    
    enemy.DZ.TempAction = 0
    enemy.DZ.FireTowardTarget = true
    local lastAction = DZAIGetLastAction(enemy)
    local lastActionTime = enemy.DZ.LastActionTime

    -- use special attack
    if r < actionData.SpecialAttack then
        enemy.DZ.TempAction = 2
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
    -- I'll treat attack and charge attack the same in this domain
    enemy.DZ.TempAction = 1

    -- if the last action is dash, do dash attack
    if (lastAction.Action == 0 or lastAction.Action == 3) and _worldTime - lastActionTime < 0.3 then
        enemy.WeaponName = enemy.DashAttackWeapon
        enemy.ChainedWeapon = nil
        return enemy.WeaponName
    end

    -- if the last action is also attack, do weapon combo
    if lastAction.Action == 1 then
        if enemy.ChainedWeapon ~= nil and _worldTime - lastActionTime < 0.3 then
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