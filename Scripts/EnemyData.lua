-- Replace Hades to Zagreus
-- set phases to only 1
UnitSetData.Enemies.Hades.Phases = 1
UnitSetData.Enemies.Hades.ShrineDataOverwrites.Phases = 1

UnitSetData.Enemies.Hades.DeathAnimation = "ZagreusDeathFullscreen"

-- remove all stages, leaving only 1
UnitSetData.Enemies.Hades.AIStages = 
{
    {
        RandomAIFunctionNames = { "DarkZagreusFistAI" },
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
