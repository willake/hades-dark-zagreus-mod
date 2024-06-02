DebugPrint({ Text = "Load DarkSword" })

WeaponData.DarkSword =
{
    Name = "DarkSword",
    AIData =
    {
        AIAngleTowardsPlayerWhileFiring = true,
        AIMoveWithinRangeTimeoutMin = 0.3,
        AIMoveWithinRangeTimeoutMax = 0.6,
        SkipAttackAfterMoveTimeout = true,
        SkipAngleTowardTarget = true,
        PreFireDuration = 0.05,
        PreFireAnimation = "ZagreusSwordCharge1",
        ChainedWeapon = "DarkSword2",
        WaitUntilProjectileDeath = "DarkSword"
    },

    CauseImpactReaction = true,

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
        "ZagreusSwordArthurAttack1_Bink"
    },
}

WeaponData.DarkSword2 =
{
    Name = "DarkSword2",
    StartingWeapon = false,
    CauseImpactReaction = true,

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        SkipAngleTowardTarget = true,
        ChainedWeapon = "DarkSword3",
        PreFireDuration = 0.13, -- 0.3 
        PreFireAnimation = "ZagreusSwordCharge2",
        FireAnimation = "ZagreusSwordAttack2",
        FireFxOnSelf = "SwordSwipeB",
        WaitUntilProjectileDeath = "DarkSword2"
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

WeaponData.DarkSword3 =
{
    Name = "DarkSword3",
    StartingWeapon = false,
    CauseImpactReaction = true,

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        SkipAngleTowardTarget = true,
        PreFireDuration = 0.25,
        PreFireAnimation = "ZagreusSwordCharge3",
        PreFireFx = "ChargeAttack",
        PreFireSound = "/Leftovers/SFX/AuraCharge",
        FireAnimation = "ZagreusSwordAttack3",
        FireFxOnSelf = "SwordSwipeC",
        WaitUntilProjectileDeath = "DarkSword3"
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

WeaponData.DarkSwordDash =
{
    Name = "DarkSwordDash",
    StartingWeapon = false,
    CauseImpactReaction = true,

    AIData =
    {
        PreFireDuration = 0.05,
        AIAngleTowardsPlayerWhileFiring = true,
        AIMoveWithinRangeTimeout = 1.0,
        SkipMovement = true,
        SkipAngleTowardTarget = true,
        WaitUntilProjectileDeath = "DarkSwordDash"
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

WeaponData.DarkSwordParry =
{
    Name = "DarkSwordParry",
    StartingWeapon = false,

    CauseImpactReaction = true,
    ImpactReactionHitsOverride = 2,

    AIData =
    {
        AIMoveWithinRangeTimeoutMin = 0.3,
        AIMoveWithinRangeTimeoutMax = 0.6,
        SkipAttackAfterMoveTimeout = true,
        SkipAngleTowardTarget = true,
        PreFireDuration = 0.28,
        PreFireAnimation = "ZagreusSwordParryCharge",
        WaitUntilProjectileDeath = "DarkSwordParry"
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
