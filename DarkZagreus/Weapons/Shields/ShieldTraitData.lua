ModUtil.Table.Merge(
    TraitData, {
        -- DarkShield 2, Aspect of Chaos
        DZShieldRushBonusProjectileTrait =
        {
            InheritFrom = { "WeaponEnchantmentTrait" },
            RequiredWeapon = "DarkShield",
            PreEquipWeapons = { "DZShieldThrowProjectileBonusApplicator", "DarkChaosShieldThrow" },
            WeaponBinks =
            {
                "ZagreusShield01QuickAttack_Bink",
                "ZagreusShield01DashAttack_Bink",
                "ZagreusShield01Attack_Bink",
                "ZagreusShield01ThrowReceive_Bink",
                "ZagreusShield01Idle_Bink",
                "ZagreusShield01Run_Bink",
                "ZagreusShield01RunStop_Bink",
                "ZagreusShield01HeavyThrow_Bink",
                "ZagreusShieldHeavyThrowNoCatch_Bink",
            },
            WeaponDataOverride =
            {
                DarkShield =
                {
                    WeaponBinks =
                    {
                        "ZagreusShield01QuickAttack_Bink",
                        "ZagreusShield01DashAttack_Bink",
                        "ZagreusShield01Attack_Bink",
                        "ZagreusShield01ThrowReceive_Bink",
                        "ZagreusShield01Idle_Bink",
                        "ZagreusShield01Run_Bink",
                        "ZagreusShield01RunStop_Bink",
                        "ZagreusShield01HeavyThrow_Bink",
                        "ZagreusShieldHeavyThrowNoCatch_Bink",
                    },
                },
                DarkShieldRush = 
                {
                    AIData =
                    {
                        PreFireAnimation = "DarkZagreusShieldAlt01AttackCharge",
                        FireAnimation = "DarkZagreusShieldAlt01AttackFire",
                        PreFireCancelAnimation = "DarkZagreusShieldAlt01AttackChargeCancel",
                    }
                }
            },
            PropertyChanges =
            {
                {
                    WeaponName = "DarkChaosShieldThrow",
                    WeaponProperty = "NumProjectiles",
                    BaseValue = 1,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                    ExtractValue =
                    {
                        ExtractAs = "TooltipProjectiles",
                    },
                },
                {
                    WeaponNames = { "DarkShieldThrow" },
                    ProjectileName = "DarkShieldThrow",
                    ProjectileProperty = "Graphic",
                    ChangeValue = "ProjectileShieldAlt01",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkShieldThrowDash" },
                    ProjectileName = "ShieldThrowDash",
                    ProjectileProperty = "Graphic",
                    ChangeValue = "ProjectileShieldAlt01",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShield",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusShieldAlt01Punch",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldDash",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusShieldAlt01PunchFast",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldRush",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldRush",
                    WeaponProperty = "ChargeCancelGraphic",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldRush",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkShieldThrow", "ShieldThrowDash" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusShieldAlt01Throw",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldThrow",
                    ProjectileName = "DarkShieldThrow",
                    ProjectileProperty = "OnDeathFiredByAnimation",
                    ChangeValue = "DarkZagreusShieldAlt01Catch",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "ShieldThrowDash",
                    ProjectileName = "ShieldThrowDash",
                    ProjectileProperty = "OnDeathFiredByAnimation",
                    ChangeValue = "DarkZagreusShieldAlt01Catch",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
            }
        },
        -- DarkShield 3, Aspect of Zeus
        DZShieldTwoShieldTrait =
        {
            InheritFrom = { "WeaponEnchantmentTrait" },
            RequiredWeapon = "DarkShield",
            RarityLevels =
            {
                Common =
                {
                    MinMultiplier = 1.0,
                    MaxMultiplier = 1.0,
                },
                Rare =
                {
                    MinMultiplier = 1.75,
                    MaxMultiplier = 1.75,
                },
                Epic =
                {
                    MinMultiplier = 2.5,
                    MaxMultiplier = 2.5,
                },
                Heroic =
                {
                    MinMultiplier = 3.25,
                    MaxMultiplier = 3.25,
                },
                Legendary =
                {
                    MinMultiplier = 4.0,
                    MaxMultiplier = 4.0,
                },
            },
            WeaponDataOverride =
            {
                DarkShieldThrowDash =
                {
                    AIData =
                    {
                        FireDuration = 0.4,
                        IsZeusShieldThrow = true
                        -- while equiping zeus shield, players can throw it and hit it again to make it turn back
                    },

                    RecallOnFailToFire = "DarkShieldThrow",
                },
                DarkShieldThrow =
                {
                    RecallOnFailToFire = "DarkShieldThrow",
                    NotReadySound = "/SFX/Player Sounds/ZagreusShieldReturn",
                    
                    AIData =
                    {
                        FireDuration = 0.4,
                        IsZeusShieldThrow = true 
                        -- while equiping zeus shield, players can throw it and hit it again to make it turn back
                    },

                    Sounds =
                    {
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteRanged" },
                            { Name = "/SFX/Player Sounds/ZagreusBowFire" },
                            { Name = "/SFX/Player Sounds/ZagreusSpearThrow" },
                        },
                        ImpactSounds =
                        {
                            Invulnerable = "/SFX/SwordWallHitClank",
                            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
                            Bone = "/SFX/Player Sounds/ElectricZapSmall",
                            Brick = "/SFX/Player Sounds/ElectricZapSmall",
                            Stone = "/SFX/Player Sounds/ElectricZapSmall",
                            Organic = "/SFX/Player Sounds/ElectricZapSmall",
                            StoneObstacle = "/SFX/Player Sounds/ElectricZapSmall",
                            BrickObstacle = "/SFX/Player Sounds/ElectricZapSmall",
                            MetalObstacle = "/SFX/Player Sounds/ElectricZapSmall",
                            BushObstacle = "/SFX/Player Sounds/ElectricZapSmall",
                        },
                    },
                },
                DarkShield =
                {
                    WeaponBinks =
                    {
                        "ZagreusShield02QuickAttack_Bink",
                        "ZagreusShield02DashAttack_Bink",
                        "ZagreusShield02Attack_Bink",
                        "ZagreusShield02ThrowReceive_Bink",
                        "ZagreusShield02Idle_Bink",
                        "ZagreusShield02Run_Bink",
                        "ZagreusShield02RunStop_Bink",
                        "ZagreusShield02HeavyThrow_Bink",
                        "ZagreusShieldHeavyThrowNoCatch_Bink",
                    },
                },
                DarkShieldRush =
                {
                    AIData =
                    {
                        PreFireAnimation = "DarkZagreusShieldAlt02AttackCharge",
                        FireAnimation = "DarkZagreusShieldAlt02AttackFire",
                        PreFireCancelAnimation = "DarkZagreusShieldAlt02AttackChargeCancel",
                    },
                }
            },
            WeaponBinks =
            {
                "ZagreusShield02QuickAttack_Bink",
                "ZagreusShield02DashAttack_Bink",
                "ZagreusShield02Attack_Bink",
                "ZagreusShield02ThrowReceive_Bink",
                "ZagreusShield02Idle_Bink",
                "ZagreusShield02Run_Bink",
                "ZagreusShield02RunStop_Bink",
                "ZagreusShield02HeavyThrow_Bink",
                "ZagreusShieldHeavyThrowNoCatch_Bink",
            },
            PropertyChanges =
            {
                {
                    WeaponName = "DarkShieldThrow",
                    ProjectileName = "DarkShieldThrow",
                    ProjectileProperty = "Graphic",
                    ChangeValue = "ProjectileShieldMirage",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldThrow",
                    ProjectileName = "DarkShieldThrow",
                    ProjectileProperty = "GroupName",
                    ChangeValue = "Standing",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldThrow",
                    ProjectileName = "DarkShieldThrow",
                    ProjectileProperty = "DamageLow",
                    BaseValue = 0.5,
                    ChangeType = "Multiply",
                    ExtractValue =
                    {
                        ExtractAs = "TooltipDamage",
                        Format = "MultiplyByBase",
                        BaseType = "Projectile",
                        BaseName = "DarkShieldThrow",
                        BaseProperty = "DamageLow",
                    },
                },
                {
                    WeaponName = "DarkShieldThrow",
                    ProjectileName = "DarkShieldThrow",
                    ProjectileProperty = "DamageHigh",
                    DeriveValueFrom = "DamageLow",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldThrow",
                    ProjectileName = "DarkShieldThrow",
                    ProjectileProperty = "ClearWeaponBonusesOnHit",
                    ChangeValue = true,
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldThrow",
                    ProjectileName = "DarkShieldThrow",
                    ProjectileProperty = "MultipleUnitCollisions",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldThrow",
                    ProjectileName = "DarkShieldThrow",
                    ProjectileProperty = "IgnoreCoverageAngles",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldThrow",
                    ProjectileName = "DarkShieldThrow",
                    ProjectileProperty = "UseVulnerability",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldThrow",
                    ProjectileName = "DarkShieldThrow",
                    ProjectileProperty = "ReturnToOwnerAfterInactiveSeconds",
                    ChangeValue = 10,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldThrow",
                    WeaponProperty = "DisableOwnerForDuration",
                    ChangeValue = 0,
                    ChangeType = "Absolute",
                },
                {
                    WeaponName = "DarkShieldThrow",
                    ProjectileName = "DarkShieldThrow",
                    ProjectileProperty = "FinalJumpToOwner",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldThrow",
                    ProjectileProperty = "SelfImpactVelocityMultiplier",
                    ChangeValue = 0,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldThrow",
                    ProjectileName = "DarkShieldThrow",
                    ProjectileProperty = "Speed",
                    ChangeValue = 325,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldThrow",
                    ProjectileName = "DarkShieldThrow",
                    ProjectileProperty = "Acceleration",
                    ChangeValue = -75,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldThrow",
                    ProjectileName = "DarkShieldThrow",
                    ProjectileProperty = "ReturnToOwnerSpeed",
                    ChangeValue = 550,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldThrow",
                    ProjectileName = "DarkShieldThrow",
                    ProjectileProperty = "PenetrateJumpTargets",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldThrow",
                    ProjectileName = "DarkShieldThrow",
                    ProjectileProperty = "MultiDetonate",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldThrow",
                    ProjectileName = "DarkShieldThrow",
                    ProjectileProperty = "Fuse",
                    ChangeValue = 0.3,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldThrow",
                    ProjectileName = "DarkShieldThrow",
                    ProjectileProperty = "DetonateGraphic",
                    ChangeValue = "ShieldThrowTrailMirage",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldThrow",
                    ProjectileName = "DarkShieldThrow",
                    ProjectileProperty = "DamageRadius",
                    ChangeValue = 320,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldThrow",
                    ProjectileName = "DarkShieldThrow",
                    ProjectileProperty = "DamageRadiusScaleX",
                    ChangeValue = 0.9,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldThrow",
                    ProjectileName = "DarkShieldThrow",
                    ProjectileProperty = "DamageRadiusScaleY",
                    ChangeValue = 0.5,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldThrow",
                    ProjectileName = "DarkShieldThrow",
                    EffectName = "OnHitStun",
                    EffectProperty = "Duration",
                    ChangeValue = 0.5,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                -- Visual changes
                {
                    WeaponName = "DarkShield",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusShieldAlt02Punch",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldDash",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusShieldAlt02PunchFast",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldRush",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldRush",
                    WeaponProperty = "ChargeCancelGraphic",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldRush",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldThrow",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusShieldAlt02Throw",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldThrow",
                    ProjectileName = "DarkShieldThrow",
                    ProjectileProperty = "OnDeathFiredByAnimation",
                    ChangeValue = "DarkZagreusShieldAlt02Catch",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
            },
        },
        -- DarkShield 4, Aspect of Beowulf
        -- this weapon also changes the behavior of ranged weapon (red crystal)
        -- but I can't intergate ranged weapon with this mod, so I ignore all of the related actions
        DZShieldLoadAmmoTrait =
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
            AmmoDropData =
            {
                AmmoDropForceMin = 160,
                AmmoDropForceMax = 190,
                AmmoDropUpwardForceMin = 1000,
                AmmoDropUpwardForceMax = 1030,
            },
            RequiredWeapons = { "DarkShield" }, -- "RangedWeapon"
            -- PreEquipWeapons = { "SelfLoadAmmoApplicator" },
            -- AnimDefinitions =
            -- {
            --     Default =
            --     {
            --         Unloaded =
            --         {
            --             Graphic = "ShieldRush3DBeowulf",
            --             DissipateGraphic = "ShieldRush3DBeowulf-Out",
            --             StartFx = "null",
            --             StartFx2 = "null",
            --             AttachedAnim = "null",
            --         },
            --         Loaded =
            --         {
            --             Graphic = "ShieldRush3DBeowulf",
            --             DissipateGraphic = "ShieldRush3DBeowulf-Out",
            --             StartFx = "null",
            --             StartFx2 = "null",
            --             AttachedAnim = "ShieldRush3DBeowulfMax",
            --         },
            --     },

            --     ArtemisWeaponTrait =
            --     {
            --         Unloaded =
            --         {
            --             Graphic = "ShieldRush3DBeowulf-Artemis",
            --             DissipateGraphic = "ShieldRush3DBeowulf-Out-Artemis",
            --             StartFx = "null",
            --             StartFx2 = "null",
            --             AttachedAnim = "null",
            --         },
            --         Loaded =
            --         {
            --             Graphic = "ShieldRush3DBeowulf-Artemis",
            --             DissipateGraphic = "ShieldRush3DBeowulf-Out-Artemis",
            --             StartFx = "null",
            --             StartFx2 = "null",
            --             AttachedAnim = "ShieldRush3DBeowulfMax-Artemis",
            --         },
            --     },

            --     AphroditeWeaponTrait =
            --     {
            --         Unloaded =
            --         {
            --             Graphic = "ShieldRush3DBeowulf-Aphrodite",
            --             DissipateGraphic = "ShieldRush3DBeowulf-Out-Aphrodite",
            --             StartFx = "null",
            --             StartFx2 = "null",
            --             AttachedAnim = "null",
            --         },
            --         Loaded =
            --         {
            --             Graphic = "ShieldRush3DBeowulf-Aphrodite",
            --             DissipateGraphic = "ShieldRush3DBeowulf-Out-Aphrodite",
            --             StartFx = "null",
            --             StartFx2 = "null",
            --             AttachedAnim = "ShieldRush3DBeowulfMax-Aphrodite",
            --         },
            --     },

            --     AresWeaponTrait =
            --     {
            --         Unloaded =
            --         {
            --             Graphic = "ShieldRush3DBeowulf-Ares",
            --             DissipateGraphic = "ShieldRush3DBeowulf-Out-Ares",
            --             StartFx = "null",
            --             StartFx2 = "null",
            --             AttachedAnim = "null",
            --         },
            --         Loaded =
            --         {
            --             Graphic = "ShieldRush3DBeowulf-Ares",
            --             DissipateGraphic = "ShieldRush3DBeowulf-Out-Ares",
            --             StartFx = "null",
            --             StartFx2 = "null",
            --             AttachedAnim = "ShieldRush3DBeowulfMax-Ares",
            --         },
            --     },

            --     AthenaWeaponTrait =
            --     {
            --         Unloaded =
            --         {
            --             Graphic = "ShieldRush3DBeowulf-Athena",
            --             DissipateGraphic = "ShieldRush3DBeowulf-Out-Athena",
            --             StartFx = "null",
            --             StartFx2 = "null",
            --             AttachedAnim = "null",
            --         },
            --         Loaded =
            --         {
            --             Graphic = "ShieldRush3DBeowulf-Athena",
            --             DissipateGraphic = "ShieldRush3DBeowulf-Out-Athena",
            --             StartFx = "null",
            --             StartFx2 = "null",
            --             AttachedAnim = "ShieldRush3DBeowulfMax-Athena",
            --         },
            --     },


            --     DemeterWeaponTrait =
            --     {
            --         Unloaded =
            --         {
            --             Graphic = "ShieldRush3DBeowulf-Demeter",
            --             DissipateGraphic = "ShieldRush3DBeowulf-Out-Demeter",
            --             StartFx = "null",
            --             StartFx2 = "null",
            --             AttachedAnim = "null",
            --         },
            --         Loaded =
            --         {
            --             Graphic = "ShieldRush3DBeowulf-Demeter",
            --             DissipateGraphic = "ShieldRush3DBeowulf-Out-Demeter",
            --             StartFx = "null",
            --             StartFx2 = "null",
            --             AttachedAnim = "ShieldRush3DBeowulfMax-Demeter",
            --         },
            --     },

            --     DionysusWeaponTrait =
            --     {
            --         Unloaded =
            --         {
            --             Graphic = "ShieldRush3DBeowulf-Dionysus",
            --             DissipateGraphic = "ShieldRush3DBeowulf-Out-Dionysus",
            --             StartFx = "null",
            --             StartFx2 = "null",
            --             AttachedAnim = "null",
            --         },
            --         Loaded =
            --         {
            --             Graphic = "ShieldRush3DBeowulf-Dionysus",
            --             DissipateGraphic = "ShieldRush3DBeowulf-Out-Dionysus",
            --             StartFx = "null",
            --             StartFx2 = "null",
            --             AttachedAnim = "ShieldRush3DBeowulfMax-Dionysus",
            --         },
            --     },

            --     PoseidonWeaponTrait =
            --     {
            --         Unloaded =
            --         {
            --             Graphic = "ShieldRush3DBeowulf-Poseidon",
            --             DissipateGraphic = "ShieldRush3DBeowulf-Out-Poseidon",
            --             StartFx = "null",
            --             StartFx2 = "null",
            --             AttachedAnim = "null",
            --         },
            --         Loaded =
            --         {
            --             Graphic = "ShieldRush3DBeowulf-Poseidon",
            --             DissipateGraphic = "ShieldRush3DBeowulf-Out-Poseidon",
            --             StartFx = "null",
            --             StartFx2 = "null",
            --             AttachedAnim = "ShieldRush3DBeowulfMax-Poseidon",
            --         },
            --     },

            --     ZeusWeaponTrait =
            --     {
            --         Unloaded =
            --         {
            --             Graphic = "ShieldRush3DBeowulf-Zeus",
            --             DissipateGraphic = "ShieldRush3DBeowulf-Out-Zeus",
            --             StartFx = "null",
            --             StartFx2 = "null",
            --             AttachedAnim = "null",
            --         },
            --         Loaded =
            --         {
            --             Graphic = "ShieldRush3DBeowulf-Zeus",
            --             DissipateGraphic = "ShieldRush3DBeowulf-Out-Zeus",
            --             StartFx = "null",
            --             StartFx2 = "null",
            --             AttachedAnim = "ShieldRush3DBeowulfMax-Zeus",
            --         },
            --     },


            -- },
            -- OverrideWeaponFireNames =
            -- {
            --     RangedWeapon = "nil",
            --     SelfLoadAmmoApplicator = "RangedWeapon",
            -- },
            -- OnProjectileDeathFunction =
            -- {
            --     Name = "ShieldFireClear",
            --     Args = {
            --         Interval = 0.17,
            --     },
            -- },
            -- SetupFunction =
            -- {
            --     Name = "SetupSelfAmmoLoad",
            --     Args = { Duration = 3 },
            --     RunOnce = true,
            -- },
            AddIncomingDamageModifiers =
            {
                GlobalMultiplier = 1.10,
                ExtractValues =
                {
                    {
                        Key = "GlobalMultiplier",
                        ExtractAs = "TooltipDamageTaken",
                        Format = "PercentDelta",
                        SkipAutoExtract = true
                    },
                }
            },
            -- AddOutgoingDamageModifiers =
            -- {
            --     ValidWeapons = { "DarkShieldRush" },
            --     LoadedAmmoMultiplier = { BaseValue = 1.20, SourceIsMultiplier = true },
            --     ExcludeLinked = true,
            --     ExtractValues =
            --     {
            --         {
            --             Key = "LoadedAmmoMultiplier",
            --             ExtractAs = "TooltipDamageIncrease",
            --             Format = "PercentDelta",
            --         }
            --     },
            -- },
            WeaponBinks =
            {
                "ZagreusShieldBeowulfQuickAttack_Bink",
                "ZagreusShieldBeowulfDashAttack_Bink",
                "ZagreusShieldBeowulfAttack_Bink",
                "ZagreusShieldBeowulfHeavyBullRush_Bink",
                "ZagreusShieldBeowulfHeavyThrow_Bink",
                "ZagreusShieldBeowulfThrowReceive_Bink",
                "ZagreusShieldBeowulfIdle_Bink",
                "ZagreusShieldBeowulfRun_Bink",
                "ZagreusShieldBeowulfRunStop_Bink",
                "ZagreusShieldHeavyPound_Bink",
                "ZagreusShieldHeavyThrowNoCatch_Bink",
            },
            WeaponDataOverride =
            {
                DarkShield =
                {
                    AIData =
                    {
                        FireDuration = 0.55, -- 0.15 + 0.4
                    },

                    WeaponBinks =
                    {
                        "ZagreusShieldBeowulfQuickAttack_Bink",
                        "ZagreusShieldBeowulfDashAttack_Bink",
                        "ZagreusShieldBeowulfAttack_Bink",
                        "ZagreusShieldBeowulfHeavyBullRush_Bink",
                        "ZagreusShieldBeowulfHeavyThrow_Bink",
                        "ZagreusShieldBeowulfThrowReceive_Bink",
                        "ZagreusShieldBeowulfIdle_Bink",
                        "ZagreusShieldBeowulfRun_Bink",
                        "ZagreusShieldBeowulfRunStop_Bink",
                        "ZagreusShieldHeavyPound_Bink",
                        "ZagreusShieldHeavyThrowNoCatch_Bink",
                    },

                    HitSimSlowCooldown = 0.2,
                    HitSimSlowParameters =
                    {

                        { ScreenPreWait = 0.03, Fraction = 0.02, LerpTime = 0 },
                        { ScreenPreWait = 0.02, Fraction = 0.10, LerpTime = 0 },
                        { ScreenPreWait = 0.03, Fraction = 1.00, LerpTime = 0 },
                    },

                    Sounds =
                    {
                        ChargeSounds =
                        {
                            {
                                Name = "/VO/ZagreusEmotes/EmoteCharging_Bow",
                                StoppedBy = { "ChargeCancel", "Fired" }
                            }
                        },
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteHeavyShieldAttack" },
                            { Name = "/SFX/Player Sounds/ZagreusShieldSwipe" },
                            { Name = "" },

                        },
                        ImpactSounds =
                        {
                            Invulnerable = "/SFX/SwordWallHitClank",
                            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
                            Bone = "/SFX/MetalBoneSmashSHIELD",
                            Brick = "/SFX/MetalStoneClangSHIELD",
                            Stone = "/SFX/MetalStoneClangSHIELD",
                            Organic = "/SFX/MetalOrganicHitSHIELD",
                            StoneObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
                            BrickObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
                            MetalObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
                            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
                        },
                    },
                },
                DarkShieldThrow =
                {
                    Sounds =
                    {
                        ChargeSounds =
                        {
                            {
                                Name = "/Leftovers/SFX/AuraCharge",
                                Key = "ShieldThrowElectiveCharge",
                                StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
                                SetPitchToPropertyValue = "ChargeTime",
                            },
                            {
                                Name = "/VO/ZagreusEmotes/EmoteHeavyShieldCharge",
                                StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
                            }
                        },
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteHeavyShieldThrow" },
                            { Name = "/SFX/Player Sounds/ZagreusBowFire" },
                            { Name = "/SFX/Enemy Sounds/Minotaur/HugeAxeSwing" },
                        },
                        ImpactSounds =
                        {
                            Invulnerable = "/SFX/SwordWallHitClank",
                            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
                            Bone = "/SFX/Player Sounds/ZagreusShieldRicochet",
                            Brick = "/SFX/Player Sounds/ZagreusShieldRicochet",
                            Stone = "/SFX/Player Sounds/ZagreusShieldRicochet",
                            Organic = "/SFX/Player Sounds/ZagreusShieldRicochet",
                            StoneObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
                            BrickObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
                            MetalObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
                            BushObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
                        },
                    },
                },
                DarkShieldDash =
                {
                    AIData = 
                    {
                        FireDuration = 0.32, -- 0.12 + 0.2
                    },

                    Sounds =
                    {
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteAttacking_ShieldThrow" },
                            { Name = "/SFX/Player Sounds/ZagreusShieldSwipe" },
                        },
                        ImpactSounds =
                        {
                            Invulnerable = "/SFX/SwordWallHitClank",
                            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
                            Bone = "/SFX/MetalBoneSmashSHIELD",
                            Brick = "/SFX/MetalStoneClangSHIELD",
                            Stone = "/SFX/MetalStoneClangSHIELD",
                            Organic = "/SFX/MetalOrganicHitSHIELD",
                            StoneObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
                            BrickObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
                            MetalObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
                            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
                        },
                    },
                },
                DarkShieldRush =
                {
                    AIData =
                    {
                        PreFireAnimation = "DarkZagreusShieldBeowulfHeavyBullRush_Charge",
                        FireAnimation = "DarkZagreusShieldBeowulfHeavyBullRush_Fire",
                        PreFireCancelAnimation = "DarkZagreusShieldBeowulfAttackChargeCancel",
                        MinChargeTime = 0.12, -- 0.2 * 0.6
                        MaxChargeTime = 1.2, -- 0.8 * 1.5
                        Velocity = 600,
                        ChargeVelocityMultiplier = 4,
                        FireDuration = 0.3,
                    },

                    Sounds =
                    {
                        FireSounds =
                        {
                            PerfectChargeSounds =
                            {
                                { Name = "/SFX/Player Sounds/ZagreusCriticalFire" },
                                { Name = "/SFX/Player Sounds/ZagreusBowFire" },
                            },
                            { Name = "/VO/ZagreusEmotes/EmoteHeavyShieldRush" },
                            { Name = "/SFX/Player Sounds/ZagreusShieldRush" },
                        },
                        ChargeSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteHeavyShieldBlock" },
                            { Name = "/SFX/Player Sounds/ZagreusHeavyShieldStomp" },
                            {
                                Name = "/SFX/Player Sounds/ZagreusWeaponChargeup",
                                Key = "DarkShieldRush",
                                StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
                            },
                        },
                        ImpactSounds =
                        {
                            Invulnerable = "/SFX/SwordWallHitClank",
                            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
                            Bone = "/SFX/MetalBoneSmashSHIELD",
                            Brick = "/SFX/MetalStoneClangSHIELD",
                            Stone = "/SFX/MetalStoneClangSHIELD",
                            Organic = "/SFX/MetalOrganicHitSHIELD",
                            StoneObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
                            BrickObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
                            MetalObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
                            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
                        },
                    },
                }
            },
            -- BaseLoadedRushScale = 1.20,
            -- LoadedRushRarityMultiplier = 1,
            PropertyChanges =
            {
                -- Slow heavy shield Rush

                {
                    WeaponNames = { "DarkShieldRush" },
                    ProjectileProperty = "DamageLow",
                    ChangeValue = 50,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                    DeriveSource = "DarkShieldRushDamage",
                },
                {
                    WeaponNames = { "DarkShieldRush" },
                    ProjectileProperty = "DamageHigh",
                    DeriveValueFrom = "DarkShieldRushDamage"
                },

                {
                    WeaponName = "DarkShieldRush",
                    WeaponProperty = "ChargeDamageMultiplier",
                    ChangeValue = 1.0,
                    ChangeType = "Absolute",
                },
                {
                    WeaponName = "DarkShieldRush",
                    WeaponProperty = "ChargeVelocityMultiplier",
                    ChangeValue = 4.0,
                    ChangeType = "Absolute",
                },
                {
                    WeaponNames = { "DarkShieldRush" },
                    ProjectileProperty = "ImpactVelocity",
                    ChangeValue = 0.65,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkShieldRush" },
                    ProjectileProperty = "ImpactVelocityCap",
                    ChangeValue = 0.65,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldRush",
                    WeaponProperty = "MinChargeToFire",
                    ChangeValue = 0.6,
                    ChangeType = "Multiply",
                },
                {
                    WeaponName = "DarkShieldRush",
                    WeaponProperty = "ChargeTime",
                    ChangeValue = 0.0, -- 1.5
                    ChangeType = "Multiply",
                },
                {
                    WeaponName = "DarkShieldRush",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                },
                {
                    WeaponName = "DarkShieldRush",
                    WeaponProperty = "ChargeCancelGraphic",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                },
                {
                    WeaponName = "DarkShieldRush",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                },
                {
                    WeaponName = "DarkShieldRush",
                    EffectName = "ShieldSelfInvulnerableRush",
                    EffectProperty = "AngleCoverage",
                    ChangeValue = math.rad(225),
                    ChangeType = "Absolute",
                },
                {
                    WeaponName = "DarkShieldRush",
                    EffectName = "ShieldSelfReflectRush",
                    EffectProperty = "AngleCoverage",
                    ChangeValue = math.rad(225),
                    ChangeType = "Absolute",
                },
                {
                    WeaponName = "DarkShieldRush",
                    EffectName = "ShieldSelfInvulnerableRush",
                    EffectProperty = "AngleCoverageOffset",
                    ChangeValue = -math.rad(45),
                    ChangeType = "Absolute",
                },
                {
                    WeaponName = "DarkShieldRush",
                    EffectName = "ShieldSelfReflectRush",
                    EffectProperty = "AngleCoverageOffset",
                    ChangeValue = -math.rad(45),
                    ChangeType = "Absolute",
                },

                -- Main attack

                {
                    WeaponName = "DarkShield",
                    WeaponProperty = "ChargeTime",
                    ChangeValue = 0.16,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShield",
                    WeaponProperty = "MinChargeToFire",
                    ChangeValue = 0.0, -- 1.0
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShield",
                    WeaponProperty = "BlockMoveInput",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShield",
                    EffectName = "ShieldDisableAttack",
                    EffectProperty = "DisableMove",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkShield", "DarkShieldDash" },
                    ProjectileProperty = "DamageLow",
                    ChangeValue = 40,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkShield", "DarkShieldDash" },
                    ProjectileProperty = "DamageHigh",
                    ChangeValue = 40,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkShield", "DarkShieldDash" },
                    ProjectileProperty = "ImpactVelocity",
                    ChangeValue = 1800,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkShield", "DarkShieldDash" },
                    ProjectileProperty = "ImpactVelocityCap",
                    ChangeValue = 1800,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShield",
                    EffectName = "ShieldSelfSlowFire",
                    EffectProperty = "Duration",
                    ChangeValue = 0.5,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShield",
                    EffectName = "ShieldDisableAttack",
                    EffectProperty = "Duration",
                    ChangeValue = 1.45,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldRush",
                    WeaponProperty = "ControlWindow",
                    ChangeValue = 1.45,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShield",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusShieldHeavyPound_Charge",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShield",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusShieldHeavyPound_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShield",
                    ProjectileProperty = "DetonateGraphic",
                    ChangeValue = "BeowulfShieldSlam",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShield",
                    ProjectileProperty = "DamageRadius",
                    ChangeValue = 220,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShield",
                    ProjectileProperty = "Fuse",
                    ChangeValue = 0.11,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },


                -- Dash attack

                {
                    WeaponName = "DarkShieldDash",
                    WeaponProperty = "ChargeTime",
                    ChangeValue = 0.12,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldDash",
                    WeaponProperty = "MinChargeToFire",
                    ChangeValue = 0.0, -- 1.0
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldDash",
                    EffectName = "ShieldSelfSlowFireBeowulf",
                    EffectProperty = "Active",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponName = "DarkShieldDash",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusShieldBeowulfPunchFast_Charge",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponName = "DarkShieldDash",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusShieldBeowulfPunchFast",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                -- One target slower shield Throw

                {
                    WeaponNames = { "DarkShieldThrow", "ShieldThrowDash" },
                    ProjectileProperty = "ImpactVelocity",
                    ChangeValue = 900,
                    ChangeType = "Add",
                },
                {
                    WeaponNames = { "DarkShieldThrow", "ShieldThrowDash" },
                    ProjectileProperty = "ImpactVelocityCap",
                    ChangeValue = 900,
                    ChangeType = "Add",
                },
                {
                    WeaponNames = { "DarkShieldThrow", "ShieldThrowDash" },
                    WeaponProperty= "ChargeTime",
                    ChangeValue = 0.3,
                    ChangeType = "Absolute",
                },
                {
                    WeaponNames = { "DarkShieldThrow", "ShieldThrowDash" },
                    WeaponProperty= "ShowFreeAimLine",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                },
                {
                    WeaponNames = { "DarkShieldThrow", "ShieldThrowDash" },
                    WeaponProperty= "MinChargeToFire",
                    ChangeValue = 0.0, -- 1.0
                    ChangeType = "Absolute",
                },
                {
                    WeaponNames = { "DarkShieldThrow", "ShieldThrowDash" },
                    ProjectileProperty= "StartDelay",
                    ChangeValue = 0.12,
                    ChangeType = "Absolute",
                },
                {
                    WeaponNames = { "DarkShieldThrow", "ShieldThrowDash" },
                    EffectName = "OnHitStun",
                    EffectProperty = "Duration",
                    ChangeValue = 0.7,
                    ChangeType = "Absolute",
                },
                {
                    WeaponNames = { "DarkShieldThrow" },
                    WeaponProperty = "MinChargeStartFx",
                    ChangeValue = "ShieldChargeThrowTrait",
                    ChangeType = "Absolute",
                },
                {
                    WeaponName = "DarkShieldThrow",
                    WeaponProperty = "LockTriggerForCharge",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                },
                {
                    WeaponNames = { "DarkShieldThrow", "ShieldThrowDash" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusShieldBeowulfHeavyThrow_Charge",
                    ChangeType = "Absolute"
                },
                {
                    WeaponNames = { "DarkShieldThrow", "ShieldThrowDash" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusShieldBeowulfHeavyThrow_Fire",
                    ChangeType = "Absolute"
                },
                {
                    WeaponNames = { "DarkShieldThrow", "ShieldThrowDash" },
                    ProjectileProperty = "OnDeathFiredByAnimation",
                    ChangeValue = "DarkZagreusShieldBeowulfHeavyThrow_ReturnToIdle",
                    ChangeType = "Absolute"
                },
                {
                    WeaponNames = { "DarkShieldThrow", "ShieldThrowDash" },
                    EffectName = "ShieldThrowDisable",
                    EffectProperty = "Active",
                    ChangeValue = true,
                    ChangeType = "Absolute"
                },
                {
                    WeaponNames = { "DarkShieldThrow", "ShieldThrowDash" },
                    ProjectileProperty = "Speed",
                    ChangeValue = 2900,
                    ChangeType = "Absolute",
                },
                {
                    WeaponNames = { "DarkShieldThrow", "ShieldThrowDash" },
                    ProjectileProperty = "ReturnToOwnerAfterInactiveSeconds",
                    ChangeValue = 0.4,
                    ChangeType = "Absolute",
                },
                {
                    WeaponNames = { "DarkShieldThrow", "ShieldThrowDash" },
                    ProjectileProperty = "ReturnToOwnerSpeed",
                    ChangeValue = 2500,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkShieldThrow", "DarkShieldThrowDash" },
                    ProjectileProperty = "DamageLow",
                    ChangeValue = 45,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                    DeriveSource = "DarkShieldThrowDamage",
                },
                {
                    WeaponNames = { "DarkShieldThrow", "DarkShieldThrowDash" },
                    ProjectileProperty = "DamageHigh",
                    DeriveValueFrom = "DarkShieldThrowDamage"
                },
                -- Changes to make ranged weapon instant fire
                -- {
                --     WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                --     WeaponProperty = "FullyAutomatic",
                --     ChangeValue = true,
                --     ChangeType = "Absolute",
                -- },
                -- {
                --     WeaponName = "RangedWeapon",
                --     WeaponProperty = "ShowFreeAimLine",
                --     ChangeValue = false,
                --     ChangeType = "Absolute",
                -- },
                -- {
                --     WeaponName = "RangedWeapon",
                --     WeaponProperty = "IgnoreOwnerAttackDisabled",
                --     ChangeValue = true,
                --     ChangeType = "Absolute",
                -- },
                -- {
                --     WeaponName = "RangedWeapon",
                --     WeaponProperty = "ClearFireRequestOnChargeCancel",
                --     ChangeValue = false,
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
                --     WeaponProperty = "AllowExternalForceRelease",
                --     ChangeValue = false,
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
                --     WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                --     WeaponProperty = "FireOnRelease",
                --     ChangeValue = false,
                --     ChangeType = "Absolute",
                -- },
                -- {
                --     WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                --     ProjectileProperty = "Type",
                --     ChangeValue = "INSTANT",
                -- },
                -- {
                --     WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                --     ProjectileProperty = "DamageRadius",
                --     ChangeValue = 300
                -- },
                -- {
                --     WeaponNames = WeaponSets.HeroNonPhysicalWeapons,
                --     ProjectileName = "RangedWeapon",
                --     ProjectileProperty = "DetonateGraphic",
                --     ChangeValue = "RadialNovaSwordParry"
                -- },

                -- Animations
                {
                    WeaponName = "DarkShieldThrow",
                    ProjectileName = "DarkShieldThrow",
                    ProjectileProperty = "OnDeathFiredByAnimation",
                    ChangeValue = "DarkZagreusShieldBeowulfCatch",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkShieldThrow" },
                    ProjectileName = "DarkShieldThrow",
                    ProjectileProperty = "Graphic",
                    ChangeValue = "ProjectileShieldAlt03",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkShieldThrowDash" },
                    ProjectileName = "DarkShieldThrowDash",
                    ProjectileProperty = "Graphic",
                    ChangeValue = "ProjectileShieldAlt03",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponName = "DarkShieldThrowDash",
                    ProjectileName = "DarkShieldThrowDash",
                    ProjectileProperty = "OnDeathFiredByAnimation",
                    ChangeValue = "DarkZagreusShieldBeowulfCatch",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                -- vfx

                {
                    WeaponName = "DarkShieldRush",
                    ProjectileProperty = "Graphic",
                    ChangeValue = "ShieldRush3DBeowulf",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponName = "DarkShieldRush",
                    ProjectileProperty = "DissipateGraphic",
                    ChangeValue = "ShieldRush3DBeowulf-Out",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

            }
        },
    }
)

ModUtil.Table.Merge(
    DarkZagreus.WeaponTraits, {
        "DZShieldRushBonusProjectileTrait",
        "DZShieldTwoShieldTrait",
        "DZShieldLoadAmmoTrait"
    }
)