if not DarkZagreus.Config.Enabled then return end

function DZDarkZagreusKillPresentation( unit, args )
	DebugPrint({ Text = "Dark Zagreus Kill Presentation: " })
	unit.InTransition = true
	CurrentRun.CurrentRoom.Encounter.BossKillPresentation = true
	local killerId = CurrentRun.Hero.ObjectId
	local victimId = unit.ObjectId
	local deathPanSettings = args
	ClearEffect({ Ids = { victimId, killerId }, All = true, BlockAll = true, })
	StopSuper()
	ClearStoredAmmoHero()
	-- DestroyHadesFightObstacles()
	-- ExpireProjectiles({ Names = { "HadesCast", "HadesAmmoDrop", "HadesAmmoWeapon", "GraspingHands", "HadesTombstoneSpawn", "HadesCastBeam", "HadesCastBeamNoTracking" } })
	-- Destroy({ Ids = GetIdsByType({ Name = "HadesBidentReturnPoint" }) })
	-- StopAnimation({ DestinationId = CurrentRun.Hero.ObjectId, Name = "HadesReverseDarknessVignetteHold" })
	SetAlpha({ Ids = GetIds({ Name = "Terrain_Lighting_01" }), Fraction = 1.0, Duration = 1.0 })
	
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = false })

	local ammoIds = GetIdsByType({ Name = "AmmoPack" })
	SetObstacleProperty({ Property = "Magnetism", Value = 3000, DestinationIds = ammoIds })
	SetObstacleProperty({ Property = "MagnetismSpeedMax", Value = CurrentRun.Hero.LeaveRoomAmmoMangetismSpeed, DestinationIds = ammoIds })
	StopAnimation({ DestinationIds = ammoIds, Name = "AmmoReturnTimer" })
	SetUnitInvulnerable( unit )

	thread(LastKillPresentation, unit )
	SetPlayerInvulnerable( "DZDarkZagreusKillPresentation" )
	AddInputBlock({ Name = "DZDarkZagreusKillPresentation" })
	AddTimerBlock( CurrentRun, "DZDarkZagreusKillPresentation" )
	EndRamWeapons({ Id = killerId })

	if IsScreenOpen("Codex") then
		CloseCodexScreen()
	end

	if IsScreenOpen("TraitTrayScreen") then
		CloseAdvancedTooltipScreen()
	end

	SetMusicSection( 3 )

	Stop({ Id = unit.ObjectId })
	SetAnimation({ Name = "ZagreusDeadLoop", DestinationId = unit.ObjectId })
	AngleTowardTarget({ Id = CurrentRun.Hero.ObjectId, DestinationId = unit.ObjectId })

	if unit.Phase2ActivateGroups ~= nil then
		SetAlpha({ Ids = GetIds({ Names = unit.Phase2ActivateGroups }), Fraction = 0.0, Duration = 0.3 })
	end
	if unit.Phase2DeactivateGroups ~= nil then
		SetAlpha({ Ids = GetIds({ Names = unit.Phase2DeactivateGroups }), Fraction = 1.0, Duration = 0.3 })
	end

	if unit.Phase2VFX ~= nil then
		StopAnimation({ Name = unit.Phase2VFX, DestinationId = unit.ObjectId })
	end

	if unit.DefeatedSound ~= nil then
		PlaySound({ Name = unit.DefeatedSound, Id = unit.ObjectId })
	end
	thread( PlayVoiceLines, unit.DefeatedVoiceLines, true, unit )

	wait( 2.8, RoomThreadName )

	-- if TextLinesRecord["LordHadesFirstDefeat"] then
	-- 	wait( 2.8, RoomThreadName )
	-- else
	-- 	wait( 4.0, RoomThreadName )
	-- end

	-- ProcessTextLines( unit.BossPresentationOutroTextLineSets )
	-- ProcessTextLines( unit.BossPresentationOutroRepeatableTextLineSets )

	-- if not PlayRandomRemainingTextLines( unit, unit.BossPresentationOutroTextLineSets ) then
	-- 	PlayRandomRemainingTextLines( unit, unit.BossPresentationOutroRepeatableTextLineSets )
	-- end

	SetMusicSection( 10 )
	ZeroSuperMeter()
	ToggleControl({ Names = { "AdvancedTooltip", }, Enabled = true })
	HarpyKillPresentation( unit, args )
	wait( 1.0, RoomThreadName )
	RemoveInputBlock({ Name = "DZDarkZagreusKillPresentation" })
	ShowRunClearScreen()
	CurrentRun.ActiveBiomeTimer = false
	CurrentRun.CurrentRoom.Encounter.BossKillPresentation = false	
	thread( CheckQuestStatus, { Silent = true } )
end

-- for aspect of gilmamesh, mark target
function DZAIPositionEffectStacks( id )
	local unit = CurrentRun.Hero
	
	-- if not EnemyHealthDisplayAnchors[id] or not unit then
	-- 	return
	-- end

	local effects = {}
	if EnemyHealthDisplayAnchors[ id .. "rupturestatus" ] then
		table.insert( effects, EnemyHealthDisplayAnchors[ id .. "rupturestatus" ])
	end

	local spacing = 45
	-- if unit.UseBossHealthBar then
	-- 	spacing = 60
	-- end
	local width = (TableLength( effects ) - 1) * spacing

	for i, effectId in pairs( effects ) do
		Attach({ Id = effectId, DestinationId = id, OffsetY = -60, OffsetX = ((i - 1) * spacing - width/2) })
	end
end

function DZAIReloadPresentationStart( attacker, weaponData, state )
	if IsMoving({ Id = attacker.ObjectId }) then
		SetAnimation({ DestinationId = attacker.ObjectId, Name = weaponData.MovingReloadAnimation })
	else
		SetAnimation({ DestinationId = attacker.ObjectId, Name = weaponData.IdleReloadAnimation })
		-- FireWeaponFromUnit({ Weapon = "GunReloadSelf", AutoEquip = true, Id = attacker.ObjectId, DestinationId = attacker.ObjectId })
	end
end

function DZAIReloadPresentationComplete( attacker, weaponData, state )
	Flash({ Id = attacker.ObjectId, Speed = 6, MinFraction = 0, MaxFraction = 1, Color = Color.White, Duration = 0.15, ExpireAfterCycle = false })
	if DZTemp.AI.Weapon and DZTemp.AI.Weapon.WeaponName == "GunWeapon" and DZTemp.AI.Weapon.ItemIndex == 4 then
		PlaySound({ Name = "/SFX/Player Sounds/ZagreusGunReloadCompleteFlashLucifer", Id = attacker.ObjectId })
	else
		PlaySound({ Name = "/SFX/Player Sounds/ZagreusGunReloadCompleteFlash", Id = attacker.ObjectId })
	end
end