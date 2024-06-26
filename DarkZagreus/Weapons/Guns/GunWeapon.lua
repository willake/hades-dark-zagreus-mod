DebugPrint({ Text = "Load DarkGun" })

WeaponData.DarkGun =
{
    Name = "DarkGun",
    -- DashWeapon = "GunWeaponDash",
    -- SecondaryWeapon = "GunGrenadeToss",
    -- NoAmmoFireSound = "/EmptyCue",
    AIData =
    {
        AttackDistance = 680,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        FireDuration = 0.17, -- 0.07 + 0.1
        AIMoveWithinRangeTimeout = 2,
        SkipAngleTowardTarget = true,
    },
    
    CauseImpactReaction = true,
    ImpactReactionHitsOverride = 1,

    ReloadDelay = 0.2,
    ActiveReloadTime = 0.75,
    IdleReloadAnimation = "DarkZagreusGunReloadStart",
    MovingReloadAnimation = "DarkZagreusGunRunReload",

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
        "ZagreusGun_Bink",
        "ZagreusGunGrenadeToss_Bink",
        "ZagreusGunFireEmpty_Bink",
        "ZagreusGunRun_Bink",
        "ZagreusGunStop_Bink",
    },
}

WeaponData.DarkGunDash =
{
    Name = "DarkGunDash",
    InheritFrom = { "DarkGun" },
    DashWeapon = nil,

    AIData =
    {
        GiveupDistance = 680,
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        FireDuration = 0.1, -- 0.07 + 0.02
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

WeaponData.DarkGunGrenadeToss =
{
    Name = "DarkGunGrenadeToss",
    NotReadyText = "GunReloadingStart",

    CauseImpactReaction = true,
    ImpactReactionHitsOverride = 10,

    AIData =
    {
        AttackDistance = 500,
        AIAngleTowardsPlayerWhileFiring = true,
        AIMoveWithinRangeTimeout = 1.0,
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

-- for aspect of hestia to inherits
WeaponData.DarkSniperGun = {
    InheritFrom = { "DarkGun" },
    DashWeapon = nil,
    OnFiredFunctionName = "ClearManualReloadVFX",

    AIData =
    {
        AttackDistance = 680,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        FireDuration = 0.18, -- 0.07 + 0.1
        AIMoveWithinRangeTimeout = 0.5,
    },
}

WeaponData.DarkSniperGunDash = {
    InheritFrom = { "DarkSniperGun" },
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

-- for aspect of lucifer
WeaponData.DarkGunBomb = 
{
    InheritFrom = { "DarkGunGrenadeToss" },
}

WeaponData.DarkGunBombImmolation = 
{

}

WeaponData.DarkManualReload =
{
    AIData =
    {
        AttackDistance = 680,
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

EffectData.DZGrenadeSelfDamageOutput =
{
    OnApplyFunctionName = "DZAIGrenadeSelfDamageOutputApply",
}