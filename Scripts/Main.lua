if not DarkZagreus.Config.Enabled then return end

OnAnyLoad { "D_Boss01", function(triggerArgs)
    DebugPrintf({ Text = "Enter D_Boss01, equipWeapon" })
    -- active enmies should only contain hades
    if ActiveEnemies ~= nil then
        for enemyId, enemy in pairs( ActiveEnemies ) do
            DebugPrintf({ Text = "Hades Object ID " .. enemy.ObjectId })
            -- equip weapon
            local weaponData = DZPersistent.PrevRunRecord.Weapon
            if weaponData.WeaponName and weaponData.ItemIndex then
                DZWeaponData[weaponData.WeaponName][weaponData.ItemIndex].Equip(enemy)
            else
                DZWeaponData["SwordWeapon"][1].Equip(enemy)
            end 
        end
    end
end }

-- DZPersistant for data which can be saved with save files
DZPersistent = {}

-- DZTemp for data should be deleted after leaving the game
DZTemp = {}

SaveIgnores["DZTemp"] = true