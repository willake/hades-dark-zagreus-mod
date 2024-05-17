DebugPrint({ Text = "Load DarkErisGun" })

WeaponData.DarkErisGun =
{
    Name = "DarkErisGun",
    -- DashWeapon = "GunWeaponDash",
    -- SecondaryWeapon = "GunGrenadeToss",
    -- NoAmmoFireSound = "/EmptyCue",
    AIData =
    {
        AttackDistance = 680,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        -- FireDuration = 0.05,
        -- CanHold = true
        WaitUntilProjectileDeath = true
    },
    
    CauseImpactReaction = true,
    ImpactReactionHitsOverride = 1,

    ReloadDelay = 0.2,
    ActiveReloadTime = 0.75,
    IdleReloadAnimation = "ZagreusGunAlt02ReloadStart",
				MovingReloadAnimation = "ZagreusGunAlt02RunReload",

    OutOfAmmoFunctionName = "GunOutOfAmmoPresentation",
    NoAmmoFunctionName = "GunFailedNoAmmoPresentation",
    LowAmmoSoundThreshold = 5,

    NoAmmoText = "GunReloadingStart",

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

    WeaponBinks =
    {
        "ZagreusGun02_Bink",
        "ZagreusGun02Run_Bink",
        "ZagreusGun02GrenadeToss_Bink",
        "ZagreusGun02Stop_Bink",
        "ZagreusGun02FireEmpty_Bink",
    },
}

WeaponData.DarkErisGunDash =
{
    Name = "DarkErisGunDash",
    InheritFrom = { "DarkErisGun" },
    DashWeapon = nil,

    IdleReloadAnimation = "ZagreusGunAlt02ReloadStart",
				MovingReloadAnimation = "ZagreusGunAlt02RunReload",

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        -- FireDuration = 0.05,
        -- CanHold = true,
        -- ChainedWeapon = "DarkGun"
        WaitUntilProjectileDeath = true
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

WeaponData.DarkErisGunGrenadeToss =
{
    Name = "DarkErisGunGrenadeToss",
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
            { Name = "/VO/ZagreusEmotes/EmoteCharging_Bow" },
        },
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteAttacking_Bow" },
            { Name = "/SFX/Player Sounds/ZagreusGunGrenadeLaunchFire" },
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