function DarkZagreusFistAI( enemy, currentRun )
    enemy.AIState = {
        OwnHP = 100,
        ClosestEnemyHP = 100,
        Distance = 0.5,
        IsLastActionAttack = 0,
        IsLastActionSpectialAttack = 0,
        IsLastActionDash = 0,
        IsLastActionDashAttack = 0,
        IsLastActionCast = 0,
        LastActionTime = 0
    }
    enemy.LastAction = ""
    while IsAIActive( enemy, currentRun ) do
		local continue = DoFistAILoop( enemy, currentRun )
		if not continue then
			return
		end
	end
end

function DoFistAILoop(enemy, currentRun, targetId)
    local actionData = GetAIActionData(enemy.AIState)

    -- select a weapon to use if not exist
    enemy.WeaponName = SelectFistWeapon(enemy, actionData)
    DebugAssert({ Condition = enemy.WeaponName ~= nil, Text = "Enemy has no weapon!" })
    table.insert(enemy.WeaponHistory, enemy.WeaponName)

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
			local didTimeout = DoDarkZagreusMove( enemy, currentRun, targetId, weaponAIData, actionData )

			if didTimeout and weaponAIData.SkipAttackAfterMoveTimeout then
				return true
			end
		end

        if enemy.WeaponName == nil then
            return true
        end

        -- Attack
		local attackSuccess = false

        while not attackSuccess do
            attackSuccess = DoFistAIAttackOnce( enemy, currentRun, targetId, weaponAIData, actionData )

            if not attackSuccess then
                DebugPrintf({ Text = "Attack failed. Gonna try again."})
				enemy.AINotifyName = "CanAttack"..enemy.ObjectId
				NotifyOnCanAttack({ Id = enemy.ObjectId, Notify = enemy.AINotifyName, Timeout = 9.0 })
				waitUntil( enemy.AINotifyName )
			end
        end
    end

    return true
end

function DoFistAIAttackOnce(enemy, currentRun, targetId, weaponAIData, actionData)
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

    if weaponAIData.SkipAngleTowardTarget then
		--DebugPrint({ Text = "Skipping default AngleTowardTarget" })
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

    if not CanAttack({ Id = enemy.ObjectId }) then
		return false
	end

    if not FireFistWeapon( enemy, weaponAIData, currentRun, targetId, actionData ) then
        return false
    end
    enemy.AIState.LastActionTime = _worldTime
    SetLastActionOnAIState(enemy)

    local distanceToTarget = GetDistance({ Id = enemy.ObjectId, DestinationId = targetId })
    
    return true
end

function FireFistWeapon(enemy, weaponAIData, currentRun, targetId, actionData)
    local fireTicks = 1

    -- use the chargeTime to interpolate the combo counts
    -- chargeTime in this situation is how long the player hold the button
    -- it can high than 1
    if weaponAIData.CanDoCombo and actionData.ChargeTime > 0.0 then
 
        -- calculate how many times will this action finish a combo 
        -- the purpose of this calculation is to consider the cooldown time after DarkFist5
        -- i know it's kinda dumb but this is the only way i can think of now
        local remainTime = actionData.ChargeTime
        local finishComboTimes = 0
        if weaponAIData.IsStartFromFistDash and remainTime > 1.2 then
            remainTime = remainTime - 1.2
            finishComboTimes = 1
            -- if start with DarkFistDash, the first combo takes 1.2 sec to finish whole combo
            -- from DarkFistDash to DarkFist5, 0.2 attack duration per action
            -- following by normal combos
        else
            -- if start with DarkFist, it takes 1 sec to finish whole combo
            -- from DarkFist to DarkFist5, 0.2 attack duration per action
            remainTime = remainTime - 1
            finishComboTimes = 1
        end

        local finishComboTimes = finishComboTimes + math.floor(remainTime / 1)
        local totalCooldownTime = finishComboTimes * 0.5 -- cooldown time is 0.5
        DebugPrintf({ Text = "Will finish combo " .. finishComboTimes .. " times"})

        fireTicks = math.ceil((actionData.ChargeTime - totalCooldownTime) / 0.2)
        DebugPrintf({ Text = "Total hold time is " .. actionData.ChargeTime .. ", set fire ticks to " .. fireTicks})
    end 

    local aiData = DZGetWeaponAIData(enemy, weaponAIData.WeaponName)

    for fireTick = 1, fireTicks, 1 do
        -- if ReachedAIStageEnd(enemy) or currentRun.CurrentRoom.InStageTransition then
        --     weaponAIData.ForcedEarlyExit = true
        --     return true
        -- end
    
        -- if not CanAttack({ Id = enemy.ObjectId }) then
        --     return false
        -- end

        -- TODO: CanAttack is not working here, I dont know why
        -- It will keep failing and repeat the same attack
    
        -- TODO: this is not working as well
        if aiData.AIAngleTowardsPlayerWhileFiring then
            AngleTowardTarget({ Id = enemy.ObjectId, DestinationId = targetId })
        end
        
        -- Prefire

        DoPreFire(enemy, aiData, targetId)

        -- Prefire End

        -- if not CanAttack({ Id = enemy.ObjectId }) then
        --     return false
        -- end

        -- Fire
        
        DoRegularFire(enemy, aiData, targetId)
        -- Fire end

        if aiData.Cooldown then
            wait(aiData.Cooldown, enemy.AIThreadName)
        end

        if aiData.ChainedWeapon then
            aiData = DZGetWeaponAIData(enemy, aiData.ChainedWeapon)
        end
    end

    if ReachedAIStageEnd(enemy) or currentRun.CurrentRoom.InStageTransition then
		weaponAIData.ForcedEarlyExit = true
		return true
	end

    return true
end

function SelectFistWeapon(enemy, actionData)
    local r = math.random()
    -- init combo weapon to nil
    -- enemy.PostAttackChargeWeapon = nil
    enemy.LastAction = ""

    -- use attack weapon
    if r < actionData.AttackProb then

        -- if the last action is dash, do dash attack
        if enemy.AIState.IsLastActionDash > 0 and _worldTime - enemy.AIState.LastActionTime < 0.3 then
            enemy.LastAction = "DashAttack"
            enemy.WeaponName = enemy.DashAttackWeapon
            enemy.ChainedWeapon = nil
            return enemy.WeaponName
        end

        -- or just do a regular attack
        enemy.LastAction = "Attack"
        enemy.WeaponName = enemy.PrimaryWeapon
        enemy.ChainedWeapon = nil
        return enemy.WeaponName
    end

    -- use special attack
    if r < actionData.AttackProb + actionData.SpectialAttackProb then
        enemy.LastAction = "SpecialAttack"

        -- fist weapon special has dash attack version
        if enemy.AIState.IsLastActionDash > 0 and _worldTime - enemy.AIState.LastActionTime < 0.3 then
            enemy.WeaponName = enemy.SpecialDashAttackWeapon
            enemy.ChainedWeapon = nil
            return enemy.WeaponName
        end

        enemy.WeaponName = enemy.SpecialAttackWeapon
        enemy.ChainedWeapon = nil
        return enemy.WeaponName
    end

    -- use dash
    if r < actionData.AttackProb + actionData.SpectialAttackProb + actionData.DashProb then
        enemy.LastAction = "Dash"
        enemy.WeaponName = enemy.DashWeapon
        enemy.ChainedWeapon = nil
        return enemy.WeaponName
    end

    enemy.WeaponName = nil
    return nil
end