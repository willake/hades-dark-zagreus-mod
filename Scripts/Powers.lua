-- these function are replicated version from Power.lua
-- because the original version is only available for player character

ModUtil.Path.Wrap("MarkTargetApply", function(base, triggerArgs)
    if not triggerArgs.Reapplied then
        DZTemp.LastMarkedTargetTime = _worldTime
        DZTemp.ValidMarkTime = 3
    end
    
    return base(triggerArgs)
end, DarkZagreus)

-- for aspect of chiron
function DZAIMarkTargetApply( triggerArgs )
	if not triggerArgs.Reapplied then
        DZTemp.AI.LastMarkedTargetTime = _worldTime
        DZTemp.AI.ValidMarkTime = 3
        SetWeaponProperty({ WeaponName = "DarkChironBowSplitShot", DestinationId = DZTemp.AI.ObjectId, Property = "OverrideFireRequestTarget", Value = triggerArgs.triggeredById, DataValue = false})
	end
end

function DZAIMarkTargetClear( triggerArgs )
	SetWeaponProperty({ WeaponName = "DarkChironBowSplitShot", DestinationId = DZTemp.AI.ObjectId, Property = "OverrideFireRequestTarget", Value = -1, DataValue = false})
end

-- deal with this function when rush weapon is fired while using aspect of talos
function DZAIFistVacuumRush(enemy, args)
    -- i might do this function later
    -- because I don't know when is it trigger
    enemy.VacuumRush = true
	wait( args.Duration, RoomThreadName )
	enemy.VacuumRush = false 
end

-- attract player to enemy position
function DZAICheckVacuumPlayer(enemy, targetId, args)
    -- TODO sometime it's not working, need to know why
    -- maybe also check if player is dead
	if targetId ~= 0 then
		local distanceBuffer = args.DistanceBuffer
        if enemy.VacuumRush then
			distanceBuffer = args.RushDistanceBuffer
		end
        Stop({ Id = targetId })
        -- DebugPrintf({ Text = "GetRequiredForceToEnemy: " .. GetRequiredForceToEnemy( targetId, enemy.ObjectId, -1 * distanceBuffer )})
		ApplyForce({ Id = targetId, Speed = GetRequiredForceToEnemy( targetId, enemy.ObjectId, -1 * distanceBuffer), Angle = GetAngleBetween({ Id = targetId, DestinationId = enemy.ObjectId }) })
		FireWeaponFromUnit({ Weapon = "DarkTalosFistSpecialVacuum", Id = enemy.ObjectId, DestinationId = targetId, AutoEquip = true })
		DZAIFistVacuumPullPresentation( enemy, targetId, args )
	end
end

function DZAIFistVacuumPullPresentation( attracter, victimId, args )
	CreateAnimationsBetween({ Animation = "FistVacuumFx", DestinationId = victimId, Id = attracter.ObjectId, Length = args.distanceBuffer, Stretch = true, UseZLocation = false, Group = "FX_Standing_Add" })
	PlaySound({ Name = "/SFX/Player Sounds/ZagreusFistMagnetismVacuumActivate", Id = victimId })
end

function DZAIMarkTargetFistApply( triggerArgs )
	if not triggerArgs.Reapplied then
		local validWeapons =
		{
			"DarkTalosFist",
			"DarkTalosFist2",
			"DarkTalosFist3",
			"DarkTalosFist4",
			"DarkTalosFist5",
			"DarkTalosFistDash",
		}

		AddIncomingDamageModifier( triggerArgs.TriggeredByTable,
		{
			Name = triggerArgs.EffectName,
			ValidWeapons = validWeapons,
			ValidWeaponMultiplier = triggerArgs.Modifier
		})
	end
end

function DZAIMarkTargetFistClear( triggerArgs )
	if triggerArgs.TriggeredByTable.IncomingDamageModifiers then
		RemoveIncomingDamageModifier( triggerArgs.TriggeredByTable, triggerArgs.EffectName )
	end
end

-- will wrap DamageHero in Combat.lua to call this
function DZAICheckComboPowers( victim, attacker, triggerArgs, sourceWeaponData )

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
		SetWeaponProperty({ WeaponName = "DarkDemeterFistSpecialDash", DestinationId = attacker.ObjectId, Property = "NumProjectiles", Value = 2 }) -- + GetTotalHeroTraitValue("BonusSpecialHits")
		SetWeaponProperty({ WeaponName = "DarkDemeterFistSpecialDash", DestinationId = attacker.ObjectId, Property = "ProjectileInterval", Value = 0.03 })
		SetWeaponProperty({ WeaponName = "DarkDemeterFistSpecialDash", DestinationId = attacker.ObjectId, Property = "FireFx2", Value = "FistUppercutSpecial" })

		DZAIComboReadyPresentation( attacker, triggerArgs )
	end

end

function DZAIComboReadyPresentation( attacker, triggerArgs )
	CreateAnimation({ Name = "FistComboReadyFx", DestinationId = attacker.ObjectId })
	CreateAnimation({ Name = "PowerUpComboReady", DestinationId = attacker.ObjectId })
	CreateAnimation({ Name = "FistComboReadyGlow", DestinationId = attacker.ObjectId })
	if CheckCooldown( "DZComboReadyHint", 1.5 ) then
		thread( InCombatText, attacker.ObjectId, "Combo_Ready", 0.8 )
		PlaySound({ Name = "/SFX/Player Sounds/ZagreusFistComboProc", Id = attacker.ObjectId })
	end
end

function DZAICheckComboPowerReset( attacker, weaponData )
	if weaponData ~= nil and attacker.ComboReady then
        DZDebugPrintString("Reset Combo")
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
function DZAICheckFistDetonation( attacker, victim, triggerArgs )
	if DZTemp.AI == nil then
		return
	end
	if victim.ObjectId ~= CurrentRun.Hero.ObjectId then
		return
	end

	if ( not victim.ActiveEffects or not victim.ActiveEffects["DZMarkRuptureTarget"] ) and triggerArgs.SourceWeapon == "DarkGilgameshFistSpecialDash" then
		DZDebugPrintString("Pass")
		local delay = 0.1
		-- original script use MapState
		DZTemp.AI.QueuedDetonations = DZTemp.AI.QueuedDetonations or {}
		while DZTemp.AI.QueuedDetonations[_worldTime + delay ] and delay < 2 do
			delay = delay + 0.1
		end
		local key = _worldTime + delay
		DZTemp.AI.QueuedDetonations[_worldTime + delay] = victim
		wait( delay, RoomThreadName )
		FireWeaponFromUnit({ Weapon = "DarkGilgameshFistDetonation", Id = attacker.ObjectId, DestinationId = victim.ObjectId, FireFromTarget = true, AutoEquip = true })
		DZTemp.AI.QueuedDetonations[key] = nil
		victim.LastRuptureTime = _worldTime
	end
end

function DZAIMarkRuptureTargetApply( triggerArgs )
	DZAIUpdateRuptureEffectStacks( triggerArgs )
end

function DZAIMarkRuptureTargetClear( triggerArgs )
	local victim = triggerArgs.TriggeredByTable
	StopAnimation({ Name = "PoseidonAresProjectileGlow", DestinationId = victim.ObjectId })
	DZAIClearRuptureEffectStacks( triggerArgs )
end

function DZAIUpdateRuptureEffectStacks( args )

	local unitId = args.triggeredById
	local unit = args.TriggeredByTable
	local startIconScale = 1.3

	if not EnemyHealthDisplayAnchors[ unitId .. "rupturestatus" ] then

		local backingId = nil
		local scale = 1
		if unit.BarXScale then
			scale = unit.BarXScale
		end

		backingId = SpawnObstacle({ Name = "RuptureSmall", Group = "Combat_UI_World", DestinationId = unitId, TriggerOnSpawn = false })
			CreateTextBox({ Id = backingId, FontSize = 20, OffsetX = 12, OffsetY = 0,
				Font = "AlegreyaSansSCExtraBold",
				Justification = "Left",
				ShadowColor = {0, 0, 0, 240}, ShadowOffset = {0, 2}, ShadowBlur = 0,
				OutlineThickness = 3, OutlineColor = {0.25, 0.3, 0.5, 1},
			})
		EnemyHealthDisplayAnchors[ unitId .. "rupturestatus" ] = backingId
	end
	
	local scaleTarget = 1.0
	SetScale({ Id = EnemyHealthDisplayAnchors[ unitId .. "rupturestatus" ], Fraction = startIconScale })

	DZAIPositionEffectStacks( unitId )
end

function DZAIClearRuptureEffectStacks( args )
	Destroy({ Id = EnemyHealthDisplayAnchors[ args.triggeredById .. "rupturestatus" ] })
	EnemyHealthDisplayAnchors[ args.triggeredById .. "rupturestatus" ] = nil
	DZAIPositionEffectStacks( args.triggeredById )
end

function DZAIOnRuptureDashHit( args )
	if DZTemp.AI == nil then
		return
	end
	local victim = args.TriggeredByTable
	-- if victim.TriggersOnDamageEffects and victim == CurrentRun.Hero then
    if victim == CurrentRun.Hero then
		if not victim.ActiveEffects or not victim.ActiveEffects["DZMarkRuptureTarget"]  then
			ApplyEffectFromWeapon({ WeaponName = "DarkGilgameshMarkRuptureApplicator", EffectName = "DZMarkRuptureTarget", Id = DZTemp.AI.ObjectId, DestinationId = victim.ObjectId })
		end
	end
end

function DZAIOnRuptureWeaponHit( args )
	if DZTemp.AI == nil then
		return
	end
	local victim = args.TriggeredByTable
	if victim == CurrentRun.Hero then
		if victim.ActiveEffects and victim.ActiveEffects["DZMarkRuptureTarget"]  then
			ApplyEffectFromWeapon({ WeaponName = "DarkGilgameshMarkRuptureApplicator", EffectName = "DZMarkRuptureTarget", Id = DZTemp.AI.ObjectId, DestinationId = victim.ObjectId })
		end
	end
end

-- for aspect of lucifer
function DZAIActivateLuciferFuse( enemy )
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

function DZAIGunBombDetonate( bomb )
	if DZTemp.AI then
		FireWeaponFromUnit({ Weapon = "DarkLuciferGunBomb", Id = DZTemp.AI.ObjectId, DestinationId = bomb.ObjectId, FireFromTarget = true })
	end
end

function DZAISetUpGunBombImmolation( enemy, currentRun, args )
	local hasGodGraphic = false
	if not hasGodGraphic then
		SetAnimation({ Name = "LuciferBomb", DestinationId = enemy.ObjectId })
	end

	-- let original system handle this, i don't wanna do that :)
	CurrentRun.Hero.WeaponSpawns = CurrentRun.Hero.WeaponSpawns or {}
	CurrentRun.Hero.WeaponSpawns[enemy.ObjectId] = enemy

	while not enemy.IsDead and DZTemp.AI do
		FireWeaponFromUnit({ Weapon = "DarkLuciferGunBombImmolation", Id = DZTemp.AI.ObjectId, DestinationId = enemy.ObjectId, FireFromTarget = true })
		if EnemyData[enemy.Name] and EnemyData[enemy.Name].ImmolationInterval then
			wait( EnemyData[enemy.Name].ImmolationInterval, RoomThreadName )
		else
			wait( 0.5, RoomThreadName )
		end
	end
end

-- for aspect of hestia
function DZAIManualReloadBonusApply( triggerArgs )
	DZTemp.AI.NextIsPowerShot = true
	-- SwapWeapon({ Name = "GunWeapon", SwapWeaponName = "SniperGunWeapon", ClearFireRequest = true, StompOriginalWeapon = false, GainedControlFrom = "GunWeapon", DestinationId = CurrentRun.Hero.ObjectId, ExtendControlIfSwapActive = true, RequireCurrentControl = true })
	-- SwapWeapon({ Name = "GunWeaponDash", SwapWeaponName = "SniperGunWeaponDash", ClearFireRequest = true, StompOriginalWeapon = false, GainedControlFrom = "SniperGunWeapon", DestinationId = CurrentRun.Hero.ObjectId, ExtendControlIfSwapActive = true, RequireCurrentControl = true })
end

function DZAIClearManualReloadVFX( owner )
	-- ClearEffect({ Id = owner.ObjectId, Name = "DZManualReloadBonus" })
end