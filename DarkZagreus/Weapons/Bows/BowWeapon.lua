DebugPrint({ Text = "Load DarkBow" })

WeaponData.DarkBow =
{
    Name = "DarkBow",
    RapidDamageType = true,

    AIData =
    {
        IsAttackDistanceBasedOnCharge = true,
        AIChargeTargetMarker = "ShadeBowTargetMarker",
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeoutMin = 0.5,
        AIMoveWithinRangeTimeoutMax = 1.0,
        SkipAttackAfterMoveTimeout = true,
        PreFireDuration = 0.2,
        PreFireAnimation = "DarkZagreusBowDashStart",
        PreFireFx = "BowCharge",
        PreFireSound = "/SFX/Player Sounds/ZagreusBowChargeup",
        FireAnimation = "DarkZagreusBowDashFire",
        PreFireCancelAnimation = "DarkZagreusBowDashStartCancel",
        MinChargeStartFx = "BowCharge",
        -- ChargeFx = "BowCharge",
        IsRangeBasedOnCharge = true,
        MinChargeTime = 0.2,
        MaxChargeTime = 0.8,
        Range = 45,
        ChargeRangeMultiplier = 20,
        WaitUntilProjectileDeath = "DarkBow"
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
        "ZagreusBow_Bink",
        "ZagreusBowRapidFire_Bink",
        "ZagreusBowDash_Bink",
        "ZagreusBowRun_Bink",
        "ZagreusBowRunStop_Bink",
    },

    Upgrades = {},
}

WeaponData.DarkBowDash =
{
    StartingWeapon = false,

    AIData =
    {
        GiveupDistanceBasedOnCharge = true,
        AIChargeTargetMarker = "ShadeBowTargetMarker",
        SkipMovement = true,
        AITrackTargetDuringCharge = true,
        PreFireDuration = 0.2,
        PreFireAnimation = "DarkZagreusBowStart",
        PreFireFx = "BowChargeFast",
        PreFireSound = "/SFX/Player Sounds/ZagreusBowChargeup",
        FireAnimation = "DarkZagreusBowFire",
        PreFireCancelAnimation = "DarkZagreusBowStartCancel",
        -- MinChargeStartFx = "BowCharge",
        IsRangeBasedOnCharge = true,
        ChargeFx = "BowChargeFast",
        MinChargeTime = 0.2,
        MaxChargeTime = 0.8,
        Range = 45,
        ChargeRangeMultiplier = 20,
        WaitUntilProjectileDeath = "DarkBowDash"
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

WeaponData.DarkBowSplitShot =
{
    StartingWeapon = false,

    AIData =
    {
        AttackDistanceMin = 300,
        AttackDistanceMax = 900,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0,
        WaitUntilProjectileDeath = "DarkBowSplitShot",
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteRanged", },
            { Name = "/Leftovers/SFX/AuraOn" },
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
}

EffectData.DZMarkTarget =
{
    OnApplyFunctionName = "DZAIMarkTargetApply",
    OnClearFunctionName = "DZAIMarkTargetClear",
}
