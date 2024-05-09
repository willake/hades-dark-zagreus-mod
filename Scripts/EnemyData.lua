-- Replace Hades to Zagreus
-- set phases to only 1
UnitSetData.Enemies.Hades.MaxHealth = 1000
UnitSetData.Enemies.Hades.Phases = 1
UnitSetData.Enemies.Hades.ShrineDataOverwrites.Phases = 1
UnitSetData.Enemies.Hades.ShrineDataOverwrites.MaxHealth = 1000

-- UnitSetData.Enemies.Hades.DeathAnimation = "ZagreusDeathFullscreen"

-- remove all stages, leaving only 1
UnitSetData.Enemies.Hades.AIStages = 
{
    {
        RandomAIFunctionNames = { "DarkZagreusAI" },
        SelectPactLevelAIStage = "PactDataStage0",
        AIData =
        {
            AIEndHealthThreshold = 0.0,
        },
        StageTransitionGlobalVoiceLines = "FatherSonArgumentVoiceLines",
    }
}

UnitSetData.Enemies.Hades.WeaponOptions = { }

UnitSetData.Enemies.Hades.PactDataStage0 = 
{
    Default = {
    },

    [4] = {
        UnequipWeapons = { },
        EquipWeapons = {  },
    },
}

UnitSetData.Enemies.Hades.DefaultAIData =
{
    -- PreAttackEndFunctionName = "EnemyHandleInvisibleAttack",
    -- PreAttackEndFunctionArgs = { Animation = "HadesReappear" },
    -- InvisibilityFadeOutDuration = 1.0,
    -- InvisibilityFadeInDuration = 0.3,
    -- PostTeleportWaitDurationMin = 1.0,
    -- PostTeleportWaitDurationMax = 2.0,
    -- PostInvisibilityFunction = "HadesTeleport",

    DashWeapon = "EnemyRushWeapon",
    -- PreAttackDash = "HadesSideDash",
    DashIfOverDistance = 500,
}


-- for aspect of lucifer
UnitSetData.Enemies.DarkGunBombUnit =
{
    InheritFrom = { "BaseTrap" },

    MaxHealth = 9999,
    FlashOnFuse = true,
    FuseDuration = 0.2,
    OnDamagedFunctionName = "ActivateLuciferFuse",
    FuseActivationSound = "/Leftovers/SFX/CurSprint",
    --FuseAnimation = "BlastCubeLit",
    CanStoreAmmo = false,
    OnHitShake = { Distance = 3, Speed = 600, Duration = 0.15 },


    OnDeathShakeScreenSpeed = 150,
    OnDeathShakeScreenDistance = 4,
    OnDeathShakeScreenDuration = 0.25,
    OnDeathShakeScreenFalloff = 1500,

    AlwaysTraitor = true,
    OnDeathFunctionName = "GunBombDetonate",

    AdditionalEnemySetupFunctionName = "SetUpGunBombImmolation",
    ImmolationInterval = 1.0,
    IncomingDamageModifiers =
    {
        {
            Name = "ImmolationImmunity",
            ValidWeapons = {"GunBombImmolation"},
            ValidWeaponMultiplier = 0,
            Multiplicative = true,
        },
    },
}