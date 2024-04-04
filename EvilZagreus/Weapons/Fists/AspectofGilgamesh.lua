DebugPrint({ Text = "Load DarkGilgameshFist" })

WeaponData.DarkGilgameshFist = 
{
    Name = "DarkGilgameshFist",
    -- DashWeapon = "FistWeaponDash",
    -- DashSwaps = { "FistWeapon", "FistWeapon2", "FistWeapon3", "FistWeapon4", "FistWeapon5" },
    -- ExpireDashWeaponOnDash = true,
    -- SecondaryWeapon = "FistWeaponSpecial",
    ComboPoints = 1,
    CauseImpactReaction = true,
    AIData =
    {
        AIAttackDistance = 100,
        AIAngleTowardsPlayerWhileFiring = true,
        AIMoveWithinRangeTimeout = 1.0,
        ChainedWeapon = "DarkGilgameshFist2",
        FireDuration = 0.2,
        -- WaitUntilProjectileDeath = true,
        CanDoCombo = true,
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

WeaponData.DarkGilgameshFist2 = 
{
    Name = "DarkGilgameshFist2",
    InheritFrom = { "DarkGilgameshFist" },

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        AIMoveWithinRangeTimeout = 1.0,
        ChainedWeapon = "DarkGilgameshFist3",
        FireDuration = 0.2,
        -- WaitUntilProjectileDeath = true,
    }
}

WeaponData.DarkGilgameshFist3 = 
{
    Name = "DarkGilgameshFist3",
    InheritFrom = { "DarkGilgameshFist" },

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        AIMoveWithinRangeTimeout = 1.0,
        ChainedWeapon = "DarkGilgameshFist4",
        FireDuration = 0.2,
        -- WaitUntilProjectileDeath = true,
    }
}

WeaponData.DarkGilgameshFist4 = 
{
    Name = "DarkGilgameshFist4",
    InheritFrom = { "DarkGilgameshFist" },

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        AIMoveWithinRangeTimeout = 1.0,
        ChainedWeapon = "DarkGilgameshFist5",
        FireDuration = 0.2,
        -- WaitUntilProjectileDeath = true,
    }
}
	
WeaponData.DarkGilgameshFist5 = 
{
    Name = "DarkGilgameshFist5",
    InheritFrom = { "DarkGilgameshFist" },

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        AIMoveWithinRangeTimeout = 1.0,
        ChainedWeapon = "DarkGilgameshFist",
        FireDuration = 0.2,
        -- WaitUntilProjectileDeath = true,
        Cooldown = 0.5
    }
}

WeaponData.DarkGilgameshFistDash =
{
    StartingWeapon = false,
    CauseImpactReaction = true,
    ComboPoints = 1,

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        AIMoveWithinRangeTimeout = 1.0,
        ChainedWeapon = "DarkGilgameshFist",
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

    Upgrades = { },
}

WeaponData.DarkGilgameshFistSpecial = 
{
    Name = "DarkGilgameshFistSpecial",
    StartingWeapon = false,
    -- DamageNumberGenusName = "FistWeaponSpecial",
    -- DashWeapon = "FistWeaponSpecialDash",
    --ComboPoints = 1,
    -- OnFiredFunctionName = "CheckComboPowerReset",
    CauseImpactReaction = true,
    ImpactReactionHitsOverride = 2,

    AIData =
    {
        AIAttackDistance = 100,
        AIAngleTowardsPlayerWhileFiring = true,
        AIMoveWithinRangeTimeout = 1.0,
        FireDuration = 0.4,
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

    Upgrades = { },
}

WeaponData.DarkGilgameshFistSpecialDash = 
{
    Name = "DarkGilgameshFistSpecialDash",
    StartingWeapon = false,
    CauseImpactReaction = true,
    -- DamageNumberGenusName = "FistWeaponSpecial",
    --ComboPoints = 1,
    -- OnFiredFunctionName = "CheckComboPowerReset",

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        AIMoveWithinRangeTimeout = 1.0,
        FireDuration = 0.4,
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

    Upgrades = { },
}