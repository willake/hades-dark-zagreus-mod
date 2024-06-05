DebugPrint({ Text = "Load DarkChaosShield" })

WeaponData.DarkChaosShield = {
    Name = "DarkChaosShield",
    -- DashWeapon ="ShieldWeaponDash",
    -- SecondaryWeapon = "ShieldThrow",

    AIData =
    {
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AttackDistanceForPostCharge = 600,
        PostFireChargeWeapon = "DarkChaosShieldRush",
        AIMoveWithinRangeTimeout = 0.5,
        SkipAttackAfterMoveTimeout = true,
        PreFireDuration = 0.15,
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
        "ZagreusShield01QuickAttack_Bink",
        "ZagreusShield01DashAttack_Bink",
        "ZagreusShield01Attack_Bink",
        "ZagreusShield01ThrowReceive_Bink",
        "ZagreusShield01Idle_Bink",
        "ZagreusShield01Run_Bink",
        "ZagreusShield01RunStop_Bink",
        "ZagreusShield01HeavyThrow_Bink",
        "ZagreusShieldHeavyThrowNoCatch_Bink",
    },
}

WeaponData.DarkChaosShieldDash = 
{
    Name = "DarkChaosShieldDash",
    StartingWeapon = false,

    AIData =
    {
        AIAngleTowardsPlayerWhileFiring = true,
        SkipMovement = true,
        SkipAngleTowardTarget = true,
        PreFireDuration = 0.12,
        WaitUntilProjectileDeath = "DarkChaosShieldDash",
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

-- originally, there are ShieldThrow and ChaosShieldThrow
-- for this mod will be DarkShieldThrow and DarkShieldThrowBonus
WeaponData.DarkChaosShieldThrow = 
{
    Name = "DarkChaosShieldThrow",
    StartingWeapon = false,
    -- OnHitFunctionNames = { "IncrementHitByShield" },

    AIData =
    {
        AttackDistanceMin = 800,
        AttackDistanceMax = 1000,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0,
        WaitUntilProjectileDeath = "DarkChaosShieldThrow",
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

WeaponData.DarkChaosShieldThrowBonus = 
{
    Name = "DarkChaosShieldThrowBonus",
    StartingWeapon = false,
    OnHitFunctionNames = { "IncrementHitByShield" },

    AIData =
    {
        SkipMovement = true,
        AITrackTargetDuringCharge = true,
        FireDuration = 0.2
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

WeaponData.DarkChaosShieldRush = 
{
    Name = "DarkChaosShieldRush",
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
        PreFireAnimation = "ZagreusShieldAlt01AttackCharge",
        PreFireFx = "BowCharge",
        PreFireSound = "/SFX/Player Sounds/ZagreusBowChargeup",
        FireAnimation = "ZagreusShieldAlt01AttackFire",
        PreFireCancelAnimation = "ZagreusShieldAlt01AttackChargeCancel",
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

WeaponData.DarkChaosShieldThrowProjectileBonusApplicator =
{
    Name = "DarkChaosShieldThrowProjectileBonusApplicator",
}

EffectData.DZThrowProjectileBonus =
{
    OnApplyFunctionName = "DZAIShieldThrowProjectileBonusApply",
    OnClearFunctionName = "DZAIShieldThrowProjectileBonusClear",
}