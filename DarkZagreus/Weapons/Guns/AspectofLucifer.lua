DebugPrint({ Text = "Load DarkLuciferGun" })

WeaponData.DarkLuciferGun =
{
    Name = "DarkLuciferGun",
    -- DashWeapon = "GunWeaponDash",
    -- SecondaryWeapon = "GunGrenadeToss",
    -- NoAmmoFireSound = "/EmptyCue",

    AIData =
    {
        AttackDistance = 650,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        WaitUntilProjectileDeath = "DarkLuciferGun",
        NeedPreWarm = true,
        PreWarmDuration = 0.28,
        PreWarmAnimation = "DarkZagreusGunLucifer_Start",
        PreFireDuration = 0.13,
        PreFireFx = "GunCharge",
        FireDuration = 0.07,
        AIMoveWithinRangeTimeout = 0.5,
        SkipAttackAfterMoveTimeout = true,
    },
    
    CauseImpactReaction = true,
    ImpactReactionHitsOverride = 1,

    ReloadDelay = 0.2,
    ActiveReloadTime = 0.75,
    CancelUnitHitFlash = true,
    RapidDamageType = true,
    CancelUnitShake = true,
    CancelArmorUnitShake = true,
    CancelArmorSpark = true,
    -- DashWeapon = nil,
    IdleReloadAnimation = "DarkZagreusGunLuciferReload_Start",
    MovingReloadAnimation = "DarkZagreusGunLuciferRunReload",

    -- OutOfAmmoFunctionName = "GunOutOfAmmoPresentation",
    -- NoAmmoFunctionName = "GunFailedNoAmmoPresentation",
    LowAmmoSoundThreshold = 5,

    -- NoAmmoText = "GunReloadingStart",

    Sounds =
    {
        FireSounds =
        {
        --	{ Name = "/VO/ZagreusEmotes/EmoteHeavyGunFire" },
        --	{ Name = "/SFX/Player Sounds/ZagreusGunFire" },
        },
        LowAmmoFireSounds =
        {
        --	{ Name = "/SFX/Player Sounds/ZagreusGunFire" },
        --	{ Name = "/SFX/Player Sounds/ZagreusGunReloadCompleteFlash" },
        },
        ImpactSounds =
        {
            Invulnerable = "/SFX/BurnDamage",
            Armored = "/SFX/BurnDamage",
            Bone = "/SFX/BurnDamage",
            Brick = "/SFX/BurnDamage",
            Stone = "/SFX/BurnDamage",
            Organic = "/SFX/BurnDamage",
            StoneObstacle = "/SFX/BurnDamage",
            BrickObstacle = "/SFX/BurnDamage",
            MetalObstacle = "/SFX/BurnDamage",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },
    },

    WeaponBinks =
    {
        "ZagreusGunLucifer_Bink",
        "ZagreusGunLuciferIdle_Bink",
        "ZagreusGunLuciferRun_Bink",
        "ZagreusGunLuciferStop_Bink",
        "ZagreusGunLuciferFireEmpty_Bink",
        "ZagreusGunLuciferGrenadeToss_Bink",
    },
}

WeaponData.DarkLuciferGunDash =
{
    Name = "DarkLuciferGunDash",
    InheritFrom = { "DarkLuciferGun" },
    DashWeapon = nil,

    AIData =
    {
        GiveupDistance = 680,
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        -- FireDuration = 0.05,
        -- CanHold = true,
        -- ChainedWeapon = "DarkGun",
        WaitUntilProjectileDeath = "DarkLuciferGunDash",
        NeedPreWarm = true,
        PreWarmDuration = 0.3,
        PreWarmAnimation = "DarkZagreusGunLucifer_Start"
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteCharging_Bow" },
            { Name = "/SFX/Player Sounds/ZagreusGunFire" },
        },
        LowAmmoFireSounds =
        {
            { Name = "/SFX/Player Sounds/ZagreusGunFire" },
            { Name = "/SFX/Player Sounds/ZagreusGunReloadCompleteFlash" },
        },
        ImpactSounds =
        {
            Invulnerable = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/ArrowMetalBoneSmash",
            Brick = "/SFX/ArrowMetalStoneClang",
            Stone = "/SFX/ArrowMetalStoneClang",
            Organic = "/SFX/GunBulletOrganicImpact",
            StoneObstacle = "/SFX/ArrowWallHitClankSmall",
            BrickObstacle = "/SFX/ArrowWallHitClankSmall",
            MetalObstacle = "/SFX/ArrowWallHitClankSmall",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },
    },

}

WeaponData.DarkLuciferGunGrenadeToss =
{
    Name = "DarkLuciferGunGrenadeToss",
    NotReadyText = "GunReloadingStart",

    CauseImpactReaction = true,
    ImpactReactionHitsOverride = 10,

    AIData =
    {
        AttackDistance = 500,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0,
        FireDuration = 0.2
    },

    Sounds =
    {
        ChargeSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteHeavyGunCharge" },
        },
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteHeavyGunLob" },
        },
        ImpactSounds =
        {
            Invulnerable = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/ArrowMetalBoneSmash",
            Brick = "/SFX/ArrowMetalStoneClang",
            Stone = "/SFX/ArrowMetalStoneClang",
            Organic = "/SFX/ArrowImpactSplatter",
            StoneObstacle = "/SFX/ArrowWallHitClankSmall",
            BrickObstacle = "/SFX/ArrowWallHitClankSmall",
            MetalObstacle = "/SFX/ArrowWallHitClankSmall",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },
    },

    SelfMultiplier = 0.01,
}

WeaponData.DarkLuciferGunBomb = {
    InheritFrom = { "DarkGunBomb" }
}

WeaponData.DarkLuciferGunBombImmolation = {
    InheritFrom = { "DarkGunBombImmolation" }
}

-- {
--     WeaponName = "RushWeapon",
--     EffectName = "RushWeaponInvulnerable",
--     EffectProperty = "ClearOnAttack",
--     ChangeValue = true,
--     ChangeType = "Absolute",
--     ExcludeLinked = true,
-- }

-- {
--     WeaponName = "RushWeapon",
--     EffectName = "RushWeaponInvulnerable",
--     EffectProperty = "ClearOnAttack",
--     ChangeValue = true,
--     ChangeType = "Absolute",
--     ExcludeLinked = true,
-- },