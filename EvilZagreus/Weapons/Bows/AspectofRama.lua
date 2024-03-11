DebugPrint({ Text = "Load DarkRamaBow" })

WeaponData.DarkRamaBow =
{
    Name = "DarkRamaBow",
    -- ShortName = "EnemyBowWeapon_Short",
    -- DashWeapon = "BowWeaponDash",
    -- SecondaryWeapon = "BowSplitShot",
    RapidDamageType = true,
    AIData =
    {
        PreAttackAnimation = "ZagreusBowRamaHeavyShotStart",
        FireAnimation = "ZagreusBowRamaHeavyShotFire",
        -- PostAttackAnimation = "EnemyHydraRangedPostAttack",
        PreAttackDuration = 0.4,
        PreAttackWaitForAnimation = true,
        FireDuration = 0.6,
        -- PostAttackDuration = 2.0,
        AIAttackDistance = 500,
        AIBufferDistance = 100,
        AIChargeTargetMarker = true,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 2.5,

        AIFireTicksMin = 1,
        AIFireTicksMax = 1,
        AIFireTicksCooldown = 0.6,

        -- MinAttacksBetweenUse = 2,

    },

    -- ChargeCameraMotion = { ZoomType = "Overshoot", Fraction = 0.95, Duration = 0.6 },
    -- FireCameraMotion = { ZoomType = "Ease", Fraction = 1.0, Duration = 0.06 },

    --FireScreenshake = { Distance = 2, Speed = 300, FalloffSpeed = 0, Duration = 0.1, Angle = 90 },
    --HitScreenshake = { Distance = 6, Speed = 3000, FalloffSpeed = 0, Duration = 0.1, Angle = 90 },

    --[[
        HitSimSlowCooldown = 0.3,
        HitSimSlowParameters =
        {
            { ScreenPreWait = 0.04, Fraction = 0.03, LerpTime = 0.0 },
            { ScreenPreWait = 0.02, Fraction = 0.20, LerpTime = 0.06 },
            { ScreenPreWait = 0.02, Fraction = 1.00, LerpTime = 0.07 },
        },
		]]

    -- FireRumbleParameters =
    -- {
    --     { ScreenPreWait = 0.02, RightFraction = 0.15, Duration = 0.15 },
    -- },

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
    StartingWeapon = false,

    FireRumbleParameters =
    {
        { ScreenPreWait = 0.02, RightFraction = 0.15, Duration = 0.15 },
    },

    AIData =
    {
        PreAttackAnimation = "ZagreusBowRamaDashShot_Start",
        FireAnimation = "ZagreusBowRamaDashShot_Fire",
        PreAttackDuration = 0.4,
        -- FireAnimation = "ZagreusBowFire",
        -- PostAttackAnimation = "EnemyHydraRangedPostAttack",
        PreAttackWaitForAnimation = true,
        FireDuration = 0.6,
        -- PostAttackDuration = 2.0,
        AIAttackDistance = 500,
        AIBufferDistance = 100,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 2.5,

        AIFireTicksMin = 1,
        AIFireTicksMax = 1,
        AIFireTicksCooldown = 0.6,

        -- MinAttacksBetweenUse = 2,

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
    StartingWeapon = false,

    FireRumbleParameters =
    {
        { ScreenPreWait = 0.02, LeftFraction = 0.225,  Duration = 0.15 },
        { ScreenPreWait = 0.17, LeftFraction = 0.225,  Duration = 0.15 },
        { ScreenPreWait = 0.17, RightFraction = 0.225, Duration = 0.2 },
        --{ ScreenPreWait = 0.20, RightFraction = 0.6, Duration = 0.3 },
    },

    AIData =
    {
        -- PreAttackAnimation = "ZagreusBowStart",
        PreAttackDuration = 0.4,
        -- FireAnimation = "ZagreusBowFire",
        -- PostAttackAnimation = "EnemyHydraRangedPostAttack",
        PreAttackWaitForAnimation = true,
        FireDuration = 0.6,
        -- PostAttackDuration = 2.0,
        AIAttackDistance = 500,
        AIBufferDistance = 100,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 2.5,

        AIFireTicksMin = 1,
        AIFireTicksMax = 1,
        AIFireTicksCooldown = 0.6,

        -- MinAttacksBetweenUse = 2,

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
