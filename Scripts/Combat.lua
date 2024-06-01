-- check if is damaged
ModUtil.Path.Wrap("DamageHero", function(base, victim, triggerArgs)
    if DZCheckCanRecord() then
        -- for record
        DZTemp.LastGetDamagedTime = _worldTime

        if DZTemp.AI then
            local attacker = triggerArgs.AttackerTable
            
            -- id is DarkZagreus's ObjectId
            if attacker and attacker.ObjectId == DZTemp.AI.ObjectId then
                DZTemp.AI.LastDamageEnemyTime = _worldTime 

                -- for aspect of gilgamesh
                local sourceWeaponData = GetWeaponData( attacker, triggerArgs.SourceWeapon )
                thread( DZAICheckComboPowers, victim, attacker, triggerArgs, sourceWeaponData )
                thread( DZAICheckFistDetonation, attacker, victim, triggerArgs)
            end 
        end
    end 
    
    return base(victim, triggerArgs)
end, DarkZagreus)

-- check if damaged enemies
ModUtil.Path.Wrap("DamageEnemy", function(base, victim, triggerArgs)

    if DZCheckCanRecord() then
        DZTemp.LastDamageEnemyTime = _worldTime
        
        if DZTemp.AI then
            if victim and victim.ObjectId == DZTemp.AI.ObjectId then
                DZTemp.AI.LastDamageEnemyTime = _worldTime 
            end  
        end    
    end
    return base(victim, triggerArgs)
end, DarkZagreus)

-- override the reload function to prevent the cobmat system from doing reload presentation on dark zagreus
ModUtil.Path.Override("ReloadGun", function (attacker, weaponData)
    if attacker.HandlingDeath or attacker.Reloading or attacker.SurgeActive then
		return false
	end

    if DZTemp.AI and attacker.ObjectId == DZTemp.AI.ObjectId then
        return DZAIReloadGun(attacker, weaponData)
    end

	attacker.Reloading = true
	local prevCooldownAnim = GetWeaponDataValue({ Id = attacker.ObjectId, WeaponName = "GunWeapon", Property = "FailedToFireCooldownAnimation" })
	if prevCooldownAnim ~= nil then
		SetWeaponProperty({ WeaponName = "GunWeapon", DestinationId = attacker.ObjectId, Property = "FailedToFireCooldownAnimation", Value = "null" })
	end
	SetWeaponProperty({ WeaponName = "GunWeapon", DestinationId = attacker.ObjectId, Property = "Enabled", Value = false })
	SetWeaponProperty({ WeaponName = "GunWeaponDash", DestinationId = attacker.ObjectId, Property = "Enabled", Value = false })
	SetWeaponProperty({ WeaponName = "SniperGunWeapon", DestinationId = attacker.ObjectId, Property = "Enabled", Value = false })
	SetWeaponProperty({ WeaponName = "SniperGunWeaponDash", DestinationId = attacker.ObjectId, Property = "Enabled", Value = false })

	RunWeaponMethod({ Id = attacker.ObjectId, Weapon = weaponData.Name, Method = "EmptyAmmo" })
    thread( UpdateGunUI )
    local presentationState = {}
    ReloadPresentationStart( attacker, weaponData, presentationState )
    wait( weaponData.ActiveReloadTime, RoomThreadName)
    if attacker.HandlingDeath then
        return false
    end
    ReloadPresentationComplete( attacker, weaponData, presentationState )
    if prevCooldownAnim ~= nil then
        SetWeaponProperty({ WeaponName = "GunWeapon", DestinationId = attacker.ObjectId, Property = "FailedToFireCooldownAnimation", Value = prevCooldownAnim })
    end
    RunWeaponMethod({ Id = attacker.ObjectId, Weapon = weaponData.Name, Method = "RefillAmmo" })
    SetWeaponProperty({ WeaponName = "GunWeapon", DestinationId = attacker.ObjectId, Property = "Enabled", Value = true })
    SetWeaponProperty({ WeaponName = "GunWeaponDash", DestinationId = attacker.ObjectId, Property = "Enabled", Value = true })
    SetWeaponProperty({ WeaponName = "SniperGunWeapon", DestinationId = attacker.ObjectId, Property = "Enabled", Value = true })
    SetWeaponProperty({ WeaponName = "SniperGunWeaponDash", DestinationId = attacker.ObjectId, Property = "Enabled", Value = true })
    thread( UpdateGunUI )
    attacker.Reloading = false
    return true
end, DarkZagreus)

function DZAIReloadGun(attacker, weaponData)
    attacker.Reloading = true

	RunWeaponMethod({ Id = attacker.ObjectId, Weapon = weaponData.Name, Method = "EmptyAmmo" })
    DZAIReloadPresentationStart( attacker, weaponData, presentationState )
    wait( weaponData.ActiveReloadTime, RoomThreadName)
    if attacker.HandlingDeath then
        return false
    end
    DZAIReloadPresentationComplete( attacker, weaponData, presentationState )
    RunWeaponMethod({ Id = attacker.ObjectId, Weapon = weaponData.Name, Method = "RefillAmmo" })
    attacker.Reloading = false
    return true
end

function DZAIManualReload( attacker )
    -- might be useful in the future
	-- if attacker.ActiveEffects then
	-- 	for effectName in pairs(attacker.ActiveEffects) do
	-- 		if EffectData[effectName] and EffectData[effectName].BlockReload then
	-- 			return
	-- 		end
	-- 	end
	-- end

	-- if CurrentDeathAreaRoom == nil and CurrentRun and CurrentRun.CurrentRoom and CurrentRun.CurrentRoom.DisableWeaponsExceptDash then
	-- 	return
	-- end

	for weaponName, v in pairs( attacker.Weapons ) do
		local weaponData = GetWeaponData( attacker, weaponName)
		if weaponData ~= nil and weaponData.ActiveReloadTime ~= nil then
			if attacker.Reloading then
				return
			end

            local weapon = DZTemp.AI.Weapon

			if RunWeaponMethod({ Id = attacker.ObjectId, Weapon = weaponData.Name, Method = "IsAmmoFull" }) then
                -- aspect of hestia can reload whenever
                if weapon and (weapon.WeaponName ~= "GunWeapon" or weapon.ItemIndex ~= 4) then
                    return
                end 
			end

			ReloadGun( attacker, weaponData )

			if weapon and weapon.WeaponName == "GunWeapon" and weapon.ItemIndex == 4 then
				ApplyEffectFromWeapon({ Id = attacker.ObjectId, DestinationId = attacker.ObjectId, WeaponName = "DZManualReloadEffectApplicator", EffectName = "DZManualReloadBonus" })
			end

			return
		end
	end
end