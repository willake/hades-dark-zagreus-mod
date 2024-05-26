if not DarkZagreus.Config.Enabled then return end 

function DarkZagreusShieldAI( enemy, currentRun )
    enemy.HasBonus = false -- for chaos shield
    return DZAIDoShieldAILoop( enemy, currentRun )
end

function DZAIDoShieldAILoop(enemy, currentRun, targetId)
    local aiState = DZAIGetCurrentState(enemy)
    local actionData = DZAIMakeActionData(aiState, enemy.DZ.LastActions)

    -- select a weapon to use if not exist
    enemy.WeaponName = DZAISelectShieldWeapon(enemy, actionData)

    if enemy.WeaponName == nil then
        return false
    end

    -- DebugAssert({ Condition = enemy.WeaponName ~= nil, Text = "Enemy has no weapon!" })
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
			local didTimeout = DZAIDoMove( enemy, currentRun, targetId, weaponAIData)

			if didTimeout and weaponAIData.SkipAttackAfterMoveTimeout then
				return true
			end
		end

        -- Attack
		local attackSuccess = false

        while not attackSuccess do
            attackSuccess = DZAIDoShieldAttackOnce( enemy, currentRun, targetId, weaponAIData, actionData )

            if not attackSuccess then
				enemy.AINotifyName = "CanAttack"..enemy.ObjectId
				NotifyOnCanAttack({ Id = enemy.ObjectId, Notify = enemy.AINotifyName, Timeout = 9.0 })
				waitUntil( enemy.AINotifyName )
			end
        end
    end

    return true
end

function DZAIDoShieldAttackOnce(enemy, currentRun, targetId, weaponAIData, actionData)
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

    if not CanAttack({ Id = enemy.ObjectId }) then
		return false
	end

    if not DZAIFireShieldWeapon( enemy, weaponAIData, currentRun, targetId, actionData ) then
        return false
    end

    return true
end

function DZAIFireShieldWeapon(enemy, weaponAIData, currentRun, targetId, actionData)
    local chargeTime = 0.0

    if weaponAIData.PostFireChargeStages ~= nil then
        chargeTime = actionData.ChargeTime * weaponAIData.MaxChargeTime
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

    enemy.DZ.LastActionTime = _worldTime
    -- save both which action is used and the charge time
    DZAIEnqueueLastAction(enemy, { Action = enemy.DZ.TempAction, ChargeTime = actionData.ChargeTime })

    -- Fire end

    -- shield will fire a rush weapon after primary attack
    if weaponAIData.PostFireChargeWeapon ~= nil then
        local postFireWeaponAIData = 
            DZAIGetWeaponAIData(enemy, weaponAIData.PostFireChargeWeapon)

        DZAIDoPreFire(enemy, postFireWeaponAIData, targetId)

        DZAIDoChargeDistanceFire(enemy, postFireWeaponAIData, targetId, actionData.ChargeTime)
        
        if postFireWeaponAIData.WillEnableBonus then
            enemy.HasBonus = true
        end
    end

    if weaponAIData.PostFireBonusWeapon ~= nil and enemy.HasBonus then
        local bonusWeaponAIData = 
            DZAIGetWeaponAIData(enemy, weaponAIData.PostFireBonusWeapon)

        DZAIDoPreFire(enemy, bonusWeaponAIData, targetId)

        DZAIDoRegularFire(enemy, bonusWeaponAIData, targetId)

        if bonusWeaponAIData.WillConsumeBonus then
            enemy.HasBonus = false
        end
    end

    if ReachedAIStageEnd(enemy) or currentRun.CurrentRoom.InStageTransition then
		weaponAIData.ForcedEarlyExit = true
		return true
	end

    return true
end

function DZAISelectShieldWeapon(enemy, actionData)
    local total = 
        actionData.Attack + actionData.SpecialAttack + actionData.DashToward + actionData.DashAway
    local r = math.random() * total
    -- init combo weapon to nil
    -- enemy.PostAttackChargeWeapon = nil
    enemy.DZ.TempAction = 0
    enemy.DZ.FireTowardTarget = true

    local lastAction = DZAIGetLastAction(enemy)

    -- use attack weapon
    if r < actionData.Attack then

        enemy.DZ.TempAction = 1

        -- if the last action is dash, do dash attack
        if (lastAction.Action == 0 or lastAction.Action == 3) and _worldTime - enemy.DZ.LastActionTime < 0.3 then
            enemy.WeaponName = enemy.DashAttackWeapon
            enemy.ChainedWeapon = nil
            return enemy.WeaponName
        end

        -- or just do a regular attack
        enemy.WeaponName = enemy.PrimaryWeapon
        enemy.ChainedWeapon = nil
        return enemy.WeaponName
    end

    -- use special attack
    if r < actionData.Attack + actionData.SpecialAttack then
        enemy.DZ.TempAction = 2
        enemy.WeaponName = enemy.SpecialAttackWeapon
        enemy.ChainedWeapon = nil
        return enemy.WeaponName
    end

    -- use dash
    if r < actionData.Attack + actionData.SpecialAttack + actionData.DashToward then
        enemy.DZ.TempAction = 0
        enemy.WeaponName = enemy.DashWeapon
        enemy.ChainedWeapon = nil
        return enemy.WeaponName
    end

    if r < actionData.Attack + actionData.SpecialAttack + actionData.DashToward + actionData.DashAway then
        enemy.DZ.TempAction = 3
        enemy.WeaponName = enemy.DashWeapon
        enemy.ChainedWeapon = nil
        enemy.DZ.FireTowardTarget = false
        return enemy.WeaponName
    end

    enemy.WeaponName = nil
    return nil
end