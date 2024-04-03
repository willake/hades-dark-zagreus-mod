DebugPrint({ Text = "Load DarkBeowulfShield" })

-- for this weapon, I don't know how to activate the
-- speical rush, which is powered by the ranged weapon

WeaponData.DarkBeowulfShield = {
    Name = "DarkBeowulfShield",
    -- DashWeapon ="ShieldWeaponDash",
    -- SecondaryWeapon = "ShieldThrow",

    AIData =
    {
        AIAttackDistance = 300,
        AIBufferDistance = 300,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0,
        FireDuration = 0.3,
        PostFireChargeWeapon = "DarkBeowulfShieldRush",
    },

    Sounds =
    {
        ChargeSounds =
        {
            {
                Name = "/VO/ZagreusEmotes/EmoteCharging_Bow",
                StoppedBy = { "ChargeCancel", "Fired" }
            }
        },
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteHeavyShieldAttack" },
            { Name = "/SFX/Player Sounds/ZagreusShieldSwipe" },
            { Name = "" },

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
        "ZagreusShieldBeowulfQuickAttack_Bink",
        "ZagreusShieldBeowulfDashAttack_Bink",
        "ZagreusShieldBeowulfAttack_Bink",
        "ZagreusShieldBeowulfHeavyBullRush_Bink",
        "ZagreusShieldBeowulfHeavyThrow_Bink",
        "ZagreusShieldBeowulfThrowReceive_Bink",
        "ZagreusShieldBeowulfIdle_Bink",
        "ZagreusShieldBeowulfRun_Bink",
        "ZagreusShieldBeowulfRunStop_Bink",
        "ZagreusShieldHeavyPound_Bink",
        "ZagreusShieldHeavyThrowNoCatch_Bink",
    },
}

WeaponData.DarkBeowulfShieldDash = 
{
    Name = "DarkBeowulfShieldDash",
    StartingWeapon = false,

    AIData =
    {
        FireDuration = 0.45,
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
            { Name = "/VO/ZagreusEmotes/EmoteAttacking_ShieldThrow" },
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

WeaponData.DarkBeowulfShieldThrow = 
{
    Name = "DarkBeowulfShieldThrow",
    StartingWeapon = false,
    OnHitFunctionNames = { "IncrementHitByShield" },

    AIData =
    {
        AIAttackDistance = 800,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 2.5,
        PreFireDuration = 0.2,
        FireAnimation = "ZagreusShieldThrow",
        WaitUntilProjectileDeath = true,
    },
		
    Sounds =
    {
        ChargeSounds =
        {
            {
                Name = "/Leftovers/SFX/AuraCharge",
                Key = "ShieldThrowElectiveCharge",
                StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
                SetPitchToPropertyValue = "ChargeTime",
            },
            {
                Name = "/VO/ZagreusEmotes/EmoteHeavyShieldCharge",
                StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
            }
        },
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteHeavyShieldThrow" },
            { Name = "/SFX/Player Sounds/ZagreusBowFire" },
            { Name = "/SFX/Enemy Sounds/Minotaur/HugeAxeSwing" },
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

WeaponData.DarkBeowulfShieldRush = 
{
    Name = "DarkBeowulfShieldRush",
    StartingWeapon = false,
    CauseImpactReaction = true,
    -- RushOverride = true,
    -- DoProjectileBlockPresentation = true,

    AIData =
    {
        AIAttackDistance = 9999,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0,
        SkipMovement = true,
        PreFireDuration = 0.2,
        PreFireAnimation = "ZagreusShieldBeowulfHeavyBullRush_Charge",
        PreFireFx = "BowCharge",
        PreFireSound = "/SFX/Player Sounds/ZagreusBowChargeup",
        FireAnimation = "ZagreusShieldBeowulfHeavyBullRush_Fire",
        PreFireCancelAnimation = "ZagreusShieldBeowulfAttackChargeCancel",
        MinChargeStartFx = "ShieldCharge",
        -- ChargeFx = "BowCharge",
        IsRangeBasedOnCharge = true,
        MinChargeTime = 0.12, -- 0.2 * 0.6
        MaxChargeTime = 1.5, -- 1 * 1.5
        -- Range = 45,
        -- ChargeRangeMultiplier = 20,
        Velocity = 600,
        ChargeVelocityMultiplier = 5,
        WaitUntilProjectileDeath = true
    },

    Sounds =
    {
        FireSounds =
        {
            PerfectChargeSounds =
            {
                { Name = "/SFX/Player Sounds/ZagreusCriticalFire" },
                { Name = "/SFX/Player Sounds/ZagreusBowFire" },
            },
            { Name = "/VO/ZagreusEmotes/EmoteHeavyShieldRush" },
            { Name = "/SFX/Player Sounds/ZagreusShieldRush" },
        },
        ChargeSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteHeavyShieldBlock" },
            { Name = "/SFX/Player Sounds/ZagreusHeavyShieldStomp" },
            {
                Name = "/SFX/Player Sounds/ZagreusWeaponChargeup",
                Key = "ShieldWeaponRush",
                StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
            },
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

-- this weapon also changes the behavior of ranged weapon (red crystal)
-- but i can't intergate ranged weapon with this mod, so I ignore all of the related actions