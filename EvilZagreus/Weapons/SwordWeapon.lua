DebugPrint({ Text = "Load SwordWeapon" })

WeaponData.EnemySwordWeapon = {
    Name = "EnemySwordWeapon",

    AIData =
    {
        --PreAttackAnimation = "EnemyHydraBite_Charge",
        --FireAnimation = "EnemyHydraBite_Attack",
        --PostAttackAnimation = "EnemyHydraIdle",
        PreAttackDuration = 0,
        --PreAttackEndDuration = 0.5,
        --PreAttackEndShake = true,
        --PreAttackVelocityWeapon = "HydraBiteSelfVelocity",
        FireDuration = 0.8,
        PostAttackDuration = 0,
        AIAttackDistance = 175,
        AIBufferDistance = 175,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0,
    },

    CauseImpactReaction = true,

    FireScreenshake = { Distance = 2, Speed = 200, FalloffSpeed = 1400, Duration = 0.1, Angle = 225 },

    HitSimSlowParameters =
    {
        { ScreenPreWait = 0.04, Fraction = 0.1, LerpTime = 0 },
        { ScreenPreWait = 0.01, Fraction = 1.0, LerpTime = 0.03 },
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteAttacking_Sword" },
            { Name = "/SFX/Player Sounds/ZagreusSwordSwipe" },
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

    WeaponBinks =
    {
        "ZagreusSword_Bink",
        "ZagreusSwordReturnToIdle_Bink",
        "ZagreusSwordDashAttack_Bink",
        "ZagreusSwordRun_Bink",
        "ZagreusSwordRunStop_Bink",
        "ZagreusSwordParry_Bink",
    },
}

WeaponData.EnemySwordWeapon2 =
{
    Name = "EnemySwordWeapon2",
    StartingWeapon = false,
    CauseImpactReaction = true,
    HitScreenshake = { Distance = 6, Speed = 300, FalloffSpeed = 0, Duration = 0.1, Angle = 90 },

    HitSimSlowParameters =
    {
        { ScreenPreWait = 0.02, Fraction = 0.1, LerpTime = 0 },
        { ScreenPreWait = 0.02, Fraction = 1.0, LerpTime = 0.07 },
    },

    HitRumbleParameters =
    {
        { ScreenPreWait = 0.02, RightFraction = 0.2, Duration = 0.15 },
    },

    AIData =
    {
        --PreAttackAnimation = "EnemyHydraBite_Charge",
        --FireAnimation = "EnemyHydraBite_Attack",
        --PostAttackAnimation = "EnemyHydraIdle",
        PreAttackDuration = 0,
        --PreAttackEndDuration = 0.5,
        --PreAttackEndShake = true,
        --PreAttackVelocityWeapon = "HydraBiteSelfVelocity",
        FireDuration = 0.8,
        PostAttackDuration = 0,
        AIAttackDistance = 175,
        AIBufferDistance = 175,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0,
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteAttacking" },
            { Name = "/SFX/Player Sounds/ZagreusSwordOverhead" },
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

    Upgrades = {},
}

WeaponData.EnemySwordWeapon3 =
{
    Name = "EnemySwordWeapon3",
    StartingWeapon = false,
    CauseImpactReaction = true,

    HitSimSlowCooldown = 0.03,
    HitSimSlowParameters =
    {
        { ScreenPreWait = 0.06, Fraction = 0.1, LerpTime = 0.0 },
        { ScreenPreWait = 0.05, Fraction = 1.0, LerpTime = 0.07 },

        --{ ScreenPreWait = 0.01, Fraction = 0.01, LerpTime = 0 },
        --{ ScreenPreWait = 0.06, Fraction = 0.3, LerpTime = 0.07 },
        --{ ScreenPreWait = 0.08, Fraction = 1.0, LerpTime = 0.07 },
    },

    -- HitRumbleParameters =
    -- {
    -- 	{ ScreenPreWait = 0.02, LeftFraction = 0.25, Duration = 0.2 },
    -- },

    AIData =
    {
        --PreAttackAnimation = "EnemyHydraBite_Charge",
        --FireAnimation = "EnemyHydraBite_Attack",
        --PostAttackAnimation = "EnemyHydraIdle",
        PreAttackDuration = 0,
        --PreAttackEndDuration = 0.5,
        --PreAttackEndShake = true,
        --PreAttackVelocityWeapon = "HydraBiteSelfVelocity",
        FireDuration = 0.8,
        PostAttackDuration = 0,
        AIAttackDistance = 175,
        AIBufferDistance = 175,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0,
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmotePowerAttacking_Sword" },
        },
        ChargeSounds =
        {
            {
                Name = "/Leftovers/SFX/AuraCharge",
                StoppedBy = { "TriggerRelease" }
            },
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

    Upgrades = {},
}

WeaponData.EnemySwordWeaponDash =
{
    Name = "EnemySwordWeaponDash",
    StartingWeapon = false,
    CauseImpactReaction = true,

    --HitScreenshake = { Distance = 3, Speed = 10000, Duration = 0.08, FalloffSpeed = 30000 },
    -- HitRumbleParameters =
    -- {
    -- 	{ ScreenPreWait = 0.02, LeftFraction = 0.125, Duration = 0.15 },
    -- },

    HitSimSlowParameters =
    {

        { ScreenPreWait = 0.04, Fraction = 0.1, LerpTime = 0.0 },
        { ScreenPreWait = 0.03, Fraction = 1.0, LerpTime = 0.07 },

        --{ ScreenPreWait = 0.00, Fraction = 0.01, LerpTime = 0 },
        --{ ScreenPreWait = 0.02, Fraction = 0.15, LerpTime = 0.07 },
        --{ ScreenPreWait = 0.035, Fraction = 1.0, LerpTime = 0.1 },
    },

    AIData =
    {
        --PreAttackAnimation = "EnemyHydraBite_Charge",
        --FireAnimation = "EnemyHydraBite_Attack",
        --PostAttackAnimation = "EnemyHydraIdle",
        PreAttackDuration = 0,
        --PreAttackEndDuration = 0.5,
        --PreAttackEndShake = true,
        --PreAttackVelocityWeapon = "HydraBiteSelfVelocity",
        FireDuration = 0.8,
        PostAttackDuration = 0,
        AIAttackDistance = 175,
        AIBufferDistance = 175,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0,
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteAttacking_Bow" },
            { Name = "/SFX/Player Sounds/ZagreusSwordSwipe" },
        },
        ChargeSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteCharging" },
            {
                Name = "/Leftovers/SFX/AuraCharge",
                StoppedBy = { "TriggerRelease" }
            },
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

    Upgrades = {},
}

WeaponData.EnemySwordParry =
{
    Name = "EnemySwordParry",
    StartingWeapon = false,

    CauseImpactReaction = true,
    ImpactReactionHitsOverride = 2,

    SkipAttackNotReadySounds = true,

    FireScreenshake = { Distance = 4, Speed = 300, FalloffSpeed = 4000, Duration = 0.25, Angle = 0 },
    ChargeCameraMotion = { ZoomType = "Ease", Fraction = 1.05, Duration = 0.04, HoldDuration = 0.4, RestoreDefaultDuration = 0.8 },

    FireSimSlowParameters =
    {
        --{ ScreenPreWait = 0.0, Fraction = 0.01, LerpTime = 0 },
        --{ ScreenPreWait = 0.04, Fraction = 0.1, LerpTime = 0.07 },
        --{ ScreenPreWait = 0.14, Fraction = 1.0, LerpTime = 0.1 },
    },
    AIData =
    {
        --PreAttackAnimation = "EnemyHydraBite_Charge",
        --FireAnimation = "EnemyHydraBite_Attack",
        --PostAttackAnimation = "EnemyHydraIdle",
        PreAttackDuration = 0,
        --PreAttackEndDuration = 0.5,
        --PreAttackEndShake = true,
        --PreAttackVelocityWeapon = "HydraBiteSelfVelocity",
        FireDuration = 0.8,
        PostAttackDuration = 0,
        AIAttackDistance = 175,
        AIBufferDistance = 175,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0,
    },

    -- FireRumbleParameters =
    -- {
    -- 	{ ScreenPreWait = 0.08, Fraction = 0.2, Duration = 0.22 },
    -- },

    Sounds =
    {
        ChargeSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteCharging_Bow" },
            { Name = "/SFX/Player Sounds/ZagreusSwordSwipe" },
        },
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteParry_Sword" },
        },
        ImpactSounds =
        {
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/ArrowMetalBoneSmash",
            Brick = "/SFX/ArrowMetalStoneClang",
            Stone = "/SFX/ArrowMetalStoneClang",
            Organic = "/SFX/ArrowImpactSplatter",
            StoneObstacle = "/SFX/SwordWallHitClankSmall",
            BrickObstacle = "/SFX/SwordWallHitClankSmall",
            MetalObstacle = "/SFX/SwordWallHitClankSmall",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },
    },

    Binks =
    {
        "ZagreusSwordParry_Bink",
    },

    Upgrades = {},
}
