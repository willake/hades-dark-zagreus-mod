ModUtil.Table.Merge(
    TraitData, {
        -- DarkGun 2, Aspect of Eris
        DZGunGrenadeSelfEmpowerTrait =
        {
            RequiredWeapon = "DarkGun",
            RarityLevels =
            {
                Common =
                {
                    MinMultiplier = 1.0,
                    MaxMultiplier = 1.0,
                },
                Rare =
                {
                    MinMultiplier = 2.0,
                    MaxMultiplier = 2.0,
                },
                Epic =
                {
                    MinMultiplier = 3.0,
                    MaxMultiplier = 3.0,
                },
                Heroic =
                {
                    MinMultiplier = 4.0,
                    MaxMultiplier = 4.0,
                },
                Legendary =
                {
                    MinMultiplier = 5.0,
                    MaxMultiplier = 5.0,
                },
            },
            WeaponBinks =
            {
                "ZagreusGun02_Bink",
                "ZagreusGun02Run_Bink",
                "ZagreusGun02GrenadeToss_Bink",
                "ZagreusGun02Stop_Bink",
                "ZagreusGun02FireEmpty_Bink",
            },
            WeaponDataOverride =
            {
                DarkGun =
                {
                    IdleReloadAnimation = "DarkZagreusGunAlt02ReloadStart",
                    MovingReloadAnimation = "DarkZagreusGunAlt02RunReload",
                    WeaponBinks =
                    {
                        "ZagreusGun02_Bink",
                        "ZagreusGun02Run_Bink",
                        "ZagreusGun02GrenadeToss_Bink",
                        "ZagreusGun02Stop_Bink",
                        "ZagreusGun02FireEmpty_Bink",
                    },
                },
                DarkGunDash =
                {
                    IdleReloadAnimation = "DarkZagreusGunAlt02ReloadStart",
                    MovingReloadAnimation = "DarkZagreusGunAlt02RunReload",
                },
            },
            PropertyChanges =
            {
                {
                    WeaponNames = { "DarkDarkGunGrenadeToss", "DarkGunBomb" },
                    EffectName = "ZagreusOnHitStun",
                    EffectProperty = "Active",
                    ChangeValue = false,
                },
                {
                    WeaponNames = { "DarkDarkGunGrenadeToss", "DarkGunBomb" },
                    EffectName = "GrenadeSelfDamageOutput",
                    EffectProperty = "Active",
                    ChangeValue = true,
                },
                {
                    WeaponNames = { "DarkDarkGunGrenadeToss", "DarkGunBomb" },
                    EffectName = "GrenadeSelfDamageOutput",
                    EffectProperty = "Modifier",
                    BaseValue = 0.15,
                    ChangeType = "Add",
                    ExtractValue =
                    {
                        ExtractAs = "TooltipDamage",
                        Format = "Percent",
                    }
                },
                {
                    WeaponNames = { "DarkGun",  },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusGunAlt02Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkGun",  },
                    WeaponProperty = "FailedToFireCooldownAnimation",
                    ChangeValue = "DarkZagreusGunAlt02FireEmpty",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkGunDash", },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusGunAlt02Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkGunDash", },
                    WeaponProperty = "FailedToFireCooldownAnimation",
                    ChangeValue = "DarkZagreusGunAlt02FireEmpty",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },


                {
                    WeaponNames = { "DarkDarkGunGrenadeToss" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusGunAlt02GrenadeTossCharge",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkDarkGunGrenadeToss" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusGunAlt02GrenadeTossFire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
            },
        },
        -- DarkGun 3, Aspect of Hestia
        DZGunManualReloadTrait =
        {
            InheritFrom = { "WeaponEnchantmentTrait" },
            PostWeaponUpgradeScreenAnimation = "ZagreusGunAlt01ReloadEnd",
            RequiredWeapon = "DarkGun",
            PreEquipWeapons = { "DZManualReloadEffectApplicator", "DarkSniperGun", "DarkSniperGunDash" },
            PostWeaponUpgradeScreenAngle = 210,
            RarityLevels =
            {
                Common =
                {
                    MinMultiplier = 1.0,
                    MaxMultiplier = 1.0,
                },
                Rare =
                {
                    MinMultiplier = 1.5,
                    MaxMultiplier = 1.5,
                },
                Epic =
                {
                    MinMultiplier = 2.0,
                    MaxMultiplier = 2.0,
                },
                Heroic =
                {
                    MinMultiplier = 2.5,
                    MaxMultiplier = 2.5,
                },
                Legendary =
                {
                    MinMultiplier = 3.0,
                    MaxMultiplier = 3.0,
                },
            },
            DZActionConfig = 
            {
                PrimaryPowerWeapon = "DarkSniperGun",
                DashAttackPowerWeapon = "DarkSniperGunDash"
            },
            WeaponBinks =
            {
                "ZagreusGun01_Bink",
                "ZagreusGun01Run_Bink",
                "ZagreusGun01GrenadeToss_Bink",
                "ZagreusGun01Stop_Bink",
                "ZagreusGun01FireEmpty_Bink",
            },
            WeaponDataOverride =
            {
                DarkGun =
                {
                    IdleReloadAnimation = "DarkZagreusGunAlt01ReloadStart",
                    MovingReloadAnimation = "DarkZagreusGunAlt01RunReload",
                    WeaponBinks =
                    {
                        "ZagreusGun01_Bink",
                        "ZagreusGun01Run_Bink",
                        "ZagreusGun01GrenadeToss_Bink",
                        "ZagreusGun01Stop_Bink",
                        "ZagreusGun01FireEmpty_Bink",
                    }
                },
                DarkGunDash =
                {
                    IdleReloadAnimation = "DarkZagreusGunAlt01ReloadStart",
                    MovingReloadAnimation = "DarkZagreusGunAlt01RunReload",
                },
            },
            PropertyChanges =
            {
                {
                    WeaponNames = { "DarkSniperGun", "DarkSniperGunDash" },
                    ProjectileProperty = "DamageLow",
                    BaseValue = 50,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                    ExtractValue =
                    {
                        ExtractAs = "TooltipDamage",
                    },
                },
                {
                    WeaponNames = { "DarkSniperGun", "DarkSniperGunDash" },
                    ProjectileProperty = "DamageHigh",
                    DeriveValueFrom = "DamageLow",
                },
                {
                    WeaponNames = { "DarkSniperGun", "DarkSniperGunDash" },
                    WeaponProperty = "Enabled",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                },
                {
                    WeaponNames = { "DarkGun", "DarkSniperGun" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusGunAlt01Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkGun", "DarkSniperGun" },
                    WeaponProperty = "FailedToFireCooldownAnimation",
                    ChangeValue = "DarkZagreusGunAlt01FireEmpty",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkGunDash", "DarkSniperGunDash" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusGunAlt01Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkGunDash", "DarkSniperGunDash" },
                    WeaponProperty = "FailedToFireCooldownAnimation",
                    ChangeValue = "DarkZagreusGunAlt01FireEmpty",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkGunGrenadeToss" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusGunAlt01GrenadeTossCharge",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkGunGrenadeToss" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusGunAlt01GrenadeTossFire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
            },
        },
        -- DarkGun 4, Aspect of Lucifer
        DZGunLoadedGrenadeTrait =
        {
            InheritFrom = { "WeaponEnchantmentTrait" },
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
            RequiredWeapon = "DarkGun",
            PreEquipWeapons = { "DarkGunBomb", "DarkGunBombImmolation" },
            DZActionConfig = 
            {
                MaxAmmo = 20
            },
            --InfiniteAmmo = true,
            WeaponBinks =
            {
                "ZagreusGunLucifer_Bink",
                "ZagreusGunLuciferIdle_Bink",
                "ZagreusGunLuciferRun_Bink",
                "ZagreusGunLuciferStop_Bink",
                "ZagreusGunLuciferFireEmpty_Bink",
                "ZagreusGunLuciferGrenadeToss_Bink",
            },
            WeaponDataOverride =
            {
                DarkGun =
                {
                    CancelUnitHitFlash = true,
                    RapidDamageType = true,
                    CancelUnitShake = true,
                    CancelArmorUnitShake = true,
                    CancelArmorSpark = true,
                    DashWeapon = nil,
                    IdleReloadAnimation = "DarkZagreusGunLuciferReload_Start",
                    MovingReloadAnimation = "DarkZagreusGunLuciferRunReload",
                    
                    AIData =
                    {
                        AttackDistance = 650,
                        NeedPreWarm = true,
                        PreWarmDuration = 0.28,
                        PreWarmAnimation = "DarkZagreusGunLucifer_Start",
                        PreFireFx = "GunCharge",
                        FireDuration = 0.12,
                    },

                    WeaponBinks =
                    {
                        "ZagreusGunLucifer_Bink",
                        "ZagreusGunLuciferIdle_Bink",
                        "ZagreusGunLuciferRun_Bink",
                        "ZagreusGunLuciferStop_Bink",
                        "ZagreusGunLuciferFireEmpty_Bink",
                        "ZagreusGunLuciferGrenadeToss_Bink",
                    },

                    Sounds =
                    {
                        FireSounds =
                        {
                        --	{ Name = "/VO/ZagreusEmotes/EmoteHeavyGunFire" },
                        --	{ Name = "/SFX/Player Sounds/ZagreusGunFire" },
                        },
                        LowAmmoFireSounds =
                        {
                        --	{ Name = "/SFX/Player Sounds/ZagreusGunFire" },
                        --	{ Name = "/SFX/Player Sounds/ZagreusGunReloadCompleteFlash" },
                        },
                        ImpactSounds =
                        {
                            Invulnerable = "/SFX/BurnDamage",
                            Armored = "/SFX/BurnDamage",
                            Bone = "/SFX/BurnDamage",
                            Brick = "/SFX/BurnDamage",
                            Stone = "/SFX/BurnDamage",
                            Organic = "/SFX/BurnDamage",
                            StoneObstacle = "/SFX/BurnDamage",
                            BrickObstacle = "/SFX/BurnDamage",
                            MetalObstacle = "/SFX/BurnDamage",
                            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
                        },
                    },
                },
                DarkGunDash = 
                {
                    AIData =
                    {
                        FireDuration = 0.12,
                        NeedPreWarm = true,
                        PreWarmDuration = 0.3,
                        PreWarmAnimation = "DarkZagreusGunLucifer_Start"
                    },
                },
                DarkGunGrenadeToss =
                {
                    AIData =
                    {
                        FireDuration = 0.37
                    },
                    Sounds =
                    {
                        ChargeSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteHeavyGunCharge" },
                        },
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteHeavyGunLob" },
                        },
                        ImpactSounds =
                        {
                            Invulnerable = "/SFX/Player Sounds/ZagreusShieldRicochet",
                            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
                            Bone = "/SFX/ArrowMetalBoneSmash",
                            Brick = "/SFX/ArrowMetalStoneClang",
                            Stone = "/SFX/ArrowMetalStoneClang",
                            Organic = "/SFX/ArrowImpactSplatter",
                            StoneObstacle = "/SFX/ArrowWallHitClankSmall",
                            BrickObstacle = "/SFX/ArrowWallHitClankSmall",
                            MetalObstacle = "/SFX/ArrowWallHitClankSmall",
                            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
                        },
                    },
                }
            },
            PropertyChanges =
            {
                -- laser properties
                {
                    WeaponName = "DarkGun",
                    ProjectileProperty = "ClearWeaponBonusesOnHit",
                    ChangeValue = true,
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    ProjectileProperty = "ProjectileDefenseRadius",
                    ChangeValue = 0,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponName = "DarkGun",
                    ProjectileProperty = "Type",
                    ChangeValue = "BEAM",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    ProjectileProperty = "ArcSize",
                    ChangeValue = 100,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    WeaponProperty = "RefreshProjectileOnFire",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkRush",
                    EffectName = "RushWeaponInvulnerable",
                    EffectProperty = "ClearOnAttack",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    ProjectileProperty = "SkipFireCancelIfFiring",
                    ChangeValue = "true",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    ProjectileProperty = "AutoAdjustForTarget",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    ProjectileProperty = "AttachToOwner",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    ProjectileProperty = "Speed",
                    ChangeValue = 0,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    ProjectileProperty = "TotalFuse",
                    ChangeValue = 0.2,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    ProjectileProperty = "Fuse",
                    ChangeValue = 0.13,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    WeaponProperty = "Cooldown",
                    ChangeValue = 0.13,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    WeaponProperty = "Scatter",
                    ChangeValue = 0,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    WeaponProperty = "ScatterCap",
                    ChangeValue = 0,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    ProjectileProperty = "ImmunityDuration",
                    ChangeValue = 0.05,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    ProjectileProperty = "MultiDetonate",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    ProjectileProperty = "DrawAsBeam",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    WeaponProperty = "BarrelLength",
                    ChangeValue = 50,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    WeaponProperty = "ChargeTime",
                    ChangeValue = 0.3,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusGunLucifer_Start",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusGunLucifer_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    WeaponProperty = "FireEndGraphic",
                    ChangeValue = "DarkZagreusGunLucifer_ReturnToIdle",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    WeaponProperty = "FailedToFireCooldownAnimation",
                    ChangeValue = "DarkZagreusGunLuciferFireEmpty",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    WeaponProperty = "OnlyChargeOnce",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    WeaponProperty = "FireFx",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    ProjectileProperty = "DamageLow",
                    ChangeValue = 10,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    ProjectileProperty = "DamageHigh",
                    ChangeValue = 10,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    ProjectileProperty = "ConsecutiveHitWindow",
                    ChangeValue = 0.6,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    ProjectileProperty = "DamagePerConsecutiveHit",
                    ChangeValue = 0.75,
                    --ChangeValue = 0.45,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    WeaponProperty = "MaxAmmo",
                    ChangeValue = 20,
                    ChangeType = "Absolute",
                    ExtractValue =
                    {
                        ExtractAs = "TooltipAmmo",
                    },
                },
                {
                    WeaponName = "DarkGun",
                    ProjectileProperty = "Range",
                    ChangeValue = 0.975,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    EffectName = "GunDisable",
                    EffectProperty = "Active",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    EffectName = "GunDisableCancellable",
                    EffectProperty = "Active",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    EffectName = "GunDisableLucifer",
                    EffectProperty = "Active",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    EffectName = "GunDisableCancellableLucifer",
                    EffectProperty = "Active",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkRush",
                    EffectName = "RushWeaponInvulnerable",
                    EffectProperty = "ClearOnAttack",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                -- rapid fire trait stabilizers
                
                {
                    WeaponName = "ArtemisLegendary",
                    WeaponProperty = "Cooldown",
                    ChangeValue = 0.25,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "LightningStrikeImpact",
                    WeaponProperty = "Cooldown",
                    ChangeValue = 0.25,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "ChainLightning",
                    WeaponProperty = "Cooldown",
                    ChangeValue = 0.25,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                -- bomb properties
                {
                    WeaponNames = { "DarkGunBomb" },
                    ProjectileProperty = "DamageLow",
                    BaseValue = 50,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                    ExtractValue =
                    {
                        ExtractAs = "TooltipDamage",
                    },
                    DeriveBombSource = "DeriveBombSource",
                },
                {
                    WeaponNames = { "DarkGunBomb" },
                    ProjectileProperty = "DamageHigh",
                    DeriveValueFrom = "DeriveBombSource",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkGunBombImmolation" },
                    ProjectileProperty = "DamageLow",
                    ChangeValue = 20,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                    ExtractValue =
                    {
                        ExtractAs = "TooltipImmolationDamage",
                    },
                    DeriveImmolationSource = "DeriveImmolationSource"
                },
                {
                    WeaponNames = { "DarkGunBombImmolation" },
                    ProjectileProperty = "DamageHigh",
                    DeriveValueFrom = "DeriveImmolationSource",
                    ExcludeLinked = true,
                },
                -- change arc to drop a bomb instead of explode
                {
                    WeaponNames = { "DarkGunGrenadeToss" },
                    ProjectileProperty = "SpawnCap",
                    ChangeValue = 3,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkGunGrenadeToss" },
                    ProjectileProperty = "FizzleOldSpawnsOnDetonate",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkGunGrenadeToss" },
                    ProjectileProperty = "DamageLow",
                    BaseValue = 0,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                    DeriveSource = "DeriveSource"
                },
                {
                    WeaponNames = { "DarkGunGrenadeToss" },
                    ProjectileProperty = "DamageRadius",
                    BaseValue = 0,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkGunGrenadeToss" },
                    ProjectileProperty = "DamageHigh",
                    DeriveValueFrom = "DeriveSource",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkGunGrenadeToss" },
                    ProjectileProperty = "HideDetonateGraphic",
                    ChangeValue = true,
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkGunGrenadeToss" },
                    ProjectileProperty = "DetonateSound",
                    ChangeValue = "null",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkGunGrenadeToss" },
                    ProjectileProperty = "SpawnsInheritGroups",
                    ChangeValue = false,
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkGunGrenadeToss" },
                    ProjectileProperty = "SkipSpawnsIfBlocked",
                    ChangeValue = true,
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkGunGrenadeToss" },
                    ProjectileProperty = "SpawnGroup",
                    ChangeValue = "Standing",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkGunGrenadeToss" },
                    ProjectileProperty = "SpawnType",
                    ChangeValue = "UNIT",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkGunGrenadeToss" },
                    ProjectileProperty = "SkipSpawnsIfBlocked",
                    ChangeValue = "false",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkGunGrenadeToss" },
                    ProjectileProperty = "SpawnOnDetonate",
                    ChangeValue = "GunBombUnit",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkGunGrenadeToss" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusGunLuciferGrenadeTossCharge",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkGunGrenadeToss" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusGunLuciferGrenadeTossFire",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkGunGrenadeToss" },
                    ProjectileProperty = "Gravity",
                    ChangeValue = 2.10,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkGunGrenadeToss" },
                    ProjectileProperty = "Speed",
                    ChangeValue = 1.55,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },

                -- laser vfx

                {
                    WeaponName = "DarkGun",
                    ProjectileProperty = "Graphic",
                    ChangeValue = "GunLaser",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    ProjectileProperty = "BeamStartAnimSkipsImpact",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    ProjectileProperty = "AttachedAnim",
                    ChangeValue = "GunLaserOriginFlare",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    ProjectileProperty = "TipFx",
                    ChangeValue = "GunLaserTipFlare",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    WeaponProperty = "ChargeStartFx",
                    ChangeValue = "GunCharge",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkGun",
                    ProjectileProperty = "DissipateGraphic",
                    ChangeValue = "GunLaserEnd",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                -- bomb vfx

                {
                    WeaponNames = { "DarkGunGrenadeToss" },
                    ProjectileProperty = "Graphic",
                    ChangeValue = "GunGrenadeLuciferOrb",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkGunGrenadeToss" },
                    ProjectileProperty = "GroupName",
                    ChangeValue = "FX_Standing_Add",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

            },
        },
    }
)

ModUtil.Table.Merge(
    DarkZagreus.WeaponTraits, {
        "DZGunGrenadeSelfEmpowerTrait",
        "DZGunManualReloadTrait",
        "DZGunLoadedGrenadeTrait"
    }
)