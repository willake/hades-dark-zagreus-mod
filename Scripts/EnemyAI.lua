function DoDarkZagreusMove(enemy, currentRun, targetId, weaponAIData, actionData)
    if weaponAIData == nil then
        weaponAIData = enemy
    end

    local attackDistance = weaponAIData.AttackDistance or 175

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

function GetAIState()
    return
    {
        OwnHP = 100,
        ClosestEnemyHP = 100,
        Distance = 0.5,
        IsLastActionAttack = 0,
        IsLastActionSpectialAttack = 0,
        IsLastActionDash = 0,
        IsLastActionDashAttack = 0,
        IsLastActionCast = 0
    }
end

function GetAIActionData(state)
    local r = math.random()
    local chargeTime = 0.0

    -- if r > 0.5 then
    --     chargeTime = 0.1 + (math.random() * 0.9)
    -- end

    if r > 0.2 then
        chargeTime = 0.1 + (math.random() * 1.5)
    end

    return 
    {
        AttackDistance = 175,    
        IsCombo = true,
        AttackProb = 0.7, -- 0.7
        SpectialAttackProb = 0.2, -- 0.2
        DashProb = 0.1,
        ChargeTime = chargeTime
    }
end

-- Prefire
-- pre-fire means the animation that plays before attack,
-- which you can clearly see that the character is going to attack
function DoPreFire(enemy, weaponAIData, targetId)

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

function DoRegularFire(enemy, weaponAIData, targetId)
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
end

-- Do fire that distance will vary by how much player charged
function DoChargeDistanceFire(enemy, weaponAIData, targetId, percentageCharged)
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

-- simulate player holding fire button to attack
-- e.g. fist
function DoFistFire(enemy, weaponAIData, targetId, holdTimeInPercentage)
    
end

function SetLastActionOnAIState(enemy)
    enemy.AIState.IsLastActionAttack = 0
    enemy.AIState.IsLastActionSpectialAttack = 0
    enemy.AIState.IsLastActionDash = 0
    enemy.AIState.IsLastActionDashAttack = 0
    enemy.AIState.IsLastActionCast = 0
    if enemy.LastAction == "Attack" then
        enemy.AIState.IsLastActionAttack = 1
    elseif enemy.LastAction == "SpecialAttack" then
        enemy.AIState.IsLastActionSpectialAttack = 1
    elseif enemy.LastAction == "Dash" then
        enemy.AIState.IsLastActionDash = 1
    elseif enemy.LastAction == "DashAttack" then
        enemy.AIState.IsLastActionDashAttack = 1
    elseif enemy.LastAction == "Cast" then
        enemy.AIState.IsLastActionCast = 1
    end
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