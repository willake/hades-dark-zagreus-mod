DebugPrint({ Text = "Load DarkHestiaGun" })

WeaponData.DarkHestiaGun =
{
    Name = "DarkHestiaGun",
    -- DashWeapon = "GunWeaponDash",
    -- SecondaryWeapon = "GunGrenadeToss",
    -- NoAmmoFireSound = "/EmptyCue",
    AIData =
    {
        AttackDistance = 680,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        FireDuration = 0.18, -- 0.07 + 0.1
        AIMoveWithinRangeTimeout = 0.5,
    },
    
    CauseImpactReaction = true,
    ImpactReactionHitsOverride = 1,

    ReloadDelay = 0.2,
    ActiveReloadTime = 0.75,
    IdleReloadAnimation = "DarkZagreusGunAlt01ReloadStart",
    MovingReloadAnimation = "DarkZagreusGunAlt01RunReload",

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
        "ZagreusGun01_Bink",
        "ZagreusGun01Run_Bink",
        "ZagreusGun01GrenadeToss_Bink",
        "ZagreusGun01Stop_Bink",
        "ZagreusGun01FireEmpty_Bink",
    },
}

WeaponData.DarkHestiaGunDash =
{
    Name = "DarkHestiaGunDash",
    InheritFrom = { "DarkHestiaGun" },
    DashWeapon = nil,

    IdleReloadAnimation = "DarkZagreusGunAlt01ReloadStart",
    MovingReloadAnimation = "DarkZagreusGunAlt01RunReload",

    AIData =
    {
        GiveupDistance = 680,
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        FireDuration = 0.1, -- 0.07 + 0.02
        SkipAngleTowardTarget = true
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

WeaponData.DarkHestiaGunGrenadeToss =
{
    Name = "DarkHestiaGunGrenadeToss",
    NotReadyText = "GunReloadingStart",

    CauseImpactReaction = true,
    ImpactReactionHitsOverride = 10,

    AIData =
    {
        AttackDistance = 500,
        AIAngleTowardsPlayerWhileFiring = true,
        AIMoveWithinRangeTimeout = 2,
        FireDuration = 0.28
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

WeaponData.DarkHestiaSniperGun = {
    Name = "DarkHestiaSniperGun",
    InheritFrom = { "DarkHestiaGun" },
    DashWeapon = nil,
    OnFiredFunctionName = "DZAIClearManualReloadVFX",

    AIData =
    {
        AttackDistance = 680,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        FireDuration = 0.18, -- 0.07 + 0.1
        AIMoveWithinRangeTimeout = 0.5,
    },
}

WeaponData.DarkHestiaSniperGunDash = {
    Name = "DarkHestiaSniperGunDash",
    InheritFrom = { "DarkHestiaSniperGun" },
    -- DashWeapon = SniperGunWeaponDash,

    AIData =
    {
        GiveupDistance = 680,
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        FireDuration = 0.1, -- 0.07 + 0.02
    },
}

WeaponData.DZManualReloadEffectApplicator =
{
    -- CompleteObjectivesOnFire = { "ManualReload" },
}

EffectData.DZManualReloadBonus =
{
    OnApplyFunctionName = "DZAIManualReloadBonusApply",
    OnClearFunctionName = "DZAIManualReloadBonusClear",
}