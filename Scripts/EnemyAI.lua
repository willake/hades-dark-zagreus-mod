if not DarkZagreus.Config.Enabled then return end 

function DarkZagreusAI( enemy, currentRun )
    enemy.DZ = {} -- for storing data related to this mod
    enemy.DZ.LastActions = {} -- a queue for storing last actions, max size is 1 now
    enemy.DZ.TempAction = 0 -- mark action while selecting a weapon, enqueue action when the weapon is actually fired
    enemy.DZ.LastActionTime = 0
    DZTemp.AI = {}
    DZTemp.AI.ObjectId = enemy.ObjectId

    local ailoop = _G[DZWeaponAI["SwordWeapon"]]
    local weapon = {}
        
    if DZPersistent.PrevRunRecord and DZPersistent.PrevRunRecord.Version == DarkZagreus.DataVersion then
        weapon = DZPersistent.PrevRunRecord.Weapon
    end 
    
    if weapon and weapon.WeaponName then
        ailoop = _G[DZWeaponAI[weapon.WeaponName]] 
    end

    while IsAIActive( enemy, currentRun ) do
        
		local continue = ailoop( enemy, currentRun )
		if not continue then
			return
		end
	end
end

function DZAIDoMove(enemy, currentRun, targetId, weaponAIData, actionData)
    if weaponAIData == nil then
        weaponAIData = enemy
    end

    local attackDistance = weaponAIData.AttackDistance or 175

    if weaponAIData.AttackDistanceMin and weaponAIData.AttackDistanceMax then
        local r = math.random()
        local range = weaponAIData.AttackDistanceMax - weaponAIData.AttackDistanceMin
        attackDistance = weaponAIData.AttackDistanceMin + r * range
    end

    if weaponAIData.IsAttackDistanceBasedOnCharge then
        local chargeTime = actionData.ChargeTime
        local rangeMax = weaponAIData.Range * weaponAIData.ChargeRangeMultiplier
        attackDistance = chargeTime * rangeMax
    end

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

function DZAIEnqueueLastAction(enemy, action)
    table.insert(enemy.DZ.LastActions, action)

    -- max size of last action queue is 1 now, will be 2 in the future
    -- depends on how many information we wanna storing for the model prediction
    if #enemy.DZ.LastActions > 1 then
        table.remove(enemy.DZ.LastActions, 1) 
    end
end

function DZAIGetLastAction(enemy)
    if #enemy.DZ.LastActions == 0 then
        return {
            Action = 0,
            ChargeTime = 0.0
        }
    else
        return enemy.DZ.LastActions[#enemy.DZ.LastActions]
    end
end

function DZAIGetCurrentState(enemy)
    local distance = 0.00
    distance = GetDistance({ Id = enemy.ObjectId, DestinationId = currentRun.Hero.ObjectId })

    if distance > 1000 then
        distance = 1000
    end

    local isGetDamagedRecently = false
    local isDamageEnemyRecently = false
    local isMarkTargetRecently = false

    if DZTemp.AI then
        if DZTemp.AI.LastGetDamagedTime then
            isGetDamagedRecently = _worldTime - DZTemp.AI.LastGetDamagedTime < 1.0
        end

        if DZTemp.AI.LastDamageEnemyTime then
            isDamageEnemyRecently = _worldTime - DZTemp.AI.LastDamageEnemyTime < 1.0
        end

        if DZTemp.AI.LastMarkedTargetTime and DZTemp.AI.ValidMarkTime then
            isMarkTargetRecently = _worldTime - DZTemp.AI.LastMarkedTargetTime < DZTemp.AI.ValidMarkTime
        end 
    end
    
    return {
        OwnHP = enemy.Health / enemy.MaxHealth,
        ClosestEnemyHP = CurrentRun.Hero.Health / CurrentRun.Hero.MaxHealth,
        Distance = distance / 1000,
        GetDamagedRecently = isGetDamagedRecently and 1.0 or 0.0,
        DamageEnemyRecently = isDamageEnemyRecently and 1.0 or 0.0,
        MarkTargetRecently = isMarkTargetRecently and 1.0 or 0.0
    }
end

function DZAIMakeRandomActionData(state)
    local r = math.random()
    local chargeTime = 0.0

    chargeTime = r

    return {
        DashToward = 0.2, -- 0.2
        Attack = 0.5, -- 0.5
        SpecialAttack = 0.2, -- 0.2
        DashAway = 0.1,
        ChargeTime = chargeTime
    }
end

function DZAIMakeActionData(state, lastActions)

    if DZTemp.Model == nil or #DZTemp.Model == 0 then
        return DZAIMakeRandomActionData(state)
    end

    local lastAction = lastActions[#lastActions]

    if lastAction == nil then
       lastAction = 
       {
        Action = 0,
        ChargeTime = 0.0
       } 
    end

    DZTemp.Model:activate({
        state.OwnHP, state.ClosestEnemyHP, state.Distance, 
        (lastAction.Action == 0) and 1 or 0, -- if last action is dash toward
        (lastAction.Action == 1) and 1 or 0, -- if last action is attack
        (lastAction.Action == 2) and 1 or 0, -- if last action is special attack,
        (lastAction.Action == 3) and 1 or 0, -- if last action is dash away
        lastAction.ChargeTime }
    )

    local dashTowardProb = DZTemp.Model[4].cells[1].signal
    local attackProb = DZTemp.Model[4].cells[2].signal
    local specialProb = DZTemp.Model[4].cells[3].signal
    local dashAwayProb = DZTemp.Model[4].cells[4].signal
    local chargeTime = DZTemp.Model[4].cells[5].signal

    DZDebugPrintString(string.format("dash toward prob | %.3f", dashTowardProb))
    DZDebugPrintString(string.format("attack prob | %.3f", attackProb))
    DZDebugPrintString(string.format("special prob | %.3f", specialProb))
    DZDebugPrintString(string.format("dash away prob | %.3f", dashAwayProb))
    DZDebugPrintString(string.format("charge time | %.3f", chargeTime))

    return {    
        DashToward = dashTowardProb,
        Attack = attackProb,
        SpecialAttack = specialProb,
        DashAway = dashAwayProb,
        ChargeTime = chargeTime
    }
end

-- Prefire
-- pre-fire means the animation that plays before attack,
-- which you can clearly see that the character is going to attack
function DZAIDoPreFire(enemy, weaponAIData, targetId)

    if weaponAIData.PreFireAnimation then
        SetAnimation({ DestinationId = enemy.ObjectId, Name = weaponAIData.PreFireAnimation })
    end

    if weaponAIData.PreFireFx then
        CreateAnimation({ DestinationId = enemy.ObjectId, Name = weaponAIData.PreFireFx })
    end

    if weaponAIData.PreFireSound then
        PlaySound({ Name = weaponAIData.PreFireSound, Id = enemy.ObjectId })
    end

    if weaponAIData.AITrackTargetDuringCharge then
		Track({ Ids = { enemy.ObjectId }, DestinationIds = { targetId } })
	end

    -- wait for pre fire animation
    if weaponAIData.PreFireDuration then
        wait( weaponAIData.PreFireDuration, enemy.AIThreadName )
    end

    if weaponAIData.PreFireFx then
        StopAnimation({ DestinationId = enemy.ObjectId, Name = weaponAIData.PreFireFx })
    end

    -- if weaponAIData.PreFireSound then
    --     StopSound({ Name = weaponAIData.PreFireSound, Id = enemy.ObjectId })
    -- end
end

function DZAIDoRegularFire(enemy, weaponAIData, targetId)
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

    if weaponAIData.FireOnSelf then
        FireWeaponFromUnit({ Weapon = weaponAIData.WeaponName, Id = enemy.ObjectId, DestinationId = enemy.ObjectId, AutoEquip = true })
    else
        if enemy.DZ.FireTowardTarget == false then
            local angleToward = GetAngleBetween({ Id = enemy.ObjectId, DestinationId = targetId })
            local opposite = DZGetRandomAngleInOppositeDirection(angleToward)
            local radians = math.rad(opposite)
            -- SetAngle({ Id = enemy.ObjectId, Angle = opposite, Duration = 0.0 })
            -- local location = GetLocation({ Id = enemy.ObjectId})
            -- local tempTarget = SpawnObstacle({ 
            --     Name = "TempTarget", DestinationId = enemy.ObjectId, OffsetX = location.X + math.cos(radians) * 100, OffsetY = location.Y - math.sin(radians) * 100 })
            -- AngleTowardTarget({ Id = enemy.ObjectId, DestinationId = tempTarget })  not working
            -- DZDebugPrintString(string.format("DashAway - Original = %.1f, Opposite = %.1f", angleToward, opposite))
            Stop({ Id = enemy.ObjectId })
            SetAngle({ Id = enemy.ObjectId, Angle = opposite, Duration = 0.0 })
            FireWeaponFromUnit({ Weapon = weaponAIData.WeaponName, Id = enemy.ObjectId, DestinationId = targetId, AutoEquip = true })
            Destroy({Id = tempTarget})
        else
            FireWeaponFromUnit({ Weapon = weaponAIData.WeaponName, Id = enemy.ObjectId, DestinationId = targetId, AutoEquip = true })
        end
    end
    
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
end

-- Do fire that distance will vary by how much player charged
function DZAIDoChargeDistanceFire(enemy, weaponAIData, targetId, percentageCharged)
    local chargeTime = percentageCharged * weaponAIData.MaxChargeTime
    local minChargeTime = weaponAIData.MinChargeTime or 0.0
    
    -- if the charge time is smaller than the min charge time, then cancel it
    if chargeTime < minChargeTime and weaponAIData.PreFireCancelAnimation then
        SetAnimation({ DestinationId = enemy.ObjectId, Name = weaponAIData.PreFireCancelAnimation })
        return false
    end

    -- equip weapon so that SetProperty can work, otherwise it won't changed
    EquipWeapon({ Name = weaponAIData.WeaponName, DestinationId = enemy.ObjectId })
    -- set projectile range based on charge time
    if weaponAIData.ChargeRangeMultiplier then
        local rangeMultiplier = weaponAIData.ChargeRangeMultiplier or 1
        local range = weaponAIData.Range or 0.0
        -- if range ~= nil then
        --     DebugPrintf({ Text = "Old projectile range: " .. range })
        -- else
        --     DebugPrintf({ Text = "Can't find old projectile range" }) 
        -- end
        -- set projectile range
        SetProjectileProperty(
            { WeaponName = weaponAIData.WeaponName, DestinationId = enemy.ObjectId, Property = "Range", Value = range * percentageCharged * rangeMultiplier })
    
        -- DEBUG, check new range
        local newRange = GetProjectileProperty({ Id = enemy.ObjectId, WeaponName = "DarkBow", Property = "Range" })
        -- if newRange ~= nil then
        --     DebugPrintf({ Text = "New projectile range: " .. newRange })
        -- else
        --     DebugPrintf({ Text = "Can't find new projectile range" }) 
        -- end 
    end

    -- set weapon velocity based on charge time, e.g. DarkShieldRush
    if weaponAIData.ChargeVelocityMultiplier then
        local velocityMultiplier = weaponAIData.ChargeVelocityMultiplier or 1
        local velocity = weaponAIData.Velocity or 0.0

        -- set weapon velocity
        SetWeaponProperty(
            { WeaponName = weaponAIData.WeaponName, DestinationId = enemy.ObjectId, Property = "SelfVelocity", Value = velocity * percentageCharged * velocityMultiplier })
        -- DEBUG, check new range
        local newVelocity = GetWeaponDataValue({ Id = enemy.ObjectId, WeaponName = weaponAIData.WeaponName, Property = "SelfVelocity" })
        -- if newVelocity ~= nil then
        --     -- DebugPrintTable("New velocity", newVelocity, 3)
        --     DebugPrintf({ Text = "New weapon velocity: " .. newVelocity })
        -- else
        --     DebugPrintf({ Text = "Can't find new weapon velocity" }) 
        -- end 
    end

    -- charge starts

    if weaponAIData.ChargeFx then
        CreateAnimation({ DestinationId = enemy.ObjectId, Name = weaponAIData.ChargeFx })
    end

    if weaponAIData.AIChargeTargetMarker then
        CreateTargetMarker( enemy, targetId, weaponAIData )
    end

    if weaponAIData.AITrackTargetDuringCharge then
		Track({ Ids = { enemy.ObjectId }, DestinationIds = { targetId } })
	end

    if chargeTime > 0.0 then
        -- DebugPrintf({ Text = "Start waiting" .. chargeTime }) 
        wait(chargeTime, enemy.AIThreadName) 
    end

    if weaponAIData.ChargeFx then
        StopAnimation({ DestinationId = enemy.ObjectId, Name = weaponAIData.ChargeFx })
    end

    -- charge ends

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
    
    if weaponAIData.AIChargeTargetMarker then
		FinishTargetMarker( enemy )
	end

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

    return true
end

function DZAIGetWeaponAIData(enemy, weaponName)
	-- local weaponAIData = ShallowCopyTable(enemy.DefaultAIData) or enemy
	local weaponAIData = {}
    if WeaponData[weaponName] ~= nil and WeaponData[weaponName].AIData ~= nil then
		-- local weaponData = ShallowCopyTable(WeaponData[weaponName].AIData)

		-- if WeaponData[enemy.WeaponName].ShrineAIDataOverwrites ~= nil and GetNumMetaUpgrades(WeaponData[enemy.WeaponName].ShrineMetaUpgradeName) >= WeaponData[enemy.WeaponName].ShrineMetaUpgradeRequiredLevel then
		-- 	OverwriteTableKeys( weaponData, WeaponData[enemy.WeaponName].ShrineAIDataOverwrites)
		-- end

		OverwriteTableKeys(weaponAIData, WeaponData[weaponName].AIData)
	end
	weaponAIData.WeaponName = weaponName

    -- DebugPrintTable("WeaponData", weaponAIData, 3)

	-- if enemy.SwapAnimations ~= nil then
	-- 	for k, v in pairs(weaponAIData) do
	-- 		if enemy.SwapAnimations[v] ~= nil then
	-- 			weaponAIData[k] = enemy.SwapAnimations[v]
	-- 		end
	-- 	end
	-- end

	return weaponAIData
end

function DZGetRandomAngleInOppositeDirection(angle)
    local r = math.random(0, 180)

    return (angle + 90 + r) % 360
end