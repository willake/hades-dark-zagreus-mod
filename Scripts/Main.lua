if not DarkZagreus.Config.Enabled then return end 
DZDebugPrintString(string.format("Mod is loaded. Version: %s Data version: %s", DarkZagreus.Version, DarkZagreus.DataVersion))

-- entering hades boss room
OnAnyLoad { "D_Boss01", function(triggerArgs)
    DZDebugPrintString("Enter D_Boss01")
    -- active enmies should only contain hades
    if ActiveEnemies ~= nil then
        for enemyId, enemy in pairs( ActiveEnemies ) do
            DZDebugPrintString("Hades Object ID " .. enemy.ObjectId)

            local weaponData = DarkZagreus.DefaultAIWeapon
            local traits = DarkZagreus.DefaultAITraits

            if DZPersistent.PrevRunRecord and DZPersistent.PrevRunRecord.Version == DarkZagreus.DataVersion then
                weaponData = DZPersistent.PrevRunRecord.Weapon
                
                if weaponData and DZPersistent.PrevRunRecord.History then
                    DZTrainAI()
                end

                traits = DZPersistent.PrevRunRecord.Traits
            end
            
            -- Note(Huiun): equip weapons first so that we can apply traits 
            DZWeaponData[weaponData.WeaponName].Equip(enemy)
            DZDebugPrintTable("DZ Weapon Equipped", weaponData)

            -- Note(Huiun): apply weapon traits first
            for index, trait in ipairs(traits) do
                if trait.Name and DarkZagreus.WeaponTraits[trait.Name] then
                    DZUtil.Trait.AddTraitToUnit({ Unit = enemy, TraitData = GetProcessedTraitData({Unit = enemy, TraitName = "DZ" .. trait.Name, Rarity = trait.Rarity})}) 
                end   
            end
            DZDebugPrintString("Weapon Trait Applied")

            -- Note(Huiun): apply traits based on avilable traits
            for index, trait in ipairs(traits) do
                if trait.Name and DarkZagreus.AvailableTraits[trait.Name] then
                    DZUtil.Trait.AddTraitToUnit({ Unit = enemy, TraitData = GetProcessedTraitData({Unit = enemy, TraitName = "DZ" .. trait.Name, Rarity = trait.Rarity})}) 
                end     
            end
            DZDebugPrintString("Other Traits Applied")
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