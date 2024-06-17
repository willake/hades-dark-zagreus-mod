ModUtil.Table.Merge(
    TraitData, {
        -- DarkBow 1, Aspect of Zagreus
        DZBowBaseUpgradeTrait =
        {
            InheritFrom = { "WeaponEnchantmentTrait" },
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

            PropertyChanges =
            {
                {
                    WeaponNames = { "DarkBow", "DarkBowDash" },
                    ProjectileProperty = "CriticalHitChance",
                    BaseMin = 0.03,
                    BaseMax = 0.03,
                    ChangeType = "Add",
                    ExtractValue =
                    {
                        ExtractAs = "TooltipCritChance",
                        Format = "Percent",
                    }
                },


            },
        },
        -- DarkBow 2, Aspect of Chiron
        DZBowMarkHomingTrait =
        {
            InheritFrom = { "WeaponEnchantmentTrait" },
            RequiredWeapon = "DarkBow",
            RarityLevels =
            {
                Common =
                {
                    MinMultiplier = 1.00,
                    MaxMultiplier = 1.00,
                },
                Rare =
                {
                    MinMultiplier = 4/5,
                    MaxMultiplier = 4/5,
                },
                Epic =
                {
                    MinMultiplier = 3/5,
                    MaxMultiplier = 3/5,
                },
                Heroic =
                {
                    MinMultiplier = 2/5,
                    MaxMultiplier = 2/5,
                },
                Legendary =
                {
                    MinMultiplier = 1/5,
                    MaxMultiplier = 1/5,
                },
            },
            WeaponBinks =
            {
                "ZagreusBow01Dash_Bink",
                "ZagreusBow01_Bink",
                "ZagreusBow01Run_Bink",
                "ZagreusBow01RunStop_Bink",
                "ZagreusBow01RapidFire_Bink"
            },
            WeaponDataOverride =
            {
                DarkBow =
                {
                    AIData = 
                    {
                        PreFireAnimation = "DarkZagreusBowAlt01DashStart",
                        FireAnimation = "DarkZagreusBowAlt01DashFire",
                        PreFireCancelAnimation = "DarkZagreusBowAlt01StartCancel",
                        Range = 45,
                    },

                    WeaponBinks =
                    {
                        "ZagreusBow01Dash_Bink",
                        "ZagreusBow01_Bink",
                        "ZagreusBow01Run_Bink",
                        "ZagreusBow01RunStop_Bink",
                        "ZagreusBow01RapidFire_Bink"
                    }
                },
                DarkBowDash =
                {
                    AIData =
                    {
                        PreFireAnimation = "DarkZagreusBowAlt01Start",
                        FireAnimation = "DarkZagreusBowAlt01Fire",
                        PreFireCancelAnimation = "DarkZagreusBowAlt01StartCancel",
                    },
                },
                DarkBowSplitShot =
                {
                    Sounds =
                    {
                        FireSounds =
                        {
                            -- these are on the animation
                        },
                        ImpactSounds =
                        {
                            Invulnerable = "/SFX/SwordWallHitClank",
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
                },
            },
            PropertyChanges =
            {
                {
                    WeaponNames = { "DarkBow", "DarkBowDash" },
                    EffectName = "DZMarkTarget",
                    EffectProperty = "Active",
                    ChangeValue = true,
                },
                {
                    WeaponNames = { "DarkBowSplitShot" },
                    WeaponProperty = "NumProjectiles",
                    BaseValue = -5,
                    ChangeType = "Add",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkBow",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkBow",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkBow", "DarkBowDash" },
                    WeaponProperty = "ChargeCancelGraphic",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkBowDash",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkBowDash",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkBowSplitShot",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusBowAlt01RapidFire_Start",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkBowSplitShot",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusBowAlt01RapidFire_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkBow",
                    ProjectileProperty = "Graphic",
                    ChangeValue = "BowWeaponArrow-Alt01",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkBow",
                    ProjectileProperty = "AttachedAnim",
                    ChangeValue = "BowWeaponArrowShadow-Alt01",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkBowSplitShot",
                    ProjectileProperty = "Graphic",
                    ChangeValue = "BowWeaponArrowSplitShot-Alt01",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkBowSplitShot",
                    ProjectileProperty = "AttachedAnim",
                    ChangeValue = "BowWeaponArrowShadow-Alt01",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
    
            },
            ExtractProjectiles = 
            { 
                CustomRarityMultiplier =
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
                        MinMultiplier = 1.5,
                        MaxMultiplier = 1.5,
                    },
                    Heroic =
                    {
                        MinMultiplier = 1.75,
                        MaxMultiplier = 1.75,
                    },
                    Legendary =
                    {
                        MinMultiplier = 2,
                        MaxMultiplier = 2,
                    },
                },
                BaseValue = 4 
            },
            ExtractValues =
            {
                {
                    Key = "ExtractProjectiles",
                    ExtractAs = "TooltipProjectiles",
                },
                {
                    ExtractAs = "BaseProjectiles",
                    External = true,
                    BaseType = "Weapon",
                    BaseName = "DarkBowSplitShot",
                    BaseProperty = "NumProjectiles",
                }
            }
        },
        -- DarkBow 3, Aspect of Hera
        DZBowLoadAmmoTrait =
        {
            InheritFrom = { "WeaponEnchantmentTrait" },
            -- PreEquipWeapons = { "LoadAmmoApplicator" },
            -- RequiredWeapons = { "RangedWeapon", "DarkBow" },
            RarityLevels =
            {
                Common =
                {
                    MinMultiplier = 1.00,
                    MaxMultiplier = 1.00,
                },
                Rare =
                {
                    MinMultiplier = 1.66,
                    MaxMultiplier = 1.66,
                },
                Epic =
                {
                    MinMultiplier = 2.33,
                    MaxMultiplier = 2.33,
                },
                Heroic =
                {
                    MinMultiplier = 2.66,
                    MaxMultiplier = 2.66,
                },
                Legendary =
                {
                    MinMultiplier = 3.66,
                    MaxMultiplier = 3.66,
                },
            },
            WeaponBinks =
            {
                "ZagreusBow02Dash_Bink",
                "ZagreusBow02_Bink",
                "ZagreusBow02Run_Bink",
                "ZagreusBow02RunStop_Bink",
                "ZagreusBow02RapidFire_Bink"
            },
            WeaponDataOverride =
            {
                DarkBow =
                {
                    AIData =
                    {
                        PreFireAnimation = "DarkZagreusBowAlt02DashStart",
                        FireAnimation = "DarkZagreusBowAlt02DashFire",
                        PreFireCancelAnimation = "DarkZagreusBowAlt02StartCancel",
                    },
                    WeaponBinks =
                    {
                        "ZagreusBow02Dash_Bink",
                        "ZagreusBow02_Bink",
                        "ZagreusBow02Run_Bink",
                        "ZagreusBow02RunStop_Bink",
                        "ZagreusBow02RapidFire_Bink"
                    }
                },
                DarkBowDash =
                {
                    AIData = 
                    {
                        PreFireAnimation = "DarkZagreusBowAlt02Start",
                        FireAnimation = "DarkZagreusBowAlt02Fire",
                        PreFireCancelAnimation = "DarkZagreusBowAlt02StartCancel",
                    }
                }
            },
            -- SetupFunction =
            -- {
            --     Name = "SetupAmmoLoad",
            --     Args =
            --     {
            --         MaxCount = 99,
            --         ExtractValues =
            --         {
            --             {
            --                 Key = "MaxCount",
            --                 ExtractAs = "TooltipCount",
            --             },
            --         }
            --     },
            --     RunOnce = true,
            -- },
            -- AmmoReclaimTimeDivisor =
            -- {
            --     BaseValue = 1.6,
            --     SourceIsMultiplier = true,
            -- },
            -- OverrideWeaponFireNames =
            -- {
            --     RangedWeapon = "nil",
            --     LoadAmmoApplicator = "RangedWeapon",
            -- },
            ExtractValues =
            {
                {
                    Key = "AmmoReclaimTimeDivisor",
                    ExtractAs = "TooltipAmmo",
                    Format = "AmmoDelayDivisor",
                    DecimalPlaces = 2.0,
                },
                {
                    ExtractAs = "TooltipTotalAmmoDelay",
                    Format = "ExistingAmmoDropDelay",
                    SkipAutoExtract = true,
                    DecimalPlaces = 2.0,
                }
            },

            PropertyChanges =
            {
                -- {
                --     WeaponName = "RangedWeapon",
                --     WeaponProperty = "IgnoreOwnerAttackDisabled",
                --     ChangeValue = true,
                --     ChangeType = "Absolute",
                -- },
                -- {
                --     WeaponName = "RangedWeapon",
                --     WeaponProperty = "Cooldown",
                --     ChangeValue = 0,
                --     ChangeType = "Absolute",
                -- },
                -- {
                --     WeaponName = "RangedWeapon",
                --     WeaponProperty = "ChargeTime",
                --     ChangeValue = 0,
                --     ChangeType = "Absolute",
                -- },
                -- {
                --     WeaponName = "RangedWeapon",
                --     WeaponProperty = "SelfVelocity",
                --     ChangeValue = 0,
                --     ChangeType = "Absolute",
                -- },
                -- {
                --     WeaponName = "RangedWeapon",
                --     WeaponProperty = "FireGraphic",
                --     ChangeValue = "null",
                --     ChangeType = "Absolute",
                -- },
                -- {
                --     WeaponName = "RangedWeapon",
                --     WeaponProperty = "AllowMultiFireRequest",
                --     ChangeValue = true,
                --     ChangeType = "Absolute",
                -- },
                -- {
                --     WeaponName = "RangedWeapon",
                --     WeaponProperty = "RootOwnerWhileFiring",
                --     ChangeValue = false,
                --     ChangeType = "Absolute",
                -- },
                -- {
                --     WeaponName = "RangedWeapon",
                --     WeaponProperty = "ChargeStartAnimation",
                --     ChangeValue = "null",
                --     ChangeType = "Absolute",
                -- },
                -- {
                --     WeaponName = "RangedWeapon",
                --     WeaponProperty = "SetCompleteAngleOnFire",
                --     ChangeValue = false,
                --     ChangeType = "Absolute",
                -- },
                -- {
                --     WeaponName = "RangedWeapon",
                --     WeaponProperty = "IgnoreForceCooldown",
                --     ChangeValue = true,
                --     ChangeType = "Absolute"
                -- },
                -- {
                --     WeaponName = "RangedWeapon",
                --     EffectName = "RangedDisable",
                --     EffectProperty = "Active",
                --     ChangeValue = false,
                -- },
                -- {
                --     WeaponName = "RangedWeapon",
                --     EffectName = "RangedDisableCancelable",
                --     EffectProperty = "Active",
                --     ChangeValue = false,
                -- },
                -- {
                --     WeaponName = "RangedWeapon",
                --     WeaponProperty = "AllowExternalForceRelease",
                --     ChangeValue = false,
                --     ChangeType = "Absolute",
                -- },
                {
                    WeaponName = "DarkBow",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkBow",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkBow", "DarkBowDash" },
                    WeaponProperty = "ChargeCancelGraphic",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkBowDash",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkBowDash",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkBowSplitShot",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusBowAlt02RapidFire_Start",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkBowSplitShot",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusBowAlt02RapidFire_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkBow",
                    ProjectileProperty = "Graphic",
                    ChangeValue = "BowWeaponArrow-Alt02",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkBow",
                    ProjectileProperty = "AttachedAnim",
                    ChangeValue = "BowWeaponArrowShadow-Alt02",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkBowSplitShot",
                    ProjectileProperty = "Graphic",
                    ChangeValue = "BowWeaponArrowSplitShot-Alt02",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkBowSplitShot",
                    ProjectileProperty = "AttachedAnim",
                    ChangeValue = "BowWeaponArrowShadow-Alt02",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
            }
        },
        -- DarkBow 4, Aspect of Rama
        DZBowBondTrait =
        {
            InheritFrom = { "WeaponEnchantmentTrait" },
            RequiredWeapons = { "DarkBow" },
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

            WeaponBinks =
            {
                "ZagreusBowRama_Bink",
                "ZagreusBowRamaRun_Bink",
                "ZagreusBowRamaRunStop_Bink",
                "ZagreusBowRamaRapidFire_Bink",
                "ZagreusBowRamaRapidLoop_Bink",
                "ZagreusBowRamaHeavyShot_Bink",
                "ZagreusBowRamaDashShot_Bink",
            },
            WeaponDataOverride =
            {
                DarkBow =
                {
                    AIData =
                    {
                        PreFireAnimation = "DarkZagreusBowRamaHeavyShotStart",
                        FireAnimation = "DarkZagreusBowRamaHeavyShotFire",
                        PreFireCancelAnimation = "DarkZagreusBowRamaHeavyShotStartCancel",
                    },
                    FireScreenshake = { Distance = 3, Speed = 400, FalloffSpeed = 1200, Duration = 0.25 },

                    WeaponBinks =
                    {
                        "ZagreusBowRamaDash_Bink",
                        "ZagreusBowRama_Bink",
                        "ZagreusBowRamaRun_Bink",
                        "ZagreusBowRamaRunStop_Bink",
                        "ZagreusBowRamaRapidFire_Bink",
                        "ZagreusBowRamaRapidLoop_Bink",
                        "ZagreusBowRamaHeavyShot_Bink",
                        "ZagreusBowRamaDashShot_Bink",
                    },

                    HitSimSlowCooldown = 0.3,
                    HitSimSlowParameters =
                    {
                        { ScreenPreWait = 0.04, Fraction = 0.03, LerpTime = 0.0 },
                        { ScreenPreWait = 0.02, Fraction = 0.20, LerpTime = 0.06 },
                        { ScreenPreWait = 0.02, Fraction = 1.00, LerpTime = 0.07 },
                    },

                    Sounds =
                    {
                        FireSounds =
                        {
                            PerfectChargeSounds =
                            {
                                { Name = "/SFX/Player Sounds/ZagreusCriticalFire" },
                                { Name = "/VO/ZagreusEmotes/EmoteHeavyBowPowerAttack" },
                                { Name = "/SFX/Player Sounds/ZagreusBowFireRamaSitar" },
                            },
                            ImperfectChargeSounds =
                            {
                                { Name = "/VO/ZagreusEmotes/EmoteHeavyBowAttack"},
                                { Name = "/SFX/Player Sounds/ZagreusBowFireRamaSitar" },
                            },
                            LoadedSounds =
                            {
                                { Name = "/SFX/Player Sounds/ZagreusBloodshotFire" },
                            },
                            { Name = "/Leftovers/SFX/AuraOn"},
                        },
                        ChargeSounds =
                        {
                            {
                                Name = "/VO/ZagreusEmotes/EmoteHeavyBowCharge",
                                StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
                                SetPitchToPropertyValue = "ChargeTime",
                            },
                        },
                        ImpactSounds =
                        {
                            Invulnerable = "/SFX/SwordWallHitClank",
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

                },
                DarkBowDash =
                {
                    AIData =
                    {
                        PreFireAnimation = "DarkZagreusBowRamaDashShot_Start",
                        FireAnimation = "DarkZagreusBowRamaDashShot_Fire",
                        PreFireCancelAnimation = "DarkZagreusBowRamaDashShot_Cancel",
                    },

                    FireScreenshake = { Distance = 3, Speed = 300, FalloffSpeed = 1200, Duration = 0.15 },

                    HitSimSlowCooldown = 0.3,
                    HitSimSlowParameters =
                    {
                        { ScreenPreWait = 0.02, Fraction = 0.03, LerpTime = 0.0 },
                        { ScreenPreWait = 0.02, Fraction = 0.20, LerpTime = 0.06 },
                        { ScreenPreWait = 0.02, Fraction = 1.00, LerpTime = 0.07 },
                    },
                },
                DarkBowSplitShot =
                {
                    FireRumbleParameters =
                    {
                        { ScreenPreWait = 0.02, RightFraction = 0.225, Duration = 0.16 },
                    },

                    Sounds =
                    {
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteHeavyBowFlurry", },
                            { Name = "/SFX/Player Sounds/ZagreusSplitShotRamaSitar"},
                        },
                        ImpactSounds =
                        {
                            Invulnerable = "/SFX/SwordWallHitClank",
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
                },
            },

            BondDamageShareData =
            {
                Multiplier = {	BaseValue = 0.3 },
                WeaponNames = { "DarkBow", "DarkBowDash"} ,
                AlliedDamageMultiplier = 0.1,
                ExtractValues =
                {
                    {
                        Key = "Multiplier",
                        ExtractAs = "TooltipDamageTransfer",
                        Format = "Percent",
                    },
                }
            },

            PropertyChanges =
            {
                {
                    -- Note(Huiun): TODO, DZ no need multiple targets, but might be nice to implement it
                    WeaponNames = { "DarkBowSplitShot" },
                    EffectName = "MarkBondTarget",
                    EffectProperty = "Active",
                    ChangeValue = true,
                },
                -- main shot modifications
                {
                    WeaponNames = { "DarkBow", "DarkBowDash"},
                    ProjectileProperty = "Scale",
                    ChangeValue = 3,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                    ExtractValue =
                    {
                        ExtractAs = "TooltipWidth",
                        Format = "PercentDelta",
                        SkipAutoExtract = true,
                    }
                },
                {
                    WeaponNames = { "DarkBow", "DarkBowDash"},
                    ProjectileProperty = "ExtentScale",
                    ChangeValue = 2,
                    ChangeType = "Add",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkBow", "DarkBowDash" },
                    ProjectileProperty = "AttachedAnim",
                    ChangeValue = "RamaWideShot",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkBow", "DarkBowDash" },
                    WeaponProperty = "ChargeTime",
                    ChangeValue = 2.1,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkBow", "DarkBowDash" },
                    WeaponProperty = "MinChargeToFire",
                    ChangeValue = 0.13,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkBow", "DarkBowDash" },
                    WeaponProperty = "ChargeDamageMultiplier",
                    ChangeValue = 2.0,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkBow", "DarkBowDash" },
                    WeaponProperty = "PerfectChargeDamageMultiplier",
                    ChangeValue = 1.25,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkBow", "DarkBowDash" },
                    WeaponProperty = "ChargeRangeMultiplier",
                    ChangeValue = 1.15,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },

                {
                    WeaponName = "DarkBow",
                    WeaponProperty = "MinChargeStartFx",
                    ChangeValue = "BowChargeRama",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponName = "DarkBowDash",
                    WeaponProperty = "ChargeStartFx",
                    ChangeValue = "BowChargeRamaDash",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkBow",
                    EffectName = "DarkBowDisable",
                    EffectProperty = "Duration",
                    ChangeValue = 1.3,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkBow",
                    EffectName = "DarkBowDisableCancelable",
                    EffectProperty = "Duration",
                    ChangeValue = 2.0,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                -- split shot modifications
                {
                    WeaponNames = { "DarkBowSplitShot" },
                    ProjectileProperty = "DamageLow",
                    ChangeValue = 5,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                    SplitShoutDamageSource = "SplitShotDamageSource",
                    ExtractValue =
                    {
                        ExtractAs = "SpecialDamage",
                        SkipAutoExtract = true,
                    },
                },
                {
                    WeaponNames = { "DarkBowSplitShot" },
                    ProjectileProperty = "DamageHigh",
                    DeriveValueFrom = "SplitShotDamageSource",
                },
                {
                    WeaponNames = { "DarkBowSplitShot" },
                    WeaponProperty = "ProjectileAngleOffsetMin",
                    ChangeValue = -1 * math.rad(4),
                    --ChangeValue = 0,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkBowSplitShot" },
                    WeaponProperty = "ProjectileAngleOffsetMax",
                    ChangeValue = math.rad(4),
                    --ChangeValue = 0,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkBowSplitShot" },
                    WeaponProperty = "ProjectileAngleOffset",
                    ChangeValue = 0,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkBowSplitShot" },
                    ProjectileProperty = "NoJumpTargetRandomSpread",
                    ChangeValue = 90,
                    ChangeType = "Absolute",
                },
                {
                    WeaponNames = { "DarkBowSplitShot" },
                    WeaponProperty = "NumProjectiles",
                    ChangeValue = 3,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkBowSplitShot" },
                    WeaponProperty = "ProjectileInterval",
                    ChangeValue = 1.5,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkBowSplitShot" },
                    WeaponProperty = "ProjectileInterval",
                    ChangeValue = 1.5,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkBowSplitShot" },
                    WeaponProperty = "AutoLock",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkBowSplitShot" },
                    WeaponProperty = "AutoLockRange",
                    ChangeValue = 1000,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkBowSplitShot" },
                    WeaponProperty = "AutoLockArcDistance",
                    ChangeValue = math.rad(90),
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponName = "DarkBowSplitShot",
                    EffectName = "SplitShotDisable",
                    EffectProperty = "Duration",
                    ChangeValue = 0.65,
                    ChangeType = "Multiply",
                },
                {
                    WeaponName = "DarkBowSplitShot",
                    EffectName = "SplitShotDisableFast",
                    EffectProperty = "Duration",
                    ChangeValue = 0.65,
                    ChangeType = "Multiply",
                },
                {
                    WeaponName = "DarkBowSplitShot",
                    EffectName = "SplitShotDisableCancelable",
                    EffectProperty = "Duration",
                    ChangeValue = 0.5,
                    ChangeType = "Multiply",
                },
                {
                    WeaponName = "DarkBowSplitShot",
                    EffectName = "SplitShotDisableFastCancelable",
                    EffectProperty = "Duration",
                    ChangeValue = 0.5,
                    ChangeType = "Multiply",
                },
                {
                    WeaponName = "DarkBowSplitShot",
                    WeaponProperty = "ChargeTime",
                    ChangeValue = 0.18,
                    ChangeType = "Absolute",
                },

                {
                    WeaponNames = { "DarkBowSplitShot" },
                    ProjectileProperty = "NumJumps",
                    ChangeValue = 1,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                    ExtractValue =
                    {
                        ExtractAs = "BonusJumps",
                        SkipAutoExtract = true,
                    }
                },
                {
                    WeaponNames = { "DarkBowSplitShot" },
                    ProjectileProperty = "BounceWhenOutOfJumpTargets",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkBowSplitShot" },
                    ProjectileProperty = "JumpRange",
                    ChangeValue = 500,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkBowSplitShot" },
                    ProjectileProperty = "Fuse",
                    ChangeValue = 0.75,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponName = "DarkBowSplitShot",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusBowRamaRapidLoop_Start",
                    ChangeType = "Absolute",
                },
                {
                    WeaponName = "DarkBowSplitShot",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusBowRamaRapidLoop_Fire",
                    ChangeType = "Absolute",
                },
                {
                    WeaponName = "DarkBowSplitShot",
                    EffectName = "OnHitStun",
                    EffectProperty = "Active",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                },
                -- tap fire properties
                {
                    WeaponNames = { "DarkBowSplitShot" },
                    WeaponProperty = "LockTriggerForCharge",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkBowSplitShot" },
                    WeaponProperty = "FireOnRelease",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkBowSplitShot" },
                    WeaponProperty = "FullyAutomatic",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkBowSplitShot" },
                    WeaponProperty = "ForceReleaseOnFire",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkBowSplitShot" },
                    WeaponProperty = "AllowExternalForceRelease",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkBowSplitShot" },
                    WeaponProperty = "ForceReleaseWeaponOnFire",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkBowSplitShot" },
                    WeaponProperty = "MinChargeToFire",
                    ChangeValue = 1.0,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkBowSplitShot" },
                    WeaponProperty = "ReloadTime",
                    ChangeValue = 0.35,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkBow",
                    WeaponProperty = "ClipSize",
                    ChangeValue = 0,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkBow",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                },
                {
                    WeaponName = "DarkBow",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                },
                {
                    WeaponName = "DarkBow",
                    WeaponProperty = "ChargeCancelGraphic",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                },
                {
                    WeaponName = "DarkBowDash",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                },
                {
                    WeaponName = "DarkBowDash",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                },
                {
                    WeaponName = "DarkBowDash",
                    WeaponProperty = "ChargeCancelGraphic",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                },
            },
        ExtractValues =
        {
            {
                ExtractAs = "TooltipBondDuration",
                SkipAutoExtract = true,
                External = true,
                BaseType = "Effect",
                WeaponName = "DarkSword", -- originally is SwordWeapon, not sure why
                BaseName = "MarkBondTarget",
                BaseProperty = "Duration",
            },
        }
        },
    }
)

ModUtil.Table.Merge(
    DarkZagreus.WeaponTraits, {
        "DZBowBaseUpgradeTrait",
        "DZBowMarkHomingTrait",
        "DZBowLoadAmmoTrait",
        "DZBowBondTrait"
    }
)