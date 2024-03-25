DebugPrint({ Text = "Load DarkGuanYuSpear" })

WeaponData.DarkGuanYuSpear =
	{
		Name = "DarkGuanYuSpear",
		-- DashSwaps = { "SpearWeapon", "SpearWeapon2", "SpearWeapon3", },
		-- ExpireDashWeaponOnDash = true,
		-- SecondaryWeapon = "SpearWeaponThrow",
		-- ResourceName = "LockKeys",
		UnlockCost = 4,
		LockKeyTextOffsetY = -125,
		--DashWeaponWindow = 0.6,

		AIData =
		{
			PreAttackDuration = 0,
			FireDuration = 0.8,
			PostAttackDuration = 0,
			AIAttackDistance = 175,
			AIBufferDistance = 175,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			AIMoveWithinRangeTimeout = 1.0,
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

WeaponData.DarkGuanYuSpear2 =
	{
		Name = "DarkGuanYuSpear2",

		AIData =
		{
			PreAttackDuration = 0,
			FireDuration = 0.8,
			PostAttackDuration = 0,
			AIAttackDistance = 175,
			AIBufferDistance = 175,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			AIMoveWithinRangeTimeout = 1.0,
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

WeaponData.DarkGuanYuSpear3 =
	{
		Name = "DarkGuanYuSpear3",

		AIData =
		{
			PreAttackDuration = 0,
			FireDuration = 0.8,
			PostAttackDuration = 0,
			AIAttackDistance = 175,
			AIBufferDistance = 175,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			AIMoveWithinRangeTimeout = 1.0,
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

WeaponData.DarkGuanYuSpearDash =
	{
		Name = "DarkGuanYuSpearDash",

		AIData =
		{
			PreAttackDuration = 0,
			FireDuration = 0.8,
			PostAttackDuration = 0,
			AIAttackDistance = 175,
			AIBufferDistance = 175,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			AIMoveWithinRangeTimeout = 1.0,
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
			FireAnimation = "ZagreusSpearThrowFireReturn",
			FireDuration = 0.6,
			-- PostAttackDuration = 2.0,
			AIAttackDistance = 500,
			AIBufferDistance = 100,
			AIChargeTargetMarker = true,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			AIMoveWithinRangeTimeout = 2.5,
	
			AIFireTicksMin = 1,
			AIFireTicksMax = 1,
			AIFireTicksCooldown = 0.6,
	
			-- MinAttacksBetweenUse = 2,
	
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

-- WeaponData.DarkGuanYuSpearThrowImmolation =
-- 	{
-- 		Name = "DarkSpearThrowImmolation",
-- 		InheritFrom = { "DarkSpearSpin" },

-- 		AIData =
-- 		{
-- 			PreAttackDuration = 0,
-- 			FireDuration = 0.8,
-- 			PostAttackDuration = 0,
-- 			AIAttackDistance = 175,
-- 			AIBufferDistance = 175,
-- 			AIAngleTowardsPlayerWhileFiring = true,
-- 			AITrackTargetDuringCharge = true,
-- 			AIMoveWithinRangeTimeout = 1.0,
-- 		},

-- 		Sounds =
-- 		{
-- 			FireSounds =
-- 			{
-- 				{ Name = "/SFX/Player Sounds/ZagreusSpearSwipe" },
-- 				{ Name = "/SFX/Enemy Sounds/Megaera/MegaeraRapidEnergyBlastFire" }
-- 			},
-- 			ImpactSounds =
-- 			{
-- 				Invulnerable = "/SFX/SwordWallHitClank",
-- 				Armored = "/SFX/Player Sounds/ZagreusShieldRicochet",
-- 				Bone = "/SFX/MetalBoneSmash",
-- 				Brick = "/SFX/MetalStoneClang",
-- 				Stone = "/SFX/MetalStoneClang",
-- 				Organic = "/SFX/StabSplatterSmall",
-- 				StoneObstacle = "/SFX/SwordWallHitClank",
-- 				BrickObstacle = "/SFX/SwordWallHitClank",
-- 				MetalObstacle = "/SFX/SwordWallHitClank",
-- 				BushObstacle = "/Leftovers/World Sounds/LeavesRustle",
-- 			}
-- 		}
-- 	}

WeaponData.DarkGuanYuSpearSpin =
	{
		Name = "DarkGuanYuSpearSpin",
		StartingWeapon = false,

		CauseImpactReaction = true,
		ImpactReactionHitsOverride = 5,

		AIData =
		{
			PreAttackDuration = 0,
			FireDuration = 0.8,
			PostAttackDuration = 0,
			AIAttackDistance = 175,
			AIBufferDistance = 175,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			AIMoveWithinRangeTimeout = 1.0,
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

WeaponData.DarkGuanYuSpearRush =
	{
		Name = "DarkGuanYuSpearRush",
		-- FailToFireFunctionName = "SetSpearTeleportBuffer",

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