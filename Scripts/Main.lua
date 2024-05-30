if not DarkZagreus.Config.Enabled then return end 
DZDebugPrintString(string.format("Mod is loaded. Version: %s Data version: %s", DarkZagreus.Version, DarkZagreus.DataVersion))

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
                and DZPersistent.PrevRunRecord.Version == DarkZagreus.DataVersion 
                and weaponData 
                and weaponData.WeaponName 
                and weaponData.ItemIndex then
                DZWeaponData[weaponData.WeaponName][weaponData.ItemIndex].Equip(enemy)
                DZDebugPrintTable("DZ Weapon Equipped", weaponData)
            else
                DZWeaponData[DarkZagreus.DefaultAIWeapon.WeaponName][DarkZagreus.DefaultAIWeapon.ItemIndex].Equip(enemy)
                DZDebugPrintTable("DZ Weapon Equipped", 
                {
                    WeaponName = DarkZagreus.DefaultAIWeapon.WeaponName,
                    ItemIndex = DarkZagreus.DefaultAIWeapon.ItemIndex
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

-- Load Dark Zagreus's portrait
local package = "DarkZagreus"
ModUtil.WrapBaseFunction( "SetupMap", function(baseFunc)
    DZDebugPrintString("Trying to load package "..package..".pkg")
    LoadPackages({Name = package})
    return baseFunc()
end)