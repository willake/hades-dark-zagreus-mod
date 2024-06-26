DebugPrint({ Text = "Load DarkSpear" })

WeaponData.DarkSpear =
	{
		Name = "DarkSpear",
		-- DashSwaps = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", },

		AIData =
		{
			AttackDistance = 400,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			ChainedWeapon = "DarkSpear2",
			PostFireChargeStages = 
			{
				{ ChargeWeapon = "DarkSpearSpin", Threshold = 0.3 },
				{ ChargeWeapon = "DarkSpearSpin2", Threshold = 0.45 },
				{ ChargeWeapon = "DarkSpearSpin3", Threshold = 1.1 },
			},
			MaxChargeTime = 1.2,
			-- PreFireDuration = 0.12,
			FireDuration = 0.42, -- 0.12 + 0.3
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
			"ZagreusSpear_Bink",
			"ZagreusSpearRun_Bink",
			"ZagreusSpearReturnToIdle_Bink",
			"ZagreusSpearSpin_Bink",
			"ZagreusSpearThrow_Bink",
			"ZagreusSpearDashAttack_Bink",
			"ZagreusSpearThrowReceive_Bink",
			"ZagreusSpearRunStop_Bink",
		},
}

WeaponData.DarkSpear2 =
	{
		Name = "DarkSpear2",

		AIData =
		{
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			SkipMovement = true,
			ChainedWeapon = "DarkSpear3",
			-- PreFireDuration = 0.08,
			FireDuration = 0.29, -- 0.08 + 0.21
			PostFireChargeStages = 
			{
				{ ChargeWeapon = "DarkSpearSpin", Threshold = 0.3 },
				{ ChargeWeapon = "DarkSpearSpin2", Threshold = 0.45 },
				{ ChargeWeapon = "DarkSpearSpin3", Threshold = 1.1 },
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

WeaponData.DarkSpear3 =
	{
		Name = "DarkSpear3",

		AIData =
		{
			SkipMovement = true,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			-- PreFireDuration = 0.03,
			FireDuration = 0.33, -- 0.03 + 0.3 
			PostFireChargeStages = 
			{
				{ ChargeWeapon = "DarkSpearSpin", Threshold = 0.3 },
				{ ChargeWeapon = "DarkSpearSpin2", Threshold = 0.45 },
				{ ChargeWeapon = "DarkSpearSpin3", Threshold = 1.1 },
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

WeaponData.DarkSpearDash =
	{
		Name = "DarkSpearDash",

		AIData =
		{
			SkipMovement = true,
			GiveupDistance = 400,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			FireDuration = 0.31,
			PostFireChargeStages = 
			{
				{ ChargeWeapon = "DarkSpearSpin", Threshold = 0.3 },
				{ ChargeWeapon = "DarkSpearSpin2", Threshold = 0.45 },
				{ ChargeWeapon = "DarkSpearSpin3", Threshold = 1.1 },
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

WeaponData.DarkSpearThrow =
	{
		Name = "DarkSpearThrow",
		StartingWeapon = false,

		AIData =
		{
			AttackDistanceMin = 600,
			AttackDistanceMax = 880,
			AIAngleTowardsPlayerWhileFiring = true,
			AIMoveWithinRangeTimeout = 1.0,
			-- PreFireDuration = 0.12, 
			FireDuration = 0.5, -- 0.12 + 0.4
			-- WaitUntilProjectileDeath = "DarkSpearThrow",
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/SFX/Player Sounds/ZagreusBowFire" },
				{ Name = "/SFX/Player Sounds/ZagreusSpearThrow" },
				{
					Name = "/VO/ZagreusEmotes/EmoteSpearThrow",
					Cooldown = 0.5
				},
			},
			ChargeSounds =
			{
				{ Name = "/VO/ZagreusEmotes/EmoteRanged" },
				{
					Name = "/Leftovers/SFX/AuraCharge" ,
					StoppedBy = { "TriggerRelease" }
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

WeaponData.DarkSpearThrowReturn =
	{
		Name = "DarkSpearThrowReturn",
		StartingWeapon = false,

		AIData =
		{
			SkipMovement = true,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			AIMoveWithinRangeTimeout = 1.0,
			FireDuration = 0.425,
			-- WaitUntilProjectileDeath = "DarkSpearThrowReturn",
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

WeaponData.DarkSpearSpin =
	{
		Name = "DarkSpearSpin",
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
			PreFireAnimation = "DarkZagreusSpearSpinStart",
            PreFireCancelAnimation = "DarkZagreusSpearSpinStartChargeCancel",
            FireAnimation = "DarkZagreusSpearSpinAttack",
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

WeaponData.DarkSpearSpin2 =
	{
		InheritFrom = { "DarkSpearSpin" }
	}

WeaponData.DarkSpearSpin3 =
	{
		InheritFrom = { "DarkSpearSpin" }
	}

WeaponData.DarkSpearRush =
	{
		Name = "DarkSpearRush",
		-- FailToFireFunctionName = "SetSpearTeleportBuffer",

		AIData =
		{
			FireDuration = 0.4,
			SkipMovement = true,
			-- PostFireWeapon = "DarkAchillesSpearThrowInvisibleReturn"
		},

		SimSlowBlur =
		{
			Strength = 0.3,
			Distance = 1.6,
			FXInTime = 0.06,
			FXHoldTime = 0.4,
			FXOutTime = 0.4,
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

		Upgrades = { },
	}


WeaponData.DarkSpearThrowInvisibleReturn =
	{
		InheritFrom = { "DarkSpearThrowReturn" },
		CompleteObjectivesOnFire = {},
	}

WeaponData.DarkSpearThrowImmolation =
	{
		InheritFrom = { "DarkSpearSpin" },
		FireScreenshake = { Distance = 0, Speed = 0, FalloffSpeed = 0, Duration = 0, DynamicAngleOffset = 0 },
		Sounds =
		{
			FireSounds =
			{
				{ Name = "/SFX/Player Sounds/ZagreusSpearSwipe" },
				{ Name = "/SFX/Enemy Sounds/Megaera/MegaeraRapidEnergyBlastFire" }
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

EffectData.DZSpearRushBonus =
	{
		OnApplyFunctionName = "DZAISpearRushBonusApply",
	}

EffectData.DZMarkTargetSpin = 
	{
		OnApplyFunctionName = "DZAIMarkTargetSpinApply",
		OnClearFunctionName = "DZAIMarkTargetSpinClear",
	}