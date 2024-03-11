DebugPrint({ Text = "Load DarkBow" })

WeaponData.DarkBow =
{
    Name = "DarkBow",
    -- ShortName = "EnemyBowWeapon_Short",
    -- DashWeapon = "BowWeaponDash",
    -- SecondaryWeapon = "BowSplitShot",
    RapidDamageType = true,
    AIData =
    {
        PreAttackAnimation = "ZagreusBowStart",
        FireAnimation = "ZagreusBowFire",
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
		HitSimSlowCooldown = 0.2,
		HitSimSlowParameters =
		{
			{ ScreenPreWait = 0.02, Fraction = 0.1, LerpTime = 0 },
			{ ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0.1 },
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

    FireRumbleParameters =
    {
        { ScreenPreWait = 0.02, RightFraction = 0.15, Duration = 0.15 },
    },

    AIData =
    {
        PreAttackAnimation = "ZagreusBowStart",
        FireAnimation = "ZagreusBowFire",
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

WeaponData.DarkBowSplitShot =
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
