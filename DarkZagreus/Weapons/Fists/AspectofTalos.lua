DebugPrint({ Text = "Load DarkTalosFist" })

-- This weapon will trigger VacuumRush function
-- I will make a replicated version of this function
-- to attract player

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
        AIAngleTowardsPlayerWhileFiring = true,
        ChainedWeapon = "DarkTalosFist2",
        -- PreFireDuration = 0.15,
        FireDuration = 0.25, -- 0.15 + 0.1
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
        "ZagreusFistAlt02Idle_Bink",
        "ZagreusFistAlt02Run_Bink",
        "ZagreusFistAlt02RunStop_Bink",
        "ZagreusFistAlt02FlurryPunch_Bink",
        "ZagreusFistAlt02FlashKick_Bink",
        "ZagreusFistAlt02Grab_Bink",
        "ZagreusFistAlt02AerialUpperCut_Bink",
        "ZagreusFistAlt02DashUpperCut_Bink",
        "ZagreusFistAlt02DashHayMaker_Bink",
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
        ChainedWeapon = "DarkTalosFist3",
        -- PreFireDuration = 0.07,
        FireDuration = 0.17, -- 0.07 + 0.1
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
        ChainedWeapon = "DarkTalosFist4",
        -- PreFireDuration = 0.07,
        FireDuration = 0.17, -- 0.07 + 0.1
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
        ChainedWeapon = "DarkTalosFist5",
        -- PreFireDuration = 0.07,
        FireDuration = 0.17, -- 0.07 + 0.1
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
        ChainedWeapon = "DarkTalosFist",
        -- PreFireDuration = 0.07,
        FireDuration = 0.17, -- 0.07 + 0.1
        Cooldown = 0.5,
    }
}

WeaponData.DarkTalosFistDash =
{
    StartingWeapon = false,
    CauseImpactReaction = true,
    ComboPoints = 1,

    AIData =
    {
        GiveupDistance = 250,
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        ChainedWeapon = "DarkTalosFist",
        -- PreFireDuration = 0.07,
        FireDuration = 0.15, -- 0.07 + 0.08
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
        AttackDistance = 700,
        AIAngleTowardsPlayerWhileFiring = true,
        -- PreFireDuration = 0.23,
        FireDuration = 0.73, -- 0.23 + 0.5
        AIMoveWithinRangeTimeout = 0.5,
        SkipAttackAfterMoveTimeout = true,
        OnWeaponChargeFunction =
		{
			FunctionName = "DZAICheckVacuumPlayer",
			FunctionArgs =
			{
				Range = 800,				-- Vacuum distance
				DistanceBuffer = 130,		-- Space to leave between player and enemy
				RushDistanceBuffer = 300,
				AutoLockArc = 60,
			},
		}
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

WeaponData.DarkTalosFistSpecialVacuum =
{
    Name = "DarkTalosFistSpecialVacuum"
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
        GiveupDistance = 700,
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        -- PreFireDuration = 0.24,
        FireDuration = 0.44, -- 0.24 + 0.2
        OnWeaponChargeFunction =
		{
			FunctionName = "DZAICheckVacuumPlayer",
			FunctionArgs =
			{
				Range = 800,				-- Vacuum distance
				DistanceBuffer = 130,		-- Space to leave between player and enemy
				RushDistanceBuffer = 300,
				AutoLockArc = 60,
			},
		}
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

WeaponData.DarkTalosRush = 
{
    InheritFrom = {"DarkRush"},

    AIData =
    {
        AIAngleTowardsPlayerWhileFiring = true,
        AITrackTargetDuringCharge = true,
        AIMoveWithinRangeTimeout = 1.0,
        WaitUntilProjectileDeath = "DarkTalosRush",
        AddRush = {
			FunctionName = "DZAIFistVacuumRush",
			FunctionArgs =
			{
				Duration = 0.2,
			},
			RunOnce = true,
		}
    }
}

EffectData.DZMarkTargetFist =
{
    OnApplyFunctionName = "DZAIMarkTargetFistApply",
    OnClearFunctionName = "DZAIMarkTargetFistClear",
}