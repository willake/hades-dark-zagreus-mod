DebugPrint({ Text = "Load DarkShield" })

WeaponData.DarkShield = {
    Name = "DarkShield",
    -- DashWeapon ="ShieldWeaponDash",
    -- SecondaryWeapon = "ShieldThrow",

    AIData =
    {
        AIAngleTowardsPlayerWhileFiring = true,
        AttackDistanceForPostCharge = 600,
        PostFireChargeWeapon = "DarkShieldRush",
        AIMoveWithinRangeTimeout = 0.5,
        SkipAttackAfterMoveTimeout = true,
        PreFireDuration = 0.15,
        WaitUntilProjectileDeath = "DarkShield",
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteAttacking_Shield" },
            { Name = "/SFX/Player Sounds/ZagreusShieldSwipe" },
        },
        ImpactSounds =
        {
            Invulnerable = "/SFX/SwordWallHitClank",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/MetalBoneSmashSHIELD",
            Brick = "/SFX/MetalStoneClangSHIELD",
            Stone = "/SFX/MetalStoneClangSHIELD",
            Organic = "/SFX/MetalOrganicHitSHIELD",
            StoneObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
            BrickObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
            MetalObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },
    },

    Upgrades = { },

    WeaponBinks =
    {
        "ZagreusShieldThrowReceive_Bink",
        "ZagreusShieldQuickAttack_Bink",
        "ZagreusShieldAttack_Bink",
        "ZagreusShieldDashAttack_Bink",
        "ZagreusShieldRun_Bink",
        "ZagreusShieldRunStop_Bink",
        "ZagreusShieldWalk_Bink",
        "ZagreusShieldIdle_Bink",
        "ZagreusShieldHeavyThrow_Bink",
        "ZagreusShieldHeavyThrowNoCatch_Bink",
    },
}

WeaponData.DarkShieldDash = 
{
    Name = "DarkShieldDash",
    StartingWeapon = false,

    AIData =
    {
        GiveupDistance = 250,
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        SkipAngleTowardTarget = true,
        PreFireDuration = 0.12,
        WaitUntilProjectileDeath = "DarkShieldDash",
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteAttacking_Shield" },
            { Name = "/SFX/Player Sounds/ZagreusShieldSwipe" },
        },
        ImpactSounds =
        {
            Invulnerable = "/SFX/SwordWallHitClank",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/MetalBoneSmashSHIELD",
            Brick = "/SFX/MetalStoneClangSHIELD",
            Stone = "/SFX/MetalStoneClangSHIELD",
            Organic = "/SFX/MetalOrganicHitSHIELD",
            StoneObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
            BrickObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
            MetalObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },
    },

    Upgrades = { },
}

WeaponData.DarkShieldThrow = 
{
    Name = "DarkShieldThrow",
    StartingWeapon = false,
    OnHitFunctionNames = { "IncrementHitByShield" },

    AIData =
    {
        AttackDistanceMin = 800,
        AttackDistanceMax = 1000,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0,
        WaitUntilProjectileDeath = "DarkShieldThrow",
        PreFireDuration = 0.28,
    },
		
    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteRanged" },
            { Name = "/SFX/Player Sounds/ZagreusBowFire" },
            { Name = "/SFX/Player Sounds/ZagreusSpearThrow" },
        },
        ImpactSounds =
        {
            Invulnerable = "/SFX/SwordWallHitClank",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Brick = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Stone = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Organic = "/SFX/Player Sounds/ZagreusShieldRicochet",
            StoneObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
            BrickObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
            MetalObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
            BushObstacle = "/SFX/Player Sounds/ZagreusShieldRicochet",
        },
    },

    Upgrades =
    {

    },
    SelfMultiplier = 0,
}

WeaponData.DarkShieldRush = 
{
    Name = "DarkShieldRush",
    StartingWeapon = false,
    CauseImpactReaction = true,
    -- RushOverride = true,
    -- DoProjectileBlockPresentation = true,

    AIData =
    {
        SkipMovement = true,
        AITrackTargetDuringCharge = true,
        AIChargeTargetMarker = "ShadeBowTargetMarker",
        AIMoveWithinRangeTimeout = 1.0,
        PreFireDuration = 0.2,
        PreFireAnimation = "DarkZagreusShieldAttackCharge",
        PreFireFx = "BowCharge",
        PreFireSound = "/SFX/Player Sounds/ZagreusBowChargeup",
        FireAnimation = "DarkZagreusShieldAttackFire",
        PreFireCancelAnimation = "DarkZagreusShieldAttackChargeCancel",
        MinChargeStartFx = "ShieldCharge",
        -- ChargeFx = "BowCharge",
        IsRangeBasedOnCharge = true,
        MinChargeTime = 0.2,
        MaxChargeTime = 1,
        -- Range = 45,
        -- ChargeRangeMultiplier = 20,
        Velocity = 600,
        ChargeVelocityMultiplier = 5,
        FireDuration = 0.2,
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
            { Name = "/VO/ZagreusEmotes/EmoteParrying" },
            { Name = "/SFX/Player Sounds/ZagreusShieldRush" },
        },
        ChargeSounds =
        {
            {
                Name = "/SFX/Player Sounds/ZagreusWeaponChargeup",
                Key = "ShieldWeaponRush",
                StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
                SetPitchToPropertyValue = "ChargeTime",
            },
            {
                Name = "/VO/ZagreusEmotes/EmoteRangedCharging",
                StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
            }
        },
        ImpactSounds =
        {
            Invulnerable = "/SFX/SwordWallHitClank",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/MetalBoneSmashSHIELD",
            Brick = "/SFX/MetalStoneClangSHIELD",
            Stone = "/SFX/MetalStoneClangSHIELD",
            Organic = "/SFX/MetalOrganicHitSHIELD",
            StoneObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
            BrickObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
            MetalObstacle = "/SFX/Player Sounds/ShieldObstacleHit",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },
    },

    Upgrades = { },
}