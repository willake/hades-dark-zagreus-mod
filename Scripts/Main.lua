if not DarkZagreus.Config.Enabled then return end

DZVersion = "alpha2"
DebugPrint({ Text = "DarkZagreus Mod loaded. Version: " .. DZVersion})

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

            if weaponData and weaponData.WeaponName and weaponData.ItemIndex then
                DZWeaponData[weaponData.WeaponName][weaponData.ItemIndex].Equip(enemy)
            else
                DZWeaponData["SwordWeapon"][1].Equip(enemy)
            end 

            DZDebugPrintTable("DZ Weapon Equipped", weaponData, 3)
        end
    end
end }

-- DZPersistant for data which can be saved with save files
DZPersistent = {}

-- DZTemp for data should be deleted after leaving the game
DZTemp = {}

SaveIgnores["DZTemp"] = true
SaveIgnores["DZVersion"] = true