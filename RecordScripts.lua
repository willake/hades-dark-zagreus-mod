DZ = {}
DZ.Model = {}
DZ.IsRecording = false
DZ.LastAction = 0

SaveIgnores["DZ"] = true
  
-- sword weapon
OnWeaponFired{ "SwordWeapon SwordWeapon2 SwordWeapon3 SwordWeaponDash",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        DebugPrintf({ Text = "Attack" })
        LogRecord(DZGetCurrentState(), DZMakeActionData(1, 0, 1))        
        DZ.LastAction = 1
    end
}

OnWeaponFired{ "SwordParry",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        DebugPrintf({ Text = "SpecialAttack" })
        LogRecord(DZGetCurrentState(), DZMakeActionData(2, 0, 1))
        DZ.LastAction = 2
    end
}

-- bow
OnWeaponCharging { "BowWeapon BowWeaponDash",
    function(triggerArgs)
        DZ.StartChargingTime = _worldTime
    end 
}

OnWeaponTriggerRelease { "BowWeapon BowWeaponDash",
    function(triggerArgs)
        if not DZCheckCanRecord() then
            return false
        end

        local duration = _worldTime - DZ.StartChargingTime
        DebugPrint({ Text = "ChargeDuration: " .. duration })
        DebugPrint({ Text = "Attack" })
        LogRecord(DZGetCurrentState(), DZMakeActionData(1, duration, 1))   
        DZ.LastAction = 1  
    end 
}

OnWeaponFired{ "BowSplitShot",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        DebugPrintf({ Text = "SpecialAttack" })
        LogRecord(DZGetCurrentState(), DZMakeActionData(2, 0, 1))
        DZ.LastAction = 2
    end
}

-- spear

-- OnWeaponCharging { "SpearWeapon SpearWeapon2 SpearWeapon3",
--     function(triggerArgs)
--         DebugPrintf({ Text = "StartCharging" })
--         DZ.StartChargingTime = _worldTime
--         DZ.IsSpearSpinCharging = false
--     end 
-- }

-- OnWeaponTriggerRelease { "SpearWeapon SpearWeapon2 SpearWeapon3",
--     function(triggerArgs)
--         -- if not DZCheckCanRecord() then
--         --     return false
--         -- end

--         if IsControlDown({ Name = "Attack2" }) then
--             return
--         end
--         DebugPrint({ Text = "ShortAttack" })
--         -- LogRecord(DZGetCurrentState(), DZMakeActionData(1, 0, 1))     
--         DZ.LastAction = 1
--     end 
-- }

-- OnWeaponTriggerRelease { "SpearWeaponSpin SpearWeaponSpin2 SpearWeaponSpin3",
--     function(triggerArgs)
--         -- if not DZCheckCanRecord() then
--         --     return false
--         -- end

--         local duration = _worldTime - DZ.StartChargingTime
--         DebugPrint({ Text = "ChargeDuration: " .. duration })
--         DebugPrint({ Text = "Attack" })
--         -- LogRecord(DZGetCurrentState(), DZMakeActionData(1, duration, 1.6))     
--         DZ.LastAction = 1
--     end 
-- }

-- OnWeaponFired{ "SpearWeaponThrowReturn",
--     function( triggerArgs )
--         -- if not DZCheckCanRecord() then
--         --     return false
--         -- end

--         DebugPrintf({ Text = "SpecialAttack" })
--         -- LogRecord(DZGetCurrentState(), DZMakeActionData(2, 0, 1))
--         DZ.LastAction = 2
--     end
-- }

-- -- SpearThrowImmolation
-- OnWeaponCharging { "SpearWeaponThrow SpearWeaponThrowReturn SpearWeaponThrowInvisibleReturn",
--     function(triggerArgs)
--         -- if not DZCheckCanRecord() then
--         --     return false
--         -- end

--         DebugPrint({ Text = "StartCharging" })
--         DZ.StartChargingTime = _worldTime
--     end 
-- }

-- OnWeaponTriggerRelease { "SpearWeaponThrow SpearWeaponThrowReturn SpearWeaponThrowInvisibleReturn",
--     function(triggerArgs)
--         -- if not DZCheckCanRecord() then
--         --     return false
--         -- end
        
--         local duration = _worldTime - DZ.StartChargingTime
--         DebugPrint({ Text = "ChargeDuration: " .. duration })
--         DebugPrint({ Text = "SpecialAttack" })
--         -- LogRecord(DZGetCurrentState(), DZMakeActionData(1, 0, 1))     
--         DZ.LastAction = 2
--     end 
-- }

-- rush
OnWeaponFired{ "RushWeapon",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        DebugPrintf({ Text = "Rush" })
        LogRecord(DZGetCurrentState(), DZMakeActionData(0, 0, 1))
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

function DZMakeActionData(action, chargeTime, maxChargeTime)
    local dash = (action == 0) and 1.0 or 0.0
    local attack = (action == 1) and 1.0 or 0.0
    local special = (action == 2) and 1.0 or 0.0

    local time = chargeTime / maxChargeTime
    time = (time > 1.0) and 1.0 or time -- if exceed 1 then normalize to 1

    return {    
        Dash = dash,
        Attack = attack,
        SpecialAttack = special,
        ChargeTime = time
    }
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


function DZForceTraining()
    local learningRate = 50 -- set between 1, 100
    local attempts = 50 -- number of times to do backpropagation
    local threshold = 1 -- steepness of the sigmoid curve

    local network = Luann:new({6, 5, 5, 4}, learningRate, threshold)
    local trainingData = LoadTrainingData("DZrecord" .. ".log")

    DebugPrint({ Text = "Start trainning... Data count: " .. tostring(#trainingData)})

    for i = 1, attempts do
        for _, data in ipairs(trainingData) do
            network:bp(data[1], data[2])
        end
    end

    DZ.Model = network
end

OnControlPressed { "Reload",
function(triggerArgs)
    DZForceTraining()
end
}

--- Managing Start/End recording
-- I don't know how to detect give up and die
-- wrapping EndRun() is not working, so better terminate the recording whenever the character
-- enters the DeathArea

-- ModUtil.Path.Wrap("StartNewRun", function(base, prevRun, args)
--     DebugPrintf({ Text = "StartNewRun" })
--     DZ.IsRecording = true
--     CreateNewRecord()
--     return base(prevRun, args)
-- end, DarkZagreus)

-- ModUtil.Path.Wrap("EndRun", function(base, currentRun)
--     DZ.IsRecording = false
--     return base(currentRun)
-- end, DarkZagreus)

-- OnAnyLoad { "DeathArea", function(triggerArgs)
--     DZ.IsRecording = false
-- end}

-- ModUtil.Path.Wrap("RecordRunCleared", function(base)
--     if currentRun.Cleared ~= nil then
--         DebugPrintf({ Text = "EndRun " .. tostring(currentRun.Cleared) }) 
--     else
--         DebugPrintf({ Text = "EndRun " .. "false" })
--     end
--     DZ.IsRecording = false

--     -- training

--     local learningRate = 50 -- set between 1, 100
--     local attempts = 100 -- number of times to do backpropagation
--     local threshold = 1 -- steepness of the sigmoid curve

--     local network = Luann:new({6, 5, 5, 4}, learningRate, threshold)
--     local trainingData = LoadTrainingData("DZrecord" .. ".log")

--     for i = 1, attempts do
--         for _, data in ipairs(trainingData) do
--             network:bp(data[1], data[2])
--         end
--     end

--     return base(currentRun)
-- end, DarkZagreus)

--- Managing Start/End recording end

-- if io module is not avilable then just print record out
CreateNewRecord = function() DebugPrintf({ Text = "Create new record file, enable isRecording to true" }) end
LogRecord = function (state, action) DebugPrintf({ Text = string.format("%.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f", 
    state.OwnHP, state.ClosestEnemyHP, state.Distance, 
    state.IsLastActionDash, state.IsLastActionAttack, state.IsLastActionSpecialAttack,
    action.Dash, action.Attack, action.SpecialAttack, action.ChargeTime)})
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

        local input = string.format("%.2f %.2f %.2f %.2f %.2f %.2f\n", 
        state.OwnHP, state.ClosestEnemyHP, state.Distance, 
        state.IsLastActionDash, state.IsLastActionAttack, state.IsLastActionSpecialAttack)
        local output = string.format("%.2f %.2f %.2f %.2f\n", 
        action.Dash, action.Attack, action.SpecialAttack, action.ChargeTime)

        file:write(input)
        file:write(output)
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