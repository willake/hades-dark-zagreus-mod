 function DarkZagreusSpearAI( enemy, currentRun )
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
	enemy.IsSpearThrown = false
    while IsAIActive( enemy, currentRun ) do
		local continue = DoSpearAILoop( enemy, currentRun )
		if not continue then
			return
		end
	end
end

function DoSpearAILoop(enemy, currentRun, targetId)
    local actionData = GetAIActionData(enemy.AIState)

    -- select a weapon to use if not exist
    enemy.WeaponName = SelectSpearWeapon(enemy, actionData)
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
        attackSuccess = DoSpearAIAttackOnce( enemy, currentRun, targetId, weaponAIData, actionData )
		-- while not attackSuccess do
		-- 	attackSuccess = DoSpearAIAttackOnce( enemy, currentRun, targetId, weaponAIData, actionData )

            -- if not attackSuccess then
			-- 	enemy.AINotifyName = "CanAttack"..enemy.ObjectId
			-- 	NotifyOnCanAttack({ Id = enemy.ObjectId, Notify = enemy.AINotifyName, Timeout = 9.0 })
			-- 	waitUntil( enemy.AINotifyName )
			-- end
		-- end
    end

    return true
end

function DoSpearAIAttackOnce(enemy, currentRun, targetId, weaponAIData, actionData)
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

    -- if the next attack is within combo threshold, 
    -- then replace the weapon to combo weapon
    -- the threshold is 0.3
    -- if _worldTime - enemy.AIState.LastActionTime < 0.3 then
    --     if enemy.ComboWeapon ~= nil then
    --         enemy.WeaponName = enemy.ComboWeapon
    --     end
    -- end
    if not FireDarkWeapon( enemy, weaponAIData, currentRun, targetId, actionData ) then
        return false
    end
    enemy.AIState.LastActionTime = _worldTime
    SetLastActionOnAIState(enemy)

    local distanceToTarget = GetDistance({ Id = enemy.ObjectId, DestinationId = targetId })
    
    return true
end

function FireSpearWeapon(enemy, weaponAIData, currentRun, targetId, actionData)
    local fireTicks = weaponAIData.FireTicks or 1
    local chargeTime = 0.0

    if weaponAIData.PostFireChargeStages ~= nil then
        chargeTime = actionData.ChargeTime * weaponAIData.MaxChargeTime
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

    DoPreFire(enemy, weaponAIData)

    -- Prefire End

    if not CanAttack({ Id = enemy.ObjectId }) then
        return false
    end

    -- Fire

    if weaponAIData.FireAnimation then
        SetAnimation({ DestinationId = enemy.ObjectId, Name = weaponAIData.FireAnimation })
    end

    if weaponAIData.FireFxOnSelf then
        CreateAnimation({ DestinationId = enemy.ObjectId, Name = weaponAIData.FireFxOnSelf })
    end

    if weaponAIData.FireFxAtTarget then
        CreateAnimation({ DestinationId = targetId, Name = weaponAIData.FireFxAtTarget })
    end

    if weaponAIData.FireSound then
        PlaySound({ Name = weaponAIData.FireSound, Id = enemy.ObjectId })
    end

    FireWeaponFromUnit({ Weapon = weaponAIData.WeaponName, Id = enemy.ObjectId, DestinationId = targetId, AutoEquip = true })
    
    if weaponAIData.WaitUntilProjectileDeath ~= nil then
		enemy.AINotifyName = "ProjectilesDead"..enemy.ObjectId
		NotifyOnProjectilesDead({ Name = weaponAIData.WaitUntilProjectileDeath, Notify = enemy.AINotifyName })
		waitUntil( enemy.AINotifyName )
	else
		wait( weaponAIData.FireDuration, enemy.AIThreadName )
	end

    if weaponAIData.FireFxOnSelf then
        StopAnimation({ DestinationId = enemy.ObjectId, Name = weaponAIData.FireFxOnSelf })
    end

    if weaponAIData.FireFxAtTarget then
        StopAnimation({ DestinationId = targetId, Name = weaponAIData.FireFxAtTarget })
    end

    -- Fire end

    if not CanAttack({ Id = enemy.ObjectId }) then
        return false
    end

    -- PostAttackCharge
    -- Only spear weapons have this
    -- Spear will charge after attack if player still holding the button
    if weaponAIData.PostFireChargeStages ~= nil and chargeTime > 0.0 then
        local chargeWeaponAIData = 
        DZGetWeaponAIData(enemy, weaponAIData.PostFireChargeStages[0].ChargeWeapon)
        local stageReached = 0
        local maxStage = #weaponAIData.PostFireChargeStages 

        DoPreFire(enemy, chargeWeaponAIData)
        
        local remainChargeTime = 0.0
        for stage = 1, maxStage do 
            DebugPrintf({ Text = "Charging stage " .. stage })
            local lastStageData = weaponAIData.PostFireChargeStages[stage - 1]
            local stageData = weaponAIData.PostFireChargeStages[stage]

            if chargeTime < stageData.Threshold then
                remainChargeTime = chargeTime - lastStageData.Threshold
                break
            end

            wait(stageData.Threshold, enemy.AIThreadName)
            PlaySound({ Name = "/Leftovers/SFX/AuraOnLoud" })
            Flash({ Id = enemy.ObjectId, Speed = 4, MinFraction = 0.5, MaxFraction = 0.6, Color = Color.White, Duration = 0.3 })
            chargeWeaponAIData = DZGetWeaponAIData(enemy, weaponAIData.PostFireChargeStages[stage].ChargeWeapon)
        end

        wait(remainChargeTime, enemy.AIThreadName)
        FireWeaponFromUnit({ Weapon = chargeWeaponAIData.WeaponName, Id = enemy.ObjectId, DestinationId = targetId, AutoEquip = true })
    
        wait(chargeWeaponAIData.FireDuration, enemy.AIThreadName)
    end
    

    if ReachedAIStageEnd(enemy) or currentRun.CurrentRoom.InStageTransition then
		weaponAIData.ForcedEarlyExit = true
		return true
	end

    return true
end

function SelectSpearWeapon(enemy, actionData)
    local r = math.random()
    -- init combo weapon to nil
    -- enemy.PostAttackChargeWeapon = nil
    enemy.LastAction = ""

    -- use attack weapon
    if r < actionData.AttackProb then

        if enemy.ShouldReturnSpearAfterThrow and enemy.IsSpearThrown then
            enemy.WeaponName = enemy.SpecialAttackWeaponReturn
            enemy.IsSpearThrown = false
            return enemy.WeaponName
        end

        -- if the last action is dash, do dash attack
        if enemy.AIState.IsLastActionDash > 0 and _worldTime - enemy.AIState.LastActionTime < 0.3 then
            enemy.LastAction = "DashAttack"
            enemy.WeaponName = enemy.DashAttackWeapon
            return enemy.WeaponName
        end

        enemy.LastAction = "Attack"

        -- spear will charge after primary attack
        -- if enemy.PostPrimaryChargeWeapon ~= nil then
        --     enemy.PostPrimaryChargeWeapon = enemy.PostPrimaryChargeWeapon
        -- end

        -- if the last action is also attack, do weapon combo
        if enemy.AIState.IsLastActionAttack > 0 then
            if enemy.ChainedWeapon ~= nil and _worldTime - enemy.AIState.LastActionTime < 0.3 then
                enemy.WeaponName = enemy.ChainedWeapon
                enemy.ChainedWeapon = nil
                return enemy.WeaponName
            end
        end

        -- or just do a regular attack
        enemy.WeaponName = enemy.PrimaryWeapon
        return enemy.WeaponName
    end

    -- use special attack
    if r < actionData.AttackProb + actionData.SpectialAttackProb then
        if enemy.ShouldReturnSpearAfterThrow and enemy.IsSpearThrown then
            enemy.WeaponName = enemy.SpecialAttackWeaponReturn
            enemy.IsSpearThrown = false
            return enemy.WeaponName
        end

        enemy.LastAction = "SpecialAttack"
        enemy.WeaponName = enemy.SpecialAttackWeapon
        enemy.IsSpearThrown = true
        return enemy.WeaponName
    end

    -- use dash
    if r < actionData.AttackProb + actionData.SpectialAttackProb + actionData.DashProb then
        enemy.LastAction = "Dash"
        enemy.WeaponName = enemy.DashWeapon
        return enemy.WeaponName
    end

    enemy.WeaponName = nil
    return nil
end