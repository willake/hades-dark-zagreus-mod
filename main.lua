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
            -- SetWeaponProperty({ WeaponName = "EnemySwordWeapon", DestinationId = enemy.ObjectId, Property = "FireGraphic", Value = "ZagreusSwordArthurAttack1_Fire", ValueChangeType = "Absolute" })
            -- SetWeaponProperty({ WeaponName = "EnemySwordWeapon", DestinationId = CurrentRun.Hero.ObjectId, Property = "FireGraphic", Value = "ZagreusSwordArthurAttack1_Fire", ValueChangeType = "Absolute" })
            table.insert(enemy.WeaponOptions, "DarkHeraBow")
            EquipWeapon({ Name = "DarkHeraBow", DestinationId = enemy.ObjectId })
            table.insert(enemy.WeaponOptions, "DarkHeraBowDash")
            EquipWeapon({ Name = "DarkHeraBowDash", DestinationId = enemy.ObjectId })
            table.insert(enemy.WeaponOptions, "DarkHeraBowSplitShot")
            EquipWeapon({ Name = "DarkHeraBowSplitShot", DestinationId = enemy.ObjectId })
            -- table.insert(enemy.WeaponOptions, "DarkArthurSword3")
            -- EquipWeapon({ Name = "DarkArthurSword3", DestinationId = enemy.ObjectId })
            -- table.insert(enemy.WeaponOptions, "DarkArthurSwordDash")
            -- EquipWeapon({ Name = "DarkArthurSwordDash", DestinationId = enemy.ObjectId })
            -- table.insert(enemy.WeaponOptions, "DarkArthurSwordParry")
            -- EquipWeapon({ Name = "DarkArthurSwordParry", DestinationId = enemy.ObjectId })
        end
    end
    
end }