if not EvilZagreus.Config.Enabled then return end

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
	},
	GunWeapon =
	{
	},
	BowWeapon =
	{
	},
	ShieldWeapon =
	{
	},
	FistWeapon =
	{
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