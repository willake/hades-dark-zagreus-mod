function DarkZagreusAI( enemy, currentRun )
    enemy.AIState = { }
    enemy.LastActionTime = 0
    enemy.LastAction = 0

    while IsAIActive( enemy, currentRun ) do
        local ailoop = _G[DZWeaponAI["ShieldWeapon"]]
        local weapon = DZPersistent.PrevRunRecord.Weapon
        if weapon.WeaponName then
            ailoop = _G[DZWeaponAI[weapon.WeaponName]] 
        end
		local continue = ailoop( enemy, currentRun )
		if not continue then
			return
		end
	end
end

function DZDoMove(enemy, currentRun, targetId, weaponAIData, actionData)
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

function DZGetCurrentAIState(enemy)
    local distance = 0.00
    distance = GetDistance({ Id = enemy.ObjectId, DestinationId = currentRun.Hero.ObjectId })

    if distance > 1000 then
        distance = 1000
    end

    local isLastActionDash = (enemy.LastAction == 0) and 1 or 0
    local isLastActionAttack = (enemy.LastAction == 1) and 1 or 0
    local isLastActionSpectialAttack = (enemy.LastAction == 2) and 1 or 0
    
    return {
        OwnHP = enemy.Health / enemy.MaxHealth,
        ClosestEnemyHP = CurrentRun.Hero.Health / CurrentRun.Hero.MaxHealth,
        Distance = distance / 1000,
        IsLastActionDash = isLastActionDash,
        IsLastActionAttack = isLastActionAttack,
        IsLastActionSpecialAttack = isLastActionSpectialAttack
    }
end

function DZMakeRandomAIActionData(state)
    local r = math.random()
    local chargeTime = 0.0

    chargeTime = r

    return {
        Dash = 0.2,
        Attack = 0.6,
        SpecialAttack = 0.2,
        ChargeTime = chargeTime
    }
end

function DZMakeAIActionData(state)

    if DZTemp.Model == nil or #DZTemp.Model == 0 then
        return DZMakeRandomAIActionData(state)
    end

    DZDebugPrintTable("AIState", state, 3)
    -- local r = math.random()
    -- local chargeTime = 0.0

    -- if r > 0.5 then
    --     chargeTime = 0.1 + (math.random() * 0.9)
    -- end

    DZTemp.Model:activate({state.OwnHP, state.ClosestEnemyHP, state.Distance, 
    state.IsLastActionDash, state.IsLastActionAttack, state.IsLastActionSpecialAttack})

    local dashProb = DZTemp.Model[4].cells[1].signal
    local attackProb = DZTemp.Model[4].cells[2].signal
    local specialProb = DZTemp.Model[4].cells[3].signal
    local chargeTime = DZTemp.Model[4].cells[4].signal

    DebugPrint({ Text = "dashProb | " .. tostring(dashProb) })
    DebugPrint({ Text = "attackProb | " .. tostring(attackProb) })
    DebugPrint({ Text = "specialProb | " .. tostring(specialProb) })
    DebugPrint({ Text = "chargeTime | " .. tostring(chargeTime) })

    return {    
        Dash = dashProb,
        Attack = attackProb,
        SpecialAttack = specialProb,
        ChargeTime = chargeTime
    }
end

-- Prefire
-- pre-fire means the animation that plays before attack,
-- which you can clearly see that the character is going to attack
function DZDoPreFire(enemy, weaponAIData, targetId)

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

function DZDoRegularFire(enemy, weaponAIData, targetId)
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
        FireWeaponFromUnit({ Weapon = weaponAIData.WeaponName, Id = enemy.ObjectId, DestinationId = targetId, AutoEquip = true })
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
function DZDoChargeDistanceFire(enemy, weaponAIData, targetId, percentageCharged)
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
        if newRange ~= nil then
            DebugPrintf({ Text = "New projectile range: " .. newRange })
        else
            DebugPrintf({ Text = "Can't find new projectile range" }) 
        end 
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
        if newVelocity ~= nil then
            -- DebugPrintTable("New velocity", newVelocity, 3)
            DebugPrintf({ Text = "New weapon velocity: " .. newVelocity })
        else
            DebugPrintf({ Text = "Can't find new weapon velocity" }) 
        end 
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
        DebugPrintf({ Text = "Start waiting" .. chargeTime }) 
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

function DZGetWeaponAIData(enemy, weaponName)
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