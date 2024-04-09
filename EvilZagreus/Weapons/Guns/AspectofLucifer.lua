DebugPrint({ Text = "Load DarkLuciferGun" })

WeaponData.DarkLuciferGun =
{
    Name = "DarkLuciferGun",
    -- DashWeapon = "GunWeaponDash",
    -- SecondaryWeapon = "GunGrenadeToss",
    -- NoAmmoFireSound = "/EmptyCue",

    AIData =
    {
        AIAttackDistance = 900,
        MoveSuccessDistance = 900,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0,
        FireDuration = 0.05,
        CanHold = true
        -- WaitUntilProjectileDeath = true
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
    DashWeapon = nil,
    IdleReloadAnimation = "ZagreusGunLuciferReload_Start",
    MovingReloadAnimation = "ZagreusGunLuciferRunReload",

    OutOfAmmoFunctionName = "GunOutOfAmmoPresentation",
    NoAmmoFunctionName = "GunFailedNoAmmoPresentation",
    LowAmmoSoundThreshold = 5,

    NoAmmoText = "GunReloadingStart",

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
        SkipMovement = true,
        AIAttackDistance = 900,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0,
        FireDuration = 0.05,
        CanHold = true,
        ChainedWeapon = "DarkGun"
        -- WaitUntilProjectileDeath = true
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
        AIAttackDistance = 1000,
        MoveSuccessDistance = 900,
        AIBufferDistance = 1000,
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