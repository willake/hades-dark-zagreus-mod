if not DarkZagreus.Config.Enabled then return end 

DZWeaponData =
{
	SwordWeapon =
	{
		Equip = function (enemy)
			enemy.Weapons = { DarkSword = true, DarkSword2 = true, DarkSword3 = true, DarkRush = true, DarkSwordParry = true, DarkSwordDash = true}
			EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkSword" })
			EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkSword2" })
			EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkSword3" })
			EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkRush" })
			EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkSwordParry" })
			EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkSwordDash" })

			enemy.DZActionConfig = {
				PrimaryWeapon = "DarkSword",
				DashWeapon = "DarkRush",
				SpecialAttackWeapon = "DarkSwordParry",
				DashAttackWeapon = "DarkSwordDash"
			}
		end
	},
	SpearWeapon =
	{
		Equip = function (enemy)
			enemy.Weapons = { 
				DarkSpear = true, DarkSpear2 = true, DarkSpear3 = true, DarkRush = true, 
				DarkSpearThrow = true, DarkSpearThrowReturn = true, 
				DarkSpearThrowInvisibleReturn = true, DarkSpearDash = true, 
				DarkSpearSpin = true, DarkSpearSpin2 = true, DarkSpearSpin3 = true }
			EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkSpear" })
			EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkSpear2" })
			EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkSpear3" })
			EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkRush" })
			EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkSpearThrow" })
			EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkSpearThrowReturn" })
			EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkSpearDash" })
			EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkSpearSpin" })
			EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkSpearSpin2" })
			EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkSpearSpin3" })

			enemy.DZActionConfig = {
				PrimaryWeapon = "DarkSpear",
				DashWeapon = "DarkRush",
				SpecialAttackWeapon = "DarkSpearThrow",
				SpecialAttackWeaponReturn = "DarkSpearThrowReturn",
				DashAttackWeapon = "DarkSpearDash",
				ShouldReturnSpearAfterThrow = true,
				SpearObstacle = "DarkSpearReturnPoint"
			}
		end
	},
	GunWeapon =
	{
		Equip = function (enemy)
			enemy.Weapons = { 
				DarkGun = true, DarkGunDash = true, DarkRush = true, 
				DarkGunGrenadeToss = true, DarkManualReload = true, DarkSniperGun = true, 
				DarkSniperGunDash = true, DarkGunBomb = true }

			enemy.DZActionConfig = {
				PrimaryWeapon = "DarkGun",
				DashWeapon = "DarkRush",
				SpecialAttackWeapon = "DarkGunGrenadeToss",
				DashAttackWeapon = "DarkGunDash",
				ReloadWeapon = "DarkManualReload",
				MaxAmmo = 12
			}

			EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkGun" })
			EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkGunDash" })
			EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkGunGrenadeToss" })
			EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkManualReload" })
			EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkRush" })
		end
	},
	BowWeapon =
	{
		Equip = function (enemy)
			enemy.PrimaryWeapon = "DarkBow"
			enemy.DashWeapon = "DarkRush"
			enemy.SpecialAttackWeapon = "DarkBowSplitShot"
			enemy.DashAttackWeapon = "DarkBowDash"
		end,
		PostTraitApply = function (enemy)
			
		end
		-- {
		-- 	Equip = function (enemy)
        --         enemy.PrimaryWeapon = "DarkBow"
        --         enemy.DashWeapon = "DarkRush"
        --         enemy.SpecialAttackWeapon = "DarkBowSplitShot"
        --         enemy.DashAttackWeapon = "DarkBowDash"
        --     end
		-- },
		-- {
		-- 	Equip = function (enemy)
        --         enemy.PrimaryWeapon = "DarkChironBow"
        --         enemy.DashWeapon = "DarkRush"
        --         enemy.SpecialAttackWeapon = "DarkChironBowSplitShot"
        --         enemy.DashAttackWeapon = "DarkChironBowDash"
		-- 		-- equip in advance because we need to modify it's property while marking target
		-- 		EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkChironBowSplitShot" })
        --     end
		-- },
		-- {
		-- 	Equip = function (enemy)
        --         enemy.PrimaryWeapon = "DarkHeraBow"
        --         enemy.DashWeapon = "DarkRush"
        --         enemy.SpecialAttackWeapon = "DarkHeraBowSplitShot"
        --         enemy.DashAttackWeapon = "DarkHeraBowDash"
        --     end
		-- },
		-- {
		-- 	Equip = function (enemy)
        --         enemy.PrimaryWeapon = "DarkRamaBow"
        --         enemy.DashWeapon = "DarkRush"
        --         enemy.SpecialAttackWeapon = "DarkRamaBowSplitShot"
        --         enemy.DashAttackWeapon = "DarkRamaBowDash"
        --     end
		-- }
	},
	ShieldWeapon =
	{
		Equip = function (enemy)
			enemy.PrimaryWeapon = "DarkShield"
			enemy.DashWeapon = "DarkRush"
			enemy.SpecialAttackWeapon = "DarkShieldThrow"
			enemy.DashAttackWeapon = "DarkShieldDash"
		end,
	},
	FistWeapon =
	{
		Equip = function (enemy)
			enemy.PrimaryWeapon = "DarkFist"
			enemy.DashWeapon = "DarkRush"
			enemy.SpecialAttackWeapon = "DarkFistSpecial"
			enemy.SpecialDashAttackWeapon = "DarkFistSpecialDash"
			enemy.DashAttackWeapon = "DarkFistDash"
		end,
		PostTraitApply = function (enemy)
			
		end
		-- {
		-- 	Equip = function (enemy)
		-- 		enemy.PrimaryWeapon = "DarkFist"
		-- 		enemy.DashWeapon = "DarkRush"
		-- 		enemy.SpecialAttackWeapon = "DarkFistSpecial"
		-- 		enemy.SpecialDashAttackWeapon = "DarkFistSpecialDash"
		-- 		enemy.DashAttackWeapon = "DarkFistDash"
        --     end
		-- },
		-- {
		-- 	Equip = function (enemy)
        --         enemy.PrimaryWeapon = "DarkTalosFist"
		-- 		enemy.DashWeapon = "DarkTalosRush"
		-- 		enemy.SpecialAttackWeapon = "DarkTalosFistSpecial"
		-- 		enemy.SpecialDashAttackWeapon = "DarkTalosFistSpecialDash"
		-- 		enemy.DashAttackWeapon = "DarkTalosFistDash"
        --     end
		-- },
		-- {
		-- 	Equip = function (enemy)
        --         enemy.PrimaryWeapon = "DarkDemeterFist"
		-- 		enemy.DashWeapon = "DarkRush"
		-- 		enemy.SpecialAttackWeapon = "DarkDemeterFistSpecial"
		-- 		enemy.SpecialDashAttackWeapon = "DarkDemeterFistSpecialDash"
		-- 		enemy.DashAttackWeapon = "DarkDemeterFistDash"
		-- 		-- equip them in advance because Powers.lua will modify their properties
		-- 		EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkDemeterFistSpecial" })
		-- 		EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkDemeterFistSpecialDash" })
        --     end
		-- },
		-- {
		-- 	Equip = function (enemy)
		-- 		enemy.PrimaryWeapon = "DarkGilgameshFist"
		-- 		enemy.DashWeapon = "DarkGilgameshRush"
		-- 		enemy.SpecialAttackWeapon = "DarkGilgameshFistSpecial"
		-- 		enemy.SpecialDashAttackWeapon = "DarkGilgameshFistSpecialDash"
		-- 		enemy.DashAttackWeapon = "DarkGilgameshFistDash"
		-- 		EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkGilgameshRushRupture" })
		-- 		EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkGilgameshFistDetonation" })
		-- 		EquipWeapon({ DestinationId = enemy.ObjectId, Name = "DarkGilgameshMarkRuptureApplicator" })
        --     end
		-- }
	},
}

DZWeaponAI = {
	SwordWeapon = "DarkZagreusSwordAI",
	SpearWeapon = "DarkZagreusSpearAI",
	GunWeapon = "DarkZagreusGunAI",
	BowWeapon = "DarkZagreusBowAI",
	ShieldWeapon = "DarkZagreusShieldAI",
	FistWeapon = "DarkZagreusFistAI",
}

SaveIgnores["DZWeaponData"] = true
SaveIgnores["DZWeaponAI"] = true