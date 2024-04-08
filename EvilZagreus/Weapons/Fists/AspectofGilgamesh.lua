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
        AIMoveWithinRangeTimeout = 1.0,
        ChainedWeapon = "DarkGilgameshFist3",
        FireDuration = 0.2,
        -- WaitUntilProjectileDeath = true,
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
        AIMoveWithinRangeTimeout = 1.0,
        ChainedWeapon = "DarkGilgameshFist4",
        FireDuration = 0.2,
        -- WaitUntilProjectileDeath = true,
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
        AIMoveWithinRangeTimeout = 1.0,
        ChainedWeapon = "DarkGilgameshFist5",
        FireDuration = 0.2,
        -- WaitUntilProjectileDeath = true,
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
        AIMoveWithinRangeTimeout = 1.0,
        ChainedWeapon = "DarkGilgameshFist",
        FireDuration = 0.2,
        -- WaitUntilProjectileDeath = true,
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
        PreFireDuration = 0.18,
        PreFireAnimation = "ZagreusFistAlt03AerialUpperCut_Start",
        FireAnimation = "ZagreusFistAlt03AerialUpperCut_Fire",
        FireFxOnSelf = "ClawSwipeUppercut"
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
        PreFireDuration = 0.17,
        PreFireAnimation = "ZagreusFistAlt03DashUpperCut_Start",
        FireAnimation = "ZagreusFistAlt03DashUpperCut_Fire",
        FireFxOnSelf = "ClawSwipeUppercutSpecial"
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

    Upgrades = { },
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

EffectData.DarkGilgameshMarkRuptureTargetApplicator =
{
    OnApplyFunctionName = "DZOnRuptureDashHit",
}

EffectData.DarkGilgameshPunchRuptureWeapon =
{
    OnApplyFunctionName = "DZOnRuptureWeaponHit",
}

-- EffectData.DarkGilgameshMarkRuptureTarget =
-- {
--     OnApplyFunctionName = "DZMarkRuptureTargetApply",
--     OnClearFunctionName = "DZMarkRuptureTargetClear",
-- }