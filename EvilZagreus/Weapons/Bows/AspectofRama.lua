DebugPrint({ Text = "Load DarkRamaBow" })

WeaponData.DarkRamaBow =
{
    Name = "DarkRamaBow",
    RapidDamageType = true,

    AIData =
    {
        AIAttackDistance = 800,
        -- MoveSuccessDistance = 600,
        AIChargeTargetMarker = "ShadeBowTargetMarker",
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0,
        PreFireDuration = 0.2,
        PreFireAnimation = "ZagreusBowRamaHeavyShotStart",
        PreFireFx = "BowCharge",
        PreFireSound = "/SFX/Player Sounds/ZagreusBowChargeup",
        FireAnimation = "ZagreusBowRamaHeavyShotFire",
        PreFireCancelAnimation = "ZagreusBowRamaHeavyShotStartCancel",
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

    Upgrades = {},
}

WeaponData.DarkRamaBowDash =
{
    Name = "DarkRamaBowDash",
    StartingWeapon = false,

    AIData =
    {
        AIChargeTargetMarker = true,
        SkipMovement = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0,
        PreFireDuration = 0.2,
        PreFireAnimation = "ZagreusBowRamaDashShot_Start",
        PreFireFx = "BowChargeRamaDash",
        PreFireSound = "/SFX/Player Sounds/ZagreusBowChargeup",
        FireAnimation = "ZagreusBowRamaDashShot_Fire",
        PreFireCancelAnimation = "ZagreusBowRamaDashShot_Cancel",
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

WeaponData.DarkRamaBowSplitShot =
{
    Name = "DarkRamaBowSplitShot",
    StartingWeapon = false,

    AIData =
    {
        AIAttackDistance = 800,
        AIChargeTargetMarker = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 2.5,
        PreFireDuration = 0.18,
        PreFireAnimation = "ZagreusBowRamaRapidLoop_Start",
        PreFireFx = "BowChargeFast",
        FireAnimation = "ZagreusBowRamaRapidLoop_Fire",
        -- FireSound = "/VO/ZagreusEmotes/EmoteRanged",
        WaitUntilProjectileDeath = true
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

    Upgrades =
    {

    },
}
