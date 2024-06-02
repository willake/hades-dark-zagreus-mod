DebugPrint({ Text = "Load DarkHeraBow" })

WeaponData.DarkHeraBow =
{
    Name = "DarkHeraBow",
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
        PreFireAnimation = "ZagreusBowAlt02DashStart",
        PreFireFx = "BowCharge",
        PreFireSound = "/SFX/Player Sounds/ZagreusBowChargeup",
        FireAnimation = "ZagreusBowAlt02DashFire",
        PreFireCancelAnimation = "ZagreusBowAlt02StartCancel",
        MinChargeStartFx = "BowCharge",
        -- ChargeFx = "BowCharge",
        IsRangeBasedOnCharge = true,
        MinChargeTime = 0.2,
        MaxChargeTime = 1,
        Range = 45,
        ChargeRangeMultiplier = 20,
        WaitUntilProjectileDeath = "DarkHeraBow"
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
        "ZagreusBow02Dash_Bink",
        "ZagreusBow02_Bink",
        "ZagreusBow02Run_Bink",
        "ZagreusBow02RunStop_Bink",
        "ZagreusBow02RapidFire_Bink"
    }
}

WeaponData.DarkHeraBowDash =
{
    Name = "DarkHeraBowDash",
    StartingWeapon = false,

    AIData =
    {
        AIChargeTargetMarker = "ShadeBowTargetMarker",
        SkipMovement = true,
        AITrackTargetDuringCharge = true,
        AIAngleTowardsPlayerWhileFiring = true,
        PreFireDuration = 0.2,
        PreFireAnimation = "ZagreusBowAlt02Start",
        PreFireFx = "BowChargeRamaDash",
        PreFireSound = "/SFX/Player Sounds/ZagreusBowChargeup",
        FireAnimation = "ZagreusBowAlt02Fire",
        PreFireCancelAnimation = "ZagreusBowAlt02StartCancel",
        -- MinChargeStartFx = "BowCharge",
        IsRangeBasedOnCharge = true,
        ChargeFx = "BowChargeFast",
        MinChargeTime = 0.2,
        MaxChargeTime = 1,
        Range = 45,
        ChargeRangeMultiplier = 20,
        WaitUntilProjectileDeath = "DarkHeraBowDash"
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
    }
}

WeaponData.DarkHeraBowSplitShot =
{
    Name = "DarkHeraBowSplitShot",
    StartingWeapon = false,

    AIData =
    {
        AttackDistanceMin = 300,
        AttackDistanceMax = 900,
        AITrackTargetDuringCharge = true,
        AIAngleTowardsPlayerWhileFiring = true,
        AIMoveWithinRangeTimeout = 1.0,
        PreFireDuration = 0.1,
        PreFireAnimation = "ZagreusBowAlt02RapidFire_Start",
        PreFireFx = "BowChargeFast",
        FireAnimation = "ZagreusBowAlt02RapidFire_Fire",
        FireSound = "/VO/ZagreusEmotes/EmoteRanged",
        WaitUntilProjectileDeath = "DarkHeraBowSplitShot"
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
    }
}

-- this upgrade also change the cast action, but I don't know how to apply it