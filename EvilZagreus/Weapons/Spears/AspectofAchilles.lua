DebugPrint({ Text = "Load DarkAchillesSpear" })

WeaponData.DarkAchillesSpear =
	{
		Name = "DarkAchillesSpear",

		AIData =
		{
			AttackDistance = 250,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			AIMoveWithinRangeTimeout = 1.0,
			ChainedWeapon = "DarkAchillesSpear2",
			FireDuration = 0.3,
			PostFireChargeStages = 
			{
				{ ChargeWeapon = "DarkAchillesSpearSpin", Threshold = 0.6 },
				{ ChargeWeapon = "DarkAchillesSpearSpin2", Threshold = 0.93 },
				{ ChargeWeapon = "DarkAchillesSpearSpin3", Threshold = 1.66 },
			},
			MaxChargeTime = 1.7
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
			FireDuration = 0.3,
			PostFireChargeStages = 
			{
				{ ChargeWeapon = "DarkAchillesSpearSpin", Threshold = 0.6 },
				{ ChargeWeapon = "DarkAchillesSpearSpin2", Threshold = 0.93 },
				{ ChargeWeapon = "DarkAchillesSpearSpin3", Threshold = 1.66 },
			},
			MaxChargeTime = 1.7
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
			FireDuration = 0.3,
			PostFireChargeStages = 
			{
				{ ChargeWeapon = "DarkSpearSpin", Threshold = 0.6 },
				{ ChargeWeapon = "DarkSpearSpin2", Threshold = 0.93 },
				{ ChargeWeapon = "DarkSpearSpin3", Threshold = 1.66 },
			},
			MaxChargeTime = 1.7
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
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			AIMoveWithinRangeTimeout = 1.0,
			FireDuration = 0.425,
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
			FireDuration = 0.5,
			IsRangeBasedOnCharge = true,
			MinChargeTime = 0.04,
			MaxChargeTime = 0.12,
			Range = 264,
			ChargeRangeMultiplier = 3.34,
			WillThrowSpear = true,
			PreFireDuration = 0.04,
			PreFireFx = "SpearChargeThrowTrait",
			PreFireAnimation = "ZagreusSpearAlt01ThrowCharge",
			PreFireCancelAnimation = "ZagreusSpearAlt01ThrowFireReturnToIdle",
			FireAnimation = "ZagreusSpearAlt01ThrowFire"
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
			-- FireDuration = 0.425,
			WaitUntilProjectileDeath = true,
			WillReturnSpear = true
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
			FireDuration = 0.4,
			AIAngleTowardsPlayerWhileFiring = true,
			AITrackTargetDuringCharge = true,
			AIMoveWithinRangeTimeout = 1.0,
			PreFireDuration = 0.26,
			PreFireAnimation = "ZagreusSpearAlt01SpinStart",
            PreFireCancelAnimation = "ZagreusSpearAlt01SpinStartChargeCancel",
            FireAnimation = "ZagreusSpearAlt01SpinAttack"
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
			WillReturnSpear = true,
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