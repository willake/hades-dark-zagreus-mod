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
        AIAngleTowardsPlayerWhileFiring = true,
        ChainedWeapon = "DarkGilgameshFist2",
        PreFireDuration = 0.2,
        WaitUntilProjectileDeath = "DarkGilgameshFist",
        AIMoveWithinRangeTimeout = 0.5,
        SkipAttackAfterMoveTimeout = true,
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteHeavyFistDashAttack" },
            { Name = "/SFX/Player Sounds/ZagreusClawSwipe" },
        },
        ImpactSounds =
        {
            Invulnerable = "/SFX/SwordWallHitClank",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/MetalBoneSmash",
            Brick = "/SFX/MetalStoneClang",
            Stone = "/SFX/MetalStoneClang",
            Organic = "/SFX/StabSplatterSmall",
            StoneObstacle = "/SFX/SwordWallHitClank",
            BrickObstacle = "/SFX/SwordWallHitClank",
            MetalObstacle = "/SFX/SwordWallHitClank",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },
    },

    WeaponBinks =
    {
        "ZagreusFistAlt03Idle_Bink",
        "ZagreusFistAlt03ClawL_Bink",
        "ZagreusFistAlt03ClawR_Bink",
        "ZagreusFistAlt03AerialUpperCut_Bink",
        "ZagreusFistAlt03DashAttack_Bink",
        "ZagreusFistAlt03Dash_Bink",
        "ZagreusFistAlt03Run_Bink",
        "ZagreusFistAlt03RunStop_Bink",
        "ZagreusFistAlt03FlashKick_Bink",
        "ZagreusFistAlt03Grab_Bink",
        "ZagreusFistAlt03DashUpperCut_Bink",
        "ZagreusFistAlt03DashUpperClaw_Bink",
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
        ChainedWeapon = "DarkGilgameshFist3",
        PreFireDuration = 0.13,
        WaitUntilProjectileDeath = "DarkGilgameshFist2",
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteHeavyFistDashAttack" },
            { Name = "/SFX/Player Sounds/ZagreusClawSwipe" },
        },
        ImpactSounds =
        {
            Invulnerable = "/SFX/SwordWallHitClank",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/MetalBoneSmash",
            Brick = "/SFX/MetalStoneClang",
            Stone = "/SFX/MetalStoneClang",
            Organic = "/SFX/StabSplatterSmall",
            StoneObstacle = "/SFX/SwordWallHitClank",
            BrickObstacle = "/SFX/SwordWallHitClank",
            MetalObstacle = "/SFX/SwordWallHitClank",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },
    },
}

WeaponData.DarkGilgameshFist3 = 
{
    Name = "DarkGilgameshFist3",
    InheritFrom = { "DarkGilgameshFist" },

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        ChainedWeapon = "DarkGilgameshFist4",
        PreFireDuration = 0.13,
        WaitUntilProjectileDeath = "DarkGilgameshFist3",
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteHeavyFistDashAttack" },
            { Name = "/SFX/Player Sounds/ZagreusClawSwipe" },
        },
        ImpactSounds =
        {
            Invulnerable = "/SFX/SwordWallHitClank",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/MetalBoneSmash",
            Brick = "/SFX/MetalStoneClang",
            Stone = "/SFX/MetalStoneClang",
            Organic = "/SFX/StabSplatterSmall",
            StoneObstacle = "/SFX/SwordWallHitClank",
            BrickObstacle = "/SFX/SwordWallHitClank",
            MetalObstacle = "/SFX/SwordWallHitClank",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },
    },
}

WeaponData.DarkGilgameshFist4 = 
{
    Name = "DarkGilgameshFist4",
    InheritFrom = { "DarkGilgameshFist" },

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        ChainedWeapon = "DarkGilgameshFist5",
        PreFireDuration = 0.12,
        WaitUntilProjectileDeath = "DarkGilgameshFist4",
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteHeavyFistDashAttack" },
            { Name = "/SFX/Player Sounds/ZagreusClawSwipe" },
        },
        ImpactSounds =
        {
            Invulnerable = "/SFX/SwordWallHitClank",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/MetalBoneSmash",
            Brick = "/SFX/MetalStoneClang",
            Stone = "/SFX/MetalStoneClang",
            Organic = "/SFX/StabSplatterSmall",
            StoneObstacle = "/SFX/SwordWallHitClank",
            BrickObstacle = "/SFX/SwordWallHitClank",
            MetalObstacle = "/SFX/SwordWallHitClank",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },
    },
}
	
WeaponData.DarkGilgameshFist5 = 
{
    Name = "DarkGilgameshFist5",
    InheritFrom = { "DarkGilgameshFist" },

    AIData =
    {
        SkipMovement = true,
        AIAngleTowardsPlayerWhileFiring = true,
        ChainedWeapon = "DarkGilgameshFist",
        PreFireDuration = 0.12,
        WaitUntilProjectileDeath = "DarkGilgameshFist5",
        Cooldown = 0.5
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmotePowerAttacking_Fist5" },
            { Name = "/SFX/Player Sounds/ZagreusClawSwipe" },
        },
        ImpactSounds =
        {
            Invulnerable = "/SFX/SwordWallHitClank",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/MetalBoneSmash",
            Brick = "/SFX/MetalStoneClang",
            Stone = "/SFX/MetalStoneClang",
            Organic = "/SFX/StabSplatterSmall",
            StoneObstacle = "/SFX/SwordWallHitClank",
            BrickObstacle = "/SFX/SwordWallHitClank",
            MetalObstacle = "/SFX/SwordWallHitClank",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },

    },
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
        ChainedWeapon = "DarkGilgameshFist",
        PreFireDuration = 0.07,
        WaitUntilProjectileDeath = "DarkGilgameshFistDash",
        IsStartFromFistDash = true
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteAttacking_Fist2" },
            { Name = "/SFX/Player Sounds/ZagreusShieldThrow" },
        },
        ImpactSounds =
        {
            Invulnerable = "/SFX/SwordWallHitClank",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/MetalBoneSmash",
            Brick = "/SFX/MetalStoneClang",
            Stone = "/SFX/MetalStoneClang",
            Organic = "/SFX/StabSplatterSmall",
            StoneObstacle = "/SFX/SwordWallHitClank",
            BrickObstacle = "/SFX/SwordWallHitClank",
            MetalObstacle = "/SFX/SwordWallHitClank",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },
    },
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
        AIAngleTowardsPlayerWhileFiring = true,
        FireDuration = 0.4,
        PreFireDuration = 0.18,
        PreFireAnimation = "ZagreusFistAlt03AerialUpperCut_Start",
        FireAnimation = "ZagreusFistAlt03AerialUpperCut_Fire",
        FireFxOnSelf = "ClawSwipeUppercut",
        AIMoveWithinRangeTimeout = 0.5,
        SkipAttackAfterMoveTimeout = true,
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteAttacking_Fist2" },
            { Name = "/SFX/Player Sounds/ZagreusShieldThrow" },
        },
        ImpactSounds =
        {
            Invulnerable = "/SFX/SwordWallHitClank",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/MetalBoneSmash",
            Brick = "/SFX/MetalStoneClang",
            Stone = "/SFX/MetalStoneClang",
            Organic = "/SFX/StabSplatterSmall",
            StoneObstacle = "/SFX/SwordWallHitClank",
            BrickObstacle = "/SFX/SwordWallHitClank",
            MetalObstacle = "/SFX/SwordWallHitClank",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },
    },

    WeaponBinks =
    {
        "ZagreusFistFlashKick_Bink",

    },
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
        FireDuration = 0.4,
        PreFireDuration = 0.17,
        PreFireAnimation = "ZagreusFistAlt03DashUpperCut_Start",
        FireAnimation = "ZagreusFistAlt03DashUpperCut_Fire",
        FireFxOnSelf = "ClawSwipeUppercutSpecial",
    },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteHeavyFistDashUpper" },
            { Name = "/SFX/Player Sounds/ZagreusFistBigWhoosh" },
            { Name = "/SFX/Player Sounds/ZagreusShieldThrow" },
        },
        ImpactSounds =
        {
            Invulnerable = "/SFX/SwordWallHitClank",
            Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
            Bone = "/SFX/MetalBoneSmash",
            Brick = "/SFX/MetalStoneClang",
            Stone = "/SFX/MetalStoneClang",
            Organic = "/SFX/StabSplatterSmall",
            StoneObstacle = "/SFX/SwordWallHitClank",
            BrickObstacle = "/SFX/SwordWallHitClank",
            MetalObstacle = "/SFX/SwordWallHitClank",
            BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
        },
    },
}

WeaponData.DarkGilgameshRush = {
    Name = "DarkGilgameshRush",
    InheritFrom = { "DarkRush" },

    Sounds =
    {
        FireSounds =
        {
            { Name = "/VO/ZagreusEmotes/EmoteAttacking_Fist1" },
            { Name = "/SFX/Enemy Sounds/Exalted/ExaltedDash" },
        },
    },
}

WeaponData.DarkGilgameshRushRupture = {
    Name = "DarkGilgameshRushRupture"
}

WeaponData.DarkGilgameshFistDetonation = {
    Name = "DarkGilgameshFistDetonation",
}

WeaponData.DarkGilgameshMarkRuptureApplicator = {
    Name = "DarkGilgameshMarkRuptureApplicator",
}

EffectData.DZMarkRuptureTargetApplicator =
{
    OnApplyFunctionName = "DZAIOnRuptureDashHit",
}

-- no use
EffectData.DZPunchRuptureWeapon =
{
    OnApplyFunctionName = "DZAIOnRuptureWeaponHit",
}

EffectData.DZMarkRuptureTarget =
{
    OnApplyFunctionName = "DZAIMarkRuptureTargetApply",
    OnClearFunctionName = "DZAIMarkRuptureTargetClear",
}