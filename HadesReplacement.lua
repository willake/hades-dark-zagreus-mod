-- set phases to only 1
UnitSetData.Enemies.Hades.Phases = 1
UnitSetData.Enemies.Hades.ShrineDataOverwrites.Phases = 1

-- remove all stages, leaving only 1
UnitSetData.Enemies.Hades.AIStages = 
{
    {
        RandomAIFunctionNames = { "AttackerAI" },
        SelectPactLevelAIStage = "PactDataStage0",
        AIData =
        {
            AIEndHealthThreshold = 0.0,
        },
        StageTransitionGlobalVoiceLines = "FatherSonArgumentVoiceLines",
    }
}