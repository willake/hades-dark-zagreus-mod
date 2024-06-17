ModUtil.Table.Merge(
    TraitData, {
        -- DarkFist 2, Aspect of Talos 
        DZFistVacuumTrait =
        {
            InheritFrom = { "WeaponEnchantmentTrait" },
            PreEquipWeapons = { "DarkFistSpecialVacuum" },
            RequiredWeapon = "DarkFist",
            RequiredFalseTraits = { "DZFistVacuumTrait", "DZFistTeleportSpecialTrait" },
            RequiredWeapons = { "DarkFist", "DarkFistSpecial" },
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
            WeaponBinks =
            {
                "ZagreusFistAlt02Idle_Bink",
                "ZagreusFistAlt02Run_Bink",
                "ZagreusFistAlt02RunStop_Bink",
                "ZagreusFistAlt02FlurryPunch_Bink",
                "ZagreusFistAlt02FlashKick_Bink",
                "ZagreusFistAlt02Grab_Bink",
                "ZagreusFistAlt02AerialUpperCut_Bink",
                "ZagreusFistAlt02DashUpperCut_Bink",
                "ZagreusFistAlt02DashHayMaker_Bink",
            },
            WeaponDataOverride =
            {
                DarkFist =
                {
                    WeaponBinks =
                    {
                        "ZagreusFistAlt02Idle_Bink",
                        "ZagreusFistAlt02Run_Bink",
                        "ZagreusFistAlt02RunStop_Bink",
                        "ZagreusFistAlt02FlurryPunch_Bink",
                        "ZagreusFistAlt02FlashKick_Bink",
                        "ZagreusFistAlt02Grab_Bink",
                        "ZagreusFistAlt02AerialUpperCut_Bink",
                        "ZagreusFistAlt02DashUpperCut_Bink",
                        "ZagreusFistAlt02DashHayMaker_Bink",
                    }
                },
            },
            AddRush =
            {
                FunctionName = "DZAIFistVacuumRush",
                FunctionArgs =
                {
                    Duration = 0.2,
                },
                RunOnce = true,
            },
            OnWeaponChargeFunctions =
            {
                ValidWeapons = { "DarkFistSpecial", "DarkFistSpecialDash" },
                FunctionName = "DZAICheckVacuumPlayer",
                FunctionArgs =
                {
                    Range = 800,				-- Vacuum distance
                    DistanceBuffer = 130,		-- Space to leave between player and enemy
                    RushDistanceBuffer = 300,
                    AutoLockArc = 60,
                },
            },
            PropertyChanges =
            {
                {
                    WeaponNames = { "DarkFistVacuum" },
                    EffectName = "DZMarkTargetFist",
                    EffectProperty = "Active",
                    ChangeValue = true,
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistSpecialVacuum" },
                    EffectName = "DZMarkTargetFist",
                    EffectProperty = "Modifier",
                    BaseValue = 0.10,
                    ChangeType = "Add",
                    ExtractValue =
                    {
                        ExtractAs = "TooltipDamage",
                        Format = "Percent"
                    },
                    DeriveSource = "DeriveSource"
                },
                {
                    WeaponNames = { "DarkFistSpecialVacuum" },
                    EffectName = "DZMarkTargetFist",
                    EffectProperty = "Duration",
                    ChangeValue = 6,
                    ChangeType = "Absolute",
                    ExtractValue =
                    {
                        ExtractAs = "TooltipDuration",
                        SkipAutoExtract = true,
                    },
                    DeriveSource = "DeriveSource"
                },
                {
                    WeaponNames = { "DarkFistSpecialVacuum" },
                    ProjectileProperty = "DamageLow",
                    ChangeValue = 20,
                    ExtractValue =
                    {
                        ExtractAs = "TooltipPullDamage",
                        SkipAutoExtract = true,
                    },
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistSpecialVacuum" },
                    ProjectileProperty = "DamageHigh",
                    DeriveValueFrom = "DamageLow",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkFistSpecial", "DarkFistSpecialDash" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt02Grab_Start",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistSpecial", "DarkFistSpecialDash" },
                    WeaponProperty = "ChargeTime",
                    ChangeValue = 0.24,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt02FlurryPunch_Start",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt02FlurryPunch_Fire1",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist2" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt02FlurryPunch_Charge2",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist2" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt02FlurryPunch_Fire2",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist3" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt02FlurryPunch_Charge3",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist3" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt02FlurryPunch_Fire3",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist4" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt02FlurryPunch_Charge4",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist4" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt02FlurryPunch_Fire4",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist5" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt02FlurryPunch_Charge5",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist5" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt02FlurryPunch_Fire5",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistDash" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt02DashHayMaker_Charge",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistDash" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt02DashHayMaker_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistSpecial" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt02DashHayMaker_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistSpecial" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt02AerialUpperCut_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistSpecialDash" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt02DashUpperCut_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    TraitName = "DZFistTeleportSpecialTrait",
                    WeaponNames = { "DarkFistSpecial", "DarkFistSpecialDash" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt02FlashKick_Start",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    TraitName = "DZFistTeleportSpecialTrait",
                    WeaponNames = { "DarkFistSpecial", "DarkFistSpecialDash" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt02FlashKick_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    TraitName = "DZFistSpecialFireballTrait",
                    WeaponNames = { "DarkFistSpecial" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt02Grab_Start",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    TraitName = "DZFistSpecialFireballTrait",
                    WeaponNames = { "DarkFistSpecial" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt02Grab_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    TraitName = "DZFistHeavyAttackTrait",
                    WeaponName = "DarkFist2",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt02DashHayMaker_Fire",
                    ChangeType = "Absolute",
                },
                {
                    TraitName = "DZFistHeavyAttackTrait",
                    WeaponName = "DarkFist3",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt02Grab_Start",
                    ChangeType = "Absolute",
                },
                {
                    TraitName = "DZFistHeavyAttackTrait",
                    WeaponName = "DarkFist3",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt02Grab_Fire",
                    ChangeType = "Absolute",
                },
            },
        },
        -- DarkFist 3, Aspect of Demeter
        DZFistWeaveTrait =
        {
            InheritFrom = { "WeaponEnchantmentTrait" },
            RequiredWeapons = { "DarkFist", "DarkFistSpecial" },
            RequiredFalseTrait = "DZFistWeaveTrait",
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
            BonusSpecialHits = {
                BaseValue = 1,
            },
            ExtractValues =
            {
                {
                    Key = "BonusSpecialHits",
                    ExtractAs = "TooltipHits",
                },
            },
            WeaponBinks =
            {
                "ZagreusFistAlt01Idle_Bink",
                "ZagreusFistAlt01Run_Bink",
                "ZagreusFistAlt01RunStop_Bink",
                "ZagreusFistAlt01FlurryPunch_Bink",
                "ZagreusFistAlt01FlashKick_Bink",
                "ZagreusFistAlt01Grab_Bink",
                "ZagreusFistAlt01AerialUpperCut_Bink",
                "ZagreusFistAlt01DashUpperCut_Bink",
                "ZagreusFistAlt01DashHayMaker_Bink",
            },
            WeaponDataOverride =
            {
                DarkFist =
                {
                    WeaponBinks =
                    {
                        "ZagreusFistAlt01Idle_Bink",
                        "ZagreusFistAlt01Run_Bink",
                        "ZagreusFistAlt01RunStop_Bink",
                        "ZagreusFistAlt01FlurryPunch_Bink",
                        "ZagreusFistAlt01FlashKick_Bink",
                        "ZagreusFistAlt01Grab_Bink",
                        "ZagreusFistAlt01AerialUpperCut_Bink",
                        "ZagreusFistAlt01DashUpperCut_Bink",
                        "ZagreusFistAlt01DashHayMaker_Bink",
                    }
                },

                DarkFistSpecial =
                {
                    HitSimSlowCooldown = 0.02,
                    HitSimSlowParameters =
                    {

                        { ScreenPreWait = 0.02, Fraction = 0.02, LerpTime = 0.0 },
                        --{ ScreenPreWait = 0.02, Fraction = 0.10, LerpTime = 0.03 },
                        { ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0 },
                    },

                },

                DarkFistSpecialDash =
                {
                    HitSimSlowCooldown = 0.02,
                    HitSimSlowParameters =
                    {

                        { ScreenPreWait = 0.02, Fraction = 0.02, LerpTime = 0.0 },
                        --{ ScreenPreWait = 0.02, Fraction = 0.10, LerpTime = 0.03 },
                        { ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0 },
                    },
                },
            },
            PropertyChanges =
            {
                {
                    WeaponNames = { "DarkFist" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt01FlurryPunch_Start",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt01FlurryPunch_Fire1",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist2" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt01FlurryPunch_Charge2",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist2" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt01FlurryPunch_Fire2",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist3" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt01FlurryPunch_Charge3",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist3" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt01FlurryPunch_Fire3",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist4" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt01FlurryPunch_Charge4",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist4" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt01FlurryPunch_Fire4",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist5" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt01FlurryPunch_Charge5",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist5" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt01FlurryPunch_Fire5",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistDash" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt01DashHayMaker_Charge",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistDash" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt01DashHayMaker_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistSpecial" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt01AerialUpperCut_Start",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistSpecial" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt01AerialUpperCut_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistSpecialDash" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt01DashUpperCut_Start",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistSpecialDash" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt01DashUpperCut_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    TraitName = "DZFistTeleportSpecialTrait",
                    WeaponNames = { "DarkFistSpecial", "DarkFistSpecialDash" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt01FlashKick_Start",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    TraitName = "DZFistTeleportSpecialTrait",
                    WeaponNames = { "DarkFistSpecial", "DarkFistSpecialDash" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt01FlashKick_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    TraitName = "DZFistSpecialFireballTrait",
                    WeaponNames = { "DarkFistSpecial" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt01Grab_Start",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    TraitName = "DZFistSpecialFireballTrait",
                    WeaponNames = { "DarkFistSpecial" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt01Grab_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    TraitName = "DZFistHeavyAttackTrait",
                    WeaponName = "DarkFist2",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt01DashHayMaker_Fire",
                    ChangeType = "Absolute",
                },
                {
                    TraitName = "DZFistHeavyAttackTrait",
                    WeaponName = "DarkFist3",
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt01Grab_Start",
                    ChangeType = "Absolute",
                },
                {
                    TraitName = "DZFistHeavyAttackTrait",
                    WeaponName = "DarkFist3",
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt01Grab_Fire",
                    ChangeType = "Absolute",
                },
            },
        },
        -- DarkFist 4, Aspect of Gilgamesh
        DZFistDetonateTrait = 
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
            RequiredWeapons = { "DarkFist", "DarkFistSpecial" },
            RequiredFalseTrait = "DZFistWeaveTrait",
            PreEquipWeapons = {"RushRuptureWeapon", "FistDetonationWeapon", "MarkRuptureApplicator"},
            WeaponBinks =
            {
                "ZagreusFistAlt03Idle_Bink",
                "ZagreusFistAlt03ClawL_Bink",
                "ZagreusFistAlt03ClawR_Bink",
                "ZagreusFistAlt03AerialUpperCut_Bink",
                "ZagreusFistAlt03DashAttack_Bink",
                "ZagreusFistAlt03Dash_Bink",
                "ZagreusFistAlt03Run_Bink",
                "ZagreusFistAlt03RunStop_Bink",
                "ZagreusFistAlt03FlashKick_Bink",
                "ZagreusFistAlt03Grab_Bink",
                "ZagreusFistAlt03DashUpperCut_Bink",
                "ZagreusFistAlt03DashUpperClaw_Bink",
            },
            WeaponDataOverride =
            {
                DarkFist =
                {
                    WeaponBinks =
                    {
                        "ZagreusFistAlt03Idle_Bink",
                        "ZagreusFistAlt03ClawL_Bink",
                        "ZagreusFistAlt03ClawR_Bink",
                        "ZagreusFistAlt03AerialUpperCut_Bink",
                        "ZagreusFistAlt03DashAttack_Bink",
                        "ZagreusFistAlt03Dash_Bink",
                        "ZagreusFistAlt03Run_Bink",
                        "ZagreusFistAlt03RunStop_Bink",
                        "ZagreusFistAlt03FlashKick_Bink",
                        "ZagreusFistAlt03Grab_Bink",
                        "ZagreusFistAlt03DashUpperCut_Bink",
                        "ZagreusFistAlt03DashUpperClaw_Bink",
                    },

                    HitSimSlowCooldown = 0.2,
                    HitSimSlowParameters =
                    {
                        { ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
                        { ScreenPreWait = 0.02, Fraction = 0.7, LerpTime = 0.0 },
                        { ScreenPreWait = 0.06, Fraction = 1.0, LerpTime = 0.0 },
                    },

                    Sounds =
                    {
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteHeavyFistDashAttack" },
                            { Name = "/SFX/Player Sounds/ZagreusClawSwipe" },
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

                DarkFist2 =
                {	
                    HitSimSlowCooldown = 0.2,
                    HitSimSlowParameters =
                    {
                        { ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
                        { ScreenPreWait = 0.02, Fraction = 0.7, LerpTime = 0.0 },
                        { ScreenPreWait = 0.06, Fraction = 1.0, LerpTime = 0.0 },
                    },
                    Sounds =
                    {
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteHeavyFistDashAttack" },
                            { Name = "/SFX/Player Sounds/ZagreusClawSwipe" },
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

                DarkFist3 =
                {
                    HitSimSlowCooldown = 0.2,
                    HitSimSlowParameters =
                    {
                        { ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
                        { ScreenPreWait = 0.02, Fraction = 0.70, LerpTime = 0.0 },
                        { ScreenPreWait = 0.06, Fraction = 1.0, LerpTime = 0.0 },
                    },

                    Sounds =
                    {
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteHeavyFistDashAttack" },
                            { Name = "/SFX/Player Sounds/ZagreusClawSwipe" },
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

                DarkFist4 =
                {
                    HitSimSlowCooldown = 0.2,
                    HitSimSlowParameters =
                    {
                        { ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
                        { ScreenPreWait = 0.02, Fraction = 0.7, LerpTime = 0.0 },
                        { ScreenPreWait = 0.06, Fraction = 1.0, LerpTime = 0.0 },
                    },

                    Sounds =
                    {
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteHeavyFistDashAttack" },
                            { Name = "/SFX/Player Sounds/ZagreusClawSwipe" },
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

                DarkFist5 =
                {
                    HitSimSlowCooldown = 0.2,
                    HitSimSlowParameters =
                    {
                        { ScreenPreWait = 0.02, Fraction = 0.01, LerpTime = 0 },
                        { ScreenPreWait = 0.02, Fraction = 0.7, LerpTime = 0.0 },
                        { ScreenPreWait = 0.06, Fraction = 1.0, LerpTime = 0.0 },
                    },

                    Sounds =
                    {
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmotePowerAttacking_Fist5" },
                            { Name = "/SFX/Player Sounds/ZagreusClawSwipe" },
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

                DarkFistSpecial =
                {
                    Sounds =
                    {
                        ChargeSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteCharging_Bow" },
                        },
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteHeavyFistSpecial" },
                            { Name = "/SFX/Player Sounds/ZagreusFistBigWhoosh" },
                        },
                        ImpactSounds =
                        {
                            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
                            Bone = "/SFX/FistImpactBig",
                            Brick = "/SFX/FistImpactBig",
                            Stone = "/SFX/FistImpactBig",
                            Organic = "/SFX/FistImpactBig",
                            StoneObstacle = "/SFX/FistImpactSmall",
                            BrickObstacle = "/SFX/FistImpactSmall",
                            MetalObstacle = "/SFX/FistImpactSmall",
                            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
                        },
                    },
                },

                DarkFistDash =
                {
                    Sounds =
                    {
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteAttacking_Fist2" },
                            { Name = "/SFX/Player Sounds/ZagreusShieldThrow" },
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

                DarkFistSpecialDash =
                {
                    HitSimSlowCooldown = 0.2,
                    HitSimSlowParameters =
                    {
                        { ScreenPreWait = 0.04, Fraction = 0.02, LerpTime = 0.0 },
                        { ScreenPreWait = 0.06, Fraction = 0.10, LerpTime = 0.03 },
                        { ScreenPreWait = 0.02, Fraction = 1.0, LerpTime = 0.1 },
                    },

                    Sounds =
                    {
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteHeavyFistDashUpper" },
                            { Name = "/SFX/Player Sounds/ZagreusFistBigWhoosh" },
                            { Name = "/SFX/Player Sounds/ZagreusShieldThrow" },
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

                DarkRush =
                {
                    Sounds =
                    {
                        FireSounds =
                        {
                            { Name = "/VO/ZagreusEmotes/EmoteAttacking_Fist1" },
                            { Name = "/SFX/Enemy Sounds/Exalted/ExaltedDash" },
                        },
                    },
                },

            },
            OnEnemyDamagedFunction = 
            {
                Name = "DZAICheckFistDetonation",
            },
            AddOutgoingDamageModifiers =
            {
                -- Somewhat hacky but ensures detonateion isn't boosted by own status effect @alice
                ValidWeaponMultiplier = 0.75,
                Additive = true,
                ValidEffects = { "DZFistDetonationDamage" },
            },
            PropertyChanges =
            {
                -- FistDetonationWeapon
                {
                    WeaponName = "DarkFistDetonation",
                    EffectName = "FistDetonationDamage",
                    EffectProperty = "Amount",
                    BaseValue = 100,
                    ChangeType = "Add",
                    ExtractValue =
                    {
                        ExtractAs = "TooltipDamage",
                    },
                },
                {
                    WeaponName = "DarkFistDetonation",
                    EffectName = "DZMarkRuptureTarget",
                    EffectProperty = "Modifier",
                    ChangeValue = 0.5,
                    ChangeType = "Add",
                    ExtractValue =
                    {
                        ExtractAs = "TooltipDamageBonus",
                        Format = "Percent",
                    },
                },
                {
                    WeaponName = "DarkFistDetonation",
                    EffectName = "DetonationDamageTaken",
                    EffectProperty = "Modifier",
                    ChangeValue = 0.25,
                    ChangeType = "Add",
                    ExtractValue =
                    {
                        ExtractAs = "TooltipDamageTaken",
                        Format = "Percent",			
                    },
                },
                {
                    WeaponName = "DarkFistDetonation",
                    EffectName = "DZMarkRuptureTarget",
                    EffectProperty = "Duration",
                    ChangeValue = 4,
                    ChangeType = "Absolute",
                    ExtractDuration = "ExtractDuration",
                    ExtractValue =
                    {
                        ExtractAs = "TooltipDuration",
                    },
                },
                {
                    WeaponName = "DarkFistDetonation",
                    EffectName = "DetonationSlow",
                    EffectProperty = "Duration",
                    DeriveValueFrom = "ExtractDuration"
                },
                {
                    WeaponName = "DarkFistDetonation",
                    EffectName = "FistDetonationDamage",
                    EffectProperty = "Duration",
                    ChangeValue = 3.95, -- Should be 0.05 lower than duration defined above.
                    ChangeType = "Absolute",
                },
                {
                    WeaponName = "DarkFistDetonation",
                    EffectName = "DetonationDamageTaken",
                    EffectProperty = "Duration",
                    DeriveValueFrom = "ExtractDuration"
                },
                -- Dash Weapon Changes
                {
                    WeaponNames = WeaponSets.HeroRushWeapons,
                    WeaponProperty = "WeaponRange",
                    ChangeValue = 0.75,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = WeaponSets.HeroRushWeapons,
                    WeaponProperty = "ClipSize",
                    ChangeValue = 2,
                    ChangeType = "Add",
                    ExcludeLinked = true,
                    {
                        ExtractAs = "TooltipBonusDashes",
                    }
                },
                {
                    WeaponNames = WeaponSets.HeroRushWeapons,
                    WeaponProperty = "ClipRegenInterval",
                    ChangeValue = 1.2,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = WeaponSets.HeroRushWeapons,
                    WeaponProperty = "BlinkDuration",
                    ChangeValue = 0.8,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = WeaponSets.HeroRushWeapons,
                    WeaponProperty = "IgnoreTriggerLockDuringCooldown",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = WeaponSets.HeroRushWeapons,
                    WeaponProperty = "FullyAutomatic",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = WeaponSets.HeroRushWeapons,
                    WeaponProperty = "Cooldown",
                    ChangeValue = 0.17,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = WeaponSets.HeroRushWeapons,
                    EffectName = "RushWeaponInvulnerable",
                    EffectProperty = "Duration",
                    ChangeValue = 0.8,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = WeaponSets.HeroRushWeapons,
                    EffectName = "RushWeaponImmuneToForce",
                    EffectProperty = "Duration",
                    ChangeValue = 0.8,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = WeaponSets.HeroRushWeapons,
                    EffectName = "RushWeaponDisableMove",
                    EffectProperty = "Duration",
                    ChangeValue = 0.8,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = WeaponSets.HeroRushWeapons,
                    EffectName = "RushWeaponSelfGrip",
                    EffectProperty = "Active",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = WeaponSets.HeroRushWeapons,
                    EffectName = "RushWeaponSelfSlow",
                    EffectProperty = "Active",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = WeaponSets.HeroRushWeapons,
                    EffectName = "RushWeaponDisableRotation",
                    EffectProperty = "Active",
                    ChangeValue = false,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = WeaponSets.HeroRushWeapons,
                    ProjectileProperty = "DamageLow",
                    ChangeValue = 0,
                    ChangeType = "Add",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = WeaponSets.HeroRushWeapons,
                    ProjectileProperty = "DamageHigh",
                    ChangeValue = 0,
                    ChangeType = "Add",
                    ExcludeLinked = true,
                },

                -- Gilgamesh Dash
                {
                    WeaponNames = { "DarkRush" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt03DashNoCollide",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkRush" },
                    WeaponProperty = "UnblockedBlinkFx",
                    ChangeValue = "null",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                -- Gilgamesh Attack
                {
                    WeaponNames = { "DarkFist", "DarkFist3", "DarkFist5" },
                    WeaponProperty = "Projectile",
                    ChangeValue = "DarkFistClawL",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist2", "DarkFist4" },
                    WeaponProperty = "Projectile",
                    ChangeValue = "DarkFistClawR",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkFist", "DarkFist3", "DarkFist5" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt03ClawL_Start",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist", "DarkFist3", "DarkFist5" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt03ClawL_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist2", "DarkFist4" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt03ClawR_Start",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist2", "DarkFist4" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt03ClawR_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkFist2", "DarkFist3", "DarkFist4", "DarkFist5" },
                    WeaponProperty = "ControlWindow",
                    ChangeValue = 0.5,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkFist" },
                    WeaponProperty = "ChargeTime",
                    ChangeValue = 0.21,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkFist2", },
                    WeaponProperty = "ChargeTime",
                    ChangeValue = 0.14,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkFist3", },
                    WeaponProperty = "ChargeTime",
                    ChangeValue = 0.14,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkFist4" },
                    WeaponProperty = "ChargeTime",
                    ChangeValue = 0.13,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkFist5" },
                    WeaponProperty = "ChargeTime",
                    ChangeValue = 0.12,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                
                {
                    WeaponNames = { "DarkFist" },
                    EffectName = "FistDisable",
                    EffectProperty = "Duration",
                    ChangeValue = 3.0,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist" },
                    EffectName = "FistDisableAndLockTrigger",
                    EffectProperty = "Duration",
                    ChangeValue = 3.0,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist2" },
                    EffectName = "FistDisable2",
                    EffectProperty = "Duration",
                    ChangeValue = 3.0,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist2" },
                    EffectName = "FistDisableAndLockTrigger2",
                    EffectProperty = "Duration",
                    ChangeValue = 3.0,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist3" },
                    EffectName = "FistDisable3",
                    EffectProperty = "Duration",
                    ChangeValue = 3.0,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist3" },
                    EffectName = "FistDisableAndLockTrigger3",
                    EffectProperty = "Duration",
                    ChangeValue = 3.0,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist4" },
                    EffectName = "FistDisable4",
                    EffectProperty = "Duration",
                    ChangeValue = 3.0,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist4" },
                    EffectName = "FistDisableAndLockTrigger4",
                    EffectProperty = "Duration",
                    ChangeValue = 3.0,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist5" },
                    EffectName = "FistDisable5",
                    EffectProperty = "Duration",
                    ChangeValue = 3.0,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkFist5" },
                    EffectName = "FistDetonateMoveDisable",
                    EffectProperty = "Active",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                
                {
                    WeaponNames = { "DarkFist" },
                    EffectName = "FistSelfSelfSlowFire",
                    EffectProperty = "Modifier",
                    ChangeValue = 0.1,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist" },
                    EffectName = "FistSelfSlowCharge",
                    EffectProperty = "Modifier",
                    ChangeValue = 0.05,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist" },
                    EffectName = "FistSelfSlowCharge",
                    EffectProperty = "Duration",
                    ChangeValue = 1.5,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist" },
                    EffectName = "FistSelfSelfSlowFire",
                    EffectProperty = "Duration",
                    ChangeValue = 1.5,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist2" },
                    EffectName = "FistSwordSelfSlowFire2",
                    EffectProperty = "Modifier",
                    ChangeValue = 0.1,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist2" },
                    EffectName = "FistSelfSlowCharge2",
                    EffectProperty = "Modifier",
                    ChangeValue = 0.05,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist2" },
                    EffectName = "FistSelfSlowCharge2",
                    EffectProperty = "Duration",
                    ChangeValue = 1.5,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist2" },
                    EffectName = "FistSwordSelfSlowFire2",
                    EffectProperty = "Duration",
                    ChangeValue = 1.5,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist3" },
                    EffectName = "FistSwordSelfSlowFire3",
                    EffectProperty = "Modifier",
                    ChangeValue = 0.1,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist3" },
                    EffectName = "FistSelfSlowCharge3",
                    EffectProperty = "Modifier",
                    ChangeValue = 0.05,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist3" },
                    EffectName = "FistSelfSlowCharge3",
                    EffectProperty = "Duration",
                    ChangeValue = 1.5,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist3" },
                    EffectName = "FistSwordSelfSlowFire3",
                    EffectProperty = "Duration",
                    ChangeValue = 1.5,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist4" },
                    EffectName = "FistSwordSelfSlowFire4",
                    EffectProperty = "Modifier",
                    ChangeValue = 0.1,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist4" },
                    EffectName = "FistSelfSlowCharge4",
                    EffectProperty = "Modifier",
                    ChangeValue = 0.05,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist4" },
                    EffectName = "FistSelfSlowCharge4",
                    EffectProperty = "Duration",
                    ChangeValue = 1.5,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist4" },
                    EffectName = "FistSwordSelfSlowFire4",
                    EffectProperty = "Duration",
                    ChangeValue = 1.5,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist", "DarkFist3", "DarkFist5" },
                    WeaponProperty = "FireFx",
                    ChangeValue = "ClawSwipe",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFist2", "DarkFist4" },
                    WeaponProperty = "FireFx",
                    ChangeValue = "ClawSwipeFlipped",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                -- Gilgamesh Dash Attack
                {
                    WeaponNames = { "DarkFistDash" },
                    WeaponProperty = "Projectile",
                    ChangeValue = "DarkFistClawDash",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistDash" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt03DashAttack_Charge",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistDash" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt03DashAttack_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistDash" },
                    WeaponProperty = "ChargeTime",
                    ChangeValue = 0.08,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistDash" },
                    EffectName = "FistDashDisable",
                    EffectProperty = "Duration",
                    ChangeValue = 1.5,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistDash" },
                    EffectName = "FistDashDisable3",
                    EffectProperty = "Duration",
                    ChangeValue = 1.5,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistClawDash" },
                    ProjectileProperty = "StartFx",
                    ChangeValue = "ClawSwipeFlippedDash",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },			

                -- Gilgamesh Special

                {
                    WeaponNames = { "DarkFistSpecial" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt03AerialUpperCut_Start",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistSpecial" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt03AerialUpperCut_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistSpecial" },
                    WeaponProperty = "FireFx",
                    ChangeValue = "ClawSwipeUppercut",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                -- Gilgamesh Dash Special

                {
                    WeaponNames = { "DarkFistSpecialDash" },
                    WeaponProperty = "ChargeTime",
                    ChangeValue = 0.17,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistDash" },
                    EffectName = "FistDashDisable",
                    EffectProperty = "RequestTriggerLock",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistDash" },
                    EffectName = "FistDashDisable3",
                    EffectProperty = "RequestTriggerLock",
                    ChangeValue = true,
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistSpecialDash" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt03DashUpperCut_Start",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistSpecialDash" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt03DashUpperCut_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkFistSpecialDash" },
                    EffectName = "FistSpecialDashDisable",
                    EffectProperty = "Duration",
                    ChangeValue = 1.4,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistSpecialDash" },
                    EffectName = "FistSpecialDashDisable2",
                    EffectProperty = "Duration",
                    ChangeValue = 1.4,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },
                {
                    WeaponNames = { "DarkFistSpecialDash" },
                    EffectName = "FistSpecialDashDisable3",
                    EffectProperty = "Duration",
                    ChangeValue = 2.0,
                    ChangeType = "Multiply",
                    ExcludeLinked = true,
                },

                {
                    TraitName = "DZFistTeleportSpecialTrait",
                    WeaponNames = { "DarkFistSpecial", "DarkFistSpecialDash" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt03FlashKick_Start",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    TraitName = "DZFistTeleportSpecialTrait",
                    WeaponNames = { "DarkFistSpecial", "DarkFistSpecialDash" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt03FlashKick_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    TraitName = "DZFistSpecialFireballTrait",
                    WeaponNames = { "DarkFistSpecial" },
                    WeaponProperty = "ChargeStartAnimation",
                    ChangeValue = "DarkZagreusFistAlt02Grab_Start",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
                {
                    TraitName = "DZFistSpecialFireballTrait",
                    WeaponNames = { "DarkFistSpecial" },
                    WeaponProperty = "FireGraphic",
                    ChangeValue = "DarkZagreusFistAlt03Grab_Fire",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },

                {
                    WeaponNames = { "DarkFistSpecialDash" },
                    WeaponProperty = "FireFx",
                    ChangeValue = "ClawSwipeUppercutSpecial",
                    ChangeType = "Absolute",
                    ExcludeLinked = true,
                },
            }
        },
    }
)

ModUtil.Table.Merge(
    DarkZagreus.WeaponTraits, {
        "DZFistVacuumTrait",
        "DZFistWeaveTrait",
        "DZFistDetonateTrait"
    }
)