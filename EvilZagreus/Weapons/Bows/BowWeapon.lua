DebugPrint({ Text = "Load DarkBow" })

WeaponData.DarkBow =
{
    Name = "DarkBow",
    RapidDamageType = true,

    AIData =
    {
        AIAttackDistance = 800,
        AIChargeTargetMarker = "ShadeBowTargetMarker",
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeoutMin = 1.0,
        AIMoveWithinRangeTimeoutMax = 3.0,
        SkipAttackAfterMoveTimeout = true,
        PreFireDuration = 0.2,
        PreFireAnimation = "ZagreusBowDashStart",
        PreFireFx = "BowCharge",
        PreFireSound = "/SFX/Player Sounds/ZagreusBowChargeup",
        FireAnimation = "ZagreusBowDashFire",
        PreFireCancelAnimation = "ZagreusBowDashStartCancel",
        MinChargeStartFx = "BowCharge",
        -- ChargeFx = "BowCharge",
        IsRangeBasedOnCharge = true,
        MinChargeTime = 0.2,
        MaxChargeTime = 1,
        Range = 45,
        ChargeRangeMultiplier = 20,
        WaitUntilProjectileDeath = true
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
        AIChargeTargetMarker = true,
        SkipMovement = true,
        AITrackTargetDuringCharge = true,
        PreFireDuration = 0.2,
        PreFireAnimation = "ZagreusBowStart",
        PreFireFx = "BowChargeFast",
        PreFireSound = "/SFX/Player Sounds/ZagreusBowChargeup",
        FireAnimation = "ZagreusBowFire",
        PreFireCancelAnimation = "ZagreusBowStartCancel",
        -- MinChargeStartFx = "BowCharge",
        IsRangeBasedOnCharge = true,
        ChargeFx = "BowChargeFast",
        MinChargeTime = 0.2,
        MaxChargeTime = 1,
        Range = 45,
        ChargeRangeMultiplier = 20,
        WaitUntilProjectileDeath = true
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
        AIAttackDistance = 600,
        AIChargeTargetMarker = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 2.5,
        PreFireDuration = 0.2,
        PreFireAnimation = "ZagreusBowRapidFire_Start",
        PreFireFx = "BowChargeFast",
        FireAnimation = "ZagreusBowRapidFire_Fire",
        FireSound = "/VO/ZagreusEmotes/EmoteRanged",
        WaitUntilProjectileDeath = true,
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

    Upgrades =
    {

    },
}
