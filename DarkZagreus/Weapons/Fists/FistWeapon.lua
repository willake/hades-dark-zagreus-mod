DebugPrint({ Text = "Load DarkFist" })

WeaponData.DarkFist = 
{
    Name = "DarkFist",
    -- DashWeapon = "FistWeaponDash",
    -- DashSwaps = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
    -- ExpireDashWeaponOnDash = true,
    -- SecondaryWeapon = "FistWeaponSpecial",
    ComboPoints = 1,
    CauseImpactReaction = true,
    AIData =
    {
        AIAngleTowardsPlayerWhileFiring = true,
        ChainedWeapon = "DarkFist2",
        PreFireDuration = 0.15,
        WaitUntilProjectileDeath = "DarkFist",
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
        "ZagreusFistIdle_Bink",
        "ZagreusFistFlurryPunch_Bink",
        "ZagreusFistDashHayMaker_Bink",
        "ZagreusFistDashUpperCut_Bink",
        "ZagreusFistRun_Bink",
        "ZagreusFistRunStop_Bink",
        "ZagreusFistAerialUpperCut_Bink",
        "ZagreusFistGrab_Bink",
    },
}

WeaponData.DarkFist2 = 
{
    Name = "DarkFist2",
    InheritFrom = { "DarkFist" },

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        ChainedWeapon = "DarkFist3",
        PreFireDuration = 0.07,
        WaitUntilProjectileDeath = "DarkFist2",
    }
}

WeaponData.DarkFist3 = 
{
    Name = "DarkFist3",
    InheritFrom = { "DarkFist" },

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        ChainedWeapon = "DarkFist4",
        PreFireDuration = 0.07,
        WaitUntilProjectileDeath = "DarkFist3",
    }
}

WeaponData.DarkFist4 = 
{
    Name = "DarkFist4",
    InheritFrom = { "DarkFist" },

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        ChainedWeapon = "DarkFist5",
        PreFireDuration = 0.07,
        WaitUntilProjectileDeath = "DarkFist4",
    }
}
	
WeaponData.DarkFist5 = 
{
    Name = "DarkFist5",
    InheritFrom = { "DarkFist" },

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        ChainedWeapon = "DarkFist",
        PreFireDuration = 0.07,
        WaitUntilProjectileDeath = "DarkFist5",
        Cooldown = 0.5
    }
}

WeaponData.DarkFistDash =
{
    StartingWeapon = false,
    CauseImpactReaction = true,
    ComboPoints = 1,

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        ChainedWeapon = "DarkFist",
        PreFireDuration = 0.07,
        WaitUntilProjectileDeath = "DarkFistDash",
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

WeaponData.DarkFistSpecial = 
{
    Name = "DarkFistSpecial",
    StartingWeapon = false,
    -- DamageNumberGenusName = "FistWeaponSpecial",
    -- DashWeapon = "FistWeaponSpecialDash",
    --ComboPoints = 1,
    -- OnFiredFunctionName = "CheckComboPowerReset",
    CauseImpactReaction = true,
    ImpactReactionHitsOverride = 2,

    AIData =
    {
        AIAngleTowardsPlayerWhileFiring = true,
        FireDuration = 0.4,
        PreFireDuration = 0.17,
        PreFireAnimation = "ZagreusFistAerialUpperCut_Start",
        FireAnimation = "ZagreusFistAerialUpperCut_Fire",
        FireFxOnSelf = "FistFxUppercutDirectional",
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

    },
}

WeaponData.DarkFistSpecialDash = 
{
    Name = "DarkFistSpecialDash",
    StartingWeapon = false,
    CauseImpactReaction = true,
    -- DamageNumberGenusName = "FistWeaponSpecial",
    --ComboPoints = 1,
    -- OnFiredFunctionName = "CheckComboPowerReset",

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        FireDuration = 0.4,
        PreFireDuration = 0.17,
        PreFireAnimation = "ZagreusFistDashUpperCut_Start",
        FireAnimation = "ZagreusFistDashUpperCut_Fire",
        FireFxOnSelf = "FistFxUppercutDirectional"
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