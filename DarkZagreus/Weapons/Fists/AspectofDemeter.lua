DebugPrint({ Text = "Load DarkDemeterFist" })

WeaponData.DarkDemeterFist = 
{
    Name = "DarkDemeterFist",
    -- DashWeapon = "FistWeaponDash",
    -- DashSwaps = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
    -- ExpireDashWeaponOnDash = true,
    -- SecondaryWeapon = "FistWeaponSpecial",
    ComboPoints = 1,
    CauseImpactReaction = true,
    UseComboPower = true,
    
    AIData =
    {
        AIAngleTowardsPlayerWhileFiring = true,
        ChainedWeapon = "DarkDemeterFist2",
        FireDuration = 0.2,
        -- WaitUntilProjectileDeath = true,
        CanDoCombo = true,
        AIMoveWithinRangeTimeout = 0.5,
        SkipAttackAfterMoveTimeout = true,
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteAttacking_Fist1" },
            { Name = "/SFX/Player Sounds/ZagreusFistWhoosh" },
        },
        ImpactSounds =
        {
            Invulnerable = "/SFX/SwordWallHitClank",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/FistImpactSmall",
            Brick = "/SFX/FistImpactSmall",
            Stone = "/SFX/FistImpactSmall",
            Organic = "/SFX/FistImpactSmall",
            StoneObstacle = "/SFX/FistImpactSmall",
            BrickObstacle = "/SFX/FistImpactSmall",
            MetalObstacle = "/SFX/FistImpactSmall",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },
    },

    WeaponBinks =
    {
        "ZagreusFistAlt01Idle_Bink",
        "ZagreusFistAlt01Run_Bink",
        "ZagreusFistAlt01RunStop_Bink",
        "ZagreusFistAlt01FlurryPunch_Bink",
        "ZagreusFistAlt01FlashKick_Bink",
        "ZagreusFistAlt01Grab_Bink",
        "ZagreusFistAlt01AerialUpperCut_Bink",
        "ZagreusFistAlt01DashUpperCut_Bink",
        "ZagreusFistAlt01DashHayMaker_Bink",
    },
}

WeaponData.DarkDemeterFist2 = 
{
    Name = "DarkDemeterFist2",
    InheritFrom = { "DarkDemeterFist" },

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        ChainedWeapon = "DarkDemeterFist3",
        FireDuration = 0.2,
        -- WaitUntilProjectileDeath = true,
    }
}

WeaponData.DarkDemeterFist3 = 
{
    Name = "DarkDemeterFist3",
    InheritFrom = { "DarkDemeterFist" },

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        ChainedWeapon = "DarkDemeterFist4",
        FireDuration = 0.2,
        -- WaitUntilProjectileDeath = true,
    }
}

WeaponData.DarkDemeterFist4 = 
{
    Name = "DarkDemeterFist4",
    InheritFrom = { "DarkDemeterFist" },

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        ChainedWeapon = "DarkDemeterFist5",
        FireDuration = 0.2,
        -- WaitUntilProjectileDeath = true,
    }
}
	
WeaponData.DarkDemeterFist5 = 
{
    Name = "DarkDemeterFist5",
    InheritFrom = { "DarkDemeterFist" },

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        ChainedWeapon = "DarkDemeterFist",
        FireDuration = 0.2,
        -- WaitUntilProjectileDeath = true,
        Cooldown = 0.5
    }
}

WeaponData.DarkDemeterFistDash =
{
    StartingWeapon = false,
    CauseImpactReaction = true,
    ComboPoints = 1,
    UseComboPower = true,

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        ChainedWeapon = "DarkDemeterFist",
        FireDuration = 0.2,
        -- WaitUntilProjectileDeath = true,
        CanDoCombo = true,
        IsStartFromFistDash = true
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteAttacking_DashPunch" },
            { Name = "/SFX/Player Sounds/ZagreusFistWhoosh" },
        },
        ImpactSounds =
        {
            Invulnerable = "/SFX/SwordWallHitClank",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/FistImpactBig",
            Brick = "/SFX/FistImpactBig",
            Stone = "/SFX/FistImpactBig",
            Organic = "/SFX/FistImpactBig",
            StoneObstacle = "/SFX/FistImpactSmall",
            BrickObstacle = "/SFX/FistImpactSmall",
            MetalObstacle = "/SFX/FistImpactSmall",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },
    },
}

WeaponData.DarkDemeterFistSpecial = 
{
    Name = "DarkDemeterFistSpecial",
    StartingWeapon = false,
    -- DamageNumberGenusName = "FistWeaponSpecial",
    -- DashWeapon = "FistWeaponSpecialDash",
    --ComboPoints = 1,
    -- OnFiredFunctionName = "CheckComboPowerReset",
    CauseImpactReaction = true,
    ImpactReactionHitsOverride = 2,
    UseComboPower = true,

    AIData =
    {
        AIAngleTowardsPlayerWhileFiring = true,
        FireDuration = 0.4,
        PreFireDuration = 0.18,
        PreFireAnimation = "ZagreusFistAlt01AerialUpperCut_Start",
        FireAnimation = "ZagreusFistAlt01AerialUpperCut_Fire",
        FireFxOnSelf = "FistFxUppercutDirectional",
        CheckComboPowerReset = true, -- equals to OnFiredFunctionName = "CheckComboPowerReset",
        AIMoveWithinRangeTimeout = 0.5,
        SkipAttackAfterMoveTimeout = true,
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmotePowerAttacking_Fist5" },
            { Name = "/SFX/Player Sounds/ZagreusFistBigWhoosh" },
        },
        ImpactSounds =
        {
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/FistImpactBig",
            Brick = "/SFX/FistImpactBig",
            Stone = "/SFX/FistImpactBig",
            Organic = "/SFX/FistImpactBig",
            StoneObstacle = "/SFX/FistImpactSmall",
            BrickObstacle = "/SFX/FistImpactSmall",
            MetalObstacle = "/SFX/FistImpactSmall",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },
    },

    WeaponBinks =
    {
        "ZagreusFistFlashKick_Bink",

    }
}

WeaponData.DarkDemeterFistSpecialDash = 
{
    Name = "DarkDemeterFistSpecialDash",
    StartingWeapon = false,
    CauseImpactReaction = true,
    UseComboPower = true,
    -- DamageNumberGenusName = "FistWeaponSpecial",
    --ComboPoints = 1,
    -- OnFiredFunctionName = "CheckComboPowerReset",

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        FireDuration = 0.4,
        PreFireDuration = 0.18,
        PreFireAnimation = "ZagreusFistAlt01DashUpperCut_Start",
        FireAnimation = "ZagreusFistAlt01DashUpperCut_Fire",
        FireFxOnSelf = "FistFxUppercutDirectional",
        CheckComboPowerReset = true, -- equals to OnFiredFunctionName = "CheckComboPowerReset",
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmotePowerAttacking_Fist2" },
            { Name = "/SFX/Player Sounds/ZagreusFistBigWhoosh" },
        },
        ImpactSounds =
        {
            Invulnerable = "/SFX/SwordWallHitClank",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/FistImpactBig",
            Brick = "/SFX/FistImpactBig",
            Stone = "/SFX/FistImpactBig",
            Organic = "/SFX/FistImpactBig",
            StoneObstacle = "/SFX/FistImpactSmall",
            BrickObstacle = "/SFX/FistImpactSmall",
            MetalObstacle = "/SFX/FistImpactSmall",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },
    },
}