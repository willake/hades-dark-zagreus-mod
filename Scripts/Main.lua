if not EvilZagreus.Config.Enabled then return end

OnAnyLoad { "D_Boss01", function(triggerArgs)
    DebugPrintf({ Text = "Enter D_Boss01, equipWeapon and setup the AI " })
    -- active enmies should only contain hades
    if ActiveEnemies ~= nil then
        for enemyId, enemy in pairs( ActiveEnemies ) do
            DebugPrintf({ Text = "Hades Object ID " .. enemy.ObjectId })
            -- equip weapon
            local weaponName = DZPersistent.Weapon.WeaponName
            local itemIndex = DZPersistent.Weapon.ItemIndex
            DZWeaponData[weaponName][itemIndex].Equip(enemy)
            UnitSetData.Enemies.Hades.AIStages.RandomAIFunctionNames = DZWeaponAI[weaponName]
        end
    end
end }

-- DZPersistant for data which can be saved with save files
DZPersistent = {}

-- DZTemp for data should be deleted after leaving the game
DZTemp = {}

SaveIgnores["DZTemp"] = true