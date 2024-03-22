DebugPrint({ Text = "Load DarkChironBow" })

WeaponData.DarkChironBow =
{
    Name = "DarkChironBow",
    RapidDamageType = true,

    AIData =
    {
        AIAttackDistance = 800,
        -- AIBufferDistance = 100,
        AIChargeTargetMarker = true,
        -- AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 2.5,
        FireDuration = 0.425,
        PreFireDuration = 0.6,
        PreFireAnimation = "ZagreusBowAlt01DashStart",
        PreFireFx = "BowCharge",
        PreFireSound = "/SFX/Player Sounds/ZagreusBowChargeup",
        FireAnimation = "ZagreusBowAlt01DashFire",
        PreFireCancelAnimation = "ZagreusBowAlt01StartCancel",
        MinChargeStartFx = "BowCharge",
        MinChargeToFire = 0.2,
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
        AIAttackDistance = 800,
        -- AIBufferDistance = 100,
        AIChargeTargetMarker = true,
        -- AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 2.5,
        FireDuration = 0.45,
        PreFireDuration = 0.4,
        PreFireAnimation = "ZagreusBowAlt01Start",
        PreFireFx = "BowChargeFast",
        PreFireSound = "/SFX/Player Sounds/ZagreusBowChargeup",
        FireAnimation = "ZagreusBowAlt01Fire",
        PreFireCancelAnimation = "ZagreusBowAlt01StartCancel",
        MinChargeStartFx = "BowCharge",
        MinChargeToFire = 0.3,
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
        AIAttackDistance = 800,
        -- AIBufferDistance = 100,
        AIChargeTargetMarker = true,
        -- AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 2.5,
        -- FireDuration = 0.45,
        PreFireDuration = 0.1,
        PreFireAnimation = "ZagreusBowAlt01RapidFire_Start",
        PreFireFx = "BowChargeFast",
        FireAnimation = "ZagreusBowAlt01RapidFire_Fire",
        FireSound = "/VO/ZagreusEmotes/EmoteRanged",
        WaitUntilProjectileDeath = true
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

-- {
--     WeaponNames = { "BowWeapon", "BowWeaponDash" },
--     WeaponProperty = "ChargeCancelGraphic",
--     ChangeValue = "ZagreusBowAlt01StartCancel",
--     ChangeType = "Absolute",
--     ExcludeLinked = true,
-- }