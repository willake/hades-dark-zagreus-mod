if not DarkZagreus.Config.Enabled then return end 

-- Replace Hades to Zagreus
-- set phases to only 1
UnitSetData.Enemies.Hades.MaxHealth = 14000
UnitSetData.Enemies.Hades.Phases = 1
UnitSetData.Enemies.Hades.ShrineDataOverwrites.Phases = 1
UnitSetData.Enemies.Hades.ShrineDataOverwrites.MaxHealth = 20000

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

UnitSetData.Enemies.Hades.SpawnAnimation = "DarkZagreusIdle"
UnitSetData.Enemies.Hades.AISetupDelay = 2.5

UnitSetData.Enemies.Hades.DefaultAIData =
{
}

UnitSetData.Enemies.Hades.HealthBarTextId = "DarkZagreus_Full"

UnitSetData.Enemies.Hades.BossPresentationIntroTextLineSets = nil
UnitSetData.Enemies.Hades.BossPresentationSuperPriorityIntroTextLineSets =
{
    MeetDarkZagreus01 =
    {
        { Cue = nil, Portrait = "Portrait_Zag_Empathetic_01", Speaker = "CharProtag",
            PreLineAnim = "ZagreusTalkDenialStart", PreLineAnimTarget = "Hero",
            PostLineAnim = "ZagreusTalkDenialReturnToIdle", PostLineAnimTarget = "Hero",
            Text = "Who... who are you?" },
        { Cue = nil,
            PostLineAnim = "DarkZagreusIdle", Portrait = "Portrait_DarkZag_Serious_01", Speaker = "NPC_DarkZag_01",
            AngleTowardTargetId = 40000,
            PreLineFunctionName = "StartFinalBossRoomIntroMusic",
            PostLineFunctionName = "StartFinalBossRoomMusic",
            PreContentSound = "/Leftovers/Menu Sounds/TextReveal3",
            Text = "..." },
    },
}
UnitSetData.Enemies.Hades.BossPresentationPriorityIntroTextLineSets = nil
UnitSetData.Enemies.Hades.BossPresentationTextLineSets = nil
UnitSetData.Enemies.Hades.BossPresentationRepeatableTextLineSets = nil
UnitSetData.Enemies.Hades.LowHealthVoiceLines = nil
UnitSetData.Enemies.Hades.DefeatedVoiceLines = nil
UnitSetData.Enemies.Hades.BossKillVoiceLines = nil
UnitSetData.Enemies.Hades.RepulseOnMeleeInvulnerableHit = nil

UnitSetData.Enemies.Hades.DeathAnimation = "DarkZagreusDeadStartBlood" -- ZagreusDeathFullScreen is not transparent background so I can't use it
UnitSetData.Enemies.Hades.OnDeathFunctionName = "DZDarkZagreusKillPresentation"
UnitSetData.Enemies.Hades.OnDeathFunctionArgs = { 
    Message = "DarkZagreusDefeatedMessage", 
    StartPanTime = 1.5, 
    MessageLayer = "ScreenOverlay", 
    MessageDelay = 1.5, 
    MessageDuration = 2.5, 
    AddInterBiomeTimerBlock = true }


-- for aspect of lucifer
UnitSetData.Enemies.DarkGunBombUnit =
{
    InheritFrom = { "BaseTrap" },

    MaxHealth = 9999,
    FlashOnFuse = true,
    FuseDuration = 0.2,
    OnDamagedFunctionName = "DZAIActivateLuciferFuse",
    FuseActivationSound = "/Leftovers/SFX/CurSprint",
    --FuseAnimation = "BlastCubeLit",
    CanStoreAmmo = false,
    OnHitShake = { Distance = 3, Speed = 600, Duration = 0.15 },


    OnDeathShakeScreenSpeed = 150,
    OnDeathShakeScreenDistance = 4,
    OnDeathShakeScreenDuration = 0.25,
    OnDeathShakeScreenFalloff = 1500,

    AlwaysTraitor = true,
    OnDeathFunctionName = "DZAIGunBombDetonate",

    AdditionalEnemySetupFunctionName = "DZAISetUpGunBombImmolation",
    ImmolationInterval = 1.0,
    -- IncomingDamageModifiers =
    -- {
    --     {
    --         Name = "ImmolationImmunity",
    --         ValidWeapons = {"GunBombImmolation"},
    --         ValidWeaponMultiplier = 0,
    --         Multiplicative = true,
    --     },
    -- },
}

EnemyData.Hades = UnitSetData.Enemies.Hades
EnemyData.DarkGunBombUnit = UnitSetData.Enemies.DarkGunBombUnit 

-- TODO: should handle HadesKillPresentation as well