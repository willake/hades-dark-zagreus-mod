function DarkZagreusGunAI( enemy, currentRun )
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
		local continue = DoGunAILoop( enemy, currentRun )
		if not continue then
			return
		end
	end
end

-- The engine code covers ammo management already, i don't wanna mess it up
-- so maybe no manual reload in this code 

function DoGunAILoop(enemy, currentRun, targetId)
    local actionData = GetAIActionData(enemy.AIState)

    -- select a weapon to use if not exist
    enemy.WeaponName = SelectGunWeapon(enemy, actionData)
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
			local didTimeout = DoDarkZagreusMove( enemy, currentRun, targetId, weaponAIData)

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
            attackSuccess = DoGunAIAttackOnce( enemy, currentRun, targetId, weaponAIData, actionData )

            if not attackSuccess then
				enemy.AINotifyName = "CanAttack"..enemy.ObjectId
				NotifyOnCanAttack({ Id = enemy.ObjectId, Notify = enemy.AINotifyName, Timeout = 9.0 })
				waitUntil( enemy.AINotifyName )
			end
        end
    end

    return true
end

function DoGunAIAttackOnce(enemy, currentRun, targetId, weaponAIData, actionData)
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

    if not FireGunWeapon( enemy, weaponAIData, currentRun, targetId, actionData ) then
        return false
    end
    enemy.AIState.LastActionTime = _worldTime
    SetLastActionOnAIState(enemy)

    local distanceToTarget = GetDistance({ Id = enemy.ObjectId, DestinationId = targetId })
    
    return true
end

function FireGunWeapon(enemy, weaponAIData, currentRun, targetId, actionData)
    local holdTime = 0.01 -- 0.01 to make action at least play once

    if weaponAIData.CanHold then
        holdTime = actionData.ChargeTime
        DebugPrintf({ Text = "Set holdTime to " .. holdTime})
    end

    if ReachedAIStageEnd(enemy) or currentRun.CurrentRoom.InStageTransition then
        weaponAIData.ForcedEarlyExit = true
        return true
    end

    if not CanAttack({ Id = enemy.ObjectId }) then
        return false
    end

    -- Get ai data again, temp code, just want to be able to switch from DarkGunDash to DarkGun
    local aiData = DZGetWeaponAIData(enemy, weaponAIData.WeaponName)

    local startTime = _worldTime
    while _worldTime - startTime < holdTime do

        if weaponAIData.AIAngleTowardsPlayerWhileFiring then
            AngleTowardTarget({ Id = enemy.ObjectId, DestinationId = targetId })
        end

        -- Prefire

        DoPreFire(enemy, weaponAIData, targetId)

        -- Prefire End

        if not CanAttack({ Id = enemy.ObjectId }) then
            return false
        end

        -- Fire
        
        DoRegularFire(enemy, weaponAIData, targetId)

        if aiData.ChainedWeapon then
            aiData = DZGetWeaponAIData(enemy, aiData.ChainedWeapon)
        end
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

function SelectGunWeapon(enemy, actionData)
    local r = math.random()
    -- init combo weapon to nil
    -- enemy.PostAttackChargeWeapon = nil
    enemy.LastAction = ""

    -- use attack weapon
    if r < actionData.AttackProb then

        -- if the last action is dash, do dash attack
        if enemy.AIState.IsLastActionDash > 0 and _worldTime - enemy.AIState.LastActionTime < 0.45 then
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

-- for aspect of hestia
function DZManualReloadBonusApply( triggerArgs )
	-- SwapWeapon({ Name = "GunWeapon", SwapWeaponName = "SniperGunWeapon", ClearFireRequest = true, StompOriginalWeapon = false, GainedControlFrom = "GunWeapon", DestinationId = CurrentRun.Hero.ObjectId, ExtendControlIfSwapActive = true, RequireCurrentControl = true })
	-- SwapWeapon({ Name = "GunWeaponDash", SwapWeaponName = "SniperGunWeaponDash", ClearFireRequest = true, StompOriginalWeapon = false, GainedControlFrom = "SniperGunWeapon", DestinationId = CurrentRun.Hero.ObjectId, ExtendControlIfSwapActive = true, RequireCurrentControl = true })
end

