DebugPrint({ Text = "Load DarkNemesisSword" })

WeaponData.DarkNemesisSword =
{
    Name = "DarkNemesisSword",
    CauseImpactReaction = true,

    AIData =
    {
        AIAngleTowardsPlayerWhileFiring = true,
        AIMoveWithinRangeTimeoutMin = 0.3,
        AIMoveWithinRangeTimeoutMax = 0.6,
        SkipAttackAfterMoveTimeout = true,
        SkipAngleTowardTarget = true,
        PreFireDuration = 0.05,
        PreFireAnimation = "DarkZagreusSwordAlt01Charge1",
        ChainedWeapon = "DarkNemesisSword2",
        WaitUntilProjectileDeath = "DarkNemesisSword"
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
        "ZagreusSword01_Bink",
        "ZagreusSword01ReturnToIdle_Bink",
        "ZagreusSword01DashAttack_Bink",
        "ZagreusSword01Run_Bink",
        "ZagreusSword01RunStop_Bink",
        "ZagreusSword01Parry_Bink"
    },
}

WeaponData.DarkNemesisSword2 =
{
    Name = "DarkNemesisSword2",
    StartingWeapon = false,
    CauseImpactReaction = true,

    AIData =
    {
        SkipMovement = true,
        SkipAngleTowardTarget = true,
        AIAngleTowardsPlayerWhileFiring = true,
        ChainedWeapon = "DarkNemesisSword3",
        PreFireDuration = 0.13, -- 0.3 
        PreFireAnimation = "DarkZagreusSwordAlt01Charge2",
        FireAnimation = "DarkZagreusSwordAlt01Attack2",
        FireFxOnSelf = "SwordSwipeB",
        WaitUntilProjectileDeath = "DarkNemesisSword2"
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
}

WeaponData.DarkNemesisSword3 =
{
    Name = "DarkNemesisSword3",
    StartingWeapon = false,
    CauseImpactReaction = true,

    AIData =
    {
        SkipMovement = true,
        SkipAngleTowardTarget = true,
        AIAngleTowardsPlayerWhileFiring = true,
        PreFireDuration = 0.25,
        PreFireAnimation = "DarkZagreusSwordAlt01Charge3",
        PreFireFx = "ChargeAttack",
        PreFireSound = "/Leftovers/SFX/AuraCharge",
        FireAnimation = "DarkZagreusSwordAlt01Attack3",
        FireFxOnSelf = "SwordSwipeC",
        WaitUntilProjectileDeath = "DarkNemesisSword3"
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
    }
}

WeaponData.DarkNemesisSwordDash =
{
    Name = "DarkNemesisSwordDash",
    StartingWeapon = false,
    CauseImpactReaction = true,

    AIData =
    {
        PreFireDuration = 0.05,
        GiveupDistance = 250,
        AIAngleTowardsPlayerWhileFiring = true,
        AIMoveWithinRangeTimeout = 1.0,
        SkipMovement = true,
        SkipAngleTowardTarget = true,
        WaitUntilProjectileDeath = "DarkNemesisSwordDash"
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
    }
}

WeaponData.DarkNemesisSwordParry =
{
    Name = "DarkNemesisSwordParry",
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
        PreFireAnimation = "DarkZagreusSwordAlt01ParryCharge",
        FireDuration = 0.2,
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
}
