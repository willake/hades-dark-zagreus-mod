if not EvilZagreus.Config.Enabled then return end

DZPersistent = {}
DZPersistent.IsRecording = false
DZPersistent.LastAction = 0 -- 0 Dash, 1 Attack, 2 Special Attack
DZPersistent.PendingRecord = {}

DZTemp.Model = {}
  
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
-- so as the AI, the attack action was like: do attack with 1 seconds
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

function DZCheckCanRecord()
    if not DZPersistent.IsRecording then
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
    time = (time > 1.0) and 1.0 or time -- if exceed 1 then clamp to 1
    time = (time < 0.0) and 0.0 or time -- if less than 1 clamp to 1, usually not happens

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

    local isLastActionDash = (DZPersistent.LastAction == 0) and 1 or 0
    local isLastActionAttack = (DZPersistent.LastAction == 1) and 1 or 0
    local isLastActionSpectialAttack = (DZPersistent.LastActionn == 2) and 1 or 0
    
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

    DZPersistent.Weapon = weaponData
    
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

    DZTemp.Model = network
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

-- create a new record when a run starts
ModUtil.Path.Wrap("StartNewRun", function(base, prevRun, args)
    DebugPrint({ Text = "StartNewRun" })
    DZPersistent.IsRecording = true
    DZCreateNewRecord()
    return base(prevRun, args)
end, DarkZagreus)

-- stop recording when run ends
-- this function only runs when the player dies
ModUtil.Path.Wrap("EndRun", function(base, currentRun)
    DZPersistent.IsRecording = false
    return base(currentRun)
end, DarkZagreus)

-- just in case, preventing recording from still being activated
-- stop recording when zegreus back to the hades lobby
OnAnyLoad { "DeathArea", function(triggerArgs)
    DZPersistent.IsRecording = false
end}

-- stop recording and train a new model when the run is cleared
ModUtil.Path.Wrap("RecordRunCleared", function(base)
    if currentRun.Cleared ~= nil then
        DebugPrint({ Text = "EndRun " .. tostring(currentRun.Cleared) }) 
    else
        DebugPrint({ Text = "EndRun " .. "false" })
    end
    DZPersistent.IsRecording = false

    -- log the last pending record because the last one hasn't been logged
    if DZPersistent.PendingRecord then
        DZLogRecord(DZPersistent.PendingRecord.State, DZPersistent.PendingRecord.Action) 
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
DZCreateNewRecord = function() 
    DebugPrint({ Text = "Create new record file, enable isRecording to true" }) 
    DZPersistent.PendingRecord = {}
end
DZLogRecord = function (state, action) 
    DebugPrint({ Text = string.format("%.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f", 
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
DZPushPendingRecord = function(state, action)
    if DZPersistent.PendingRecord.State and DZPersistent.PendingRecord.Action then
        DZLogRecord(DZPersistent.PendingRecord.State, DZPersistent.PendingRecord.Action) 
    end
    DZPersistent.PendingRecord.State = state
    DZPersistent.PendingRecord.Action = action
end

DZOverridePendingRecord = function(state, action)
    DZPersistent.PendingRecord.State = state
    DZPersistent.PendingRecord.Action = action
end

-- if io module is avilable, create a new record file then start logging
if io then
    local recordFilePath = "DZrecord" .. ".log"

    DZCreateNewRecord = function()
        local file = io.open(recordFilePath, "w+")
        
        local weapon = GameState.LastInteractedWeaponUpgrade

        DZPersistent.PendingRecord = {}

        -- write what weapon player's holding into the file
        file:write(string.format("%s\n", weapon.WeaponName))
        file:write(string.format("%d\n", weapon.ItemIndex))

        file:close()
        DebugPrint({ Text = "Create new record file, enable isRecording to true" })
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
        DebugPrint({ Text = out })
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