DebugPrint({ Text = "Load SwordWeapon" })

WeaponData.DarkSword =
{
    Name = "DarkSword",
    AIData =
    {
        --PreAttackAnimation = "EnemyHydraBite_Charge",
        --FireAnimation = "EnemyHydraBite_Attack",
        --PostAttackAnimation = "EnemyHydraIdle",
        -- PreAttackDuration = 0,
        --PreAttackEndDuration = 0.5,
        --PreAttackEndShake = true,
        --PreAttackVelocityWeapon = "HydraBiteSelfVelocity",
        -- FireDuration = 0.8,
        -- PostAttackDuration = 0,
        AIAttackDistance = 175,
        AIBufferDistance = 175,
        AIAngleTowardsPlayerWhileFiring = true,
        -- AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0,
        ChainedWeapon = "DarkSword2"
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
        --PreAttackAnimation = "EnemyHydraBite_Charge",
        --FireAnimation = "EnemyHydraBite_Attack",
        --PostAttackAnimation = "EnemyHydraIdle",
        -- PreAttackDuration = 0,
        --PreAttackEndDuration = 0.5,
        --PreAttackEndShake = true,
        --PreAttackVelocityWeapon = "HydraBiteSelfVelocity",
        -- FireDuration = 0.8,
        PostAttackDuration = 0,
        AIAttackDistance = 175,
        AIBufferDistance = 175,
        -- AIAngleTowardsPlayerWhileFiring = true,
        -- AITrackTargetDuringCharge = true,
        -- AIMoveWithinRangeTimeout = 1.0,
        ChainedWeapon = "DarkSword3",
        SkipMovement = true,
        SkipAngleTowardTarget = true
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
        --PreAttackAnimation = "EnemyHydraBite_Charge",
        --FireAnimation = "EnemyHydraBite_Attack",
        --PostAttackAnimation = "EnemyHydraIdle",
        -- PreAttackDuration = 0,
        --PreAttackEndDuration = 0.5,
        --PreAttackEndShake = true,
        --PreAttackVelocityWeapon = "HydraBiteSelfVelocity",
        -- FireDuration = 0.8,
        -- PostAttackDuration = 0,
        AIAttackDistance = 175,
        AIBufferDistance = 175,
        -- AIAngleTowardsPlayerWhileFiring = true,
        -- AITrackTargetDuringCharge = true,
        -- AIMoveWithinRangeTimeout = 1.0,
        SkipMovement = true,
        SkipAngleTowardTarget = true
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

WeaponData.DarkSwordParry =
{
    Name = "DarkSwordParry",
    StartingWeapon = false,

    CauseImpactReaction = true,
    ImpactReactionHitsOverride = 2,

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
