DebugPrint({ Text = "Load RushWeapon" })

WeaponData.DarkRush =
{
    Name = "DarkRush",
    IgnoreCancelSimOnEffects = { "RushWeaponDisable", "RushWeaponDisableCancelable" },

    AIData =
    {
        AttackDistance = 450,
        SkipAngleTowardTarget = true,
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0,
        FireDuration = 0.05,
        PreFireDuration = 0.07,
        -- WaitUntilProjectileDeath = "DarkRush"
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
}