DebugPrint({ Text = "Load DarkAchillesSpear" })

WeaponData.DarkAchillesSpear =
	{
		Name = "DarkAchillesSpear",
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

WeaponData.DarkAchillesSpear3 =
	{
		Name = "DarkAchillesSpear3",

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

WeaponData.DarkAchillesSpearDash =
	{
		Name = "DarkSpearDash",

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

WeaponData.DarkAchillesSpearThrow =
	{
		Name = "DarkAchillesSpearThrow",
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
			PreAttackAnimation = "ZagreusSpearThrowCharge",
			FireAnimation = "ZagreusSpearThrowFire",
			PreAttackDuration = 0.4,
			PreAttackWaitForAnimation = true,
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

WeaponData.DarkAchillesSpearSpin =
	{
		Name = "DarkAchillesSpearSpin",
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