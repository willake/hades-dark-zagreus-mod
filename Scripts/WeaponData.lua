if not DarkZagreus.Config.Enabled then return end 

DZWeaponData =
{
	SwordWeapon =
	{
		{
			Equip = function (enemy)
                enemy.PrimaryWeapon = "DarkSword"
                enemy.DashWeapon = "DarkRush"
                enemy.SpecialAttackWeapon = "DarkSwordParry"
                enemy.DashAttackWeapon = "DarkSwordDash"
            end
		},
		{
			Equip = function (enemy)
                enemy.PrimaryWeapon = "DarkNemesisSword"
                enemy.DashWeapon = "DarkRush"
                enemy.SpecialAttackWeapon = "DarkNemesisSwordParry"
                enemy.DashAttackWeapon = "DarkNemesisSwordDash"
            end
		},
		{
			Equip = function (enemy)
                enemy.PrimaryWeapon = "DarkPoseidonSword"
                enemy.DashWeapon = "DarkRush"
                enemy.SpecialAttackWeapon = "DarkPoseidonSwordParry"
                enemy.DashAttackWeapon = "DarkPoseidonSwordDash"
            end
		},
		{
			Equip = function (enemy)
                enemy.PrimaryWeapon = "DarkArthurSword"
                enemy.DashWeapon = "DarkRush"
                enemy.SpecialAttackWeapon = "DarkArthurSwordParry"
                enemy.DashAttackWeapon = "DarkArthurSwordDash"
            end
		}
	},
	SpearWeapon =
	{
		{
			Equip = function (enemy)
				enemy.PrimaryWeapon = "DarkSpear";
				enemy.DashWeapon = "DarkRush";
				enemy.SpecialAttackWeapon = "DarkSpearThrow";
				enemy.SpecialAttackWeaponReturn = "DarkSpearThrowReturn";
				enemy.DashAttackWeapon = "DarkSpearDash";
				enemy.ShouldReturnSpearAfterThrow = true;
            end
		},
		{
			Equip = function (enemy)
                enemy.PrimaryWeapon = "DarkAchillesSpear";
				enemy.DashWeapon = "DarkRush";
				enemy.SpecialAttackWeapon = "DarkAchillesSpearThrow";
				enemy.SpecialAttackWeaponRush = "DarkAchillesSpearRush";
				enemy.DashAttackWeapon = "DarkAchillesSpearDash";
				enemy.ShouldReturnSpearAfterThrow = true;
            end
		},
		{
			Equip = function (enemy)
                enemy.PrimaryWeapon = "DarkHadesSpear";
				enemy.DashWeapon = "DarkRush";
				enemy.SpecialAttackWeapon = "DarkHadesSpearThrow";
				enemy.SpecialAttackWeaponReturn = "DarkHadesSpearThrowReturn";
				enemy.DashAttackWeapon = "DarkHadesSpearDash";
				enemy.ShouldReturnSpearAfterThrow = true;
            end
		},
		{
			Equip = function (enemy)
                enemy.PrimaryWeapon = "DarkGuanYuSpear";
				enemy.DashWeapon = "DarkRush";
				enemy.SpecialAttackWeapon = "DarkGuanYuSpearThrow";
				enemy.SpecialAttackWeaponReturn = "DarkGuanYuSpearThrowReturn";
				enemy.DashAttackWeapon = "DarkGuanYuSpearDash";
				enemy.ShouldReturnSpearAfterThrow = false;
            end
		}
	},
	GunWeapon =
	{
		{
			Equip = function (enemy)
				enemy.PrimaryWeapon = "DarkGun";
				enemy.DashWeapon = "DarkRush";
				enemy.SpecialAttackWeapon = "DarkGunGrenadeToss";
				enemy.DashAttackWeapon = "DarkGunDash";
            end
		},
		{
			Equip = function (enemy)
                enemy.PrimaryWeapon = "DarkErisGun";
				enemy.DashWeapon = "DarkRush";
				enemy.SpecialAttackWeapon = "DarkErisGunGrenadeToss";
				enemy.DashAttackWeapon = "DarkErisGunDash";
            end
		},
		{
			Equip = function (enemy)
                enemy.PrimaryWeapon = "DarkHestiaGun";
				enemy.DashWeapon = "DarkRush";
				enemy.SpecialAttackWeapon = "DarkHestiaGunGrenadeToss";
				enemy.DashAttackWeapon = "DarkHestiaGunDash";
            end
		},
		{
			Equip = function (enemy)
                enemy.PrimaryWeapon = "DarkLuciferGun";
				enemy.DashWeapon = "DarkRush";
				enemy.SpecialAttackWeapon = "DarkLuciferGunGrenadeToss";
				enemy.DashAttackWeapon = "DarkLuciferGunDash";
            end
		}
	},
	BowWeapon =
	{
		{
			Equip = function (enemy)
                enemy.PrimaryWeapon = "DarkBow"
                enemy.DashWeapon = "DarkRush"
                enemy.SpecialAttackWeapon = "DarkBowSplitShot"
                enemy.DashAttackWeapon = "DarkBowDash"
            end
		},
		{
			Equip = function (enemy)
                enemy.PrimaryWeapon = "DarkChironBow"
                enemy.DashWeapon = "DarkRush"
                enemy.SpecialAttackWeapon = "DarkChironBowSplitShot"
                enemy.DashAttackWeapon = "DarkChironBowDash"
            end
		},
		{
			Equip = function (enemy)
                enemy.PrimaryWeapon = "DarkHeraBow"
                enemy.DashWeapon = "DarkRush"
                enemy.SpecialAttackWeapon = "DarkHeraBowSplitShot"
                enemy.DashAttackWeapon = "DarkHeraBowDash"
            end
		},
		{
			Equip = function (enemy)
                enemy.PrimaryWeapon = "DarkRamaBow"
                enemy.DashWeapon = "DarkRush"
                enemy.SpecialAttackWeapon = "DarkRamaBowSplitShot"
                enemy.DashAttackWeapon = "DarkRamaBowDash"
            end
		}
	},
	ShieldWeapon =
	{
		{
			Equip = function (enemy)
				enemy.PrimaryWeapon = "DarkShield";
				enemy.DashWeapon = "DarkRush";
				enemy.SpecialAttackWeapon = "DarkShieldThrow";
				enemy.DashAttackWeapon = "DarkShieldDash";
            end
		},
		{
			Equip = function (enemy)
				enemy.PrimaryWeapon = "DarkChaosShield";
				enemy.DashWeapon = "DarkRush";
				enemy.SpecialAttackWeapon = "DarkChaosShieldThrow";
				enemy.DashAttackWeapon = "DarkChaosShieldDash";
            end
		},
		{
			Equip = function (enemy)
				enemy.PrimaryWeapon = "DarkZeusShield";
				enemy.DashWeapon = "DarkRush";
				enemy.SpecialAttackWeapon = "DarkZeusShieldThrow";
				enemy.DashAttackWeapon = "DarkZeusShieldDash";
            end
		},
		{
			Equip = function (enemy)
				enemy.PrimaryWeapon = "DarkBeowulfShield";
				enemy.DashWeapon = "DarkRush";
				enemy.SpecialAttackWeapon = "DarkBeowulfShieldThrow";
				enemy.DashAttackWeapon = "DarkBeowulfShieldDash";
            end
		}
	},
	FistWeapon =
	{
		{
			Equip = function (enemy)
				enemy.PrimaryWeapon = "DarkFist";
				enemy.DashWeapon = "DarkRush";
				enemy.SpecialAttackWeapon = "DarkFistSpecial";
				enemy.SpecialDashAttackWeapon = "DarkFistSpecialDash";
				enemy.DashAttackWeapon = "DarkFistDash";
            end
		},
		{
			Equip = function (enemy)
                enemy.PrimaryWeapon = "DarkTalosFist";
				enemy.DashWeapon = "DarkRush";
				enemy.SpecialAttackWeapon = "DarkTalosFistSpecial";
				enemy.SpecialDashAttackWeapon = "DarkTalosFistSpecialDash";
				enemy.DashAttackWeapon = "DarkTalosFistDash";
            end
		},
		{
			Equip = function (enemy)
                enemy.PrimaryWeapon = "DarkDemeterFist";
				enemy.DashWeapon = "DarkRush";
				enemy.SpecialAttackWeapon = "DarkDemeterFistSpecial";
				enemy.SpecialDashAttackWeapon = "DarkDemeterFistSpecialDash";
				enemy.DashAttackWeapon = "DarkDemeterFistDash";
            end
		},
		{
			Equip = function (enemy)
				enemy.PrimaryWeapon = "DarkGilgameshFist";
				enemy.DashWeapon = "DarkRush";
				enemy.SpecialAttackWeapon = "DarkGilgameshFistSpecial";
				enemy.SpecialDashAttackWeapon = "DarkGilgameshFistSpecialDash";
				enemy.DashAttackWeapon = "DarkGilgameshFistDash";
            end
		}
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