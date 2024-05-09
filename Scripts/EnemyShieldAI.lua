function DarkZagreusShieldAI( enemy, currentRun )
    enemy.HasBonus = false -- for chaos shield
    return DZDoShieldAILoop( enemy, currentRun )
end

function DZDoShieldAILoop(enemy, currentRun, targetId)
    local aiState = DZGetCurrentAIState(enemy)
    enemy.AIState = aiState
    local actionData = DZMakeAIActionData(aiState)

    -- select a weapon to use if not exist
    enemy.WeaponName = DZSelectShieldWeapon(enemy, actionData)

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
			local didTimeout = DZDoMove( enemy, currentRun, targetId, weaponAIData)

			if didTimeout and weaponAIData.SkipAttackAfterMoveTimeout then
				return true
			end
		end

        -- Attack
		local attackSuccess = false

        while not attackSuccess do
            attackSuccess = DZDoShieldAIAttackOnce( enemy, currentRun, targetId, weaponAIData, actionData )

            if not attackSuccess then
				enemy.AINotifyName = "CanAttack"..enemy.ObjectId
				NotifyOnCanAttack({ Id = enemy.ObjectId, Notify = enemy.AINotifyName, Timeout = 9.0 })
				waitUntil( enemy.AINotifyName )
			end
        end
    end

    return true
end

function DZDoShieldAIAttackOnce(enemy, currentRun, targetId, weaponAIData, actionData)
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

    if not DZFireShieldWeapon( enemy, weaponAIData, currentRun, targetId, actionData ) then
        return false
    end
    enemy.LastActionTime = _worldTime

    return true
end

function DZFireShieldWeapon(enemy, weaponAIData, currentRun, targetId, actionData)
    local chargeTime = 0.0

    if weaponAIData.PostFireChargeStages ~= nil then
        chargeTime = actionData.ChargeTime * weaponAIData.MaxChargeTime
        DebugPrintf({ Text = "Set chargeTime to " .. chargeTime})
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

    DZDoPreFire(enemy, weaponAIData, targetId)

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
        DZDoRegularFire(enemy, weaponAIData, targetId)
    end

    -- Fire end

    -- if not CanAttack({ Id = enemy.ObjectId }) then
    --     return false
    -- end

    -- if ReachedAIStageEnd(enemy) or currentRun.CurrentRoom.InStageTransition then
	-- 	weaponAIData.ForcedEarlyExit = true
	-- 	return true
	-- end

    -- shield will fire a rush weapon after primary attack
    if weaponAIData.PostFireChargeWeapon ~= nil then
        local postFireWeaponAIData = 
            DZGetWeaponAIData(enemy, weaponAIData.PostFireChargeWeapon)

        DZDoPreFire(enemy, postFireWeaponAIData, targetId)

        DZDoChargeDistanceFire(enemy, postFireWeaponAIData, targetId, actionData.ChargeTime)
        
        if postFireWeaponAIData.WillEnableBonus then
            enemy.HasBonus = true
        end
    end

    if weaponAIData.PostFireBonusWeapon ~= nil and enemy.HasBonus then
        local bonusWeaponAIData = 
            DZGetWeaponAIData(enemy, weaponAIData.PostFireBonusWeapon)

        DZDoPreFire(enemy, bonusWeaponAIData, targetId)

        DZDoRegularFire(enemy, bonusWeaponAIData, targetId)

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

function DZSelectShieldWeapon(enemy, actionData)
    local r = math.random()
    -- init combo weapon to nil
    -- enemy.PostAttackChargeWeapon = nil
    enemy.LastAction = ""

    -- use attack weapon
    if r < actionData.Attack then

        enemy.LastAction = 1

        -- if the last action is dash, do dash attack
        if enemy.AIState.IsLastActionDash > 0 and _worldTime - enemy.LastActionTime < 0.3 then
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
        enemy.LastAction = 2
        enemy.WeaponName = enemy.SpecialAttackWeapon
        enemy.ChainedWeapon = nil
        return enemy.WeaponName
    end

    -- use dash
    if r < actionData.Attack + actionData.SpecialAttack + actionData.Dash then
        enemy.LastAction = 0
        enemy.WeaponName = enemy.DashWeapon
        enemy.ChainedWeapon = nil
        return enemy.WeaponName
    end

    enemy.WeaponName = nil
    return nil
end