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
        LogRecord(DZGetCurrentState(), 1)        
        DZ.LastAction = 1
    end
}

OnWeaponFired{ "SwordParry",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        DebugPrintf({ Text = "SpecialAttack" })
        LogRecord(DZGetCurrentState(), 2)
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
        LogRecord(DZGetCurrentState(), 0)
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


-- I don't know how to detect give up and die
-- wrapping EndRun() is not working, so better terminate the recording whenever the character
-- enters the DeathArea
OnAnyLoad { "DeathArea", function(triggerArgs)
    DZ.IsRecording = false
end}

ModUtil.Path.Wrap("StartNewRun", function(base, prevRun, args)
    DebugPrintf({ Text = "StartNewRun" })
    DZ.IsRecording = true
    CreateNewRecord()
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

-- if io module is not avilable then just print record out
CreateNewRecord = function() DebugPrintf({ Text = "Create new record file, enable isRecording to true" }) end
LogRecord = function (state, action) DebugPrintf({ Text = string.format("%.2f %.2f %.2f %.2f %.2f %.2f %.2f", 
    state.OwnHP, state.ClosestEnemyHP, state.Distance, 
    state.IsLastActionDash, state.IsLastActionAttack, state.IsLastActionSpecialAttack,
    action)})
end

-- if io module is avilable, create a new record file then start logging
if io then
    local recordFilePath = "DZrecord" .. ".log"

    CreateNewRecord = function()
        io.open(recordFilePath, "w+"):close()
        DebugPrintf({ Text = "Create new record file, enable isRecording to true" })
    end

    LogRecord = function(state, action)
        local file = io.open(recordFilePath, "a")

        local out = string.format("%.2f %.2f %.2f %.2f %.2f %.2f %.2f\n", 
        state.OwnHP, state.ClosestEnemyHP, state.Distance, 
        state.IsLastActionDash, state.IsLastActionAttack, state.IsLastActionSpecialAttack,
        action)

        file:write(out)
        DebugPrintf({ Text = out })
        file:close()  
    end
end

-- local learningRate = 50 -- set between 1, 100
-- local attempts = 10000 -- number of times to do backpropagation
-- local threshold = 1 -- steepness of the sigmoid curve

-- --create a network with 2 inputs, 3 hidden cells, and 1 output
-- local myNetwork = Luann:new({2, 3, 3, 1}, learningRate, threshold)

-- --run backpropagation (bp)
-- for i = 1,attempts do
-- 	myNetwork:bp({0,0},{0})
-- 	myNetwork:bp({1,0},{1})
-- 	myNetwork:bp({0,1},{1})
-- 	myNetwork:bp({1,1},{0})
-- end

-- --print the signal of the single output cell when :activated with different inputs
-- DebugPrint({ Text = "Results:"})
-- myNetwork:activate({0,0})
-- DebugPrint({ Text = "0 0 | " .. myNetwork[3].cells[1].signal })
-- myNetwork:activate({0,1})
-- DebugPrint({ Text = "0 1 | " .. myNetwork[3].cells[1].signal })
-- myNetwork:activate({1,0})
-- DebugPrint({ Text = "1 0 | " .. myNetwork[3].cells[1].signal })
-- myNetwork:activate({1,1})
-- DebugPrint({ Text = "1 1 | " .. myNetwork[3].cells[1].signal })