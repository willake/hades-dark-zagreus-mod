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