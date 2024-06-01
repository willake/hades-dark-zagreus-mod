if not DarkZagreus.Config.Enabled then return end
 
-- sword weapon
-- charging is deprecated in data version v5
-- OnWeaponCharging { "SwordWeapon SwordWeapon2 SwordWeapon3 SwordWeaponDash",
--     function(triggerArgs)
--         if not DZCheckCanRecord() then
--             return false
--         end
        
--         -- DZTemp.ChargeWeapon = "Attack"
--         -- DZTemp.StartChargingTime = _worldTime
--     end 
-- }

OnWeaponFired{ "SwordWeapon SwordWeapon2 SwordWeapon3 SwordWeaponDash",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        -- local duration = 0.0
        
        -- if DZTemp.ChargeWeapon == "Attack" then
        --     duration = _worldTime - DZTemp.StartChargingTime 
        -- end

        -- DebugPrint({ Text = "Attack" })
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(1))
    end
}

-- OnWeaponCharging { "SwordParry",
--     function(triggerArgs)
--         if not DZCheckCanRecord() then
--             return false
--         end
        
--         -- DZTemp.ChargeWeapon = "SpecialAttack"
--         -- DZTemp.StartChargingTime = _worldTime
--     end 
-- }

OnWeaponFired{ "SwordParry",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2))
    end
}

-- bow
OnWeaponFired { "BowWeapon BowWeaponDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end
        
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(1))
    end 
}

OnWeaponFired{ "BowSplitShot",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        -- DebugPrint({ Text = "SpecialAttack" })
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2))
    end
}

-- spear
-- TODO: not sure if i can catch Flurry Jab
OnWeaponFired { "SpearWeapon SpearWeapon2 SpearWeapon3 SpearWeaponDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(1))
    end 
}

OnWeaponFired { "SpearWeaponSpin SpearWeaponSpin2 SpearWeaponSpin3",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        DZOverridePendingRecord(DZGetCurrentState(), DZMakeActionData(4))     
    end 
}

OnWeaponFired { "SpearWeaponThrowReturn",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2))
    end
}

OnWeaponFired { "SpearWeaponThrow",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end
        
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2)) 
    end 
}

OnWeaponFired{ "SpearRushWeapon",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2))
    end
}

-- shield
-- TODO: handle Pulverizing Blow
OnWeaponFired { "ShieldWeapon ShieldWeaponDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(1))     
    end 
}

OnWeaponFired { "ShieldWeaponRush",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        DZOverridePendingRecord(DZGetCurrentState(), DZMakeActionData(4))     
    end 
}

DZTemp.ShieldThrowed = false
OnWeaponFired { "ShieldThrow ShieldThrowDash",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2))

        if DZTemp.ShieldThrowed == false then
            DZTemp.ShieldThrowed = true 
        end
    end
}

-- handle aspecot of zeus
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
            DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2))

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

        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(1))     
    end 
}

-- ignore Flying Cutter and Kinetic Launcher, which is chargable special
-- just treat it as normal special
OnWeaponFired { "FistWeaponSpecial FistWeaponSpecialDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(2))     
    end 
}

-- gun
-- same as fist weapon
-- ignore the bias affected by Delta Chamber, let it be
OnWeaponFired { "GunWeapon GunWeaponDash SniperGunWeapon SniperGunWeaponDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(1))     
    end 
}

OnWeaponFired { "GunGrenadeToss",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(1))     
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
        -- this way might miss catch back dash(aiming front but dash back, not sure how to solve it)
        -- dash away or dash toward
        DZPushPendingRecord(DZGetCurrentState(), DZMakeActionData(action))
    end
} 

-- for manual reload, see Combat.lua, because from OnControlPressed, I couldn't know how to verify if relaod is successful