if not EvilZagreus.Config.Enabled then return end

OnAnyLoad { "D_Boss01", function(triggerArgs)
    DebugPrintf({ Text = "Enter D_Boss01, equipWeapon and setup the AI " })
    -- active enmies should only contain hades
    if ActiveEnemies ~= nil then
        for enemyId, enemy in pairs( ActiveEnemies ) do
            DebugPrintf({ Text = "Hades Object ID " .. enemy.ObjectId })
            -- equip weapon
            local weaponName = DZ.Weapon.WeaponName
            local itemIndex = DZ.Weapon.ItemIndex
            DZWeaponData[weaponName][itemIndex].Equip(enemy)
            UnitSetData.Enemies.Hades.AIStages.RandomAIFunctionNames = DZWeaponAI[weaponName]
        end
    end
end }