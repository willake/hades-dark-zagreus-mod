function DarkZagreusAI( enemy, currentRun )
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
		local continue = DoDarkZagreusAILoop( enemy, currentRun )
		if not continue then
			return
		end
	end
end

function DoDarkZagreusAILoop(enemy, currentRun, targetId)
    local actionData = GetAIActionData(enemy.AIState)

    -- select a weapon to use if not exist
    enemy.WeaponName = SelectDarkWeapon(enemy, actionData)
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
			attackSuccess = DoDarkZagreusAttackOnce( enemy, currentRun, targetId, weaponAIData, actionData )
			-- FinishTargetMarker( enemy )
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

    Stop({ Id = enemy.ObjectId })

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

    -- PRE ATTACK END

    -- ATTACK

    if not CanAttack({ Id = enemy.ObjectId }) then
		return false
	end

    if not weaponAIData.SkipFireWeapon then
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
	end

    local distanceToTarget = GetDistance({ Id = enemy.ObjectId, DestinationId = targetId })
    
    return true
end

function FireDarkWeapon(enemy, weaponAIData, currentRun, targetId, actionData)
    local chargeTime = 0.0

    if weaponAIData.IsChargable then
        chargeTime = actionData.ChargeTime * weaponAIData.MaxChargeTime
    end
	-- if weaponAIData.AIFireTicksMin ~= nil and weaponAIData.AIFireTicksMax ~= nil then
	-- 	fireTicks = RandomInt( weaponAIData.AIFireTicksMin, weaponAIData.AIFireTicksMax )
	-- end

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

    -- Prefire Related
    -- pre fire means the animation that plays before attack,
    -- which you can clearly see that the character is going to attack

    if weaponAIData.PreFireAnimation then
        SetAnimation({ DestinationId = enemy.ObjectId, Name = weaponAIData.PreFireAnimation })
    end

    if weaponAIData.PreFireFx then
        CreateAnimation({ DestinationId = enemy.ObjectId, Name = weaponAIData.PreFireFx })
    end

    if weaponAIData.PreFireSound then
        PlaySound({ Name = weaponAIData.PreFireSound, Id = enemy.ObjectId })
    end

    if weaponAIData.AITrackTargetDuringPreFire then
		Track({ Ids = { enemy.ObjectId }, DestinationIds = { targetId } })
	end

    -- wait for charging
    if weaponAIData.PreFireDuration then
        wait(weaponAIData.PreFireAnimation, enemy.AIThreadName)
    end

    if weaponAIData.PreFireFx then
        StopAnimation({ DestinationId = enemy.ObjectId, Name = weaponAIData.PreFireFx })
    end

    if weaponAIData.PreFireSound then
        StopSound({ Name = weaponAIData.PreFireSound, Id = enemy.ObjectId })
    end

    -- PreFire End

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

    -- PostFireCharge, only spear weapon has it
    

    -- PostFireCharge End

    if ReachedAIStageEnd(enemy) or currentRun.CurrentRoom.InStageTransition then
		weaponAIData.ForcedEarlyExit = true
		return true
	end

    return true
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

    if r > 0.5 then
        chargeTime = 0.1 + (math.random() * 0.9)
    end
    return 
    {
        AttackDistance = 175,    
        IsCombo = true,
        AttackProb = 0.7,
        SpectialAttackProb = 0.2,
        DashProb = 0.1,
        ChargeTime = chargeTime
    }
end

function SelectDarkWeapon(enemy, actionData)
    local r = math.random()
    -- init combo weapon to nil
    enemy.ComboWeapon = nil
    enemy.LastAction = ""

    -- use attack weapon
    if r < actionData.AttackProb then

        -- if the last action is dash, do dash attack
        if enemy.AIState.IsLastActionDash > 0 and _worldTime - enemy.AIState.LastActionTime < 0.3 then
            enemy.LastAction = "DashAttack"
            enemy.WeaponName = enemy.DashAttackWeapon
            return enemy.WeaponName
        end

        enemy.LastAction = "Attack"

        -- if character has primary attack that is chargable
        -- if enemy.PrimaryChargeWeapon ~= nil and actionData.ChargeTime > 0.2 then
        --     enemy.WeaponName = enemy.PrimaryChargeWeapon
        --     return enemy.WeaponName
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
        enemy.LastAction = "SpecialAttack"
        enemy.WeaponName = enemy.SpecialAttackWeapon
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