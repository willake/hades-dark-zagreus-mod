function DarkZagreusAI( enemy, currentRun )
	while IsAIActive( enemy, currentRun ) do
		local continue = DoDarkZagreusAILoop( enemy, currentRun )
		if not continue then
			return
		end
	end
end

function DoDarkZagreusAILoop(enemy, currentRun, targetId, weaponAIData)
    if weaponAIData == nil then
        -- select a weapon to use if not exist
    end

    -- use original getTargetId function to get target
    if targetId == nil then
		targetId = GetTargetId(enemy, weaponAIData)
	end

    -- pass ChainedWeapon to enemy object
    if weaponAIData.ChainedWeapon ~= nil then
		enemy.ChainedWeapon = weaponAIData.ChainedWeapon
	end

    if targetId ~= nil and targetId ~= 0 then
        local moveToId = targetId
        
        -- Movement
        if not weaponAIData.SkipMovement then
			local didTimeout = MoveWithinRange( enemy, moveToId, weaponAIData )

			if didTimeout and weaponAIData.SkipAttackAfterMoveTimeout then
				return true
			end
		end

        -- Attack
		local attackSuccess = false
		while not attackSuccess do
			attackSuccess = AttackOnce( enemy, currentRun, targetId, weaponAIData )
			FinishTargetMarker( enemy )
			if weaponAIData.ForcedEarlyExit then
				return true
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

function DoDarkZagreusAttack(enemy, currentRun, targetId, weaponAIData, actionData)
end

function GetActionData()
    return 
    {
        AttackDistance = 175    
    }
end