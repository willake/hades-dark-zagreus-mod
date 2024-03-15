function DarkZagreusAI( enemy, currentRun )
	while IsAIActive( enemy, currentRun ) do
		local continue = DoDarkZagreusAILoop( enemy, currentRun )
		if not continue then
			return
		end
	end
end

function DoDarkZagreusAILoop(enemy, currentRun, targetId, weaponAIData)
    local state = GetAIState()
    local actionData = GetAIActionData(state)

    -- select a weapon to use if not exist
    if weaponAIData == nil then
        enemy.WeaponName = SelectDarkWeapon(enemy, state, actionData)
        DebugAssert({ Condition = enemy.WeaponName ~= nil, Text = "Enemy has no weapon!" })
        table.insert(enemy.WeaponHistory, enemy.WeaponName)

		weaponAIData = GetWeaponAIData(enemy)
    end

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
        local moveToId = targetId
        
        -- Movement
        if not weaponAIData.SkipMovement then
			local didTimeout = DoDarkZagreusMove( enemy, currentRun, moveToId, weaponAIData, actionData )

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
			attackSuccess = DoDarkZagreusAttackOnce( enemy, currentRun, targetId, weaponAIData )
			FinishTargetMarker( enemy )
            if not attackSuccess then
				enemy.AINotifyName = "CanAttack"..enemy.ObjectId
				NotifyOnCanAttack({ Id = enemy.ObjectId, Notify = enemy.AINotifyName, Timeout = 9.0 })
				waitUntil( enemy.AINotifyName )
			end
		end
    end

    return true
end

function DoDarkZagreusMove(enemy, currentRun, targetId, weaponAIData, actionData)
    if weaponAIData == nil then
        weaponAIData = enemy
    end

    local attackDistance = actionData.AttackDistance

    AngleTowardTarget({ Id = enemy.ObjectId, DestinationId = targetId })

    -- Move to target
	Move({ 
        Id = enemy.ObjectId, 
        DestinationId = targetId, 
        SuccessDistance = weaponAIData.MoveSuccessDistance or 32, 
        LookAheadMultiplier = enemy.LookAheadMultiplier })
    
    -- Wait until within attack range
	enemy.AINotifyName = "WithinDistance"..enemy.ObjectId
    
    local timeout = weaponAIData.AIMoveWithinRangeTimeout
	if timeout == nil and weaponAIData.AIMoveWithinRangeTimeoutMin ~= nil and weaponAIData.AIMoveWithinRangeTimeoutMax ~= nil then
		timeout = RandomFloat(weaponAIData.AIMoveWithinRangeTimeoutMin, weaponAIData.AIMoveWithinRangeTimeoutMax)
	end
	if timeout ~= nil and enemy.SpeedMultiplier ~= nil then
		timeout = timeout / enemy.SpeedMultiplier
	end

    NotifyWithinDistance({ Id = enemy.ObjectId, DestinationId = targetId, Distance = attackDistance,
		StopsUnits = weaponAIData.AIRequireUnitLineOfSight, StopsProjectiles = weaponAIData.AIRequireProjectileLineOfSight,
		LineOfSightBuffer = weaponAIData.AILineOfSightBuffer,
		LineOfSightEndBuffer = weaponAIData.AILineOfSighEndBuffer,
		Notify = enemy.AINotifyName, Timeout = timeout or 9.0 })

	waitUntil( enemy.AINotifyName, enemy.AIThreadName )

    local didTimeout = _eventTimeoutRecord[enemy.AINotifyName]

    return didTimeout
end

function DoDarkZagreusAttackOnce(enemy, currentRun, targetId, weaponAIData, actionData)
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

    -- don't know what does it do but should better keep it
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

    if weaponAIData.AIChargeTargetMarker then
		CreateTargetMarker( enemy, targetId, weaponAIData )
	end

    if weaponAIData.AITrackTargetDuringCharge then
		Track({ Ids = { enemy.ObjectId }, DestinationIds = { targetId } })
	end

    -- PRE ATTACK END

    -- ATTACK

    if not weaponAIData.SkipFireWeapon then
		if not AttackerFireWeapon( enemy, weaponAIData, currentRun, targetId, animationId ) then
			return false
		end
	end

    if weaponAIData.AIChargeTargetMarker then
		FinishTargetMarker( enemy )
	end

    local distanceToTarget = GetDistance({ Id = enemy.ObjectId, DestinationId = targetId })
    
    return true
end

function DoDarkSwordAttack(enemy, currentRun, targetId, weaponAIData, actionData)
end

function GetAIState()
    return
    {
        OwnHP = 100,
        ClosestEnemyHP = 100,
        Distance = 0.5,
        IsLastActionAttack = 1,
        IsLastActionSpectialAttack = 0,
        IsLastActionDash = 0,
        IsLastActionCast = 0
    }
end

function GetAIActionData(state)
    return 
    {
        AttackDistance = 175,    
        IsCombo = true,
        AttackProb = 0.8,
        SpectialAttackProb = 0.1,
        DashProb = 0.1
    }
end

function SelectDarkWeapon(enemy, state, actionData)
    local r = math.random()

    -- use attack weapon
    if r < actionData.AttackProb then
        -- if the last action is also attack, do weapon combo
        if state.IsLastActionAttack then
            if enemy.ChainedWeapon ~= nil then
                enemy.WeaponName = enemy.ChainedWeapon
                enemy.ChainedWeapon = nil
                return enemy.WeaponName
            else
                enemy.WeaponName = enemy.PrimaryWeapon
                return enemy.WeaponName
            end
        end
        
        -- if the last action is dash, do dash attack
        if state.IsLastActionDash then
            enemy.WeaponName = enemy.DashAttackWeapon
            return enemy.WeaponName
        end
    end

    -- use special attack
    if r < actionData.SpectialAttackProb then
        enemy.WeaponName = enemy.SpecialAttackWeapon
        return enemy.WeaponName
    end

    -- use dash
    if r < actionData.DashProb then
        enemy.WeaponName = enemy.DashWeapon
        return enemy.WeaponName
    end

    enemy.WeaponName = nil
    return nil
end