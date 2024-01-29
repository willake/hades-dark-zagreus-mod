WeaponData["EnemySwordWeapon"] =
{
    InheritFrom = { "BaseUnlockableWeapon", },
    EquippedKitAnimation = "WeaponSwordFloatingIdleOff",
    UnequippedKitAnimation = "WeaponSwordFloatingIdle",
    BonusUnequippedKitAnimation = "WeaponSwordFloatingIdleBonus",
    BonusEquippedKitAnimation = "WeaponSwordFloatingIdleOffBonus",
    FirstTimeEquipAnimation = "ZagreusSwordAttack1",
    FirstTimeEquipSound = "/SFX/Enemy Sounds/Minotaur/HugeAxeSwing",
    UseText = "UseWeaponKit",
    UpgradeChoiceText = "UpgradeChoiceMenu_Melee",
    ShortName = "SwordWeapon_Short",
    DashWeapon = "SwordWeaponDash",
    ExpireDashWeaponOnDash = true,
    SecondaryWeapon = "SwordParry",
    PostWeaponUpgradeScreenAnimation = "ZagreusSwordAttack2_ReturnToIdle_Loop",

    CompleteObjectivesOnFire = { "SwordWeapon", "SwordWeaponArthur" },

    KitInteractFunctionName = "WeaponKitSpecialInteractPresentation",
    KitInteractSpecialUnlockSound = "/Leftovers/Menu Sounds/EmoteAscendedArthurChoir",
    KitInteractGameStateRequirements =
    {
        RequiredTextLines = { "NyxRevealsArthurAspect01" },
        RequiredFalsePlayed = { "/VO/ZagreusHome_2047", },
    },
    AIData =
    {
        --PreAttackAnimation = "EnemyHydraBite_Charge",
        --FireAnimation = "EnemyHydraBite_Attack",
        --PostAttackAnimation = "EnemyHydraIdle",
        PreAttackDuration = 0,
        --PreAttackEndDuration = 0.5,
        --PreAttackEndShake = true,
        --PreAttackVelocityWeapon = "HydraBiteSelfVelocity",
        FireDuration = 0.8,
        PostAttackDuration = 0,
        AIAttackDistance = 175,
        AIBufferDistance = 175,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0,
    },

    SkipAttackNotReadySounds = true,

    CauseImpactReaction = true,

    --FireScreenshake = { Distance = 2, Speed = 200, FalloffSpeed = 1400, Duration = 0.1, Angle = 225 },

    HitSimSlowParameters =
    {
        { ScreenPreWait = 0.04, Fraction = 0.1, LerpTime = 0 },
        { ScreenPreWait = 0.01, Fraction = 1.0, LerpTime = 0.03 },
    },

    HitRumbleParameters =
    {
        { ScreenPreWait = 0.02, RightFraction = 0.17, Duration = 0.15 },
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteAttacking_Sword" },
            { Name = "/SFX/Player Sounds/ZagreusSwordSwipe" },
        },
        ImpactSounds =
        {
            Invulnerable = "/SFX/SwordWallHitClank",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/MetalBoneSmash",
            Brick = "/SFX/MetalStoneClang",
            Stone = "/SFX/MetalStoneClang",
            Organic = "/SFX/StabSplatterSmall",
            StoneObstacle = "/SFX/SwordWallHitClank",
            BrickObstacle = "/SFX/SwordWallHitClank",
            MetalObstacle = "/SFX/SwordWallHitClank",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },
    },

    WeaponBinks =
    {
        "ZagreusSword_Bink",
        "ZagreusSwordReturnToIdle_Bink",
        "ZagreusSwordDashAttack_Bink",
        "ZagreusSwordRun_Bink",
        "ZagreusSwordRunStop_Bink",
        "ZagreusSwordParry_Bink",
    },
}
