if not DarkZagreus.Config.Enabled then return end
 
-- sword weapon
OnWeaponCharging { "SwordWeapon SwordWeapon2 SwordWeapon3 SwordWeaponDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end
        
        DZTemp.ChargeWeapon = "Attack"
        DZTemp.StartChargingTime = _worldTime
    end 
}

OnWeaponFired{ "SwordWeapon SwordWeapon2 SwordWeapon3 SwordWeaponDash",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        local duration = 0.0
        
        if DZTemp.ChargeWeapon == "Attack" then
            duration = _worldTime - DZTemp.StartChargingTime 
        end

        -- DebugPrint({ Text = "Attack" })
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(1, duration, 1))
    end
}

OnWeaponCharging { "SwordParry",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end
        
        DZTemp.ChargeWeapon = "SpecialAttack"
        DZTemp.StartChargingTime = _worldTime
    end 
}

OnWeaponFired{ "SwordParry",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        local duration = 0.0

        if DZTemp.ChargeWeapon == "SpecialAttack" then
            duration = _worldTime - DZTemp.StartChargingTime 
        end

        -- DebugPrint({ Text = "SpecialAttack" })
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2, duration, 1))
    end
}

-- bow
OnWeaponCharging { "BowWeapon BowWeaponDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        DZTemp.ChargeWeapon = "Attack"
        DZTemp.StartChargingTime = _worldTime
    end 
}

OnWeaponFired { "BowWeapon BowWeaponDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end
        
        local duration = 0.0

        if DZTemp.ChargeWeapon == "Attack" then
            duration = _worldTime - DZTemp.StartChargingTime 
        end
        -- DebugPrint({ Text = "ChargeDuration: " .. duration })
        -- DebugPrint({ Text = "Attack" })
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(1, duration, 1))
    end 
}

OnWeaponCharging { "BowSplitShot",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end
        
        DZTemp.ChargeWeapon = "SpecialAttack"
        DZTemp.StartChargingTime = _worldTime
    end 
}

OnWeaponFired{ "BowSplitShot",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        local duration = 0.0

        if DZTemp.ChargeWeapon == "SpecialAttack" then
            duration = _worldTime - DZTemp.StartChargingTime 
        end

        -- DebugPrint({ Text = "SpecialAttack" })
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2, duration, 1))
    end
}

-- spear

OnWeaponCharging { "SpearWeapon SpearWeapon2 SpearWeapon3 SpearWeaponDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        DZTemp.ChargeWeapon = "Attack"
        DZTemp.StartChargingTime = _worldTime
    end 
}

-- TODO: not sure if i can catch Flurry Jab
OnWeaponFired { "SpearWeapon SpearWeapon2 SpearWeapon3 SpearWeaponDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        local duration = 0.0
        if DZTemp.ChargeWeapon == "Attack" then
            duration = _worldTime - DZTemp.StartChargingTime 
        end

        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(1, duration, 1))
    end 
}

OnWeaponFired { "SpearWeaponSpin SpearWeaponSpin2 SpearWeaponSpin3",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        local duration = _worldTime - DZTemp.StartChargingTime
        if DZTemp.ChargeWeapon == "Attack" then
            duration = _worldTime - DZTemp.StartChargingTime 
        end

        DZOverridePendingRecord(DZGetCurrentState(), DZMakeActionData(1, duration, 1.6))     
    end 
}

OnWeaponFired { "SpearWeaponThrowReturn",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        -- DebugPrint({ Text = "SpearWeaponThrowReturn" })
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2, 0, 1))
    end
}

OnWeaponCharging { "SpearWeaponThrow",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        DZTemp.ChargeWeapon = "SpecialAttack"
        DZTemp.StartChargingTime = _worldTime
    end 
}

OnWeaponFired { "SpearWeaponThrow",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        local duration = 0.0

        if DZTemp.ChargeWeapon == "SpecialAttack" then
            duration = _worldTime - DZTemp.StartChargingTime 
        end
        
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2, duration, 0.3)) 
    end 
}

OnWeaponFired{ "SpearRushWeapon",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        -- DebugPrint({ Text = "SpearRushWeapon" })
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2, 0, 1))
        -- LogRecord(DZGetCurrentState(), DZMakeActionData(2, 0, 1))
    end
}

-- shield
-- TODO: handle Pulverizing Blow
OnWeaponCharging { "ShieldWeapon ShieldWeaponDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        DZTemp.ChargeWeapon = "Attack"
        DZTemp.StartChargingTime = _worldTime
    end 
}

OnWeaponFired { "ShieldWeapon ShieldWeaponDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        local duration = 0.0
        if DZTemp.ChargeWeapon == "Attack" then
            duration = _worldTime - DZTemp.StartChargingTime 
        end

        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(1, duration, 1))     
    end 
}

OnWeaponFired { "ShieldWeaponRush",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        local duration = 0.0
        if DZTemp.ChargeWeapon == "Attack" then
            duration = _worldTime - DZTemp.StartChargingTime 
        end

        DZOverridePendingRecord(DZGetCurrentState(), DZMakeActionData(1, duration, 1.6))     
    end 
}

DZTemp.ShieldThrowed = false
OnWeaponCharging { "ShieldThrow ShieldThrowDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        DZTemp.ChargeWeapon = "SpecialAttack"
        DZTemp.StartChargingTime = _worldTime
    end 
}

OnWeaponFired { "ShieldThrow ShieldThrowDash",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        local duration = 0.0
        if DZTemp.ChargeWeapon == "SpecialAttack" then
            duration = _worldTime - DZTemp.StartChargingTime 
        end

        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2, duration, 1))

        if DZTemp.ShieldThrowed == false then
            DZTemp.ShieldThrowed = true 
        end
    end
}

OnWeaponFailedToFire { "ShieldThrow",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        if DZTemp.ShieldThrowed == false then
            return
        end

        local attacker = triggerArgs.TriggeredByTable
		local weaponData = GetWeaponData( attacker, triggerArgs.name )

        if weaponData.RecallOnFailToFire then
            -- DebugPrint({ Text = "ShieldThrow" })
            DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2, 0, 1))

            DZTemp.ShieldThrowed = false
        end
    end
}

-- fist
-- originally, I record fist weapon like how player behaves:
-- holding the attack button to execute the combo
-- so as the AI, the attack action was like: keep doing attack within 1 seconds
-- however, I found that it's impossible, or say, too difficult, to record this behavior
-- if I just record the action with OnControlPressed and OnControlReleased,
-- it is not secured that the weapon is fired, sometimes it will wrongly add redundant data into the record
-- so I decide to just record it with OnWeaponFired, which is easier 
OnWeaponCharging { "FistWeapon FistWeapon2 FistWeapon3 FistWeapon4 FistWeapon5 FistWeaponDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        DZTemp.ChargeWeapon = "Attack"
        DZTemp.StartChargingTime = _worldTime
    end 
}

OnWeaponFired { "FistWeapon FistWeapon2 FistWeapon3 FistWeapon4 FistWeapon5 FistWeaponDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        local duration = 0.0
        if DZTemp.ChargeWeapon == "Attack" then
            duration = _worldTime - DZTemp.StartChargingTime 
        end

        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(1, duration, 1))     
    end 
}

-- ignore Flying Cutter and Kinetic Launcher, which is chargable special
-- just treat it as normal special
OnWeaponCharging { "FistWeaponSpecial FistWeaponSpecialDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end
        
        DZTemp.ChargeWeapon = "SpecialAttack"
        DZTemp.StartChargingTime = _worldTime
    end 
}

OnWeaponFired { "FistWeaponSpecial FistWeaponSpecialDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        local duration = 0.0
        if DZTemp.ChargeWeapon == "SpecialAttack" then
            duration = _worldTime - DZTemp.StartChargingTime 
        end

        -- DebugPrint({ Text = "FistWeaponSpecial" })
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2, duration, 1))     
    end 
}

-- gun
-- same as fist weapon

-- ignore the bias affected by Delta Chamber, let it be
OnWeaponCharging { "GunWeapon GunWeaponDash SniperGunWeapon SniperGunWeaponDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        DZTemp.ChargeWeapon = "Attack"
        DZTemp.StartChargingTime = _worldTime
    end 
}

OnWeaponFired { "GunWeapon GunWeaponDash SniperGunWeapon SniperGunWeaponDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end
        local duration = 0.0
        if DZTemp.ChargeWeapon == "Attack" then
            duration = _worldTime - DZTemp.StartChargingTime 
        end

        -- DebugPrint({ Text = "GunWeapon" })
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(1, duration, 1))     
    end 
}

OnWeaponCharging { "FistWeaponSpecial FistWeaponSpecialDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end
        
        DZTemp.ChargeWeapon = "SpecialAttack"
        DZTemp.StartChargingTime = _worldTime
    end 
}


OnWeaponFired { "GunGrenadeToss",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        local duration = 0.0
        if DZTemp.ChargeWeapon == "SpecialAttack" then
            duration = _worldTime - DZTemp.StartChargingTime 
        end

        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(1, duration, 1))     
    end 
}

-- rush
OnWeaponFired{ "RushWeapon",
    function( triggerArgs )
        -- DebugPrint({ Text = GetAngle({ Id = CurrentRun.Hero.ObjectId })})
        if not DZCheckCanRecord() then
            return false
        end

        local angle = GetAngle({ Id = CurrentRun.Hero.ObjectId })
        local closestId = GetClosest({ Id = CurrentRun.Hero.ObjectId, DestinationName = "EnemyTeam"})
        local angleBetween = GetAngleBetween({ Id = CurrentRun.Hero.ObjectId, DestinationId = closestId })
        -- DebugPrint({ Text = string.format("angle: %f, between: %f, Is dash away: %s", angle, angleBetween, math.abs(angle - angleBetween) > 90)})
        local action = (math.abs(angle - angleBetween) > 90) and 3 or 0
        -- dash away or dash toward
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(action, 0.0, 1))
    end
} 