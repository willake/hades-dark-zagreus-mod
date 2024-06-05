if not DarkZagreus.Config.Enabled then return end 
 
function DarkZagreusSpearAI( enemy, currentRun )
    return DZAIDoSpearAILoop( enemy, currentRun )
end

-- SpearWeaponThrowInvisibleReturn will be trrigger when player touch the dropped spear
-- not sure how to handle it yet

function DZAIDoSpearAILoop(enemy, currentRun, targetId)
    local aiState = DZAIGetCurrentState(enemy)
    local actionData = DZAIMakeActionData(aiState, enemy.DZ.LastActions)

    -- select a weapon to use if not exist
    enemy.WeaponName = DZAISelectSpearWeapon(enemy, actionData)

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

        local percentageCharged = DZAIMakeSpearChargeTime(enemy.DZ.TempAction)
        
        -- Movement
        if not weaponAIData.SkipMovement then
			local didTimeout = DZAIDoMove( enemy, currentRun, targetId, weaponAIData, actionData, percentageCharged)

			if didTimeout and weaponAIData.SkipAttackAfterMoveTimeout then
				return true
			end
		end

        -- Attack
		local attackSuccess = false

        while not attackSuccess do
            attackSuccess = DZAIDoSpearAttackOnce( enemy, currentRun, targetId, weaponAIData, actionData, percentageCharged)

            if not attackSuccess then
				enemy.AINotifyName = "CanAttack"..enemy.ObjectId
				NotifyOnCanAttack({ Id = enemy.ObjectId, Notify = enemy.AINotifyName, Timeout = 9.0 })
				waitUntil( enemy.AINotifyName )
			end
        end
    end

    return true
end

function DZAIDoSpearAttackOnce(enemy, currentRun, targetId, weaponAIData, actionData, percentageCharged)
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

    if not DZAIFireSpearWeapon( enemy, weaponAIData, currentRun, targetId, actionData, percentageCharged) then
        return false
    end

    return true
end

function DZAIFireSpearWeapon(enemy, weaponAIData, currentRun, targetId, actionData, percentageCharged)
    local chargeTime = 0.0

    if weaponAIData.PostFireChargeStages ~= nil then
        chargeTime = percentageCharged * weaponAIData.MaxChargeTime
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
    
    if weaponAIData.IsRangeBasedOnCharge then
        DZAIDoChargeDistanceFire(enemy, weaponAIData, targetId, percentageCharged)
    else
        DZAIDoRegularFire(enemy, weaponAIData, targetId)
    end

    -- PostAttackCharge
    -- Only spear weapons have this
    -- Spear will charge after attack if player still holding the button
    if weaponAIData.PostFireChargeStages ~= nil and chargeTime > 0.2 then
        local chargeWeaponAIData = 
            DZAIGetWeaponAIData(enemy, weaponAIData.PostFireChargeStages[1].ChargeWeapon)
        local maxStage = #weaponAIData.PostFireChargeStages 
        
        DZAIDoPreFire(enemy, chargeWeaponAIData, targetId)

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
                chargeWeaponAIData = DZAIGetWeaponAIData(enemy, weaponAIData.PostFireChargeStages[stage].ChargeWeapon)
            end

            wait(remainChargeTime, enemy.AIThreadName)

            DZAIDoRegularFire(enemy, chargeWeaponAIData, targetId) 

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
            DZAIGetWeaponAIData(enemy, weaponAIData.PostFireWeapon)

        DZAIDoRegularFire(enemy, postFireWeaponAIData, targetId)
    end

    enemy.DZ.LastActionTime = _worldTime
    -- save both which action is used and the charge time
    DZAIEnqueueLastAction(enemy, { Action = enemy.DZ.TempAction, ChargeTime = actionData.ChargeTime })

    -- Fire weapon end

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

function DZAISelectSpearWeapon(enemy, actionData)
    local total = actionData.Attack + actionData.SpecialAttack 
        + actionData.DashToward + actionData.DashAway + actionData.ManualReload
    local r = math.random() * total

    enemy.DZ.TempAction = 0
    enemy.DZ.FireTowardTarget = true
    local lastAction = DZAIGetLastAction(enemy)

    -- use special attack
    if r < actionData.SpecialAttack then
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

    -- use charge attack with primary attack weapon
    if r < actionData.SpecialAttack + actionData.DashToward + actionData.DashAway + actionData.ChargeAttack then

        if enemy.ShouldReturnSpearAfterThrow and enemy.IsSpearThrown then
            enemy.DZ.TempAction = 2
            enemy.WeaponName = enemy.SpecialAttackWeaponReturn
            enemy.ChainedWeapon = nil
            return enemy.WeaponName
        end

        enemy.DZ.TempAction = 4

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

    -- use attack weapon

    if enemy.ShouldReturnSpearAfterThrow and enemy.IsSpearThrown then
        enemy.DZ.TempAction = 2
        enemy.WeaponName = enemy.SpecialAttackWeaponReturn
        enemy.ChainedWeapon = nil
        return enemy.WeaponName
    end

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

-- logic for deciding the charge time
function DZAIMakeSpearChargeTime(action)

    if action == 4 then -- charge attack
        local r = math.random()

        -- higer chance to do small charge, low chance do full charge
        if DZTemp.AI.Weapon.ItemIndex == 3 then
            if r < 0.85 then
                return 0.6 + math.random() * 0.2
            else
                return 0.9 + math.random() * 0.05
            end
        else
            if r < 0.85 then
                return 0.33 + math.random() * 0.33
            elseif r < 0.95 then
                return 0.66 + math.random() * 0.22
            else
                return 0.88 + math.random() * 0.12
            end
        end
    elseif action == 2 then -- spcial attack
        return math.random(0.3, 1.0)
    end

    -- else, like charge special attack
    return 0.0
end