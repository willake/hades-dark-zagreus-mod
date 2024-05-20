if not DarkZagreus.Config.Enabled then return end

DZVersion = "alpha2"
DZDataVersion = "v1" -- for training data, when the data structure chages, the version increases
DebugPrint({ Text = string.format("DarkZagreus Mod loaded. Version: %s Data version: %s", DZVersion, DZDataVersion)})

-- entering hades boss room
OnAnyLoad { "D_Boss01", function(triggerArgs)
    DebugPrint({ Text = "Enter D_Boss01" })
    -- active enmies should only contain hades
    if ActiveEnemies ~= nil then
        for enemyId, enemy in pairs( ActiveEnemies ) do
            DebugPrint({ Text = "Hades Object ID " .. enemy.ObjectId })
            -- equip weapon
            local weaponData = {}
            
            if DZPersistent.PrevRunRecord then
                weaponData = DZPersistent.PrevRunRecord.Weapon
                
                if weaponData and DZPersistent.PrevRunRecord.History then
                    DZTrainAI()
                end
            end

            if DZPersistent.PrevRunRecord 
                and DZPersistent.PrevRunRecord.Version == DZDataVersion 
                and weaponData 
                and weaponData.WeaponName 
                and weaponData.ItemIndex then
                DZWeaponData[weaponData.WeaponName][weaponData.ItemIndex].Equip(enemy)
                DZDebugPrintTable("DZ Weapon Equipped", weaponData, 3)
            else
                DZWeaponData["SwordWeapon"][1].Equip(enemy)
                DZDebugPrintTable("DZ Weapon Equipped", 
                {
                    WeaponName = "SwordWeapon",
                    ItemIndex = 1
                }, 3)
            end 
        end
    end
end }

-- DZPersistant for data which can be saved with save files
DZPersistent = {}

-- DZTemp for data should be deleted after leaving the game
DZTemp = {}

SaveIgnores["DZTemp"] = true
SaveIgnores["DZVersion"] = true
SaveIgnores["DZDataVersion"] = true