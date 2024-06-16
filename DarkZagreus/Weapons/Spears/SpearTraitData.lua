ModUtil.Table.Merge(
    TraitData, {
        -- SpearWeapon 2, Aspect of Achilles
        DZSpearTeleportTrait =
        {
            InheritFrom = { "WeaponEnchantmentTrait" },
            RequiredWeapon = "DarkSpearThrow",
            RarityLevels =
            {
                Common =
                {
                    MinMultiplier = 1.00,
                    MaxMultiplier = 1.00,
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
            DZActionConfig = {
                ShouldRushToSpear = true,
                SpecialAttackWeaponRush = "DarkSpearRush",
                SpearObstacle = "DarkSpearReturnPointAlt01"
            },
            PreEquipWeapons = { "DarkSpearRush", "DarkSpearThrowInvisibleReturn", },
            WeaponBinks =
            {
                "ZagreusSpear01Run_Bink",
                "ZagreusSpear01RunStop_Bink",
                "ZagreusSpear01_Bink",
                "ZagreusSpear01ReturnToIdle_Bink",
                "ZagreusSpear01Spin_Bink",
                "ZagreusSpear01DashAttack_Bink",
                "ZagreusSpear01Throw_Bink",
                "ZagreusSpear01ThrowReceive_Bink"
            },
            WeaponDataOverride =
            {
                DarkSpear =
                {
                    WeaponBinks =
                    {
                        "ZagreusSpear01Run_Bink",
                        "ZagreusSpear01RunStop_Bink",
                        "ZagreusSpear01_Bink",
                        "ZagreusSpear01ReturnToIdle_Bink",
                        "ZagreusSpear01Spin_Bink",
                        "ZagreusSpear01DashAttack_Bink",
                        "ZagreusSpear01Throw_Bink",
                        "ZagreusSpear01ThrowReceive_Bink"
                    }
                },
                DarkSpearThrow =
                {
                    AIData =
                    {
                        AITrackTargetDuringCharge = true,
                        IsRangeBasedOnCharge = true,
                        MinChargeTime = 0.04,
                        MaxChargeTime = 0.12,
                        Range = 264,
                        ChargeRangeMultiplier = 3.34,
                        PreFireDuration = 0.04,
                        PreFireFx = "SpearChargeThrowTrait",
                        PreFireAnimation = "DarkZagreusSpearAlt01ThrowCharge",
                        PreFireCancelAnimation = "DarkZagreusSpearAlt01ThrowFireReturnToIdle",
                        FireAnimation = "DarkZagreusSpearAlt01ThrowFire"
                    },
                    Sounds =
                    {
                        ChargeSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteHeavyBowCharge",
                                StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" },
                            },
                            {
                                Name = "/SFX/Player Sounds/ZagreusWeaponChargeup" ,
                                StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" },
                                SetPitchToPropertyValue = "ChargeTime",
                            },
                        },
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteHeavyShieldThrow" },
                            { Name = "/SFX/Player Sounds/ZagreusDash" },
                            { Name = "/SFX/Player Sounds/ZagreusSpearThrow" },
                        },
                    },
                },
                DarkSpearRush =
                {
                    FireRumbleParameters =
                    {
                        { ScreenPreWait = 0.1, LeftFraction = 0.17, Duration = 0.17 },
                    },

                    HitSimSlowParameters =
                    {
                        { ScreenPreWait = 0.02, Fraction = 0.10, LerpTime = 0 },
                        --{ ScreenPreWait = 0.06, Fraction = 0.30, LerpTime = 0.06 },
                        { ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0.06 },

                        --{ ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
                        --{ ScreenPreWait = 0.06, Fraction = 0.30, LerpTime = 0.06 },
                        --{ ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0.06 },
                    },

                    HitRumbleParameters =
                    {
                        { ScreenPreWait = 0.02, RightFraction = 0.15, Duration = 0.15 },
                    },

                    Sounds =
                    {
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteAttacking_DashUppercut" },
                            { Name = "/SFX/Enemy Sounds/Hades/HadesDash" },
                            { Name = "/Leftovers/World Sounds/QuickSnap" },
                        },
                        ImpactSounds =
                        {
                            Invulnerable = "/SFX/SwordWallHitClank",
                            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
                            Bone = "/SFX/FistImpactSmall",
                            Brick = "/SFX/FistImpactSmall",
                            Stone = "/SFX/FistImpactSmall",
                            Organic = "/SFX/FistImpactSmall",
                        },
                    },
                },
                DarkSpearSpin = {
                    AIData =
                    {
                        PreFireAnimation = "DarkZagreusSpearAlt01SpinStart",
                        PreFireCancelAnimation = "DarkZagreusSpearAlt01SpinStartChargeCancel",
                        FireAnimation = "DarkZagreusSpearAlt01SpinAttack"
                    }
                },
                DarkSpearSpin2 = {
                    AIData =
                    {
                        PreFireAnimation = "DarkZagreusSpearAlt01SpinStart",
                        PreFireCancelAnimation = "DarkZagreusSpearAlt01SpinStartChargeCancel",
                        FireAnimation = "DarkZagreusSpearAlt01SpinAttack"
                    }
                },
                DarkSpearSpin3 = {
                    AIData =
                    {
                        PreFireAnimation = "DarkZagreusSpearAlt01SpinStart",
                        PreFireCancelAnimation = "DarkZagreusSpearAlt01SpinStartChargeCancel",
                        FireAnimation = "DarkZagreusSpearAlt01SpinAttack"
                    }
                },
            },
            -- OnWeaponFiredFunctions =
            -- {
            --     ValidWeapons = { "DarkSpearThrow" },
            --     FunctionName = "CheckSpearTeleportBuffer",
            -- },
            PropertyChanges =
            {	
                -- Spear Throw Charge
                {
                    WeaponNames = { "DarkSpearThrow" },
                    WeaponProperty = "ChargeTime",
                    ChangeValue = 0.00, -- 0.07
                    ChangeType = "Add",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpearThrow" },
                    WeaponProperty = "ChargeStartFx",
                    ChangeValue = "SpearChargeThrowTrait",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                -- Achilles Aspect Changes
                {
                    WeaponName = "DarkSpearThrowReturn",
                    WeaponProperty = "FireFromObstacle",
                    ChangeValue = "DarkSpearReturnPointAlt01",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrowInvisibleReturn",
                    WeaponProperty = "FireFromObstacle",
                    ChangeValue = "DarkSpearReturnPointAlt01",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearRush" ,
                    WeaponProperty = "BlinkDetonateAtOrigin",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                },
                {
                    WeaponName = "DarkSpearRush" ,
                    WeaponProperty = "Enabled",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                },
                {
                    WeaponName = "DarkSpearRush" ,
                    WeaponProperty = "BlinkDetonateAtEndpoint",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                },
                {
                    WeaponName = "DarkSpearRush" ,
                    WeaponProperty = "BlinkDetonateOnInterval",
                    ChangeValue = 130,
                    ChangeType = "Absolute",
                },
                {
                    WeaponName = "DarkSpearRush" ,
                    EffectName = "DZSpearRushBonus",
                    EffectProperty = "Modifier",
                    BaseValue = 0.5,
                    ChangeType = "Add",
                    ExtractValue =
                    {
                        ExtractAs = "TooltipDamage",
                        Format = "Percent"
                    },
                    DeriveSource = "DeriveSource"
                },
                {
                    WeaponName = "DarkSpearThrowReturn",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSpearAlt01ThrowFireReturn",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrow",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrow",
                    WeaponProperty = "ChargeCancelGraphic",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrow",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearDash",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSpearAlt01DashAttack_Charge",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearDash",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSpearAlt01DashAttack",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrow",
                    ProjectileProperty = "SpawnType",
                    ChangeValue = "OBSTACLE",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrow",
                    ProjectileProperty = "SpawnOnDeath",
                    ChangeValue = "DarkSpearReturnPointAlt01",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearRush",
                    WeaponProperty = "FireToObstacle",
                    ChangeValue = "DarkSpearReturnPointAlt01",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpear",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSpearAlt01Charge1",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpear",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSpearAlt01Attack1",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpear2",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSpearAlt01Charge2",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpear2",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSpearAlt01Attack2",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpear3",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSpearAlt01Charge3",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpear3",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSpearAlt01Attack3",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpearSpin","DarkSpearSpin2","DarkSpearSpin3" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpearSpin","DarkSpearSpin2","DarkSpearSpin3" },
                    WeaponProperty = "ChargeCancelGraphic",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpearSpin","DarkSpearSpin2","DarkSpearSpin3" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
            }
        },
        -- SpearWeapon 3, Aspect of Hades
        DZSpearWeaveTrait =
        {
            InheritFrom = { "WeaponEnchantmentTrait" },
            RequiredWeapons = { "DarkSpear", "DarkSpearThrow" },
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
                    MinMultiplier = 5,
                    MaxMultiplier = 5,
                },
            },
            DZActionConfig = {
                SpearObstacle = "DarkSpearReturnPointAlt02"
            },
            WeaponBinks =
            {
                "ZagreusSpear02Run_Bink",
                "ZagreusSpear02RunStop_Bink",
                "ZagreusSpear02_Bink",
                "ZagreusSpear02ReturnToIdle_Bink",
                "ZagreusSpear02Spin_Bink",
                "ZagreusSpear02DashAttack_Bink",
                "ZagreusSpear02Throw_Bink",
                "ZagreusSpear02ThrowReceive_Bink"
            },
            WeaponDataOverride =
            {
                DarkSpear =
                {
                    AIData = {
                        PostFireChargeStages = 
                        {
                            { ChargeWeapon = "DarkSpearSpin2", Threshold = 0.30 }, -- 0.75
                            { ChargeWeapon = "DarkSpearSpin3", Threshold = 1.05 },
                        },
                        MaxChargeTime = 1.15,
                    },
                    WeaponBinks =
                    {
                        "ZagreusSpear02Run_Bink",
                        "ZagreusSpear02RunStop_Bink",
                        "ZagreusSpear02_Bink",
                        "ZagreusSpear02ReturnToIdle_Bink",
                        "ZagreusSpear02Spin_Bink",
                        "ZagreusSpear02DashAttack_Bink",
                        "ZagreusSpear02Throw_Bink",
                        "ZagreusSpear02ThrowReceive_Bink"
                    }
                },
                DarkSpear2 = 
                {
                    AIData = {
                        PostFireChargeStages = 
                        {
                            { ChargeWeapon = "DarkSpearSpin2", Threshold = 0.30 }, -- 0.75
                            { ChargeWeapon = "DarkSpearSpin3", Threshold = 1.05 },
                        },
                        MaxChargeTime = 1.15,
                    },
                },
                DarkSpear3 = 
                {
                    AIData = {
                        PostFireChargeStages = 
                        {
                            { ChargeWeapon = "DarkSpearSpin2", Threshold = 0.30 }, -- 0.75
                            { ChargeWeapon = "DarkSpearSpin3", Threshold = 1.05 },
                        },
                        MaxChargeTime = 1.15,
                    },
                },
                DarkSpearDash = 
                {
                    AIData = {
                        PostFireChargeStages = 
                        {
                            { ChargeWeapon = "DarkSpearSpin2", Threshold = 0.30 }, -- 0.75
                            { ChargeWeapon = "DarkSpearSpin3", Threshold = 1.05 },
                        },
                        MaxChargeTime = 1.15,
                    },
                },
                DarkSpearSpin = 
                {
                    AIData = {
                        PreFireAnimation = "DarkZagreusSpearAlt02SpinStart",
                        PreFireCancelAnimation = "DarkZagreusSpearAlt02SpinStartChargeCancel",
                        FireAnimation = "DarkZagreusSpearAlt02SpinAttack",
                    }
                },
                DarkSpearSpin2 = 
                {
                    AIData = {
                        PreFireAnimation = "DarkZagreusSpearAlt02SpinStart",
                        PreFireCancelAnimation = "DarkZagreusSpearAlt02SpinStartChargeCancel",
                        FireAnimation = "DarkZagreusSpearAlt02SpinAttack",
                    }
                },
                DarkSpearSpin3 = 
                {
                    AIData = {
                        PreFireAnimation = "DarkZagreusSpearAlt02SpinStart",
                        PreFireCancelAnimation = "DarkZagreusSpearAlt02SpinStartChargeCancel",
                        FireAnimation = "DarkZagreusSpearAlt02SpinAttack",
                    }
                }
            },
            PropertyChanges =
            {
                {
                    WeaponNames = { "DarkSpearSpin" },
                    ProjectileProperty = "DamageRadius",
                    ChangeValue = 1.475,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpearSpin2" },
                    ProjectileProperty = "DamageRadius",
                    ChangeValue = 1.375,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpearSpin3" },
                    ProjectileProperty = "DamageRadius",
                    ChangeValue = 1.275,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpearSpin", "DarkSpearSpin2", "DarkSpearSpin3" },
                    EffectName = "DZMarkTargetSpin",
                    EffectProperty = "Active",
                    ChangeValue = true,
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = WeaponSets.HeroPhysicalWeapons,
                    EffectName = "DZMarkTargetSpin",
                    EffectProperty = "Modifier",
                    BaseValue = 0.30,
                    ChangeType = "Add",
                    ExtractValue =
                    {
                        ExtractAs = "TooltipDamage",
                        Format = "Percent"
                    },
                    DeriveSource = "DeriveSource"
                },
                {
                    WeaponName = "DarkSpearThrowReturn",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSpearAlt02ThrowFireReturn",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrow",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSpearAlt02ThrowCharge",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrow",
                    WeaponProperty = "ChargeCancelGraphic",
                    ChangeValue = "DarkZagreusSpearAlt02ThrowFireReturnToIdle",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrow",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSpearAlt02ThrowFire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearDash",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSpearAlt02DashAttack_Charge",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearDash",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSpearAlt02DashAttack",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpear",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSpearAlt02Charge1",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpear",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSpearAlt02Attack1",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpear2",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSpearAlt02Charge2",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpear2",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSpearAlt02Attack2",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpear3",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSpearAlt02Charge3",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpear3",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSpearAlt02Attack3",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrow",
                    ProjectileProperty = "SpawnType",
                    ChangeValue = "OBSTACLE",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrow",
                    ProjectileProperty = "SpawnOnDeath",
                    ChangeValue = "DarkSpearReturnPointAlt02",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrowReturn",
                    WeaponProperty = "FireFromObstacle",
                    ChangeValue = "DarkSpearReturnPointAlt02",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrowInvisibleReturn",
                    WeaponProperty = "FireFromObstacle",
                    ChangeValue = "DarkSpearReturnPointAlt02",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkSpearSpin","DarkSpearSpin2","DarkSpearSpin3" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpearSpin","DarkSpearSpin2","DarkSpearSpin3" },
                    WeaponProperty = "ChargeCancelGraphic",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpearSpin","DarkSpearSpin2","DarkSpearSpin3" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
            },
            -- ExtractValues =
            -- {
            --     {
            --         ExtractAs = "TooltipWeaveDuration",
            --         SkipAutoExtract = true,
            --         External = true,
            --         BaseType = "Effect",
            --         WeaponName = "DarkSword",
            --         BaseName = "DZMarkTargetSpin",
            --         BaseProperty = "Duration",
            --     },
            -- }
        },
        -- SpearWeapon 4, Aspect of GuanYu
        DZSpearSpinTravel =
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
                    MinMultiplier = 0.65/0.7,
                    MaxMultiplier = 0.65/0.7,
                },
                Epic =
                {
                    MinMultiplier = 0.60/0.7,
                    MaxMultiplier = 0.60/0.7,
                },
                Heroic =
                {
                    MinMultiplier = 0.55/0.7,
                    MaxMultiplier = 0.55/0.7,
                },
                Legendary =
                {
                    MinMultiplier = 0.50/0.7,
                    MaxMultiplier = 0.50/0.7,
                },
            },
            RequiredWeapons = {"DarkSpear", "DarkSpearThrow",},
            RequiredFalseTraits = { "DZSpearAutoAttack", "DZSpearSpinAura" },
            DZActionConfig = {
                ShouldReturnSpearAfterThrow = false
            },
            WeaponBinks =
            {
                "ZagreusSpear03Run_Bink",
                "ZagreusSpear03RunStop_Bink",
                "ZagreusSpear03Spin_Bink",
                "ZagreusSpear03DashAttack_Bink",
                "ZagreusSpear03Throw_Bink",

                "ZagreusSpearLunarThrust1_Bink",
                "ZagreusSpearLunarThrust2_Bink",
                "ZagreusSpearLunarThrust3_Bink",

                "ZagreusSpearLunarThrustIdle_Bink",
                "ZagreusSpear03ReturnToIdle_Bink",
                "ZagreusSpear03ThrowReceive_Bink",
            },
            WeaponDataOverride =
            {
                DarkSpear =
                {
                    WeaponBinks =
                    {
                        "ZagreusSpear03Run_Bink",
                        "ZagreusSpear03RunStop_Bink",
                        "ZagreusSpear03Spin_Bink",
                        "ZagreusSpear03DashAttack_Bink",
                        "ZagreusSpear03Throw_Bink",

                        "ZagreusSpearLunarThrust1_Bink",
                        "ZagreusSpearLunarThrust2_Bink",
                        "ZagreusSpearLunarThrust3_Bink",

                        "ZagreusSpearLunarThrustIdle_Bink",
                        "ZagreusSpear03ReturnToIdle_Bink",
                        "ZagreusSpear03ThrowReceive_Bink",
                    },

                    Sounds =
                    {
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteMartialSpearAttack" },
                            { Name = "/SFX/Player Sounds/ZagreusSpearThrust" },
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

                DarkSpear2 =
                {	
                    AIData = {
                        -- PreFireDuration = 0.32,
                        FireDuration = 0.53, -- 0.32 + 0.21
                    },
                    Sounds =
                    {
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmotePowerAttacking_Sword" },
                            { Name = "/SFX/Player Sounds/ZagreusSpearThrust" },
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

                DarkSpear3 =
                {
                    AIData = {
                        -- PreFireDuration = 0.52,
			            FireDuration = 0.82, -- 0.52 + 0.3
                    },
                    Sounds =
                    {
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteAttacking_FistKick" },
                            { Name = "/SFX/Player Sounds/ZagreusSwordOverhead" },
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

                DarkSpearSpin =
                {
                    AIData = 
                    {
                        PreFireAnimation = "DarkZagreusSpearAlt03SpinStart",
                        PreFireCancelAnimation = "DarkZagreusSpearAlt03SpinStartChargeCancel",
                        FireAnimation = "DarkZagreusSpearAlt03SpinAttack",
                        WaitUntilProjectileDeath = "DarkGuanYuSpearSpin"
                    },

                    HitSimSlowParameters = { },

                    Sounds =
                    {
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteMartialSpearSpinAttack" },
                            { Name = "/SFX/Player Sounds/ZagreusSpearSwipe" },
                            { Name = "/Leftovers/SFX/AuraThrow" }
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

                        ChargeSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteCharging" },
                            {
                                Name = "/SFX/Player Sounds/ZagreusWeaponChargeup" ,
                                Key = "DarkSpearSpinTravel",
                                StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
                                SetPitchToPropertyValue = "ChargeTime",
                            },
                        },
                    },

                },

                DarkSpearSpin2 =
                {
                    AIData = 
                    {
                        PreFireAnimation = "DarkZagreusSpearAlt03SpinStart",
                        PreFireCancelAnimation = "DarkZagreusSpearAlt03SpinStartChargeCancel",
                        FireAnimation = "DarkZagreusSpearAlt03SpinAttack",
                        WaitUntilProjectileDeath = "DarkGuanYuSpearSpin"
                    },

                    HitSimSlowParameters = { },

                    Sounds =
                    {
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteMartialSpearSpinAttack" },
                            { Name = "/SFX/Player Sounds/ZagreusSpearSwipe" },
                            { Name = "/Leftovers/SFX/AuraThrow" }
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

                        ChargeSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteCharging" },
                            {
                                Name = "/SFX/Player Sounds/ZagreusWeaponChargeup",
                                Key = "DarkSpearSpin2Travel",
                                StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
                            },
                        },
                    },
                },

                DarkSpearSpin3 =
                {
                    AIData = 
                    {
                        PreFireAnimation = "DarkZagreusSpearAlt03SpinStart",
                        PreFireCancelAnimation = "DarkZagreusSpearAlt03SpinStartChargeCancel",
                        FireAnimation = "DarkZagreusSpearAlt03SpinAttack",
                        WaitUntilProjectileDeath = "DarkGuanYuSpearSpin"
                    },

                    HitSimSlowParameters = { },

                    Sounds =
                    {
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteMartialSpearSpinAttack" },
                            { Name = "/SFX/Player Sounds/ZagreusSpearSwipe" },
                            { Name = "/Leftovers/SFX/AuraThrow" }
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

                        ChargeSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteCharging" },
                            {
                                Name = "/SFX/Player Sounds/ZagreusWeaponChargeup" ,
                                Key = "DarkSpearSpin3Travel",
                                StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
                                SetPitchToPropertyValue = "ChargeTime",
                            },
                        },
                    },
                },

                DarkSpearThrow =
                {
                    AIData = 
                    {
                        -- PreFireDuration = 0.28,
			            FireDuration = 0.56, -- 0.28 + 0.28
                    },
                    Sounds =
                    {
                        FireSounds =
                        {
                            { Name = "/SFX/Player Sounds/ZagreusBowFire" },
                            { Name = "/SFX/Player Sounds/ZagreusSpearThrow" },
                            {
                                Name = "/VO/ZagreusEmotes/EmoteMartialSpearThrow",
                                Cooldown = 0.5
                            },
                        },
                        ChargeSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteCharging" },
                            {
                                Name = "/Leftovers/SFX/AuraCharge" ,
                                StoppedBy = { "TriggerRelease" },
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
                            StoneObstacle = "/SFX/SwordWallHitClankSmall",
                            BrickObstacle = "/SFX/SwordWallHitClankSmall",
                            MetalObstacle = "/SFX/SwordWallHitClankSmall",
                            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
                        },
                    },

                },

            },
            AddOutgoingLifestealModifiers =
            {
                MaxLifesteal = 1,
                MinLifesteal = 1,
                ValidWeapons = { "DarkSpearSpin", "DarkSpearSpin2", "DarkSpearSpin3" },
                ValidMultiplier = 0.05
            },
            PropertyChanges =
            {
                {
                    WeaponNames = { "DarkSpearSpin", "DarkSpearSpin2", "DarkSpearSpin3" },
                    ProjectileProperty = "MultiDetonate",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                },
                {
                    WeaponNames = { "DarkSpearSpin", "DarkSpearSpin2", "DarkSpearSpin3" },
                    ProjectileProperty = "Range",
                    ChangeValue = 1000,
                    ChangeType = "Add",
                },
                {
                    WeaponNames = { "DarkSpearSpin", "DarkSpearSpin2", "DarkSpearSpin3" },
                    ProjectileProperty = "Speed",
                    ChangeValue = 400,
                    ChangeType = "Absolute",
                },
                {
                    WeaponNames = { "DarkSpearSpin", "DarkSpearSpin2", "DarkSpearSpin3" },
                    ProjectileProperty = "Fuse",
                    ChangeValue = 0.25,
                    ChangeType = "Add",
                },
                {
                    WeaponNames = { "DarkSpearSpin3" },
                    ProjectileProperty = "TotalFuse",
                    ChangeValue = 1.25,
                    ChangeType = "Add",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpearSpin2" },
                    ProjectileProperty = "TotalFuse",
                    ChangeValue = 1.00,
                    ChangeType = "Add",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpearSpin" },
                    ProjectileProperty = "TotalFuse",
                    ChangeValue = 0.75,
                    ChangeType = "Add",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpearSpin", "DarkSpearSpin2", "DarkSpearSpin3" },
                    ProjectileProperty = "UnlimitedUnitPenetration",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                },
                {
                    WeaponNames = { "DarkSpearSpin", "DarkSpearSpin2", "DarkSpearSpin3" },
                    ProjectileProperty = "AttachToOwner",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                },
                {
                    WeaponNames = { "DarkSpearSpin", "DarkSpearSpin2", "DarkSpearSpin3" },
                    ProjectileProperty = "MultipleObstacleCollisions",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                },
                {
                    WeaponNames = { "DarkSpearSpin", "DarkSpearSpin2", "DarkSpearSpin3" },
                    ProjectileProperty = "CheckObstacleImpact",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                },
                {
                    WeaponNames = { "DarkSpearSpin", "DarkSpearSpin2", "DarkSpearSpin3" },
                    ProjectileProperty = "NumBounces",
                    ChangeValue = 99999,
                    ChangeType = "Absolute",
                },
                {
                    WeaponNames = { "DarkSpearSpin", "DarkSpearSpin2", "DarkSpearSpin3" },
                    ProjectileProperty = "DamageRadius",
                    ChangeValue = 0.50,
                    ChangeType = "Multiply",
                },
                {
                    WeaponNames = { "DarkSpearSpin", "DarkSpearSpin2", "DarkSpearSpin3" },
                    ProjectileProperty = "ProjectileDefenseRadius",
                    ChangeValue = 0.50,
                    ChangeType = "Multiply",
                },
                {
                    WeaponNames = { "DarkSpearSpin", "DarkSpearSpin2", "DarkSpearSpin3" },
                    ProjectileProperty = "AttachedAnim",
                    ChangeType = "Absolute",
                    ChangeValue = "GuanYuSpin",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkSpear", "DarkSpear3" },
                    ProjectileProperty = "AttachedAnim",
                    ChangeType = "Absolute",
                    ChangeValue = "GuanYuThrust",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = {"DarkSpear2" },
                    ProjectileProperty = "AttachedAnim",
                    ChangeType = "Absolute",
                    ChangeValue = "GuanYuThrust_Flip",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkSpearSpin" },
                    ProjectileProperty = "DamageLow",
                    ChangeValue = 20,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpearSpin" },
                    ProjectileProperty = "DamageHigh",
                    ChangeValue = 20,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkSpearSpin2" },
                    ProjectileProperty = "DamageLow",
                    ChangeValue = 30,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                    {
                    WeaponNames = { "DarkSpearSpin2" },
                    ProjectileProperty = "DamageHigh",
                    ChangeValue = 30,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkSpearSpin3" },
                    ProjectileProperty = "DamageLow",
                    ChangeValue = 50,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpearSpin3" },
                    ProjectileProperty = "DamageHigh",
                    ChangeValue = 50,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkSpearDash" },
                    ProjectileProperty = "DamageLow",
                    ChangeValue = 30,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpearDash" },
                    ProjectileProperty = "DamageHigh",
                    ChangeValue = 30,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },


                {
                    WeaponNames = { "DarkSpear", "DarkSpear2", "DarkSpear3" },
                    ProjectileProperty = "DamageLow",
                    ChangeValue = 40,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpear", "DarkSpear2", "DarkSpear3" },
                    ProjectileProperty = "DamageHigh",
                    ChangeValue = 40,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                -- Lunar Throw
                {
                    WeaponNames = { "DarkSpearThrow" },
                    ProjectileProperty = "DamageLow",
                    ChangeValue = 45,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpearThrow" },
                    ProjectileProperty = "DamageHigh",
                    ChangeValue = 45,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkSpearThrow" },
                    WeaponProperty = "ChargeTime",
                    ChangeValue = 1.8,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrow",
                    WeaponProperty = "ReloadTime",
                    ChangeValue = 0.6,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrow",
                    ProjectileProperty = "SpawnOnDeath",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    TraitName = "DZSpearWeaveTrait",
                    WeaponName = "DarkSpearThrow",
                    ProjectileProperty = "SpawnOnDeath",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    TraitName = "DZSpearTeleportTrait",
                    WeaponName = "DarkSpearThrow",
                    ProjectileProperty = "SpawnOnDeath",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponName = "DarkSpearThrow",
                    ProjectileProperty = "DamageRadius",
                    ChangeValue = 250,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponName = "DarkSpearThrow",
                    ProjectileProperty = "DamageRadiusScaleX",
                    ChangeValue = 1.1,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponName = "DarkSpearThrow",
                    ProjectileProperty = "DamageRadiusScaleY",
                    ChangeValue = 0.67,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponName = "DarkSpearThrow",
                    ProjectileProperty = "SpawnType",
                    ChangeValue = "PROJECTILE",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrow",
                    ProjectileProperty = "SpawnOnDetonate",
                    ChangeValue = "null",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrow",
                    ProjectileProperty = "SpawnCount",
                    ChangeValue = 0,
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrow",
                    ProjectileProperty = "MultiDetonate",
                    ChangeValue = true,
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrow",
                    ProjectileProperty = "Fuse",
                    ChangeValue = 0.08,
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrow",
                    ProjectileProperty = "ImmunityDuration",
                    ChangeValue = 0.5,
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrow",
                    ProjectileProperty = "UseVulnerability",
                    ChangeValue = true,
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpearThrow", "DarkSpearThrowReturn" },
                    ProjectileProperty = "Speed",
                    ChangeValue = 2500,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrow",
                    ProjectileProperty = "DetonateGraphic",
                    ChangeValue = "GuanYuFirecrackers",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrow",
                    ProjectileProperty = "DetonateSound",
                    ChangeValue = "null",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrow",
                    ProjectileProperty = "CheckUnitImpact",
                    ChangeValue = false,
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrow",
                    ProjectileProperty = "CheckObstacleImpact",
                    ChangeValue = true,
                    ExcludeLinked = true,
                },
                --- Graphical changes

                {
                    WeaponName = "DarkSpearThrowReturn",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrow",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSpearAlt03ThrowCharge",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrow",
                    WeaponProperty = "ChargeCancelGraphic",
                    ChangeValue = "DarkZagreusSpearAlt03ThrowFireReturnToIdle",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearThrow",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSpearAlt03ThrowFire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearDash",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSpearAlt03DashAttack_Charge",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkSpearDash",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSpearAlt03DashAttack",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpearSpin","DarkSpearSpin2","DarkSpearSpin3" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpearSpin","DarkSpearSpin2","DarkSpearSpin3" },
                    WeaponProperty = "ChargeCancelGraphic",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpearSpin","DarkSpearSpin2","DarkSpearSpin3" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkSpear" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSpearLunarThrust1_Start",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpear" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSpearLunarThrust1_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpear" },
                    WeaponProperty = "ChargeTime",
                    ChangeValue = 0.12,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkSpear2" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSpearLunarThrust2_Start",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpear2" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSpearLunarThrust2_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpear2" },
                    WeaponProperty = "ChargeTime",
                    ChangeValue = 0.33,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpear3" },
                    WeaponProperty = "ControlWindow",
                    ChangeValue = 0.43,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpear2" },
                    EffectName = "SpearLunarAerialSlow2",
                    EffectProperty = "Active",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkSpear3" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusSpearLunarThrust3_Start",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpear3" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusSpearLunarThrust3_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpear3" },
                    WeaponProperty = "ChargeTime",
                    ChangeValue = 0.52,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpear3" },
                    WeaponProperty = "ControlWindow",
                    ChangeValue = 0.62,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpear3" },
                    EffectName = "SpearLunarAerialSlow3",
                    EffectProperty = "Active",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkSpear2" },
                    ProjectileProperty = "DamageLow",
                    ChangeValue = 60,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpear2" },
                    ProjectileProperty = "DamageHigh",
                    ChangeValue = 60,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpear3" },
                    ProjectileProperty = "DamageLow",
                    ChangeValue = 100,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkSpear3" },
                    ProjectileProperty = "DamageHigh",
                    ChangeValue = 100,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
            },
        },
    }
)

ModUtil.Table.Merge(
    DarkZagreus.WeaponTraits, {
        "DZSpearTeleportTrait",
        "DZSpearWeaveTrait",
        "DZSpearSpinTravel"
    }
)