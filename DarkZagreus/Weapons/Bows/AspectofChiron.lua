DebugPrint({ Text = "Load DarkChironBow" })

WeaponData.DarkChironBow =
{
    Name = "DarkChironBow",
    RapidDamageType = true,

    AIData =
    {
        IsAttackDistanceBasedOnCharge = true,
        AIChargeTargetMarker = "ShadeBowTargetMarker",
        AITrackTargetDuringCharge = true,
        AIAngleTowardsPlayerWhileFiring = true,
        AIMoveWithinRangeTimeoutMin = 0.5,
        AIMoveWithinRangeTimeoutMax = 1.0,
        SkipAttackAfterMoveTimeout = true,
        PreFireDuration = 0.2,
        PreFireAnimation = "ZagreusBowAlt01DashStart",
        PreFireFx = "BowCharge",
        PreFireSound = "/SFX/Player Sounds/ZagreusBowChargeup",
        FireAnimation = "ZagreusBowAlt01DashFire",
        PreFireCancelAnimation = "ZagreusBowAlt01StartCancel",
        MinChargeStartFx = "BowCharge",
        -- ChargeFx = "BowCharge",
        IsRangeBasedOnCharge = true,
        MinChargeTime = 0.2,
        MaxChargeTime = 1,
        Range = 45,
        ChargeRangeMultiplier = 20,
        WaitUntilProjectileDeath = "DarkChironBow"
    },

    Sounds =
    {
        FireSounds =
        {
            PerfectChargeSounds =
            {
                { Name = "/SFX/Player Sounds/ZagreusCriticalFire" },
                { Name = "/VO/ZagreusEmotes/EmoteAttacking_BowPowerShot" },
                { Name = "/SFX/Player Sounds/ZagreusBowFire" },
            },
            ImperfectChargeSounds =
            {
                { Name = "/VO/ZagreusEmotes/EmoteAttacking_Bow" },
                { Name = "/SFX/Player Sounds/ZagreusBowFire" },
            },
            LoadedSounds =
            {
                { Name = "/SFX/Player Sounds/ZagreusBloodshotFire" },
            },
            { Name = "/Leftovers/SFX/AuraOn" },
        },
        ChargeSounds =
        {
            {
                Name = "/SFX/Player Sounds/ZagreusBowChargeup",
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

    WeaponBinks =
    {
        "ZagreusBow01Dash_Bink",
        "ZagreusBow01_Bink",
        "ZagreusBow01Run_Bink",
        "ZagreusBow01RunStop_Bink",
        "ZagreusBow01RapidFire_Bink"
    },

    Upgrades = {},
}

WeaponData.DarkChironBowDash =
{
    StartingWeapon = false,

    AIData =
    {
        AIChargeTargetMarker = "ShadeBowTargetMarker",
        SkipMovement = true,
        AITrackTargetDuringCharge = true,
        AIAngleTowardsPlayerWhileFiring = true,
        PreFireDuration = 0.2,
        PreFireAnimation = "ZagreusBowAlt01Start",
        PreFireFx = "BowChargeRamaDash",
        PreFireSound = "/SFX/Player Sounds/ZagreusBowChargeup",
        FireAnimation = "ZagreusBowAlt01Fire",
        PreFireCancelAnimation = "ZagreusBowAlt01StartCancel",
        -- MinChargeStartFx = "BowCharge",
        IsRangeBasedOnCharge = true,
        ChargeFx = "BowChargeFast",
        MinChargeTime = 0.2,
        MaxChargeTime = 1,
        Range = 45,
        ChargeRangeMultiplier = 20,
        WaitUntilProjectileDeath = "DarkChironBowDash"
    },


    Sounds =
    {
        FireSounds =
        {
            PerfectChargeSounds =
            {
                { Name = "/Leftovers/SFX/AuraPerfectThrow" },
                { Name = "/VO/ZagreusEmotes/EmoteAttacking_BowPowerShot" },
            },
            ImperfectChargeSounds =
            {
                { Name = "/VO/ZagreusEmotes/EmoteAttacking_Bow"},
                { Name = "/SFX/Player Sounds/BowFire" },
            },
            { Name = "/Leftovers/SFX/AuraOn"},
        },
        ChargeSounds =
        {
            {
                Name = "/SFX/Player Sounds/ZagreusBowChargeup" ,
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

    Upgrades =
    {

    },
}

WeaponData.DarkChironBowSplitShot =
{
    Name = "DarkChironBowSplitShot",
    StartingWeapon = false,

    AIData =
    {
        AttackDistanceMin = 300,
        AttackDistanceMax = 900,
        AITrackTargetDuringCharge = true,
        AIAngleTowardsPlayerWhileFiring = true,
        AIMoveWithinRangeTimeout = 1.0,
        PreFireDuration = 0.1,
        PreFireAnimation = "ZagreusBowAlt01RapidFire_Start",
        PreFireFx = "BowChargeFast",
        FireAnimation = "ZagreusBowAlt01RapidFire_Fire",
        FireSound = "/VO/ZagreusEmotes/EmoteRanged",
        WaitUntilProjectileDeath = "DarkChironBowSplitShot"
    },

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

    Upgrades =
    {

    },
}

EffectData.DZMarkTarget =
{
    OnApplyFunctionName = "DZAIMarkTargetApply",
    OnClearFunctionName = "DZAIMarkTargetClear",
}
-- {
--     WeaponNames = { "BowWeapon", "BowWeaponDash" },
--     WeaponProperty = "ChargeCancelGraphic",
--     ChangeValue = "ZagreusBowAlt01StartCancel",
--     ChangeType = "Absolute",
--     ExcludeLinked = true,
-- }