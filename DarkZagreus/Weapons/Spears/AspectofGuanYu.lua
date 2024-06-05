DebugPrint({ Text = "Load DarkGuanYuSpear" })

WeaponData.DarkGuanYuSpear =
	{
		Name = "DarkGuanYuSpear",
		UnlockCost = 4,
		LockKeyTextOffsetY = -125,
		--DashWeaponWindow = 0.6,

		AIData =
		{
			AttackDistance = 400,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			AIMoveWithinRangeTimeout = 1.0,
			ChainedWeapon = "DarkGuanYuSpear2",
			FireDuration = 0.3,
			PostFireChargeStages = 
			{
				{ ChargeWeapon = "DarkGuanYuSpearSpin", Threshold = 0.6 },
				{ ChargeWeapon = "DarkGuanYuSpearSpin2", Threshold = 0.93 },
				{ ChargeWeapon = "DarkGuanYuSpearSpin3", Threshold = 1.66 },
			},
			MaxChargeTime = 1.7,
			AIMoveWithinRangeTimeoutMin = 0.3,
			AIMoveWithinRangeTimeoutMax = 0.6,
			SkipAttackAfterMoveTimeout = true,
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/VO/ZagreusEmotes/EmoteMartialSpearAttack" },
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
			"ZagreusSpear03Run_Bink",
			"ZagreusSpear03RunStop_Bink",
			"ZagreusSpear03Spin_Bink",
			"ZagreusSpear03DashAttack_Bink",
			"ZagreusSpear03Throw_Bink",
			"ZagreusSpearLunarThrust1_Bink",
			"ZagreusSpearLunarThrust2_Bink",
			"ZagreusSpearLunarThrust3_Bink",
			"ZagreusSpearLunarThrustIdle_Bink",
			"ZagreusSpear03ReturnToIdle_Bink",
			"ZagreusSpear03ThrowReceive_Bink",
		},
}

WeaponData.DarkGuanYuSpear2 =
	{
		Name = "DarkGuanYuSpear2",

		AIData =
		{
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			SkipMovement = true,
			ChainedWeapon = "DarkGuanYuSpear3",
			FireDuration = 0.05,
			PostFireChargeStages = 
			{
				{ ChargeWeapon = "DarkGuanYuSpearSpin", Threshold = 0.6 },
				{ ChargeWeapon = "DarkGuanYuSpearSpin2", Threshold = 0.93 },
				{ ChargeWeapon = "DarkGuanYuSpearSpin3", Threshold = 1.66 },
			},
			MaxChargeTime = 1.7
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/VO/ZagreusEmotes/EmotePowerAttacking_Sword" },
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

WeaponData.DarkGuanYuSpear3 =
	{
		Name = "DarkGuanYuSpear3",

		AIData =
		{
			SkipMovement = true,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			FireDuration = 0.05,
			PostFireChargeStages = 
			{
				{ ChargeWeapon = "DarkGuanYuSpearSpin", Threshold = 0.6 },
				{ ChargeWeapon = "DarkGuanYuSpearSpin2", Threshold = 0.93 },
				{ ChargeWeapon = "DarkGuanYuSpearSpin3", Threshold = 1.66 },
			},
			MaxChargeTime = 1.7
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/VO/ZagreusEmotes/EmoteAttacking_FistKick" },
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

WeaponData.DarkGuanYuSpearDash =
	{
		Name = "DarkGuanYuSpearDash",

		AIData =
		{
			SkipMovement = true,
			GiveupDistance = 400,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			AIMoveWithinRangeTimeout = 1.0,
			FireDuration = 0.15,
			PostFireChargeStages = 
			{
				{ ChargeWeapon = "DarkGuanYuSpearSpin", Threshold = 0.6 },
				{ ChargeWeapon = "DarkGuanYuSpearSpin2", Threshold = 0.93 },
				{ ChargeWeapon = "DarkGuanYuSpearSpin3", Threshold = 1.66 },
			},
			MaxChargeTime = 1.7
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

WeaponData.DarkGuanYuSpearThrow =
	{
		Name = "DarkGuanYuSpearThrow",
		StartingWeapon = false,

		AIData =
		{
			AttackDistanceMin = 600,
			AttackDistanceMax = 880,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			AIMoveWithinRangeTimeout = 1.0,
			FireDuration = 0.2,
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/SFX/Player Sounds/ZagreusBowFire" },
				{ Name = "/SFX/Player Sounds/ZagreusSpearThrow" },
				{
					Name = "/VO/ZagreusEmotes/EmoteMartialSpearThrow",
					Cooldown = 0.5
				},
			},
			ChargeSounds =
			{
				{ Name = "/VO/ZagreusEmotes/EmoteCharging" },
				{
					Name = "/Leftovers/SFX/AuraCharge" ,
					StoppedBy = { "TriggerRelease" },
					SetPitchToPropertyValue = "ChargeTime",
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

WeaponData.DarkGuanYuSpearSpin =
	{
		Name = "DarkGuanYuSpearSpin",
		StartingWeapon = false,

		CauseImpactReaction = true,
		ImpactReactionHitsOverride = 5,

		AIData =
		{
			FireDuration = 0.15,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			AIMoveWithinRangeTimeout = 1.0,
			PreFireDuration = 0.26,
			PreFireAnimation = "ZagreusSpearAlt03SpinStart",
            PreFireCancelAnimation = "ZagreusSpearAlt03SpinStartChargeCancel",
            FireAnimation = "ZagreusSpearAlt03SpinAttack",
			WaitUntilProjectileDeath = "DarkGuanYuSpearSpin"
		},

		Sounds =
		{
			FireSounds =
			{
				{ Name = "/VO/ZagreusEmotes/EmoteMartialSpearSpinAttack" },
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
					Key = "SpearWeaponSpinTravel",
					StoppedBy = { "ChargeCancel", "TriggerRelease", "Fired" },
					SetPitchToPropertyValue = "ChargeTime",
				},
			},
		},

		Upgrades = { },
	}

WeaponData.DarkGuanYuSpearSpin2 =
	{
		Name = "DarkGuanYuSpearSpin2",
		InheritFrom = { "DarkGuanYuSpearSpin" }
	}

WeaponData.DarkGuanYuSpearSpin3 =
	{
		Name = "DarkGuanYuSpearSpin3",
		InheritFrom = { "DarkGuanYuSpearSpin" }
	}

-- should handle charge sounds