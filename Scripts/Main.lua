if not DarkZagreus.Config.Enabled then return end 
DZDebugPrintString(string.format("Mod is loaded. Version: %s Data version: %s", DarkZagreus.Version, DarkZagreus.DataVersion))

-- entering hades boss room
OnAnyLoad { "D_Boss01", function(triggerArgs)
    DZDebugPrintString("Enter D_Boss01")
    -- active enmies should only contain hades
    if ActiveEnemies ~= nil then
        for enemyId, enemy in pairs( ActiveEnemies ) do
            DZDebugPrintString("Hades Object ID " .. enemy.ObjectId)

            local prevWeaponData = {}
            local prevTraits = {}

            if DZPersistent.PrevRunRecord and DZPersistent.PrevRunRecord.Version == DarkZagreus.DataVersion then
                prevWeaponData = DZPersistent.PrevRunRecord.Weapon
                
                if prevWeaponData and DZPersistent.PrevRunRecord.History then
                    DZTrainAI()
                end

                prevTraits = DZPersistent.PrevRunRecord.Traits or {}
            end

            local weaponData = DarkZagreus.DefaultAIWeapon

            if prevWeaponData and prevWeaponData.WeaponName and prevWeaponData.ItemIndex then
                weaponData = prevWeaponData
            end
            
            DZWeaponData[weaponData.WeaponName].Equip(enemy)
            DZDebugPrintTable("DZ Weapon Equipped", weaponData)

            -- Note(Huiun): apply traits based on avilable traits
            for index, trait in ipairs(prevTraits) do
                if trait.Name and DarkZagreus.AvailableTraits[trait.Name] then
                    DZUtil.Trait.AddTraitToUnit({ Unit = enemy, TraitData = GetProcessedTraitData({Unit = enemy, TraitName = trait.Name, Rarity = trait.Rarity})}) 
                end     
            end

            DZWeaponData[weaponData.WeaponName].PostTraitApply(enemy)
        end
    end
end }

-- Load Dark Zagreus's portrait
local package = "DarkZagreus"
ModUtil.WrapBaseFunction( "SetupMap", function(baseFunc)
    DZDebugPrintString("Trying to load package "..package..".pkg")
    LoadPackages({Name = package})
    return baseFunc()
end)