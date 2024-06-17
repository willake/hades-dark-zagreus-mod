ModUtil.Table.Merge(
    TraitData, {
        -- SwordWeapon 1, Aspect of Zagreus
        DZSwordBaseUpgradeTrait =
        {
            InheritFrom = { "WeaponEnchantmentTrait" },
            RarityLevels =
            {
                Common =
                {
                    MinMultiplier = 1,
                    MaxMultiplier = 1,
                },
                Rare =
                {
                    MinMultiplier = 2,
                    MaxMultiplier = 2,
                },
                Epic =
                {
                    MinMultiplier = 3,
                    MaxMultiplier = 3,
                },
                Heroic =
                {
                    MinMultiplier = 4,
                    MaxMultiplier = 4,
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
                    WeaponNames = { "DarkSword", "DarkSword2", "DarkSword3" },
                    WeaponProperty = "ChargeTime",
                    BaseValue = 0.97,
                    SourceIsMultiplier = true,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword" },
                    EffectName = "SwordDisableHeavy",
                    EffectProperty = "Duration",
                    BaseValue = 0.97,
                    SourceIsMultiplier = true,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkSword" },
                    EffectName = "SwordDisableCancelableAndLockTrigger",
                    EffectProperty = "Duration",
                    BaseValue = 0.97,
                    SourceIsMultiplier = true,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword2" },
                    EffectName = "SwordDisableCancelableAndLockTrigger2",
                    EffectProperty = "Duration",
                    BaseValue = 0.97,
                    SourceIsMultiplier = true,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword3" },
                    EffectName = "SwordDisable3",
                    EffectProperty = "Duration",
                    BaseValue = 0.97,
                    SourceIsMultiplier = true,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword3" },
                    EffectName = "SwordDisableAttackCancelable3",
                    EffectProperty = "Duration",
                    BaseValue = 0.97,
                    SourceIsMultiplier = true,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    UnitProperty = "Speed",
                    BaseValue = 1.03,
                    ChangeType = "Multiply",
                    SourceIsMultiplier = true,
                },
            },
            ExtractEntry =
            {
                BaseValue = 0.97,
                SourceIsMultiplier = true,
            },
            ExtractValues =
            {
                {
                    Key = "ExtractEntry",
                    DecimalPlaces = 2,
                    Format = "NegativePercentDelta",
                    ExtractAs = "TooltipSpeed",
                },
            }
        },
        -- SwordWeapon 2, Aspect of Nemesis
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
        },
        -- SwordWeapon 3, Aspect of Poseidon
        DZDislodgeAmmoTrait =
        {
            Icon = "WeaponEnchantment_Sword02",
            InheritFrom = { "WeaponEnchantmentTrait" },
            RequiredWeapon = "DarkSword",
            -- AddOutgoingDamageModifiers =
            -- {
            --     ValidWeaponMultiplier =
            --     {
            --         BaseValue = 1.10,
            --         SourceIsMultiplier = true,
            --     },
            --     ValidWeapons = WeaponSets.HeroNonPhysicalWeapons,
            --     ExtractValues =
            --     {
            --         {
            --             Key = "ValidWeaponMultiplier",
            --             ExtractAs = "TooltipDamage",
            --             Format = "PercentDelta",
            --         },
            --     }
            -- },
            -- DislodgeAmmoProperties =
            -- {
            --     ValidWeapons = { "SwordParry" },
            --     ForceMin = 300,
            --     ForceMax = 420
            -- },
            -- DroppedAmmoForceMultiplier = 5,
            WeaponBinks =
            {
                "ZagreusSword02_Bink",
                "ZagreusSword02ReturnToIdle_Bink",
                "ZagreusSword02DashAttack_Bink",
                "ZagreusSword02Run_Bink",
                "ZagreusSword02RunStop_Bink",
                "ZagreusSword02Parry_Bink"
            },
            WeaponDataOverride =
            {
                DarkSword =
                {
                    WeaponBinks =
                    {
                        "ZagreusSword02_Bink",
                        "ZagreusSword02ReturnToIdle_Bink",
                        "ZagreusSword02DashAttack_Bink",
                        "ZagreusSword02Run_Bink",
                        "ZagreusSword02RunStop_Bink",
                        "ZagreusSword02Parry_Bink"
                    },
                },
                -- RangedWeapon =
                -- {
                --     NotReadyAmmoInEnemyText = "RetrieveAmmoOrDislodgeFromEnemy",
                -- }
            },
            PropertyChanges =
            {
                {
                    WeaponName = "DarkSword",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSwordAlt02Charge1",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSword",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSwordAlt02Attack1",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSword2",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSwordAlt02Charge2",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSword2",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSwordAlt02Attack2",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSword3",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSwordAlt02Charge3",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSword3",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSwordAlt02Attack3",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSwordParry",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSwordAlt02ParryFire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSwordParry",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSwordAlt02ParryCharge",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSwordDash",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSwordAlt02DashAttack",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
            }
        },
        -- SwordWeapon 3, Aspect of Arthur
        DZSwordConsecrationTrait =
        {
            InheritFrom = { "WeaponEnchantmentTrait" },
            RequiredWeapon = "DarkSword",
            AddOnFireWeapons = { "DarkConsecrationField" },
            LegalOnFireWeapons = { "DarkSwordParry" },
            -- OnProjectileDeathFunction =
            -- {
            --     Name = "DZConsecrationFieldDeath",
            -- },
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
                "ZagreusSwordArthurIdle_Bink",
                "ZagreusSwordArthurRun_Bink",
                "ZagreusSwordArthurRunStop_Bink",
                "ZagreusSwordArthurAttack1_Bink",
                "ZagreusSwordArthurAttack2_Bink",
                "ZagreusSwordArthurAttack3_Bink",
                "ZagreusSwordArthurAttackParry_Bink",
            },
            WeaponDataOverride =
            {
                DarkSword =
                {
                    AIData =
                    {
                        AIAngleTowardsPlayerWhileFiring = true,
                        AIMoveWithinRangeTimeoutMin = 0.3,
                        AIMoveWithinRangeTimeoutMax = 0.6,
                        SkipAttackAfterMoveTimeout = true,
                        SkipAngleTowardTarget = true,
                        -- PreFireDuration = 0.25,
                        FireDuration = 0.53, -- 0.25 + 0.28
                        ChainedWeapon = "DarkSword2",
                    },

                    WeaponBinks =
                    {
                        "ZagreusSwordArthurIdle_Bink",
                        "ZagreusSwordArthurRun_Bink",
                        "ZagreusSwordArthurRunStop_Bink",
                        "ZagreusSwordArthurAttack1_Bink",
                        "ZagreusSwordArthurAttack2_Bink",
                        "ZagreusSwordArthurAttack3_Bink",
                        "ZagreusSwordArthurAttackParry_Bink",
                    },

                    HitSimSlowCooldown = 0.3,
                    HitSimSlowParameters =
                    {
                        { ScreenPreWait = 0.04, Fraction = 0.03, LerpTime = 0.0 },
                        { ScreenPreWait = 0.02, Fraction = 0.20, LerpTime = 0.06 },
                        { ScreenPreWait = 0.02, Fraction = 1.00, LerpTime = 0.07 },

                        --{ ScreenPreWait = 0.01, Fraction = 0.01, LerpTime = 0 },
                        --{ ScreenPreWait = 0.06, Fraction = 0.3, LerpTime = 0.07 },
                        --{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0.07 },
                    },
                },

                DarkSword2 =
                {
                    AIData =
                    {
                        SkipMovement = true,
                        SkipAngleTowardTarget = true,
                        AIAngleTowardsPlayerWhileFiring = true,
                        ChainedWeapon = "DarkSword3",
                        PreFireFx = "ChargeAttack-Arthur", -- Note(Huiun): cuz ChargeFx not working
                        PreFireSound = "/VO/ZagreusEmotes/EmoteCharging",
                        -- PreFireDuration = 0.33, 
                        FireDuration = 0.81 -- 0.33 + 0.48
                    },

                    HitSimSlowCooldown = 0.3,
                    HitSimSlowParameters =
                    {
                        { ScreenPreWait = 0.02, Fraction = 0.05, LerpTime = 0.0 },
                        { ScreenPreWait = 0.03, Fraction = 0.20, LerpTime = 0.06 },
                        { ScreenPreWait = 0.03, Fraction = 1.00, LerpTime = 0.07 },

                        --{ ScreenPreWait = 0.01, Fraction = 0.01, LerpTime = 0 },
                        --{ ScreenPreWait = 0.06, Fraction = 0.3, LerpTime = 0.07 },
                        --{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0.07 },
                    },
                    Sounds =
                    {
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteAttacking_Sword" },
                            { Name = "/SFX/Player Sounds/ZagreusSwordSwipe" },
                        },
                        ChargeSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteCharging" },
                            {
                                Name = "/SFX/Player Sounds/ZagreusWeaponChargeup" ,
                                StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
                            },
                        },
                        ImpactSounds =
                        {
                            Invulnerable = "/SFX/SwordWallHitClank",
                            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
                            Bone = "/SFX/MetalBoneSmash",
                            Brick = "/SFX/MetalStoneClang",
                            Stone = "/SFX/MetalStoneClang",
                            Organic = "/SFX/StabSplatterSmall",
                            StoneObstacle = "/SFX/SwordWallHitClank",
                            BrickObstacle = "/SFX/SwordWallHitClank",
                            MetalObstacle = "/SFX/SwordWallHitClank",
                            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
                        },
                    },

                },

                DarkSword3 =
                {
                    AIData =
                    {
                        SkipMovement = true,
                        SkipAngleTowardTarget = true,
                        AIAngleTowardsPlayerWhileFiring = true,
                        -- PreFireDuration = 0.48,
                        FireDuration = 0.78, -- 0.48 + 0.3
                        PreFireFx = "ChargeAttack-Arthur",
                        PreFireSound = "/VO/ZagreusEmotes/EmoteHeavyCharging",
                    },

                    HitSimSlowCooldown = 0.3,
                    HitSimSlowParameters =
                    {
                        { ScreenPreWait = 0.04, Fraction = 0.01, LerpTime = 0.0 },
                        { ScreenPreWait = 0.02, Fraction = 0.15, LerpTime = 0.06 },
                        { ScreenPreWait = 0.06, Fraction = 1.0, LerpTime = 0.07 },

                        --{ ScreenPreWait = 0.01, Fraction = 0.01, LerpTime = 0 },
                        --{ ScreenPreWait = 0.06, Fraction = 0.3, LerpTime = 0.07 },
                        --{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0.07 },
                    },
                    Sounds =
                    {
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteHeavyAttacking" },
                            { Name = "/SFX/Enemy Sounds/Minotaur/HugeAxeSwing" }
                        },
                        ChargeSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteHeavyCharging" },
                            {
                                Name = "/Leftovers/SFX/AuraCharge" ,
                                StoppedBy = { "TriggerRelease" }
                            },
                        },
                        ImpactSounds =
                        {
                            Invulnerable = "/SFX/SwordWallHitClank",
                            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
                            Bone = "/SFX/MetalBoneSmash",
                            Brick = "/SFX/MetalStoneClang",
                            Stone = "/SFX/MetalStoneClang",
                            Organic = "/SFX/StabSplatterSmall",
                            StoneObstacle = "/SFX/SwordWallHitClank",
                            BrickObstacle = "/SFX/SwordWallHitClank",
                            MetalObstacle = "/SFX/SwordWallHitClank",
                            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
                        },
                    },
                },
                DarkSwordDash =
                {
                    AIData =
                    {
                        -- PreFireDuration = 0.2,
                        FireDuration = 0.38, -- 0.2 + 0.18
                        GiveupDistance = 250,
                        AIAngleTowardsPlayerWhileFiring = true,
                        AIMoveWithinRangeTimeout = 1.0,
                        SkipMovement = true,
                        SkipAngleTowardTarget = true,
                    },

                    HitSimSlowCooldown = 0.2,
                    Sounds =
                    {
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteSpearThrow" },
                            { Name = "/SFX/Player Sounds/ZagreusSwordSwipe" },
                        },
                        ImpactSounds =
                        {
                            Invulnerable = "/SFX/SwordWallHitClank",
                            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
                            Bone = "/SFX/MetalBoneSmash",
                            Brick = "/SFX/MetalStoneClang",
                            Stone = "/SFX/MetalStoneClang",
                            Organic = "/SFX/StabSplatterSmall",
                            StoneObstacle = "/SFX/SwordWallHitClank",
                            BrickObstacle = "/SFX/SwordWallHitClank",
                            MetalObstacle = "/SFX/SwordWallHitClank",
                            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
                        },
                    },
                },
                DarkSwordParry =
                {
                    AIData =
                    {
                        AIMoveWithinRangeTimeoutMin = 0.3,
                        AIMoveWithinRangeTimeoutMax = 0.6,
                        SkipAttackAfterMoveTimeout = true,
                        SkipAngleTowardTarget = true,
                        -- PostFireWeapon = "DarkConsecrationField",
                        -- PreFireDuration = 0.48,
                        FireDuration = 1.08 -- 0.48 + 0.6
                    },
                    
                    HitSimSlowCooldown = 0.2,
                    Sounds =
                    {
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteHeavyAttacking" },
                        },
                        ChargeSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteCharging" },
                            { Name = "/SFX/Player Sounds/ZagreusSwordSwipe" },
                        },
                        ImpactSounds =
                        {
                            Invulnerable = "/SFX/SwordWallHitClank",
                            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
                            Bone = "/SFX/MetalBoneSmash",
                            Brick = "/SFX/MetalStoneClang",
                            Stone = "/SFX/MetalStoneClang",
                            Organic = "/SFX/StabSplatterSmall",
                            StoneObstacle = "/SFX/SwordWallHitClank",
                            BrickObstacle = "/SFX/SwordWallHitClank",
                            MetalObstacle = "/SFX/SwordWallHitClank",
                            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
                        },
                    },
                },
            },
            PropertyChanges =
            {
                -- SwordWeaponDash
                {
                    WeaponNames = { "DarkSwordDash" },
                    WeaponProperty = "ChargeTime",
                    ChangeValue = 0.20,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSwordDash" },
                    WeaponProperty = "RootOwnerWhileFiring",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSwordDash" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSwordArthurAttack1_Charge",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSwordDash" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSwordArthurAttack1_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSwordDash" },
                    WeaponProperty = "FireFx",
                    ChangeValue = "SwordSwipeC-Arthur",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSwordDash" },
                    ProjectileProperty = "DamageLow",
                    ChangeValue = 50,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSwordDash" },
                    ProjectileProperty = "DamageHigh",
                    ChangeValue = 50,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                -- SwordWeapon
                {
                    WeaponNames = { "DarkSword" },
                    WeaponProperty = "ChargeTime",
                    ChangeValue = 0.25,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSwordArthurAttack1_Charge",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSwordArthurAttack1_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword" },
                    WeaponProperty = "FireFx",
                    ChangeValue = "SwordSwipeC-Arthur",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword" },
                    WeaponProperty = "RootOwnerWhileFiring",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword" },
                    WeaponProperty = "ChargeCancelMovement",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword" },
                    WeaponProperty = "Projectile",
                    ChangeValue = "DarkSwordArthur1",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword" },
                    EffectName = "SwordDisableArthur",
                    EffectProperty = "Active",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword" },
                    EffectName = "SwordDisableArthurCancellable",
                    EffectProperty = "Active",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword" },
                    EffectName = "SwordDisable",
                    EffectProperty = "Active",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword" },
                    EffectName = "SwordDisableCancelableAndLockTrigger",
                    EffectProperty = "Active",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },


                -- SwordWeapon2
                {
                    WeaponNames = { "DarkSword2" },
                    WeaponProperty = "ChargeTime",
                    ChangeValue = 0.35,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword2" },
                    WeaponProperty = "ControlWindow",
                    ChangeValue = 0.6,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword2" },
                    WeaponProperty = "ChargeFx",
                    ChangeValue = "ChargeAttack-Arthur",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword2" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSwordArthurAttack2_Charge",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkSword2" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSwordArthurAttack2_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword2" },
                    WeaponProperty = "FireFx",
                    ChangeValue = "SwordSwipeA-Arthur",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword2" },
                    WeaponProperty = "ChargeCancelMovement",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword2" },
                    WeaponProperty = "RootOwnerWhileFiring",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword2" },
                    WeaponProperty = "Projectile",
                    ChangeValue = "DarkSwordArthur2",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword2" },
                    WeaponProperty = "BarrelLength",
                    ChangeValue = "0",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword2" },
                    EffectName = "SwordDisableArthur2",
                    EffectProperty = "Active",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword2" },
                    EffectName = "SwordDisableArthurCancellable2",
                    EffectProperty = "Active",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword2" },
                    EffectName = "SwordDisable2",
                    EffectProperty = "Active",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword2" },
                    EffectName = "SwordDisableCancelableAndLockTrigger2",
                    EffectProperty = "Active",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },


                -- SwordWeapon3
                {
                    WeaponNames = { "DarkSword3" },
                    WeaponProperty = "ChargeTime",
                    ChangeValue = 0.50,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword3" },
                    WeaponProperty = "ControlWindow",
                    ChangeValue = 0.6,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword3" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSwordArthurAttack3_Charge",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkSword3" },
                    WeaponProperty = "ChargeFx",
                    ChangeValue = "ChargeAttack-Arthur",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkSword3" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSwordArthurAttack3_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword3" },
                    WeaponProperty = "FireFx",
                    ChangeValue = "SwordSwipeAFlipped-Arthur",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkSword3" },
                    WeaponProperty = "SelfVelocity",
                    ChangeValue = 0.75,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword3" },
                    WeaponProperty = "SelfVelocityCap",
                    ChangeValue = 0.75,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword3" },
                    WeaponProperty = "CancelMovement",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword3" },
                    WeaponProperty = "ChargeCancelMovement",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSword3",
                    EffectName = "SwordDisable3",
                    EffectProperty = "Active",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSword3",
                    EffectName = "SwordDisableAttackCancelable3",
                    EffectProperty = "Active",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSword3",
                    EffectName = "SwordDisableCancelable3",
                    EffectProperty = "Active",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSword3",
                    EffectName = "ArthurSwordDisable3",
                    EffectProperty = "Active",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSword3",
                    EffectName = "ArthurSwordDisableCancelable3",
                    EffectProperty = "Active",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword3" },
                    WeaponProperty = "Projectile",
                    ChangeValue = "DarkSwordArthur3",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSword3" },
                    WeaponProperty = "BarrelLength",
                    ChangeValue = 0,
                    ExcludeLinked = true,
                },

                -- Sword Parry

                {
                    WeaponNames = { "DarkSwordParry" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSwordAlt03ParryCharge",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSwordParry" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSwordAlt03ParryFire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSwordParry",
                    ProjectileProperty = "DetonateGraphic",
                    ChangeValue = "RadialNovaSwordParry-Arthur",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSwordParry" },
                    WeaponProperty = "ChargeTime",
                    ChangeValue = 0.5,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSwordParry" },
                    ProjectileProperty = "DamageLow",
                    ChangeValue = 70,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSwordParry" },
                    ProjectileProperty = "DamageHigh",
                    ChangeValue = 70,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                -- Consecration Field
                {
                    WeaponName = "DarkConsecrationField",
                    EffectName = "ConsecrationSlow",
                    EffectProperty = "Modifier",
                    ChangeValue = 0.50,
                    ChangeType = "Absolute",
                },
                {
                    WeaponName = "DarkConsecrationField",
                    EffectName = "ConsecrationDamageReduction",
                    EffectProperty = "Modifier",
                    BaseValue = 0.8,
                    SourceIsMultiplier = true,
                    ChangeType = "Multiply",
                    ExtractValue =
                    {
                        ExtractAs = "TooltipDamageReduction",
                        Format = "NegativePercentDelta",
                    }
                },
            },
        },
    }
)

ModUtil.Table.Merge(
    DarkZagreus.WeaponTraits, {
        SwordBaseUpgradeTrait = true,
        SwordCriticalParryTrait = true,
        DislodgeAmmoTrait = true,
        SwordConsecrationTrait = true
    }
)