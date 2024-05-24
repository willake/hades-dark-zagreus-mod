if not DarkZagreus.Config.Enabled then return end 

DZVersion = "beta1.0"
DZDataVersion = "v1" -- for training data, when the data structure chages, the version increases
DZDebugPrintString(string.format("Mod is loaded. Version: %s Data version: %s", DZVersion, DZDataVersion))

-- entering hades boss room
OnAnyLoad { "D_Boss01", function(triggerArgs)
    DZDebugPrintString("Enter D_Boss01")
    -- active enmies should only contain hades
    if ActiveEnemies ~= nil then
        for enemyId, enemy in pairs( ActiveEnemies ) do
            DZDebugPrintString("Hades Object ID " .. enemy.ObjectId)
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
                DZDebugPrintTable("DZ Weapon Equipped", weaponData)
            else
                DZWeaponData["SwordWeapon"][1].Equip(enemy)
                DZDebugPrintTable("DZ Weapon Equipped", 
                {
                    WeaponName = "SwordWeapon",
                    ItemIndex = 1
                })
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

-- Load Dark Zagreus's portrait
local package = "DarkZagreus"
ModUtil.WrapBaseFunction( "SetupMap", function(baseFunc)
    DZDebugPrintString("Trying to load package "..package..".pkg")
    LoadPackages({Name = package})
    return baseFunc()
end)