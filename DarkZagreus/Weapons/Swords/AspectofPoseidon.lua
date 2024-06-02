DebugPrint({ Text = "Load DarkPoseidonSword" })

WeaponData.DarkPoseidonSword =
{
    Name = "DarkPoseidonSword",

    AIData =
    {
        AIAngleTowardsPlayerWhileFiring = true,
        AIMoveWithinRangeTimeoutMin = 0.3,
        AIMoveWithinRangeTimeoutMax = 0.6,
        SkipAttackAfterMoveTimeout = true,
        SkipAngleTowardTarget = true,
        PreFireDuration = 0.05,
        PreFireAnimation = "ZagreusSwordAlt02Charge1",
        ChainedWeapon = "DarkPoseidonSword2",
        WaitUntilProjectileDeath = "DarkPoseidonSword"
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
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        SkipAngleTowardTarget = true,
        ChainedWeapon = "DarkPoseidonSword3",
        PreFireDuration = 0.13, -- 0.3 
        PreFireAnimation = "ZagreusSwordAlt02Charge2",
        FireAnimation = "ZagreusSwordAlt02Attack2",
        FireFxOnSelf = "SwordSwipeB",
        WaitUntilProjectileDeath = "DarkPoseidonSword2"
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
    }
}

WeaponData.DarkPoseidonSword3 =
{
    Name = "DarkPoseidonSword3",
    StartingWeapon = false,
    CauseImpactReaction = true,

    AIData =
    {
        SkipMovement = true,
        SkipAngleTowardTarget = true,
        PreFireDuration = 0.25,
        PreFireAnimation = "ZagreusSwordAlt02Charge3",
        PreFireFx = "ChargeAttack",
        PreFireSound = "/Leftovers/SFX/AuraCharge",
        FireAnimation = "ZagreusSwordAlt02Attack3",
        FireFxOnSelf = "SwordSwipeC",
        WaitUntilProjectileDeath = "DarkPoseidonSword3"
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
}

WeaponData.DarkPoseidonSwordDash =
{
    Name = "DarkPoseidonSwordDash",
    StartingWeapon = false,
    CauseImpactReaction = true,

    AIData =
    {
        PreFireDuration = 0.05,
        AIAngleTowardsPlayerWhileFiring = true,
        AIMoveWithinRangeTimeout = 1.0,
        SkipMovement = true,
        SkipAngleTowardTarget = true,
        WaitUntilProjectileDeath = "DarkPoseidonSwordDash"
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
        AIMoveWithinRangeTimeoutMin = 0.3,
        AIMoveWithinRangeTimeoutMax = 0.6,
        SkipAttackAfterMoveTimeout = true,
        SkipAngleTowardTarget = true,
        PreFireDuration = 0.28,
        PreFireAnimation = "ZagreusSwordAlt02ParryCharge",
        WaitUntilProjectileDeath = "DarkPoseidonSwordParry"
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
}
