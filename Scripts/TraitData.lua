ModUtil.Table.Merge(
    TraitData, {
        DZSwordCriticalParryTrait = 
        {
            InheritFrom = { "WeaponEnchantmentTrait" },
            RequiredWeapon = "DarkSword",
            RarityLevels =
            {
                Common =
                {
                    MinMultiplier = 1.00,
                    MaxMultiplier = 1.00,
                },
                Rare =
                {
                    MinMultiplier = 1.25,
                    MaxMultiplier = 1.25,
                },
                Epic =
                {
                    MinMultiplier = 1.50,
                    MaxMultiplier = 1.50,
                },
                Heroic =
                {
                    MinMultiplier = 1.75,
                    MaxMultiplier = 1.75,
                },
                Legendary =
                {
                    MinMultiplier = 2.00,
                    MaxMultiplier = 2.00,
                },
            },
            SwordPostParryCriticalAmount =
            {
                BaseValue = 0.15,
            },
            PropertyChanges =
            {
                {
                    WeaponNames = { "DarkSwordParry" },
                    EffectName = "SwordPostParryCritical",
                    EffectProperty = "Active",
                    ChangeValue = true,
                },
                {
                    WeaponNames = { "DarkSwordParry" },
                    EffectName = "SwordPostParryCritical",
                    EffectProperty = "Duration",
                    ChangeValue = 3.0,
                    ExtractValue =
                    {
                        ExtractAs = "TooltipDuration",
                        DecimalPlaces = 1,
                    }
                },
                -- animation changes
                {
                    WeaponName = "DarkSword",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSwordAlt01Charge1",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSword",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSwordAlt01Attack1",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSword2",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSwordAlt01Charge2",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSword2",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSwordAlt01Attack2",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSword3",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSwordAlt01Charge3",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSword3",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSwordAlt01Attack3",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSwordParry",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSwordAlt01ParryFire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSwordParry",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSwordAlt01ParryCharge",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSwordDash",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSwordAlt01DashAttack",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
            },
            WeaponBinks =
            {
                "ZagreusSword01_Bink",
                "ZagreusSword01ReturnToIdle_Bink",
                "ZagreusSword01DashAttack_Bink",
                "ZagreusSword01Run_Bink",
                "ZagreusSword01RunStop_Bink",
                "ZagreusSword01Parry_Bink"
            },
            WeaponDataOverride =
            {
                SwordWeapon =
                {
                    WeaponBinks =
                    {
                        "ZagreusSword01_Bink",
                        "ZagreusSword01ReturnToIdle_Bink",
                        "ZagreusSword01DashAttack_Bink",
                        "ZagreusSword01Run_Bink",
                        "ZagreusSword01RunStop_Bink",
                        "ZagreusSword01Parry_Bink"
                    },
                }
            },
            ExtractValues =
            {
                {
                    Key = "SwordPostParryCriticalAmount",
                    ExtractAs = "TooltipPercentChance",
                    Format = "Percent",
                },
            }
        }
    }
)