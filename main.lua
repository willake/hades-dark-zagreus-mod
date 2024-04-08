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

            -- spear template
            enemy.PrimaryWeapon = "DarkShield";
            enemy.DashWeapon = "DarkRush";
            enemy.SpecialAttackWeapon = "DarkShieldThrow";
            -- enemy.SpecialAttackWeaponReturn = "DarkGuanYuSpearThrowReturn";
            -- enemy.SpecialAttackWeaponInvisibleReturn = "DarkAchillesSpearThrowInvisibleReturn";
            -- enemy.SpecialAttackWeaponRush = "DarkAchillesSpearRush";
            enemy.DashAttackWeapon = "DarkShieldDash";
            EquipWeapon({ Name = enemy.PrimaryWeapon, DestinationId = enemy.ObjectId })
            -- enemy.ShouldReturnSpearAfterThrow = false;

            -- shield template
            -- enemy.PrimaryWeapon = "DarkBeowulfShield";
            -- enemy.DashWeapon = "DarkRush";
            -- enemy.SpecialAttackWeapon = "DarkBeowulfShieldThrow";
            -- -- enemy.SpecialAttackBonusWeapon = "DarkChaosShieldThrowBonus";
            -- enemy.DashAttackWeapon = "DarkBeowulfShieldDash";
            -- EquipWeapon({ Name = enemy.PrimaryWeapon, DestinationId = enemy.ObjectId })
        
            -- fist template
            -- enemy.PrimaryWeapon = "DarkGilgameshFist";
            -- enemy.DashWeapon = "DarkRush";
            -- enemy.SpecialAttackWeapon = "DarkGilgameshFistSpecial";
            -- enemy.SpecialDashAttackWeapon = "DarkGilgameshFistSpecialDash";
            -- enemy.DashAttackWeapon = "DarkGilgameshFistDash";

            -- gun template
            enemy.PrimaryWeapon = "DarkGun";
            enemy.DashWeapon = "DarkRush";
            enemy.SpecialAttackWeapon = "DarkGunGrenadeToss";
            enemy.DashAttackWeapon = "DarkGunDash";
        end
    end
    
end }


-- for fist weapon
ModUtil.Path.Context.Wrap("DamageHero", function(victim, triggerArgs)
    local attacker = triggerArgs.AttackerTable
    local sourceWeaponData = GetWeaponData( attacker, triggerArgs.SourceWeapon )
	thread( DZCheckComboPowers, victim, attacker, triggerArgs, sourceWeaponData )
    DZCheckFistDetonation(attacker, victim, triggerArgs) -- for aspect of Gilgamesh
end, EvilZagreus)