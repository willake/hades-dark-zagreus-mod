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