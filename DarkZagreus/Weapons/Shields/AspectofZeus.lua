DebugPrint({ Text = "Load DarkZeusShield" })

WeaponData.DarkZeusShield = {
    Name = "DarkZeusShield",
    -- DashWeapon ="ShieldWeaponDash",
    -- SecondaryWeapon = "ShieldThrow",

    AIData =
    {
        AIAngleTowardsPlayerWhileFiring = true,
        AttackDistanceForPostCharge = 600,
        PostFireChargeWeapon = "DarkZeusShieldRush",
        AIMoveWithinRangeTimeout = 0.5,
        SkipAttackAfterMoveTimeout = true,
        FireDuration = 0.41, -- no charge time
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
        GiveupDistance = 250,
        AIAngleTowardsPlayerWhileFiring = true,
        SkipMovement = true,
        SkipAngleTowardTarget = true,
        FireDuration = 0.2,
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
        -- PreFireDuration = 0.28,
        FireDuration = 0.4,
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
        AIChargeTargetMarker = "ShadeBowTargetMarker",
        SkipMovement = true,
        PreFireDuration = 0.2,
        PreFireAnimation = "DarkZagreusShieldAlt02AttackCharge",
        PreFireFx = "BowCharge",
        PreFireSound = "/SFX/Player Sounds/ZagreusBowChargeup",
        FireAnimation = "DarkZagreusShieldAlt02AttackFire",
        PreFireCancelAnimation = "DarkZagreusShieldAlt02AttackChargeCancel",
        ChargeFx = "ShieldCharge",
        -- ChargeFx = "BowCharge",
        IsRangeBasedOnCharge = true,
        MinChargeTime = 0.2,
        MaxChargeTime = 1,
        -- Range = 45,
        -- ChargeRangeMultiplier = 20,
        Velocity = 600,
        ChargeVelocityMultiplier = 4,
        FireDuration = 0.3,
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