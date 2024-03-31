DebugPrint({ Text = "Load DarkArthurSword" })

WeaponData.DarkArthurSword =
{
    Name = "DarkArthurSword",
    CauseImpactReaction = true,

    AIData =
    {
        AIAttackDistance = 300,
        AIBufferDistance = 300,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0,
        ChainedWeapon = "DarkArthurSword2",
        PreFireDuration = 0.3,
        PreFireAnimation = "ZagreusSwordArthurAttack1_Charge",
        FireDuration = 0.2,
        FireAnimation = "ZagreusSwordArthurAttack1_Fire",
        FireFxOnSelf = "SwordSwipeC-Arthur"
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
        "ZagreusSwordArthurIdle_Bink",
        "ZagreusSwordArthurRun_Bink",
        "ZagreusSwordArthurRunStop_Bink",
        "ZagreusSwordArthurAttack1_Bink",
        "ZagreusSwordArthurAttack2_Bink",
        "ZagreusSwordArthurAttack3_Bink",
        "ZagreusSwordArthurAttackParry_Bink",
    },
}

WeaponData.DarkArthurSword2 =
{
    Name = "DarkArthurSword2",
    StartingWeapon = false,
    CauseImpactReaction = true,

    AIData =
    {
        FireDuration = 0.435,
        AIAttackDistance = 9999,
        AIBufferDistance = 9999,
        SkipMovement = true,
        SkipAngleTowardTarget = true,
        ChainedWeapon = "DarkArthurSword3",
        PreFireDuration = 0.3, -- 0.3
        PreFireAnimation = "ZagreusSwordArthurAttack2_Charge",
        PreFireFx = "ChargeAttack-Arthur",
        PreFireSound = "/VO/ZagreusEmotes/EmoteCharging",
        FireAnimation = "ZagreusSwordArthurAttack2_Fire",
        FireFxOnSelf = "SwordSwipeA-Arthur"
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteAttacking_Sword" },
            { Name = "/SFX/Player Sounds/ZagreusSwordSwipe" },
        },
        ChargeSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteCharging" },
            {
                Name = "/SFX/Player Sounds/ZagreusWeaponChargeup" ,
                StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
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

WeaponData.DarkArthurSword3 =
{
    Name = "DarkArthurSword3",
    StartingWeapon = false,
    CauseImpactReaction = true,

    AIData =
    {
        FireDuration = 0.425,
        AIAttackDistance = 9999,
        AIBufferDistance = 9999,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0,
        SkipMovement = true,
        SkipAngleTowardTarget = true,
        PreFireDuration = 0.3,
        PreFireAnimation = "ZagreusSwordArthurAttack3_Charge",
        PreFireFx = "ChargeAttack-Arthur",
        PreFireSound = "/VO/ZagreusEmotes/EmoteHeavyCharging",
        FireAnimation = "ZagreusSwordArthurAttack3_Fire",
        FireFxOnSelf = "SwordSwipeAFlipped-Arthur"
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteHeavyAttacking" },
            { Name = "/SFX/Enemy Sounds/Minotaur/HugeAxeSwing" }
        },
        ChargeSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteHeavyCharging" },
            {
                Name = "/Leftovers/SFX/AuraCharge" ,
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

WeaponData.DarkArthurSwordDash =
{
    Name = "DarkArthurSwordDash",
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
        PreFireDuration = 0.3,
        PreFireAnimation = "ZagreusSwordArthurAttack1_Charge",
        SkipMovement = true,
        SkipAngleTowardTarget = true,
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteSpearThrow" },
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

    Upgrades = {},
}

WeaponData.DarkArthurSwordParry =
{
    Name = "DarkArthurSwordParry",
    StartingWeapon = false,
    CauseImpactReaction = true,
    ImpactReactionHitsOverride = 2,
    SkipAttackNotReadySounds = true,

    AIData =
    {
        -- PreFireDuration = 0.3, -- should be 0.5, but it looks weird
        FireDuration = 0.5,
        AIAttackDistance = 175,
        AIBufferDistance = 175,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0,
        PostFireWeapon = "DarkConsecrationField",
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

WeaponData.DarkConsecrationField =
{
    Name = "DarkConsecrationField",
    StartingWeapon = false,

    AIData =
    {
        -- PreFireDuration = 0.3, -- should be 0.5, but it looks weird
        FireDuration = 0.2,
        AIAttackDistance = 9999,
        AIBufferDistance = 9999,
    },

    OnFiredFunctionName = "DisableTraps",
    OnFiredFunctionArgs = { Range = 450, Duration = 8 },
}