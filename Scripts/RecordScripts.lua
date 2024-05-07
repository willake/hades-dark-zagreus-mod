if not EvilZagreus.Config.Enabled then return end

DZ = {}
DZ.Model = {}
DZ.IsRecording = false
DZ.LastAction = 0
DZ.PendingRecord = {}

SaveIgnores["DZ"] = true
  
-- sword weapon
OnWeaponFired{ "SwordWeapon SwordWeapon2 SwordWeapon3 SwordWeaponDash",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        DebugPrintf({ Text = "Attack" })
        DZLogRecord(DZGetCurrentState(), DZMakeActionData(1, 0, 1))        
        DZ.LastAction = 1
    end
}

OnWeaponFired{ "SwordParry",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        DebugPrintf({ Text = "SpecialAttack" })
        DZLogRecord(DZGetCurrentState(), DZMakeActionData(2, 0, 1))
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
        DZLogRecord(DZGetCurrentState(), DZMakeActionData(1, duration, 1))   
        DZ.LastAction = 1  
    end 
}

OnWeaponFired{ "BowSplitShot",
    function( triggerArgs )
        if not DZCheckCanRecord() then
            return false
        end

        DebugPrintf({ Text = "SpecialAttack" })
        DZLogRecord(DZGetCurrentState(), DZMakeActionData(2, 0, 1))
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
        DZLogRecord(DZGetCurrentState(), DZMakeActionData(0, 0, 1))
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
    local attempts = 10 -- number of times to do backpropagation
    local threshold = 1 -- steepness of the sigmoid curve

    local network = Luann:new({6, 6, 6, 4}, learningRate, threshold)
    local data = LoadTrainingData("DZrecord" .. ".log")
    local weaponData = data.WeaponData

    DZ.Weapon = weaponData
    
    local trainingData = data.TrainingData

    if #trainingData == 0 then
        return
    end

    DebugPrint({ Text = "Start trainning... Data count: " .. tostring(#trainingData)})

    DebugPrintTable("WeaponData", weaponData, 3)

    for i = 1, attempts do
        for _, data in ipairs(trainingData) do
            network:bp(data[1], data[2])
        end
    end

    DZ.Model = network
end

OnControlPressed { "Reload",
function(triggerArgs)
    -- local prevRun = GameState.LastInteractedWeaponUpgrade
    -- DebugPrintTable("PrevRun", prevRun, 5)
    DZForceTraining()
end
}

--- Managing Start/End recording
-- I don't know how to detect give up and die
-- wrapping EndRun() is not working, so better terminate the recording whenever the character
-- enters the DeathArea

ModUtil.Path.Wrap("StartNewRun", function(base, prevRun, args)
    DebugPrintf({ Text = "StartNewRun" })
    DZ.IsRecording = true
    DZCreateNewRecord()
    return base(prevRun, args)
end, DarkZagreus)

ModUtil.Path.Wrap("EndRun", function(base, currentRun)
    DZ.IsRecording = false
    return base(currentRun)
end, DarkZagreus)

OnAnyLoad { "DeathArea", function(triggerArgs)
    DZ.IsRecording = false
end}

ModUtil.Path.Wrap("RecordRunCleared", function(base)
    if currentRun.Cleared ~= nil then
        DebugPrintf({ Text = "EndRun " .. tostring(currentRun.Cleared) }) 
    else
        DebugPrintf({ Text = "EndRun " .. "false" })
    end
    DZ.IsRecording = false

    -- log the last pending record because the last one hasn't been logged
    if DZ.PendingRecord then
        DZLogRecord(DZ.PendingRecord.State, DZ.PendingRecord.Action) 
    end

    -- training

    local learningRate = 50 -- set between 1, 100
    local attempts = 100 -- number of times to do backpropagation
    local threshold = 1 -- steepness of the sigmoid curve

    local network = Luann:new({6, 5, 5, 4}, learningRate, threshold)
    local trainingData = LoadTrainingData("DZrecord" .. ".log")

    for i = 1, attempts do
        for _, data in ipairs(trainingData) do
            network:bp(data[1], data[2])
        end
    end

    return base(currentRun)
end, DarkZagreus)

--- Managing Start/End recording end

-- if io module is not avilable then just print record out
DZCreateNewRecord = function() DebugPrintf({ Text = "Create new record file, enable isRecording to true" }) end
DZLogRecord = function (state, action) DebugPrintf({ Text = string.format("%.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f", 
    state.OwnHP, state.ClosestEnemyHP, state.Distance, 
    state.IsLastActionDash, state.IsLastActionAttack, state.IsLastActionSpecialAttack,
    action.Dash, action.Attack, action.SpecialAttack, action.ChargeTime)})
end

-- Pending record system
-- Here comes a situation: when player try to use spear spin, he/she holds the button,
-- then the character fires the spear attack first then start charging
-- Since we detect player action by FireWeapon, it is difficult to intuitively check whether
-- player is intending to fire spear attack or spear spin
-- therefore I make a pending record, which push spear attack to pending 
-- this allows spear spin to override spear attack record, so holding a button will not double counting actions
DZAddPendingRecord = function(state, action)
    if DZ.PendingRecord then
        DZLogRecord(DZ.State, DZ.Action) 
    end
    DZ.PendingRecord = 
    {
        State = state,
        Action = action
    }
end

DZOverridePendingRecord = function(state, action)
    DZ.PendingRecord = 
    {
        State = state,
        Action = action
    }
end

-- if io module is avilable, create a new record file then start logging
if io then
    local recordFilePath = "DZrecord" .. ".log"

    DZCreateNewRecord = function()
        local file = io.open(recordFilePath, "w+")
        
        local weapon = GameState.LastInteractedWeaponUpgrade

        -- write what weapon player's holding into the file
        file:write(string.format("%s\n", weapon.WeaponName))
        file:write(string.format("%d\n", weapon.ItemIndex))

        file:close()
        DebugPrintf({ Text = "Create new record file, enable isRecording to true" })
    end

    DZLogRecord = function(state, action)
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