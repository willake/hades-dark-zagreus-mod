if not DarkZagreus.Config.Enabled then return end
 
function DarkZagreusSpearAI( enemy, currentRun )
    return DZDoSpearAILoop( enemy, currentRun )
end

-- SpearWeaponThrowInvisibleReturn will be trrigger when player touch the dropped spear
-- not sure how to handle it yet

function DZDoSpearAILoop(enemy, currentRun, targetId)
    local aiState = DZGetCurrentAIState(enemy)
    enemy.AIState = aiState
    local actionData = DZMakeAIActionData(aiState)

    -- select a weapon to use if not exist
    enemy.WeaponName = DZSelectSpearWeapon(enemy, actionData)
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
			local didTimeout = DZDoMove( enemy, currentRun, targetId, weaponAIData, actionData)

			if didTimeout and weaponAIData.SkipAttackAfterMoveTimeout then
				return true
			end
		end

        -- Attack
		local attackSuccess = false

        while not attackSuccess do
            attackSuccess = DZDoSpearAIAttackOnce( enemy, currentRun, targetId, weaponAIData, actionData )

            if not attackSuccess then
				enemy.AINotifyName = "CanAttack"..enemy.ObjectId
				NotifyOnCanAttack({ Id = enemy.ObjectId, Notify = enemy.AINotifyName, Timeout = 9.0 })
				waitUntil( enemy.AINotifyName )
			end
        end
    end

    return true
end

function DZDoSpearAIAttackOnce(enemy, currentRun, targetId, weaponAIData, actionData)
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

    if not DZFireSpearWeapon( enemy, weaponAIData, currentRun, targetId, actionData ) then
        return false
    end
    enemy.LastActionTime = _worldTime
    return true
end

function DZFireSpearWeapon(enemy, weaponAIData, currentRun, targetId, actionData)
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
    
    if weaponAIData.IsRangeBasedOnCharge then
        DZDoChargeDistanceFire(enemy, weaponAIData, targetId, actionData.ChargeTime)
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

    -- Stop({ Id = enemy.ObjectId })

    -- PostAttackCharge
    -- Only spear weapons have this
    -- Spear will charge after attack if player still holding the button
    if weaponAIData.PostFireChargeStages ~= nil and chargeTime > 0.3 then
        local chargeWeaponAIData = 
            DZGetWeaponAIData(enemy, weaponAIData.PostFireChargeStages[1].ChargeWeapon)
        local maxStage = #weaponAIData.PostFireChargeStages 
        
        DZDoPreFire(enemy, chargeWeaponAIData, targetId)

        -- if the charge time is larger than the threshold, at least play the first stage
        if chargeTime > weaponAIData.PostFireChargeStages[1].Threshold then
        
            local remainChargeTime = 0.0
            -- lua array index starts from 1
            for stage = 1, maxStage do 
                local lastStageData = nil
                if state == 1 then
                    lastStageData = { Threshold = 0.0 }
                else
                    lastStageData = weaponAIData.PostFireChargeStages[stage - 1]
                end
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

            DZDoRegularFire(enemy, chargeWeaponAIData, targetId) 

            -- after doing spin, combo should be canceled
            enemy.ChainedWeapon = nil
        -- otherwise, play charge cancel animation
        else
            wait(chargeTime, enemy.AIThreadName)

            if chargeWeaponAIData.PreFireCancelAnimation then
                SetAnimation({ DestinationId = enemy.ObjectId, Name = chargeWeaponAIData.PreFireCancelAnimation })
            end
        end
    end

    -- Spear will return internally after rush to the spear
    -- while equiping Aspect of Achilles
    if weaponAIData.PostFireWeapon ~= nil then
        local postFireWeaponAIData = 
            DZGetWeaponAIData(enemy, weaponAIData.PostFireWeapon)

        DZDoRegularFire(enemy, postFireWeaponAIData, targetId)
    end

    if weaponAIData.WillThrowSpear then
        enemy.IsSpearThrown = true
    end

    if weaponAIData.WillReturnSpear then
        enemy.IsSpearThrown = false
    end
    

    if ReachedAIStageEnd(enemy) or currentRun.CurrentRoom.InStageTransition then
		weaponAIData.ForcedEarlyExit = true
		return true
	end

    return true
end

function DZSelectSpearWeapon(enemy, actionData)
    local r = math.random()
    -- init combo weapon to nil
    -- enemy.PostAttackChargeWeapon = nil
    enemy.DZ.TempAction = 1

    -- use attack weapon
    if r < actionData.Attack then
        
        if enemy.ShouldReturnSpearAfterThrow and enemy.IsSpearThrown then
            enemy.DZ.TempAction = 2
            enemy.WeaponName = enemy.SpecialAttackWeaponReturn
            enemy.ChainedWeapon = nil
            return enemy.WeaponName
        end

        enemy.DZ.TempAction = 1

        -- if the last action is dash, do dash attack
        if enemy.AIState.IsLastActionDash > 0 and _worldTime - enemy.LastActionTime < 0.3 then
            enemy.WeaponName = enemy.DashAttackWeapon
            enemy.ChainedWeapon = nil
            return enemy.WeaponName
        end

        -- if the last action is also attack, do weapon combo
        if enemy.AIState.IsLastActionAttack > 0 then
            if enemy.ChainedWeapon ~= nil and _worldTime - enemy.LastActionTime < 0.3 then
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

    -- use special attack
    if r < actionData.Attack + actionData.SpecialAttack then
        enemy.DZ.TempAction = 2
        if enemy.ShouldReturnSpearAfterThrow and enemy.IsSpearThrown then

            if enemy.SpecialAttackWeaponRush then
                enemy.WeaponName = enemy.SpecialAttackWeaponRush
                enemy.ChainedWeapon = nil
                return enemy.WeaponName        
            end

            enemy.WeaponName = enemy.SpecialAttackWeaponReturn
            enemy.ChainedWeapon = nil
            return enemy.WeaponName
        end

        enemy.WeaponName = enemy.SpecialAttackWeapon
        enemy.ChainedWeapon = nil
        return enemy.WeaponName
    end

    -- use dash
    if r < actionData.Attack + actionData.SpecialAttack + actionData.Dash then
        enemy.DZ.TempAction = 0
        enemy.WeaponName = enemy.DashWeapon
        enemy.ChainedWeapon = nil
        return enemy.WeaponName
    end

    enemy.WeaponName = nil
    return nil
end