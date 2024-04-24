DZ = {}
DZ.IsRecording = false
DZ.LastAction = 0

-- sword weapon
OnWeaponFired{ "SwordWeapon SwordWeapon2 SwordWeapon3 SwordWeaponDash",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        DebugPrintf({ Text = "Attack" })
        WriteRecord(DZGetCurrentState(), 1)        
        DZ.LastAction = 1
    end
}

OnWeaponFired{ "SwordParry",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        DebugPrintf({ Text = "SpecialAttack" })
        WriteRecord(DZGetCurrentState(), 2)
        DZ.LastAction = 2
    end
}

-- rush
OnWeaponFired{ "RushWeapon",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        DebugPrintf({ Text = "Rush" })
        WriteRecord(DZGetCurrentState(), 0)
        DZ.LastAction = 0
    end
} 

function DZCheckCanRecord()
    if not DZ.IsRecording then
        return false
    end

    if CurrentRun == nil then
        return false
    end

    if CurrentRun.Hero.Health == nil then
        return false
    end

    return true
end

function DZGetCurrentState()
    local closestId = GetClosest({ Id = CurrentRun.Hero.ObjectId, DestinationName = "EnemyTeam"})
    local enemy = ActiveEnemies[closestId]
    local distance = 0.00
    local enemyHealth = 0.00
    if enemy ~= nil and enemy.Health ~= nil then
        distance = GetDistance({ Id = closestId, DestinationId = currentRun.Hero.ObjectId })
        enemyHealth = enemy.Health / enemy.MaxHealth
    end

    if distance > 1000 then
        distance = 1000
    end

    local isLastActionDash = (DZ.LastAction == 0) and 1 or 0
    local isLastActionAttack = (DZ.LastAction == 1) and 1 or 0
    local isLastActionSpectialAttack = (DZ.LastActionn == 2) and 1 or 0
    
    return {
        OwnHP = CurrentRun.Hero.Health / CurrentRun.Hero.MaxHealth,
        ClosestEnemyHP = enemyHealth,
        Distance = distance / 1000,
        IsLastActionDash = isLastActionDash,
        IsLastActionAttack = isLastActionAttack,
        IsLastActionSpecialAttack = isLastActionSpectialAttack,
    }
end

function WriteRecord(state, action)
    DebugPrintString(string.format("%.2f %.2f %.2f %.2f %.2f %.2f %.2f", 
        state.OwnHP, state.ClosestEnemyHP, state.Distance, 
        state.IsLastActionDash, state.IsLastActionAttack, state.IsLastActionSpecialAttack,
        action))    
end


-- I don't know how to detect give up and die
-- wrapping EndRun() is not working, so better terminate the recording whenever the character
-- enters the DeathArea
OnAnyLoad { "DeathArea", function(triggerArgs)
    DZ.IsRecording = false
end}

ModUtil.Path.Wrap("StartNewRun", function(base, prevRun, args)
    DebugPrintf({ Text = "StartNewRun" })
    DZ.IsRecording = true
    return base(prevRun, args)
end, DarkZagreus)

ModUtil.Path.Wrap("EndRun", function(base, currentRun)
    DZ.IsRecording = false
    return base(currentRun)
end, DarkZagreus)

ModUtil.Path.Wrap("RecordRunCleared", function(base)
    if currentRun.Cleared ~= nil then
        DebugPrintf({ Text = "EndRun " .. tostring(currentRun.Cleared) }) 
    else
        DebugPrintf({ Text = "EndRun " .. "false" })
    end
    DZ.IsRecording = false
    return base(currentRun)
end, DarkZagreus)