DebugPrint({ Text = "Load DarkHadesSpear" })

WeaponData.DarkHadesSpear =
	{
		Name = "DarkHadesSpear",
		UnlockCost = 4,
		LockKeyTextOffsetY = -125,
		--DashWeaponWindow = 0.6,

		AIData =
		{
			AttackDistance = 400,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			ChainedWeapon = "DarkHadesSpear2",
			-- PreFireDuration = 0.12,
			FireDuration = 0.42, -- 0.12 + 0.3
			PostFireChargeStages = 
			{
				{ ChargeWeapon = "DarkHadesSpearSpin2", Threshold = 0.30 }, -- 0.75
				{ ChargeWeapon = "DarkHadesSpearSpin3", Threshold = 1.05 },
			},
			MaxChargeTime = 1.15,
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
			"ZagreusSpear02Run_Bink",
			"ZagreusSpear02RunStop_Bink",
			"ZagreusSpear02_Bink",
			"ZagreusSpear02ReturnToIdle_Bink",
			"ZagreusSpear02Spin_Bink",
			"ZagreusSpear02DashAttack_Bink",
			"ZagreusSpear02Throw_Bink",
			"ZagreusSpear02ThrowReceive_Bink"
		},
}

WeaponData.DarkHadesSpear2 =
	{
		Name = "DarkHadesSpear2",

		AIData =
		{
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			SkipMovement = true,
			ChainedWeapon = "DarkHadesSpear3",
			-- PreFireDuration = 0.08,
			FireDuration = 0.29, -- 0.08 + 0.21
			PostFireChargeStages = 
			{
				{ ChargeWeapon = "DarkHadesSpearSpin2", Threshold = 0.30 }, -- 0.75
				{ ChargeWeapon = "DarkHadesSpearSpin3", Threshold = 1.05 },
			},
			MaxChargeTime = 1.15,
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

WeaponData.DarkHadesSpear3 =
	{
		Name = "DarkHadesSpear3",

		AIData =
		{
			SkipMovement = true,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			-- PreFireDuration = 0.03,
			FireDuration = 0.33, -- 0.03 + 0.3 
			PostFireChargeStages = 
			{
				{ ChargeWeapon = "DarkHadesSpearSpin2", Threshold = 0.30 }, -- 0.75
				{ ChargeWeapon = "DarkHadesSpearSpin3", Threshold = 1.05 },
			},
			MaxChargeTime = 1.15,
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

WeaponData.DarkHadesSpearDash =
	{
		Name = "DarkHadesSpearDash",

		AIData =
		{
			SkipMovement = true,
			GiveupDistance = 400,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			FireDuration = 0.31,
			PostFireChargeStages = 
			{
				{ ChargeWeapon = "DarkHadesSpearSpin2", Threshold = 0.30 }, -- 0.75
				{ ChargeWeapon = "DarkHadesSpearSpin3", Threshold = 1.05 },
			},
			MaxChargeTime = 1.15,
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

WeaponData.DarkHadesSpearThrow =
	{
		Name = "DarkHadesSpearThrow",
		StartingWeapon = false,

		AIData =
		{
			AttackDistanceMin = 600,
			AttackDistanceMax = 880,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			AIMoveWithinRangeTimeout = 1.0,
			-- FireDuration = 0.2,
			WaitUntilProjectileDeath = "DarkHadesSpearThrow"
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

WeaponData.DarkHadesSpearThrowReturn =
	{
		Name = "DarkHadesSpearThrowReturn",
		StartingWeapon = false,

		AIData =
		{
			SkipMovement = true,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			AIMoveWithinRangeTimeout = 1.0,
			-- FireDuration = 0.425,
			WaitUntilProjectileDeath = "DarkHadesSpearThrowReturn"
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

WeaponData.DarkHadesSpearSpin =
	{
		Name = "DarkHadesSpearSpin",
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
			PreFireAnimation = "DarkZagreusSpearAlt02SpinStart",
            PreFireCancelAnimation = "DarkZagreusSpearAlt02SpinStartChargeCancel",
            FireAnimation = "DarkZagreusSpearAlt02SpinAttack",
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

WeaponData.DarkHadesSpearSpin2 =
	{
		InheritFrom = { "DarkHadesSpearSpin" }
	}

WeaponData.DarkHadesSpearSpin3 =
	{
		InheritFrom = { "DarkHadesSpearSpin" }
	}

EffectData.DZMarkTargetSpin = 
	{
		OnApplyFunctionName = "DZAIMarkTargetSpinApply",
		OnClearFunctionName = "DZAIMarkTargetSpinClear",
	}