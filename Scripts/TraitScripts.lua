-- there are some duplicated functions like those in TraitScripts, 
-- because those functions only appleis to hero
function AddTraitToBoss(boss, args)
    local traitData = args.TraitData
    if taitData == nil then
        traitData = { Unit = boss, TraitName = args.TraitName, Rarity = args.Rarity }
    end

    -- if not args.PreProcessedForDisplay then
	-- 	ExtractValues(CurrentRun.Hero, traitData, traitData)
	-- end
    EquipReferencedWeaponsBoss(boss, traitData)
    
end

function EquipReferencedWeaponsBoss(boss, traitData)
    local weaponKeys = {"PreEquipWeapons", "AddOnHitWeapons", "AddOnDamageWeapons", "AddOnSlamWeapons", "AddOnFireWeapons", "AmmoDropWeapons", "OnSuperWeapons", "OnProjectileReflectWeapons" }
    for i, weaponKey in pairs(weaponKeys) do
        if traitData[weaponKey] ~= nil then
            for i, weaponName in pairs(traitData[weaponKey]) do
                EquipWeapon({ Name = weaponName, DestinationId = boss.ObjectId })
                local weaponData = WeaponData[weaponName]
                if weaponData ~= nil and weaponData.Binks ~= nil then
                    PreLoadBinks({ Names = weaponData.Binks })
                end
            end
        end
    end

    -- was a lines for AddAssist but enemy don't need that
    local weaponTableKeys = { "AddOnEnemySpawnWeapon", "AddOnEffectWeapons", "OnEnemyDeathWeapon", "OnImpactWeapons" }
	for i, weaponTableKey in pairs(weaponTableKeys) do
		if traitData[weaponTableKey] ~= nil then
			EquipWeapon({ Name = traitData[weaponTableKey].Weapon, DestinationId = boss.ObjectId })
			local weaponData = WeaponData[weaponName]
			if weaponData ~= nil and weaponData.Binks ~= nil then
				PreLoadBinks({ Names = weaponData.Binks })
			end
		end
	end
end