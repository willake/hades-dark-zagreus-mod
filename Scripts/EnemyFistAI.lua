if not DarkZagreus.Config.Enabled then return end

function DarkZagreusFistAI( enemy, currentRun )
    enemy.ComboThreshold = 12 -- for AspectofDemeter
    return DZDoFistAILoop( enemy, currentRun )
end

function DZDoFistAILoop(enemy, currentRun, targetId)
    local aiState = DZGetCurrentAIState(enemy)
    enemy.AIState = aiState
    local actionData = DZMakeAIActionData(aiState, enemy.DZ.LastActions)

    -- select a weapon to use if not exist
    enemy.WeaponName = DZSelectFistWeapon(enemy, actionData)
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
			local didTimeout = DZDoMove( enemy, currentRun, targetId, weaponAIData)

			if didTimeout and weaponAIData.SkipAttackAfterMoveTimeout then
				return true
			end
		end

        -- Attack
		local attackSuccess = false

        while not attackSuccess do
            attackSuccess = DZDoFistAIAttackOnce( enemy, currentRun, targetId, weaponAIData, actionData )

            if not attackSuccess then
                DebugPrint({ Text = "Attack failed. Gonna try again."})
				enemy.AINotifyName = "CanAttack"..enemy.ObjectId
				NotifyOnCanAttack({ Id = enemy.ObjectId, Notify = enemy.AINotifyName, Timeout = 9.0 })
				waitUntil( enemy.AINotifyName )
			end
        end
    end

    return true
end

function DZDoFistAIAttackOnce(enemy, currentRun, targetId, weaponAIData, actionData)
    if targetId == nil then
        targetId = currentRun.Hero.ObjectId
    end
    weaponAIData.LastTargetId = targetId

    if weaponAIData == nil then
        weaponAIData = enemy
    end

    -- PRE ATTACK

    -- if not CanAttack({ Id = enemy.ObjectId }) then
	-- 	return false
	-- end

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

    -- if not CanAttack({ Id = enemy.ObjectId }) then
	-- 	return false
	-- end

    if not DZFireFistWeapon( enemy, weaponAIData, currentRun, targetId, actionData ) then
        return false
    end
    enemy.DZ.LastActionTime = _worldTime
    DZAIEnqueueLastAction(enemy, enemy.DZ.TempAction)
    
    return true
end

function DZFireFistWeapon(enemy, weaponAIData, currentRun, targetId, actionData)

    if ReachedAIStageEnd(enemy) or currentRun.CurrentRoom.InStageTransition then
        weaponAIData.ForcedEarlyExit = true
        return true
    end

    -- if not CanAttack({ Id = enemy.ObjectId }) then
    --     return false
    -- end

    if weaponAIData.AIAngleTowardsPlayerWhileFiring then
        AngleTowardTarget({ Id = enemy.ObjectId, DestinationId = targetId })
    end
    
    -- Prefire

    if weaponAIData.WillTriggerVacuumFunction then
        DZCheckVacuumPlayer(enemy, targetId, 
        {
            Range = 800,				-- Vacuum distance
            DistanceBuffer = 130,		-- Space to leave between player and enemy
            RushDistanceBuffer = 300,
            AutoLockArc = 60,
        })
    end

    DZDoPreFire(enemy, weaponAIData, targetId)

    -- Prefire End

    -- if not CanAttack({ Id = enemy.ObjectId }) then
    --     return false
    -- end

    -- Fire
    
    DZDoRegularFire(enemy, weaponAIData, targetId)

    -- for AspectofDemeter
    -- the original implementation is only available for player
    -- so I implement it here
    if weaponAIData.CheckComboPowerReset then
        -- local sourceWeaponData = GetWeaponData( attacker, weaponAIData.WeaponName )
        DZCheckComboPowerReset(enemy, weaponAIData)
    end

    -- Fire end

    if weaponAIData.Cooldown then
        wait(weaponAIData.Cooldown, enemy.AIThreadName)
    end

    if ReachedAIStageEnd(enemy) or currentRun.CurrentRoom.InStageTransition then
		weaponAIData.ForcedEarlyExit = true
		return true
	end

    return true
end

function DZSelectFistWeapon(enemy, actionData)
    local r = math.random()
    -- init combo weapon to nil
    -- enemy.PostAttackChargeWeapon = nil
    enemy.DZ.TempAction = 0

    local lastAction = DZAIGetLastAction(enemy)

    -- use attack weapon
    if r < actionData.Attack then
        enemy.DZ.TempAction = 1

        -- if the last action is dash, do dash attack
        if lastAction.Action == 0 and _worldTime - enemy.DZ.LastActionTime < 0.3 then
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

    -- use special attack
    if r < actionData.Attack + actionData.SpecialAttack then
        enemy.DZ.TempAction = 2

        -- fist weapon special has dash attack version
        if lastAction.Action == 0 and _worldTime - enemy.DZ.LastActionTime < 0.3 then
            enemy.WeaponName = enemy.SpecialDashAttackWeapon
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

-- these function are replicated version from Power.lua
-- because the original version is only available for player character

function DZFistVacuumRush(enemy)
    -- i might do this function later
    -- because I don't know when is it trigger
    enemy.VacuumRush = true
	wait( args.Duration, RoomThreadName )
	enemy.VacuumRush = false 
end

function DZFistVacuumPullPresentation( attracter, victimId, args )
	CreateAnimationsBetween({ Animation = "FistVacuumFx", DestinationId = victimId, Id = attracter.ObjectId, Length = args.distanceBuffer, Stretch = true, UseZLocation = false, Group = "FX_Standing_Add" })
	PlaySound({ Name = "/SFX/Player Sounds/ZagreusFistMagnetismVacuumActivate", Id = victimId })
end

-- attract player to enemy position
function DZCheckVacuumPlayer(enemy, targetId, args)
    -- TODO sometime it's not working, need to know why
    -- maybe also check if player is dead
	if targetId ~= 0 then
		local distanceBuffer = args.DistanceBuffer
        -- if CurrentRun.Hero.VacuumRush then
		-- 	distanceBuffer = args.RushDistanceBuffer
		-- end
        Stop({ Id = targetId })
        -- DebugPrintf({ Text = "GetRequiredForceToEnemy: " .. GetRequiredForceToEnemy( targetId, enemy.ObjectId, -1 * distanceBuffer )})
		ApplyForce({ Id = targetId, Speed = GetRequiredForceToEnemy( targetId, enemy.ObjectId, -1 * distanceBuffer), Angle = GetAngleBetween({ Id = targetId, DestinationId = enemy.ObjectId }) })
		FireWeaponFromUnit({ Weapon = "DarkTalosFistSpecialVacuum", Id = enemy.ObjectId, DestinationId = targetId })
		DZFistVacuumPullPresentation( enemy, targetId, args )
	end
end

-- will wrap DamageHero in Combat.lua to call this
function DZCheckComboPowers( victim, attacker, triggerArgs, sourceWeaponData )

	if sourceWeaponData == nil or sourceWeaponData.ComboPoints == nil or sourceWeaponData.ComboPoints <= 0 then
		return
	end
    
    if sourceWeaponData.UseComboPower == nil then
        return
    end

	attacker.ComboCount = (attacker.ComboCount or 0) + sourceWeaponData.ComboPoints

    DebugPrintf({ Text = "Combo" .. attacker.ComboCount })

	if attacker.ComboCount >= attacker.ComboThreshold and not attacker.ComboReady then
		attacker.ComboReady = true
		SetWeaponProperty({ WeaponName = "DarkDemeterFistSpecial", DestinationId = attacker.ObjectId, Property = "NumProjectiles", Value = 2 }) -- + GetTotalHeroTraitValue("BonusSpecialHits")
		SetWeaponProperty({ WeaponName = "DarkDemeterFistSpecial", DestinationId = attacker.ObjectId, Property = "FireFx2", Value = "FistUppercutSpecial" })
		-- if HeroHasTrait( "FistSpecialFireballTrait" ) then
		-- 	SetWeaponProperty({ WeaponName = "FistWeaponSpecial", DestinationId = CurrentRun.Hero.ObjectId, Property = "ProjectileInterval", Value = 0.08 })
		-- else
        SetWeaponProperty({ WeaponName = "DarkDemeterFistSpecial", DestinationId = attacker.ObjectId, Property = "ProjectileInterval", Value = 0.03 })
		-- end
		SetWeaponProperty({ WeaponName = "DarkDemeterFistSpecialDash", DestinationId = attacker.ObjectId, Property = "NumProjectiles", Value = 1 }) -- + GetTotalHeroTraitValue("BonusSpecialHits")
		SetWeaponProperty({ WeaponName = "DarkDemeterFistSpecialDash", DestinationId = attacker.ObjectId, Property = "ProjectileInterval", Value = 0.03 })
		SetWeaponProperty({ WeaponName = "DarkDemeterFistSpecialDash", DestinationId = attacker.ObjectId, Property = "FireFx2", Value = "FistUppercutSpecial" })

		DZComboReadyPresentation( attacker, triggerArgs )
	end

end

function DZComboReadyPresentation( attacker, triggerArgs )
	CreateAnimation({ Name = "FistComboReadyFx", DestinationId = attacker.ObjectId })
	CreateAnimation({ Name = "PowerUpComboReady", DestinationId = attacker.ObjectId })
	CreateAnimation({ Name = "FistComboReadyGlow", DestinationId = attacker.ObjectId })
	if CheckCooldown( "ComboReadyHint", 1.5 ) then
		thread( InCombatText, attacker.ObjectId, "Combo_Ready", 0.8 )
		PlaySound({ Name = "/SFX/Player Sounds/ZagreusFistComboProc", Id = attacker.ObjectId })
	end
end

function DZCheckComboPowerReset( attacker, weaponData )
	if weaponData ~= nil and attacker.ComboReady then
        DebugPrintf({ Text = "Reset Combo"})
		-- thread(MarkObjectiveComplete, "FistWeaponFistWeave")
		attacker.ComboReady = false
		attacker.ComboCount = 0
		SetWeaponProperty({ WeaponName = "DarkDemeterFistSpecial", DestinationId = attacker.ObjectId, Property = "NumProjectiles", Value = 2 })
		-- if HeroHasTrait( "FistSpecialFireballTrait" ) then
		-- 	SetWeaponProperty({ WeaponName = "FistWeaponSpecial", DestinationId = attacker.ObjectId, Property = "NumProjectiles", Value = 1 })
		-- end
		SetWeaponProperty({ WeaponName = "DarkDemeterFistSpecial", DestinationId = attacker.ObjectId, Property = "ProjectileInterval", Value = 0.13 })
		SetWeaponProperty({ WeaponName = "DarkDemeterFistSpecial", DestinationId = attacker.ObjectId, Property = "FireFx2", Value = "null" })
		SetWeaponProperty({ WeaponName = "DarkDemeterFistSpecialDash", DestinationId = attacker.ObjectId, Property = "NumProjectiles", Value = 1 })
		SetWeaponProperty({ WeaponName = "DarkDemeterFistSpecialDash", DestinationId = attacker.ObjectId, Property = "ProjectileInterval", Value = 0 })
		SetWeaponProperty({ WeaponName = "DarkDemeterFistSpecialDash", DestinationId = attacker.ObjectId, Property = "FireFx2", Value = "null" })
		if not args or not args.Undelivered then
			ComboDeliveredPresentation( attacker )
		end
	end
end

-- for aspect of gilgamesh
function DZCheckFistDetonation( attacker, victim, triggerArgs )
	if ( not victim.ActiveEffects or not victim.ActiveEffects.MarkRuptureTarget ) and triggerArgs.SourceWeapon == "DarkGilgameshFistSpecialDash" then
		local delay = 0.1
		MapState.QueuedDetonations = MapState.QueuedDetonations  or {}
		while MapState.QueuedDetonations[_worldTime + delay ] and delay < 2 do
			delay = delay + 0.1
		end
		local key = _worldTime + delay
		MapState.QueuedDetonations[_worldTime + delay] = victim
		wait( delay, RoomThreadName )
		FireWeaponFromUnit({ Weapon = "DarkGilgameshFistDetonation", Id = attacker.ObjectId, DestinationId = victim.ObjectId, FireFromTarget = true, AutoEquip = true })
		MapState.QueuedDetonations[key] = nil
		victim.LastRuptureTime = _worldTime
	end
end

function DZOnRuptureDashHit( args )
    local attacker = args.AttackerTable
	local victim = args.TriggeredByTable
	-- if victim.TriggersOnDamageEffects and victim == CurrentRun.Hero then
    if victim == CurrentRun.Hero then
		if not victim.ActiveEffects or not victim.ActiveEffects.MarkRuptureTarget  then
			ApplyEffectFromWeapon({ WeaponName = "DarkGilgameshMarkRuptureApplicator", EffectName = "MarkRuptureTarget", Id = attacker.ObjectId, DestinationId = victim.ObjectId })
		end
	end
end

function DZOnRuptureWeaponHit( args )
    local attacker = args.AttackerTable
	local victim = args.TriggeredByTable
	if victim == CurrentRun.Hero then
		if victim.ActiveEffects and victim.ActiveEffects.MarkRuptureTarget  then
			ApplyEffectFromWeapon({ WeaponName = "DarkGilgameshMarkRuptureApplicator", EffectName = "MarkRuptureTarget", Id = attacker.ObjectId, DestinationId = victim.ObjectId })
		end
	end
end

-- for aspect of Gilgamesh
ModUtil.Path.Wrap("DamageHero", function(base, victim, triggerArgs)
    local attacker = triggerArgs.AttackerTable
    local sourceWeaponData = GetWeaponData( attacker, triggerArgs.SourceWeapon )
	thread( DZCheckComboPowers, victim, attacker, triggerArgs, sourceWeaponData )
    DZCheckFistDetonation(attacker, victim, triggerArgs) -- for aspect of Gilgamesh
    return base(victim, triggerArgs)
end, DarkZagreus)