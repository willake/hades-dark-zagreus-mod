if not DarkZagreus.Config.Enabled then return end

-- sword weapon
OnWeaponFired{ "SwordWeapon SwordWeapon2 SwordWeapon3 SwordWeaponDash",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        DebugPrint({ Text = "Attack" })
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(1, 0, 1)) 
        DZPersistent.LastAction = 1
    end
}

OnWeaponFired{ "SwordParry",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        DebugPrint({ Text = "SpecialAttack" })
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2, 0, 1))
        DZPersistent.LastAction = 2
    end
}

-- bow
OnWeaponCharging { "BowWeapon BowWeaponDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        DZTemp.StartChargingTime = _worldTime
    end 
}

OnWeaponTriggerRelease { "BowWeapon BowWeaponDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        local duration = _worldTime - DZTemp.StartChargingTime
        DebugPrint({ Text = "ChargeDuration: " .. duration })
        DebugPrint({ Text = "Attack" })
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(1, duration, 1))   
        DZPersistent.LastAction = 1  
    end 
}

OnWeaponFired{ "BowSplitShot",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        DebugPrint({ Text = "SpecialAttack" })
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2, 0, 1))
        DZPersistent.LastAction = 2
    end
}

-- spear

OnWeaponCharging { "SpearWeapon SpearWeapon2 SpearWeapon3 SpearWeaponDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        DebugPrint({ Text = "StartCharging" })
        DZTemp.StartChargingTime = _worldTime
    end 
}

-- TODO: not sure if i can catch Flurry Jab
OnWeaponFired { "SpearWeapon SpearWeapon2 SpearWeapon3 SpearWeaponDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        DebugPrint({ Text = "ShortAttack" })
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(1, 0, 1))     
        DZPersistent.LastAction = 1
    end 
}

OnWeaponFired { "SpearWeaponSpin SpearWeaponSpin2 SpearWeaponSpin3",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        local duration = _worldTime - DZTemp.StartChargingTime
        DebugPrint({ Text = "ChargeDuration: " .. duration })
        DebugPrint({ Text = "Attack" })
        DZOverridePendingRecord(DZGetCurrentState(), DZMakeActionData(1, duration, 1.6))     
        DZPersistent.LastAction = 1
    end 
}

OnWeaponFired { "SpearWeaponThrowReturn",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        DebugPrint({ Text = "SpearWeaponThrowReturn" })
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2, 0, 1))
        DZPersistent.LastAction = 2
    end
}

OnWeaponCharging { "SpearWeaponThrow",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        DebugPrint({ Text = "StartCharging" })
        DZTemp.StartChargingTime = _worldTime
    end 
}

OnWeaponFired { "SpearWeaponThrow",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end
        
        local duration = _worldTime - DZTemp.StartChargingTime
        DebugPrint({ Text = "ChargeDuration: " .. duration })
        DebugPrint({ Text = "SpearWeaponThrow" })
        
        -- if the weapon is aspect of achilles, which is chargable
        -- if GameState.LastInteractedWeaponUpgrade.ItemIndex == 2 then
        --     DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2, duration, 0.3)) 
        -- else
        --     DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2, 0, 1))
        -- end  
        
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2, duration, 0.3)) 

        DZPersistent.LastAction = 2
    end 
}

OnWeaponFired{ "SpearRushWeapon",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        DebugPrint({ Text = "SpearRushWeapon" })
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2, 0, 1))
        -- LogRecord(DZGetCurrentState(), DZMakeActionData(2, 0, 1))
        DZPersistent.LastAction = 2
    end
}

-- shield
-- TODO: handle Pulverizing Blow
OnWeaponCharging { "ShieldWeapon ShieldWeaponDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        DebugPrint({ Text = "StartCharging" })
        DZTemp.StartChargingTime = _worldTime
    end 
}

OnWeaponFired { "ShieldWeapon ShieldWeaponDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        DebugPrint({ Text = "ShieldWeapon" })
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(1, 0, 1))     
        DZPersistent.LastAction = 1
    end 
}

OnWeaponFired { "ShieldWeaponRush",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        local duration = _worldTime - DZTemp.StartChargingTime
        DebugPrint({ Text = "ChargeDuration: " .. duration })
        DebugPrint({ Text = "ShieldWeaponRush" })
        DZOverridePendingRecord(DZGetCurrentState(), DZMakeActionData(1, duration, 1.6))     
        DZPersistent.LastAction = 1
    end 
}

DZTemp.ShieldThrowed = false
OnWeaponCharging { "ShieldThrow ShieldThrowDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        DebugPrint({ Text = "StartCharging" })
        DZTemp.StartChargingTime = _worldTime
    end 
}

OnWeaponFired { "ShieldThrow ShieldThrowDash",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        local duration = _worldTime - DZTemp.StartChargingTime
        DebugPrint({ Text = "ChargeDuration: " .. duration })

        DebugPrint({ Text = "ShieldThrow" })
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2, duration, 1))
        DZPersistent.LastAction = 2

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
            DebugPrint({ Text = "ShieldThrow" })
            DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2, 0, 1))
            DZPersistent.LastAction = 2

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
OnWeaponFired { "FistWeapon FistWeapon2 FistWeapon3 FistWeapon4 FistWeapon5 FistWeaponDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        DebugPrint({ Text = "FistWeapon" })
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(1, 0, 1))     
        DZPersistent.LastAction = 1
    end 
}

-- ignore Flying Cutter and Kinetic Launcher, which is chargable special
-- just treat it as normal special
OnWeaponFired { "FistWeaponSpecial FistWeaponSpecialDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        DebugPrint({ Text = "FistWeaponSpecial" })
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2, 0, 1))     
        DZPersistent.LastAction = 2
    end 
}

-- gun
-- same as fist weapon

-- ignore the bias affected by Delta Chamber, let it be
OnWeaponFired { "GunWeapon GunWeaponDash SniperGunWeapon SniperGunWeaponDash",
    function(triggerArgs)
        -- if not DZCheckCanRecord() then
        --     return false
        -- end

        DebugPrint({ Text = "GunWeapon" })
        -- DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(1, 0, 1))     
        -- DZPersistent.LastAction = 1
    end 
}

OnWeaponFired { "GunGrenadeToss",
    function(triggerArgs)
        -- if not DZCheckCanRecord() then
        --     return false
        -- end

        DebugPrint({ Text = "GunGrenadeToss" })
        -- DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(1, 0, 1))     
        -- DZPersistent.LastAction = 1
    end 
}

-- rush
OnWeaponFired{ "RushWeapon",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        DebugPrint({ Text = "Rush" })
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(0, 0, 1))
        DZPersistent.LastAction = 0
    end
} 