DebugPrint({ Text = "Load DarkZeusShield" })

WeaponData.DarkZeusShield = {
    Name = "DarkZeusShield",
    -- DashWeapon ="ShieldWeaponDash",
    -- SecondaryWeapon = "ShieldThrow",

    AIData =
    {
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        FireDuration = 0.3,
        PostFireChargeWeapon = "DarkZeusShieldRush",
        AIMoveWithinRangeTimeout = 0.5,
        SkipAttackAfterMoveTimeout = true,
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

WeaponData.DarkZeusShieldDash = 
{
    Name = "DarkZeusShieldDash",
    StartingWeapon = false,

    AIData =
    {
        FireDuration = 0.45,
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

WeaponData.DarkZeusShieldThrow = 
{
    Name = "DarkZeusShieldThrow",
    StartingWeapon = false,
    OnHitFunctionNames = { "IncrementHitByShield" },
    -- RecallOnFailToFire = "ShieldThrow",
    -- NotReadySound = "/SFX/Player Sounds/ZagreusShieldReturn",

    AIData =
    {
        AttackDistanceMin = 800,
        AttackDistanceMax = 1000,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 2.5,
        PreFireDuration = 0.2,
        FireAnimation = "ZagreusShieldThrow",
        FireDuration = 0.2,
        -- WaitUntilProjectileDeath = "DarkZeusShieldThrow",
        IsZeusShieldThrow = true 
        -- while equiping zeus shield, players can throw it and hit it again to make it turn back
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
            Bone = "/SFX/Player Sounds/ElectricZapSmall",
            Brick = "/SFX/Player Sounds/ElectricZapSmall",
            Stone = "/SFX/Player Sounds/ElectricZapSmall",
            Organic = "/SFX/Player Sounds/ElectricZapSmall",
            StoneObstacle = "/SFX/Player Sounds/ElectricZapSmall",
            BrickObstacle = "/SFX/Player Sounds/ElectricZapSmall",
            MetalObstacle = "/SFX/Player Sounds/ElectricZapSmall",
            BushObstacle = "/SFX/Player Sounds/ElectricZapSmall",
        },
    },

    Upgrades =
    {

    },
    SelfMultiplier = 0,
}

WeaponData.DarkZeusShieldRush = 
{
    Name = "DarkZeusShieldRush",
    StartingWeapon = false,
    CauseImpactReaction = true,
    -- RushOverride = true,
    -- DoProjectileBlockPresentation = true,

    AIData =
    {
        AITrackTargetDuringCharge = true,
        SkipMovement = true,
        PreFireDuration = 0.2,
        PreFireAnimation = "ZagreusShieldAlt02AttackCharge",
        PreFireFx = "BowCharge",
        PreFireSound = "/SFX/Player Sounds/ZagreusBowChargeup",
        FireAnimation = "ZagreusShieldAlt02AttackFire",
        PreFireCancelAnimation = "ZagreusShieldAlt02AttackChargeCancel",
        MinChargeStartFx = "ShieldCharge",
        -- ChargeFx = "BowCharge",
        IsRangeBasedOnCharge = true,
        MinChargeTime = 0.2,
        MaxChargeTime = 1,
        -- Range = 45,
        -- ChargeRangeMultiplier = 20,
        Velocity = 600,
        ChargeVelocityMultiplier = 5,
        WaitUntilProjectileDeath = "DarkZeusShieldRush"
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