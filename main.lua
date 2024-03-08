if not EvilZagreus.Config.Enabled then return end

DebugPrintf({ Text = "Setup Events" })

OnAnyLoad { "RoomOpening", function(triggerArgs)
    DebugPrintf({ Text = "Enter RoomOpening, Force next room to Hades boss room" })
    -- do stuff here
    ForceNextRoom = "D_Boss01"

    -- Stomp any rooms already assigned to doors
    for doorId, door in pairs(OfferedExitDoors) do
        local room = door.Room
        if room ~= nil then
            if ForceNextRoom ~= nil then
                DebugPrint({ Text = "ForceNextRoom = " .. tostring(ForceNextRoom) })
            end

            local forcedRoomData = RoomData[ForceNextRoom]
            local forcedRoom = CreateRoom(forcedRoomData)
            AssignRoomToExitDoor(door, forcedRoom)
        end
    end
end }

-- ZeusRushTrait
OnAnyLoad { "D_Boss01", function(triggerArgs)
    DebugPrintf({ Text = "Enter D_Boss01, Apply ZeusRushTrait on Hades " })
    -- do stuff here
    if ActiveEnemies ~= nil then
        DebugPrintf({ Text = "Apply ZeusRushTrait on Hades " })
        for enemyId, enemy in pairs( ActiveEnemies ) do
            DebugPrintf({ Text = "Hades Object ID " .. enemy.ObjectId })
			-- EquipReferencedEnemyWeapons( currentRun, traitData, enemy )
			-- ApplyEnemyTrait( CurrentRun, TraitData.ZeusRushTrait , enemy )
            SetWeaponProperty({ WeaponName = "EnemySwordWeapon", DestinationId = enemy.ObjectId, Property = "FireGraphic", Value = "ZagreusSwordArthurAttack1_Fire", ValueChangeType = "Absolute" })
            SetWeaponProperty({ WeaponName = "EnemySwordWeapon", DestinationId = CurrentRun.Hero.ObjectId, Property = "FireGraphic", Value = "ZagreusSwordArthurAttack1_Fire", ValueChangeType = "Absolute" })
            table.insert(enemy.WeaponOptions, "DarkNemesisSword")
            EquipWeapon({ Name = "DarkNemesisSword", DestinationId = enemy.ObjectId })
            table.insert(enemy.WeaponOptions, "DarkNemesisSword2")
            EquipWeapon({ Name = "DarkNemesisSword2", DestinationId = enemy.ObjectId })
            table.insert(enemy.WeaponOptions, "DarkNemesisSword3")
            EquipWeapon({ Name = "DarkNemesisSword3", DestinationId = enemy.ObjectId })
            table.insert(enemy.WeaponOptions, "DarkNemesisSwordDash")
            EquipWeapon({ Name = "DarkNemesisSwordDash", DestinationId = enemy.ObjectId })
            table.insert(enemy.WeaponOptions, "DarkNemesisSwordParry")
            EquipWeapon({ Name = "DarkNemesisSwordParry", DestinationId = enemy.ObjectId })
        end
    end
    
end }