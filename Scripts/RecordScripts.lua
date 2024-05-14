if not DarkZagreus.Config.Enabled then return end

DZPersistent = {}
DZPersistent.IsRecording = false
DZPersistent.LastAction = 0 -- 0 Dash, 1 Attack, 2 Special Attack
DZPersistent.PendingRecord = {} 
DZPersistent.PrevRunRecord = {}
DZPersistent.CurRunRecord = {}

DZTemp.Weapon = {}
DZTemp.Model = {}

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

    -- only actions towards enemies should be recorded
    if IsEmpty(RequiredKillEnemies) then
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

    if DZPersistent.PrevRunRecord == nil then
        DebugPrint({ Text = "DZForceTraining() - PrevRunRecord is missing"})
        return
    end
    local weaponData = DZPersistent.PrevRunRecord.Weapon
    local trainingData = DZPersistent.PrevRunRecord.History

    if #trainingData == 0 then
        return
    end

    DebugPrint({ Text = "DZForceTraining() - PrevRunRecord is missing" .. tostring(#trainingData)})

    DZDebugPrintTable("DZForceTraining() - WeaponData", weaponData, 3)

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
        DebugPrint({ Text = "RecordRunCleared() - EndRun " .. tostring(currentRun.Cleared) }) 
    else
        DebugPrint({ Text = "RecordRunCleared() - EndRun " .. "false" })
    end
    DZPersistent.IsRecording = false

    -- log the last pending record because the last one hasn't been logged
    if DZPersistent.PendingRecord then
        DZLogRecord(DZPersistent.PendingRecord.State, DZPersistent.PendingRecord.Action) 
    end

    -- save the CurRunRecord to PrevRunRecord, so that it will also be saved into the save file
    DZSaveCurRunRecordInMemory()

    -- training

    local learningRate = 50 -- set between 1, 100
    local attempts = 100 -- number of times to do backpropagation
    local threshold = 1 -- steepness of the sigmoid curve

    local network = Luann:new({6, 5, 5, 4}, learningRate, threshold)

    for i = 1, attempts do
        for _, data in ipairs(DZPersistent.PrevRunRecord.History) do
            network:bp(data[1], data[2])
        end
    end

    return base(currentRun)
end, DarkZagreus)

--- Managing Start/End recording end

-- if io module is not avilable then just print record out
DZCreateNewRecord = function() 
    DebugPrint({ Text = "DZCreateNewRecord() - Create new record file, enable isRecording to true" }) 
    local weapon = GameState.LastInteractedWeaponUpgrade

    DZPersistent.CurRunRecord = 
    {
        Weapon = 
        {
            WeaponName = weapon.WeaponName,
            ItemIndex =  weapon.ItemIndex
        },
        History = 
        {
        }
    }
  
    DZPersistent.PendingRecord = {}
end

DZLogRecord = function (state, action) 
    DebugPrint({ Text = string.format("%.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f", 
        state.OwnHP, state.ClosestEnemyHP, state.Distance, 
        state.IsLastActionDash, state.IsLastActionAttack, state.IsLastActionSpecialAttack,
        action.Dash, action.Attack, action.SpecialAttack, action.ChargeTime)})

    table.insert(DZPersistent.CurRunRecord.History, 
    {
      { state.OwnHP, state.ClosestEnemyHP, state.Distance, 
        state.IsLastActionDash, state.IsLastActionAttack, state.IsLastActionSpecialAttack },
      { action.Dash, action.Attack, action.SpecialAttack, action.ChargeTime }
    })
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

DZSaveCurRunRecordInMemory = function ()
    DebugPrint({ Text = {"DZSaveCurRunRecordInMemory() - DZSaveCurRunRecordInMemory"} })
    DZPersistent.PrevRunRecord = DeepCopyTable(DZPersistent.CurRunRecord)
end

DZClearAllRecordInMemory = function ()
    DebugPrint({ Text = {"DZClearAllRecord() - DZClearAllRecord"} })
    DZPersistent.PendingRecord = {}
    DZPersistent.PrevRunRecord = {}
    DZPersistent.CurRunRecord = {}
end

DZSaveCurRunRecordToFile = function ()
    DebugPrint({ Text = {"DZSaveCurRunRecordToFile() - DZSaveCurRunRecordToFile"} })
end

-- if io module is avilable, create a new record file then start logging
if io then
    local recordFilePath = "DZrecord" .. ".log"

    DZSaveCurRunRecordToFile = function ()
        DebugPrint({ Text = {"DZSaveCurRunRecordToFile() - DZSaveCurRunRecordToFile"} })
        local file = io.open(recordFilePath, "w+")
        
        local weapon = GameState.LastInteractedWeaponUpgrade

        DZPersistent.PendingRecord = {}

        -- write what weapon player's holding into the file
        file:write(string.format("%s\n", weapon.WeaponName))
        file:write(string.format("%d\n", weapon.ItemIndex))

        for i = 1, #DZPersistent.CurRunRecord.History do
            local record = DZPersistent.CurRunRecord.History[i]
            
            local state = ""
            -- format state
            for i, v in ipairs(record[1]) do
                -- Format the float to 2 decimal places and concatenate it to the string
                state = state .. string.format("%.2f", v)

                -- Add a space after each float except the last one
                if i < #record[1] then
                    state = state .. " "
                end
            end

            state = state .. "\n"

            -- format action
            local action = ""
            -- format state
            for i, v in ipairs(record[2]) do
                -- Format the float to 2 decimal places and concatenate it to the string
                action = action .. string.format("%.2f", v)

                -- Add a space after each float except the last one
                if i < #record[2] then
                    action = action .. " "
                end
            end

            action = action .. "\n"
    
            file:write(state)
            file:write(action)
        end

        file:close()
    end
end

-- clean up data if the version is not matched

OnAnyLoad { "DeathArea", function(triggerArgs)
    if DZPersistent.PrevRunRecord.Version ~= DZVersion then
        DZClearAllRecordInMemory()
    end 
end}