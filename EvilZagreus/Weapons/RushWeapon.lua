DebugPrint({ Text = "Load RushWeapon" })

WeaponData.EnemyRushWeapon =
{
    Name = "EnemyRushWeapon",
    IgnoreCancelSimOnEffects = { "RushWeaponDisable", "RushWeaponDisableCancelable" },
    --[[
    CancelEffectSimSlowParameters =
    {
        { ScreenPreWait = 0.0, Fraction = 0.01, LerpTime = 0 },
        { ScreenPreWait = 0.02, Fraction = 0.1, LerpTime = 0.07 },
        { ScreenPreWait = 0.04, Fraction = 1.0, LerpTime = 0.1 },
    },
    ]]
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
        AIAttackDistance = 500,
        AIBufferDistance = 500,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0,
    },

    CompleteObjectivesOnFire = { "RushWeapon", "RushWeaponGilgamesh" },

    FireRumbleParameters =
    {
        --{ ScreenPreWait = 0.02, Fraction = 0.125, Duration = 0.1 },
    },

    SimSlowBlur =
    {
        Strength = 0.3,
        Distance = 1.6,
        FXInTime = 0.06,
        FXHoldTime = 0.4,
        FXOutTime = 0.4,
    },

    SkipAttackNotReadySounds = true,
    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteEvading" },
            { Name = "/SFX/Player Sounds/ZagreusDash" },
        },

        ImpactSounds =
        {
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/FistImpactMedium",
            Brick = "/SFX/FistImpactMedium",
            Stone = "/SFX/FistImpactMedium",
            Organic = "/SFX/FistImpactMedium",
        },

        CancelEffectSounds =
        {
        },

        NearbyEnemyFireSounds =
        {
            { Name = "/Leftovers/Menu Sounds/TitanToggleShort" },
        },
    },

    NoExpressiveAnim = true,

    Upgrades = { },
}