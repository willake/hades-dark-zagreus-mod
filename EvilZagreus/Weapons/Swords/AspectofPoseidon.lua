DebugPrint({ Text = "Load DarkPoseidonSword" })

WeaponData.DarkPoseidonSword =
{
    Name = "DarkPoseidonSword",

    AIData =
    {
        AIAttackDistance = 300,
        AIBufferDistance = 300,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0,
        ChainedWeapon = "DarkPoseidonSword2",
        FireDuration = 0.2,
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
        "ZagreusSword02_Bink",
        "ZagreusSword02ReturnToIdle_Bink",
        "ZagreusSword02DashAttack_Bink",
        "ZagreusSword02Run_Bink",
        "ZagreusSword02RunStop_Bink",
        "ZagreusSword02Parry_Bink"
    },
}

WeaponData.DarkPoseidonSword2 =
{
    Name = "DarkPoseidonSword2",
    StartingWeapon = false,
    CauseImpactReaction = true,

    AIData =
    {
        AIAttackDistance = 9999,
        AIBufferDistance = 9999,
        FireDuration = 0.425,
        SkipMovement = true,
        SkipAngleTowardTarget = true,
        ChainedWeapon = "DarkPoseidonSword3",
        PreFireDuration = 0.2, -- 0.3
        PreFireAnimation = "ZagreusSwordAlt02Charge2",
        FireAnimation = "ZagreusSwordAlt02Attack2",
        FireFxOnSelf = "SwordSwipeB"
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

WeaponData.DarkPoseidonSword3 =
{
    Name = "DarkPoseidonSword3",
    StartingWeapon = false,
    CauseImpactReaction = true,

    AIData =
    {
        AIAttackDistance = 9999,
        AIBufferDistance = 9999,
        FireDuration = 0.425,
        SkipMovement = true,
        SkipAngleTowardTarget = true,
        PreFireDuration = 0.3,
        PreFireAnimation = "ZagreusSwordAlt02Charge3",
        PreFireFx = "ChargeAttack",
        PreFireSound = "/Leftovers/SFX/AuraCharge",
        FireAnimation = "ZagreusSwordAlt02Attack3",
        FireFxOnSelf = "SwordSwipeC"
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

WeaponData.DarkPoseidonSwordDash =
{
    Name = "DarkPoseidonSword",
    StartingWeapon = false,
    CauseImpactReaction = true,

    AIData =
    {
        FireDuration = 0.3,
        AIAttackDistance = 9999,
        AIBufferDistance = 9999,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0,
        SkipMovement = true,
        SkipAngleTowardTarget = true,
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

WeaponData.DarkPoseidonSwordParry =
{
    Name = "DarkPoseidonSwordParry",
    StartingWeapon = false,
    CauseImpactReaction = true,
    ImpactReactionHitsOverride = 2,
    SkipAttackNotReadySounds = true,

    AIData =
    {
        FireDuration = 0.5,
        AIAttackDistance = 175,
        AIBufferDistance = 175,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0
    },

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
