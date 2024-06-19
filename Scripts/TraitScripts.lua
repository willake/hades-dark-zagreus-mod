
function DZUtil.Trait.AddTraitToUnit(args)
    local unit = args.Unit
	local traitData = args.TraitData
	if traitData == nil then
		traitData = GetProcessedTraitData({ Unit = unit, TraitName = args.TraitName, Rarity = args.Rarity })
	end

	-- if not args.PreProcessedForDisplay then
	-- 	ExtractValues(CurrentRun.Hero, traitData, traitData)
	-- end

	-- traits may have information that acts on weapons, so we must first equip all associated weapons to the player
	DZUtil.Trait.EquipReferencedWeapons( unit, traitData )
	DZUtil.Trait.AddTraitData( unit, traitData, args )

	EquipSpecialWeapons( unit, traitData )

    -- Note(Huiun): This is assist, will have this in the future
	-- AddAssistWeapons( unit, traitData )


	for weaponName, v in pairs( unit.Weapons ) do
		AddWallSlamWeapons( unit, traitData )
		AddOnDamageWeapons(unit, weaponName, traitData)
		AddOnFireWeapons(unit, weaponName, traitData)
		if traitData.UpgradeHeroWeapon ~= nil and Contains(traitData.UpgradeHeroWeapon.WeaponNames, weaponName) then
			AddHeroWeaponUpgrade(weaponName, traitData.UpgradeHeroWeapon.UpgradeName)
		end
	end

	DZUtil.Trait.ApplyDZActionConfig(unit, traitData)

    -- Note(Huiun): I think I won't need this, but leave here
	-- if ( traitData.EnemyPropertyChanges or traitData.AddEnemyOnDeathWeapons ) and ActiveEnemies ~= nil then
	-- 	for enemyId, enemy in pairs( ActiveEnemies ) do
	-- 		EquipReferencedEnemyWeapons( currentRun, traitData, enemy )
	-- 		ApplyEnemyTrait( CurrentRun, traitData, enemy )
	-- 	end
	-- end

    -- Note(Huiun): This is Call, will have it in the future
	-- if traitData.AddShout then
	-- 	if traitData.AddShout.Cost then
	-- 		CurrentRun.Hero.SuperCost = traitData.AddShout.Cost
	-- 	else
	-- 		CurrentRun.Hero.SuperCost = 25
	-- 	end
	-- 	ShowSuperMeter()
	-- end
end

-- Note(Huiun): This is my custom function for applying config for actions, like whether return spear after throwing it
function DZUtil.Trait.ApplyDZActionConfig(unit, traitData)
	if traitData and traitData.DZActionConfig then
		if unit.DZActionConfig == nil then
			unit.DZActionConfig = {}
		end

		for key, val in pairs(traitData.DZActionConfig) do
			unit.DZActionConfig[key] = val
		end
	end
end

function DZUtil.Trait.EquipReferencedWeapons( unit, traitData )
	local weaponKeys = {"PreEquipWeapons", "AddOnHitWeapons", "AddOnDamageWeapons", "AddOnSlamWeapons", "AddOnFireWeapons", "AmmoDropWeapons", "OnSuperWeapons", "OnProjectileReflectWeapons" }
	for i, weaponKey in pairs(weaponKeys) do
		if traitData[weaponKey] ~= nil then
			for i, weaponName in pairs(traitData[weaponKey]) do
				EquipWeapon({ Name = weaponName, DestinationId = unit.ObjectId })
				local weaponData = WeaponData[weaponName]
				if weaponData ~= nil and weaponData.Binks ~= nil then
					PreLoadBinks({ Names = weaponData.Binks })
				end
			end
		end
	end

	if traitData.AddAssist and traitData.AddAssist.WeaponName then
		local weaponName = traitData.AddAssist.WeaponName
		EquipWeapon({ Name = weaponName, DestinationId = unit.ObjectId })
		local weaponData = WeaponData[weaponName]
		if weaponData ~= nil and weaponData.Binks ~= nil then
			PreLoadBinks({ Names = weaponData.Binks })
		end
	end

	local weaponTableKeys = { "AddOnEnemySpawnWeapon", "AddOnEffectWeapons", "OnEnemyDeathWeapon", "OnImpactWeapons" }
	for i, weaponTableKey in pairs(weaponTableKeys) do
		if traitData[weaponTableKey] ~= nil then
			EquipWeapon({ Name = traitData[weaponTableKey].Weapon, DestinationId = unit.ObjectId })
			local weaponData = WeaponData[weaponName]
			if weaponData ~= nil and weaponData.Binks ~= nil then
				PreLoadBinks({ Names = weaponData.Binks })
			end
		end
	end
end

function DZUtil.Trait.AddTrait( unit, traitName, rarity, args)
	local traitData = GetProcessedTraitData({ Unit = unit, TraitName = traitName, Rarity = rarity })
	if args and args.Id then
		traitData.Id = args.Id
	end
	ExtractValues( unit, traitData, traitData )
	DZUtil.Trait.AddTraitData( unit, traitData, args )
end

-- original one has heavy player related code, so I need to do it by my own
function DZUtil.Trait.AddTraitData( unit, traitData, args )
	args = args or {}
	local isDuplicate = false
	local newTrait = DeepCopyTable( traitData )
	local traitName = newTrait.Name
	if unit.Traits == nil then
		unit.Traits = {}
	end

	-- Check if this is a "dummy trait" used by transforming traits to run one-off events or to hide the "traitiness" of certain systems
	if traitData.DummyTrait then
		if traitData.HealOnAcquire then
			-- Heal( unit.Hero, { HealAmount = traitData.HealOnAcquire, Name = traitName.."Acquire" } )
		end
		if traitData.AddTrait and TraitData[traitData.AddTrait] then
			DZUtil.Trait.AddTrait( unit, traitData.AddTrait )
		end
		if traitData.AddLastStand then
			-- AddLastStand( traitData.AddLastStand )
		end
		return
	end
    
    -- it's hero related by hope it still works fine
	newTrait.Id =  newTrait.Id or GetTraitUniqueId()

	table.insert( unit.Traits, newTrait )

	if not args.SkipPriorityTray then
		DZUtil.Trait.PriorityTrayTraitAdd( newTrait, { DeferSort = true })
	end
    
	AddOnHitWeapons( unit, newTrait )
	if newTrait.AddIncomingDamageModifiers then
		if unit.IncomingDamageModifiers == nil then
			unit.IncomingDamageModifiers = {}
		end
		local data = DeepCopyTable( newTrait.AddIncomingDamageModifiers )
		data.Name = newTrait.Name
		table.insert( unit.IncomingDamageModifiers, data )
	end

	if newTrait.AddOutgoingLifestealModifiers then	
		local data = DeepCopyTable( newTrait.AddOutgoingLifestealModifiers )
		data.Name = newTrait.Name
		AddOutgoingLifestealModifier( unit, data )
	end

	if newTrait.AddOutgoingDamageModifiers then
		if unit.OutgoingDamageModifiers == nil then
			unit.OutgoingDamageModifiers = {}
		end
		local data = DeepCopyTable( newTrait.AddOutgoingDamageModifiers )
		data.Name = newTrait.Name
		table.insert( unit.OutgoingDamageModifiers, data )
	end

	local isDuplicate = GetTraitCount( unit, newTrait ) > 1
	if isDuplicate and newTrait.OnDuplicatePropertyChanges ~= nil then
		ApplyUnitPropertyChanges( unit, traitData.OnDuplicatePropertyChanges, true )
	else
		ApplyUnitPropertyChanges( unit, traitData.PropertyChanges, true )
		if GetTraitCount( unit, newTrait ) <= 1 and traitData.AnimationName ~= nil then
            -- Note(Huiun): not sure what it does
			-- unit.TraitAnimationAnchors[traitName] = SpawnObstacle({ Name = "BlankObstacle", Group = "Events", DestinationId = unit.ObjectId })
			-- Attach({ Id = unit.TraitAnimationAnchors[traitName], DestinationId = unit.ObjectId })
			-- SetAnimation({ Name = traitData.AnimationName, DestinationId = unit.TraitAnimationAnchors[traitName]})
		end
	end

	if not isDuplicate then
		ApplyLinkedTraitPropertyChanges(unit, newTrait )
	end

	if traitData.WeaponDataOverride then
		if not unit.WeaponDataOverride then
			unit.WeaponDataOverride = {}
		end
		for key, data in pairs(traitData.WeaponDataOverride) do
			if unit.WeaponDataOverride[key] then
				unit.WeaponDataOverride[key] = MergeTables(unit.WeaponDataOverride[key], data )
			else
				unit.WeaponDataOverride[key] = MergeTables(WeaponData[key], data )
			end
		end
	end

	if traitData.AddEffectMultiplier then
		if not unit.EffectMultipliers then
			unit.EffectMultipliers = {}
		end
		local effectMultiplierData = traitData.AddEffectMultiplier
		if effectMultiplierData.WeaponName then
			if unit.EffectMultipliers[effectMultiplierData.WeaponName] and unit.EffectMultipliers[effectMultiplierData.WeaponName][effectMultiplierData.EffectName] then
				unit.EffectMultipliers[effectMultiplierData.WeaponName][effectMultiplierData.EffectName].Multiplier = unit.EffectMultipliers[effectMultiplierData.WeaponName][effectMultiplierData.EffectName].Multiplier + (effectMultiplierData.Multiplier - 1)
			else
				unit.EffectMultipliers[effectMultiplierData.WeaponName] =
				{
				[effectMultiplierData.EffectName] =
					{
					TraitName = effectMultiplierData.RequiredTraitName,
					Multiplier = effectMultiplierData.Multiplier
					}
				}
			end
		end
		if effectMultiplierData.WeaponNames then
			for i, weaponName in pairs(effectMultiplierData.WeaponNames) do
				if unit.EffectMultipliers[weaponName] and unit.EffectMultipliers[weaponName][effectMultiplierData.EffectName] then
					unit.EffectMultipliers[weaponName][effectMultiplierData.EffectName].Multiplier = unit.EffectMultipliers[weaponName][effectMultiplierData.EffectName].Multiplier + (effectMultiplierData.Multiplier - 1)
				else
					unit.EffectMultipliers[weaponName] =
					{
					[effectMultiplierData.EffectName] =
						{
						TraitName = effectMultiplierData.RequiredTraitName,
						Multiplier = effectMultiplierData.Multiplier
						}
					}
				end
			end
		end
	end

	if newTrait.SetupFunction ~= nil and (not newTrait.SetupFunction.RunOnce or not isDuplicate) and not newTrait.SetupFunction.SkipSetupOnAdd then
		_G[newTrait.SetupFunction.Name](unit, newTrait.SetupFunction.Args)
	end

	if (traitData.Duration ~= nil) then
		thread(RemoveTraitAfterDuration, unit, traitName, traitData.Duration)
	end

	if traitData.LoadBinks ~= nil then
		PreLoadBinks({ Names = traitData.LoadBinks })
	end
end

function DZUtil.Trait.PriorityTrayTraitAdd(newTrait, args)
    
end

function DZUtil.Trait.UnitHasTrait(unit, traitName)
    if traitName == nil then
        return false
    end
    if TraitData[traitName] == nil then
        DebugAssert({ Condition = (TraitData[traitName] ~= nil), Text = "TraitData is missing value for '"..traitName.."'" })
    end

    if unit.TraitDictionary then
        if unit.TraitDictionary[traitName] ~= nil then
            return true
        end
        return false
    end

    for i, trait in pairs( unit.Traits ) do
        if trait.Name == traitName then
            return true
        end
    end

    return false 
end