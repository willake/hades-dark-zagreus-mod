if not DarkZagreus.Config.Enabled then return end

function DarkZagreusGunAI( enemy, currentRun )
    enemy.ShouldPreWarm = false
    return DZDoGunAILoop( enemy, currentRun )
end

-- The engine code covers ammo management already, i don't wanna mess it up
-- so maybe no manual reload in this code 

function DZDoGunAILoop(enemy, currentRun, targetId)
    local aiState = DZGetCurrentAIState(enemy)
    enemy.AIState = aiState
    local actionData = DZMakeAIActionData(aiState, enemy.DZ.LastActions)

    -- select a weapon to use if not exist
    enemy.WeaponName = DZSelectGunWeapon(enemy, actionData)
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

        if enemy.WeaponName == nil then
            return true
        end

        -- Attack
		local attackSuccess = false

        while not attackSuccess do
            attackSuccess = DZDoGunAIAttackOnce( enemy, currentRun, targetId, weaponAIData, actionData )

            if not attackSuccess then
				enemy.AINotifyName = "CanAttack"..enemy.ObjectId
				NotifyOnCanAttack({ Id = enemy.ObjectId, Notify = enemy.AINotifyName, Timeout = 9.0 })
				waitUntil( enemy.AINotifyName )
			end
        end
    end

    return true
end

function DZDoGunAIAttackOnce(enemy, currentRun, targetId, weaponAIData, actionData)
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

    if not DZFireGunWeapon( enemy, weaponAIData, currentRun, targetId, actionData ) then
        return false
    end

    return true
end

function DZFireGunWeapon(enemy, weaponAIData, currentRun, targetId, actionData)

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

    -- Aspect of Lucifer has a prewarm when first fire the weapon
    if weaponAIData.NeedPreWarm and enemy.ShouldPreWarm then
        if weaponAIData.PreWarmAnimation then
            SetAnimation({ DestinationId = enemy.ObjectId, Name = weaponAIData.PreWarmAnimation })
        end

        if weaponAIData.PreWarmDuration then
            wait( weaponAIData.PreWarmDuration, enemy.AIThreadName )
        end

        enemy.ShouldPreWarm = false
    end

    -- Fire
    
    DZDoRegularFire(enemy, weaponAIData, targetId)

    enemy.DZ.LastActionTime = _worldTime
    -- save both which action is used and the charge time
    DZAIEnqueueLastAction(enemy, { Action = enemy.DZ.TempAction, ChargeTime = actionData.ChargeTime })

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

function DZSelectGunWeapon(enemy, actionData)
    local r = math.random()
    -- init combo weapon to nil
    -- enemy.PostAttackChargeWeapon = nil
    -- use attack weapon

    local lastAction = DZAIGetLastAction(enemy)
    
    if r < actionData.Attack then

        if enemy.DZ.TempAction ~= 1 then
            enemy.ShouldPreWarm = true
        end

        enemy.DZ.TempAction = 1

        -- if the last action is dash, do dash attack
        if lastAction.Action == 0 and _worldTime - enemy.DZ.LastActionTime < 0.45 then
            enemy.WeaponName = enemy.DashAttackWeapon
            enemy.ChainedWeapon = nil
            return enemy.WeaponName
        end

        -- or just do a regular attack
        enemy.WeaponName = enemy.PrimaryWeapon
        enemy.ChainedWeapon = nil
        return enemy.WeaponName
    end

    -- use special attack
    if r < actionData.Attack + actionData.SpecialAttack then
        enemy.DZ.TempAction = 2
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

-- for aspect of hestia
function DZManualReloadBonusApply( triggerArgs )
	-- SwapWeapon({ Name = "GunWeapon", SwapWeaponName = "SniperGunWeapon", ClearFireRequest = true, StompOriginalWeapon = false, GainedControlFrom = "GunWeapon", DestinationId = CurrentRun.Hero.ObjectId, ExtendControlIfSwapActive = true, RequireCurrentControl = true })
	-- SwapWeapon({ Name = "GunWeaponDash", SwapWeaponName = "SniperGunWeaponDash", ClearFireRequest = true, StompOriginalWeapon = false, GainedControlFrom = "SniperGunWeapon", DestinationId = CurrentRun.Hero.ObjectId, ExtendControlIfSwapActive = true, RequireCurrentControl = true })
end

-- TODO: complete these functions
function DZActivateLuciferFuse( enemy )
	if enemy.FuseActivated or enemy.IsDead then
		return
	end
	enemy.FuseActivated = true
	ActivateFusePresentation( enemy )
	local delay = 0
	CurrentRun.CurrentRoom.FusedBombs = CurrentRun.CurrentRoom.FusedBombs  or {}
	while CurrentRun.CurrentRoom.FusedBombs[_worldTime + enemy.FuseDuration + delay ] and delay < 2 do
		delay = delay + 0.1
	end
	local key = _worldTime + enemy.FuseDuration + delay
	CurrentRun.CurrentRoom.FusedBombs[_worldTime + enemy.FuseDuration + delay] = enemy
	wait( enemy.FuseDuration + delay, RoomThreadName )
	PostActivatFusePresentation( enemy )
	Kill( enemy, { SkipDestroy = false } )
	CurrentRun.CurrentRoom.FusedBombs[key] = nil
end

function DZGunBombDetonate( bomb )
	FireWeaponFromUnit({ Weapon = "GunBombWeapon", Id = CurrentRun.Hero.ObjectId, DestinationId = bomb.ObjectId, FireFromTarget = true })
	thread(MarkObjectiveComplete, "GunGrenadeLuciferBlast")
end

function DZSetUpGunBombImmolation( enemy, currentRun, args )
	local hasGodGraphic = false
	for i, traitData in pairs( CurrentRun.Hero.Traits ) do
		if traitData.Slot == "Secondary" then
			hasGodGraphic = true
			break
		end
	end
	if not hasGodGraphic then
		SetAnimation({ Name = "LuciferBomb", DestinationId = enemy.ObjectId })
	end
	CurrentRun.Hero.WeaponSpawns = CurrentRun.Hero.WeaponSpawns or {}
	CurrentRun.Hero.WeaponSpawns[enemy.ObjectId] = enemy

	while not enemy.IsDead do
		FireWeaponFromUnit({ Weapon = "GunBombImmolation", Id = CurrentRun.Hero.ObjectId, DestinationId = enemy.ObjectId, FireFromTarget = true })
		if EnemyData[enemy.Name] and EnemyData[enemy.Name].ImmolationInterval then
			wait( EnemyData[enemy.Name].ImmolationInterval, RoomThreadName )
		else
			wait( 0.5, RoomThreadName )
		end
	end
end