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
            -- table.insert(enemy.WeaponOptions, "DarkSpear")
            -- EquipWeapon({ Name = "DarkSpear", DestinationId = enemy.ObjectId })
            -- table.insert(enemy.WeaponOptions, "DarkSpear2")
            -- EquipWeapon({ Name = "DarkSpear2", DestinationId = enemy.ObjectId })
            -- table.insert(enemy.WeaponOptions, "DarkSpear3")
            -- EquipWeapon({ Name = "DarkSpear3", DestinationId = enemy.ObjectId })
            -- table.insert(enemy.WeaponOptions, "DarkSpearDash")
            -- EquipWeapon({ Name = "DarkSpearDash", DestinationId = enemy.ObjectId })
            -- table.insert(enemy.WeaponOptions, "DarkSpearSpin")
            -- EquipWeapon({ Name = "DarkSpearSpin", DestinationId = enemy.ObjectId })
            -- table.insert(enemy.WeaponOptions, "DarkSpearSpin2")
            -- EquipWeapon({ Name = "DarkSpearSpin2", DestinationId = enemy.ObjectId })
            -- table.insert(enemy.WeaponOptions, "DarkSpearSpin3")
            -- EquipWeapon({ Name = "DarkSpearSpin3", DestinationId = enemy.ObjectId })
            enemy.PrimaryWeapon = "DarkBow";
            enemy.DashWeapon = "DarkRush";
            enemy.SpecialAttackWeapon = "DarkBowSplitShot";
            enemy.DashAttackWeapon = "DarkBowDash";
            -- table.insert(enemy.WeaponOptions, "DarkSpearThrow")
            -- EquipWeapon({ Name = "DarkSpearThrow", DestinationId = enemy.ObjectId })
            -- table.insert(enemy.WeaponOptions, "DarkSpearThrowReturn")
            -- EquipWeapon({ Name = "DarkSpearThrowReturn", DestinationId = enemy.ObjectId })
        end
    end
    
end }