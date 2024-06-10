DebugPrint({ Text = "Load DarkAchillesSpear" })

WeaponData.DarkAchillesSpear =
	{
		Name = "DarkAchillesSpear",

		AIData =
		{
			AttackDistance = 400,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			AIMoveWithinRangeTimeout = 1.0,
			ChainedWeapon = "DarkAchillesSpear2",
			-- PreFireDuration = 0.12,
			FireDuration = 0.42, -- 0.12 + 0.3
			PostFireChargeStages = 
			{
				{ ChargeWeapon = "DarkAchillesSpearSpin", Threshold = 0.3 },
				{ ChargeWeapon = "DarkAchillesSpearSpin2", Threshold = 0.45 },
				{ ChargeWeapon = "DarkAchillesSpearSpin3", Threshold = 1.1 },
			},
			MaxChargeTime = 1.2,
			AIMoveWithinRangeTimeoutMin = 0.3,
			AIMoveWithinRangeTimeoutMax = 0.6,
			SkipAttackAfterMoveTimeout = true,
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/VO/ZagreusEmotes/EmoteAttacking_Spear" },
				{ Name = "/SFX/Player Sounds/ZagreusSpearThrust" },
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
            "ZagreusSpear01Run_Bink",
            "ZagreusSpear01RunStop_Bink",
            "ZagreusSpear01_Bink",
            "ZagreusSpear01ReturnToIdle_Bink",
            "ZagreusSpear01Spin_Bink",
            "ZagreusSpear01DashAttack_Bink",
            "ZagreusSpear01Throw_Bink",
            "ZagreusSpear01ThrowReceive_Bink"
		},
}

WeaponData.DarkAchillesSpear2 =
	{
		Name = "DarkAchillesSpear2",

		AIData =
		{
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			SkipMovement = true,
			ChainedWeapon = "DarkAchillesSpear3",
			-- PreFireDuration = 0.08,
			FireDuration = 0.29, -- 0.08 + 0.21
			PostFireChargeStages = 
			{
				{ ChargeWeapon = "DarkAchillesSpearSpin", Threshold = 0.3 },
				{ ChargeWeapon = "DarkAchillesSpearSpin2", Threshold = 0.45 },
				{ ChargeWeapon = "DarkAchillesSpearSpin3", Threshold = 1.1 },
			},
			MaxChargeTime = 1.2,
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/VO/ZagreusEmotes/EmoteAttacking_Spear" },
				{ Name = "/SFX/Player Sounds/ZagreusSpearThrust" },
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

WeaponData.DarkAchillesSpear3 =
	{
		Name = "DarkAchillesSpear3",

		AIData =
		{
			SkipMovement = true,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			-- PreFireDuration = 0.03,
			FireDuration = 0.33, -- 0.03 + 0.3 
			PostFireChargeStages = 
			{
				{ ChargeWeapon = "DarkAchillesSpearSpin", Threshold = 0.3 },
				{ ChargeWeapon = "DarkAchillesSpearSpin2", Threshold = 0.45 },
				{ ChargeWeapon = "DarkAchillesSpearSpin3", Threshold = 1.1 },
			},
			MaxChargeTime = 1.2,
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/VO/ZagreusEmotes/EmoteAttacking_Spear" },
				{ Name = "/SFX/Player Sounds/ZagreusSpearThrust" },
				{ Name = "/SFX/Player Sounds/BowFire" },
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

WeaponData.DarkAchillesSpearDash =
	{
		Name = "DarkAchillesSpearDash",

		AIData =
		{
			SkipMovement = true,
			GiveupDistance = 400,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			AIMoveWithinRangeTimeout = 1.0,
			FireDuration = 0.31,
			PostFireChargeStages = 
			{
				{ ChargeWeapon = "DarkAchillesSpearSpin", Threshold = 0.3 },
				{ ChargeWeapon = "DarkAchillesSpearSpin2", Threshold = 0.45 },
				{ ChargeWeapon = "DarkAchillesSpearSpin3", Threshold = 1.1 },
			},
			MaxChargeTime = 1.2,
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/VO/ZagreusEmotes/EmotePowerAttacking_Sword" },
				{ Name = "/SFX/Player Sounds/ZagreusSwordOverhead" },
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

WeaponData.DarkAchillesSpearThrow =
	{
		Name = "DarkAchillesSpearThrow",
		StartingWeapon = false,

		AIData =
		{
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			AIMoveWithinRangeTimeout = 1.0,
			-- FireDuration = 0.5,
			WaitUntilProjectileDeath = "DarkAchillesSpearThrow",
			IsRangeBasedOnCharge = true,
			MinChargeTime = 0.04,
			MaxChargeTime = 0.12,
			Range = 264,
			ChargeRangeMultiplier = 3.34,
			PreFireDuration = 0.04,
			PreFireFx = "SpearChargeThrowTrait",
			PreFireAnimation = "DarkZagreusSpearAlt01ThrowCharge",
			PreFireCancelAnimation = "DarkZagreusSpearAlt01ThrowFireReturnToIdle",
			FireAnimation = "DarkZagreusSpearAlt01ThrowFire"
		},

        Sounds =
        {
            ChargeSounds =
            {
                { Name = "/VO/ZagreusEmotes/EmoteHeavyBowCharge",
                    StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" },
                },
                {
                    Name = "/SFX/Player Sounds/ZagreusWeaponChargeup" ,
                    StoppedBy = { "TriggerRelease", "ChargeCancel", "Fired" },
                    SetPitchToPropertyValue = "ChargeTime",
                },
            },
            FireSounds =
            {
                { Name = "/VO/ZagreusEmotes/EmoteHeavyShieldThrow" },
                { Name = "/SFX/Player Sounds/ZagreusDash" },
                { Name = "/SFX/Player Sounds/ZagreusSpearThrow" },
            },
        },
		Upgrades = { },
	}

WeaponData.DarkAchillesSpearThrowReturn =
	{
		Name = "DarkAchillesSpearThrowReturn",
		StartingWeapon = false,

		AIData =
		{
			SkipMovement = true,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			AIMoveWithinRangeTimeout = 1.0,
			FireDuration = 0.425,
			-- WaitUntilProjectileDeath = "DarkAchillesSpearThrowReturn",
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/SFX/Player Sounds/ZagreusSpearReturn" },
				{
					Name = "/VO/ZagreusEmotes/EmoteAttacking_Bow",
					Cooldown = 0.5
				},
			},
			ImpactSounds =
			{
				Invulnerable = "/SFX/SwordWallHitClank",
				Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
				Bone = "/SFX/ArrowMetalBoneSmash",
				Brick = "/SFX/ArrowMetalStoneClang",
				Stone = "/SFX/ArrowMetalStoneClang",
				Organic = "/SFX/ArrowImpactSplatter",
				StoneObstacle = "/SFX/SwordWallHitClankSmall",
				BrickObstacle = "/SFX/SwordWallHitClankSmall",
				MetalObstacle = "/SFX/SwordWallHitClankSmall",
				BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
			},
		},

		Upgrades = { },
	}

WeaponData.DarkAchillesSpearThrowInvisibleReturn =
	{
		Name = "DarkAchillesSpearThrowInvisibleReturn",
		InheritFrom = { "DarkAchillesSpearThrowReturn" },
	}

WeaponData.DarkAchillesSpearSpin =
	{
		Name = "DarkAchillesSpearSpin",
		StartingWeapon = false,

		CauseImpactReaction = true,
		ImpactReactionHitsOverride = 5,

		AIData =
		{
			FireDuration = 0.34,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			AIMoveWithinRangeTimeout = 1.0,
			PreFireDuration = 0.26,
			PreFireAnimation = "DarkZagreusSpearAlt01SpinStart",
            PreFireCancelAnimation = "DarkZagreusSpearAlt01SpinStartChargeCancel",
            FireAnimation = "DarkZagreusSpearAlt01SpinAttack"
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/VO/ZagreusEmotes/EmotePoweringUp" },
				{ Name = "/SFX/Player Sounds/ZagreusSpearSwipe" },
				{ Name = "/Leftovers/SFX/AuraThrow" }
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

			ChargeSounds =
			{
				{ Name = "/VO/ZagreusEmotes/EmoteCharging" },
				{
					Name = "/SFX/Player Sounds/ZagreusWeaponChargeup" ,
					Key = "SpearWeaponSpin",
					StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
					SetPitchToPropertyValue = "ChargeTime",
				},
			},
		},

		Upgrades = { },
	}

WeaponData.DarkAchillesSpearSpin2 =
	{
		Name = "DarkAchillesSpearSpin2",
		InheritFrom = { "DarkAchillesSpearSpin" }
	}

WeaponData.DarkAchillesSpearSpin3 =
	{
		Name = "DarkAchillesSpearSpin3",
		InheritFrom = { "DarkAchillesSpearSpin" }
	}

WeaponData.DarkAchillesSpearRush =
	{
		Name = "DarkAchillesSpearRush",
		-- FailToFireFunctionName = "SetSpearTeleportBuffer",

		SimSlowBlur =
		{
			Strength = 0.3,
			Distance = 1.6,
			FXInTime = 0.06,
			FXHoldTime = 0.4,
			FXOutTime = 0.4,
		},

		AIData =
		{
			FireDuration = 0.4,
			SkipMovement = true,
			-- AIAngleTowardsPlayerWhileFiring = true,
			-- AITrackTargetDuringCharge = true,
			AIMoveWithinRangeTimeout = 1.0,
			PostFireWeapon = "DarkAchillesSpearThrowInvisibleReturn"
		},

		SkipAttackNotReadySounds = true,
		Sounds =
		{
			FireSounds =
			{
				{ Name = "/VO/ZagreusEmotes/EmoteEvading" },
				{ Name = "/SFX/Player Sounds/ZagreusDash" },
			},

			ImpactSounds =
			{
				Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
				Bone = "/SFX/FistImpactMedium",
				Brick = "/SFX/FistImpactMedium",
				Stone = "/SFX/FistImpactMedium",
				Organic = "/SFX/FistImpactMedium",
			},

			CancelEffectSounds =
			{
			},

			NearbyEnemyFireSounds =
			{
				{ Name = "/Leftovers/Menu Sounds/TitanToggleShort" },
			},
		},

		NoExpressiveAnim = true,
	}

EffectData.DZSpearRushBonus =
{
	OnApplyFunctionName = "DZAISpearRushBonusApply",
}