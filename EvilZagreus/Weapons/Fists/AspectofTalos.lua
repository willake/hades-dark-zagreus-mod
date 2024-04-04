DebugPrint({ Text = "Load DarkTalosFist" })

WeaponData.DarkTalosFist = 
{
    Name = "DarkTalosFist",
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
        ChainedWeapon = "DarkTalosFist2",
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

WeaponData.DarkTalosFist2 = 
{
    Name = "DarkTalosFist2",
    InheritFrom = { "DarkTalosFist" },

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        AIMoveWithinRangeTimeout = 1.0,
        ChainedWeapon = "DarkTalosFist3",
        FireDuration = 0.2,
        -- WaitUntilProjectileDeath = true,
    }
}

WeaponData.DarkTalosFist3 = 
{
    Name = "DarkTalosFist3",
    InheritFrom = { "DarkTalosFist" },

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        AIMoveWithinRangeTimeout = 1.0,
        ChainedWeapon = "DarkTalosFist4",
        FireDuration = 0.2,
        -- WaitUntilProjectileDeath = true,
    }
}

WeaponData.DarkTalosFist4 = 
{
    Name = "DarkTalosFist4",
    InheritFrom = { "DarkTalosFist" },

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        AIMoveWithinRangeTimeout = 1.0,
        ChainedWeapon = "DarkTalosFist5",
        FireDuration = 0.2,
        -- WaitUntilProjectileDeath = true,
    }
}
	
WeaponData.DarkTalosFist5 = 
{
    Name = "DarkTalosFist5",
    InheritFrom = { "DarkTalosFist" },

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        AIMoveWithinRangeTimeout = 1.0,
        ChainedWeapon = "DarkTalosFist",
        FireDuration = 0.2,
        -- WaitUntilProjectileDeath = true,
        Cooldown = 0.5
    }
}

WeaponData.DarkTalosFistDash =
{
    StartingWeapon = false,
    CauseImpactReaction = true,
    ComboPoints = 1,

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        AIMoveWithinRangeTimeout = 1.0,
        ChainedWeapon = "DarkTalosFist",
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

WeaponData.DarkTalosFistSpecial = 
{
    Name = "DarkTalosFistSpecial",
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

WeaponData.DarkTalosFistSpecialDash = 
{
    Name = "DarkTalosFistSpecialDash",
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