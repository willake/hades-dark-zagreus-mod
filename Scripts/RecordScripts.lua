if not DarkZagreus.Config.Enabled then return end
 
DZPersistent = {}
DZPersistent.IsRecording = false

if DZPersistent.PendingRecord == nil then
    DZPersistent.PendingRecord = {} 
end 

if DZPersistent.CurRunRecord == nil then
    DZPersistent.CurRunRecord = {}
end 

if DZPersistent.PrevRunRecord == nil then
    DZPersistent.PrevRunRecord = {}
end 

-- DZTemp.Weapon = {}
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
    local dashToward = (action == 0) and 1.0 or 0.0
    local attack = (action == 1) and 1.0 or 0.0
    local special = (action == 2) and 1.0 or 0.0
    local dashAway = (action == 3) and 1.0 or 0.0 -- added in v2
    -- 0 DashToward, 1 Attack, 2 Special Attack, 3 DashAway

    local time = chargeTime / maxChargeTime
    time = (time > 1.0) and 1.0 or time -- if exceed 1 then clamp to 1
    time = (time < 0.0) and 0.0 or time -- if less than 0 clamp to 0, usually not happens

    return {    
        DashToward = dashToward,
        DashAway = dashAway,
        Attack = attack,
        SpecialAttack = special,
        ChargeTime = time
    }
end

function DZGetCurrentState()
    local closestId = GetClosest({ Id = CurrentRun.Hero.ObjectId, DestinationName = "EnemyTeam", IgnoreInvulnerable = true, IgnoreHomingIneligible = true})
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

    local isGetDamagedRecently = _worldTime - DZPersistent.LastGetDamagedTime < 1.0
    local isDamageEnemyRecently = _worldTime - DZPersistent.LastDamageEnemyTime < 1.0

    -- DZDebugPrintString(string.format("Get Damage Recently %s, Damage Enemy Recently %s", isGetDamagedRecently, isDamageEnemyRecently))
    
    return {
        OwnHP = CurrentRun.Hero.Health / CurrentRun.Hero.MaxHealth,
        ClosestEnemyHP = enemyHealth,
        Distance = distance / 1000,
        GetDamagedRecently = isGetDamagedRecently and 1.0 or 0.0,
        DamageEnemyRecently = isDamageEnemyRecently and 1.0 or 0.0
        -- IsLastActionDash = isLastActionDash,
        -- IsLastActionAttack = isLastActionAttack,
        -- IsLastActionSpecialAttack = isLastActionSpectialAttack,
    }
end

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
    DZPersistent.PendingRecord = {}
end}

-- stop recording and train a new model when the run is cleared
ModUtil.Path.Wrap("RecordRunCleared", function(base)
    if currentRun.Cleared ~= nil then
        DZDebugPrintString("RecordRunCleared() - EndRun " .. tostring(currentRun.Cleared)) 
    else
        DZDebugPrintString("RecordRunCleared() - EndRun " .. "false")
    end
    DZPersistent.IsRecording = false

    -- log the last pending record because the last one hasn't been logged
    if DZPersistent.PendingRecord then
        DZLogRecord(DZPersistent.PendingRecord.State, DZPersistent.PendingRecord.Action) 
    end

    -- save the CurRunRecord to PrevRunRecord, so that it will also be saved into the save file
    DZSaveCurRunRecordAsPrevRunRecord() -- save copy curRunRecord to prevRunRecord
    -- DZSavePrevRunRecordToFile() -- only working on x86

    DZPersistent.CurRunRecord = {}

    return base(currentRun)
end, DarkZagreus)

--- Managing Start/End recording end

-- if io module is not avilable then just print record out
DZCreateNewRecord = function() 
    DZDebugPrintString("DZCreateNewRecord() - Create new record file, enable isRecording to true") 
    local weapon = GameState.LastInteractedWeaponUpgrade

    DZPersistent.CurRunRecord = 
    {
        Version = DarkZagreus.DataVersion,
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
    DZPersistent.LastGetDamagedTime = 0.0
    DZPersistent.LastDamageEnemyTime = 0.0
    DZPersistent.AI = {}
end

DZLogRecord = function (state, action) 
    DZDebugPrintString(string.format("%.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f %.2f", 
        state.OwnHP, state.ClosestEnemyHP, state.Distance, state.GetDamagedRecently, state.DamageEnemyRecently,
        action.DashToward, action.Attack, action.SpecialAttack, action.DashAway, action.ChargeTime))

    table.insert(DZPersistent.CurRunRecord.History, 
    {
      { state.OwnHP, state.ClosestEnemyHP, state.Distance, state.GetDamagedRecently, state.DamageEnemyRecently },
      { action.DashToward, action.Attack, action.SpecialAttack, action.DashAway ,action.ChargeTime }
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

DZSaveCurRunRecordAsPrevRunRecord = function ()
    DZDebugPrintString("DZSaveCurRunRecordInMemory()")
    DZPersistent.PrevRunRecord = DeepCopyTable(DZPersistent.CurRunRecord)
end

DZClearPrevRecordInMemory = function ()
    DZDebugPrintString("DZClearPrevRecordInMemory() - Clear previous record")
    DZPersistent.PrevRunRecord = {}
end

DZClearAllRecordInMemory = function ()
    DZDebugPrintString("DZClearAllRecord() - Clear all records")
    -- DZPersistent.PendingRecord = {}
    DZPersistent.PrevRunRecord = {}
    -- DZPersistent.CurRunRecord = {}
end

DZSavePrevRunRecordToFile = function ()
    DZDebugPrintString("DZSaveCurRunRecordToFile() - Save CurRunRecord to file")
    DZSaveTrainingData(DZPersistent.PrevRunRecord, "DZRecord.log")
end

DZLoadPreRunRecordFromFile = function ()
    DZDebugPrintString("DZSaveCurRunRecordToFile() - Save CurRunRecord to file")
    local record = DZLoadTrainingData("DZRecord.log")
    if record ~= nil and record.Weapon ~= nil and record.History ~= nil then
        DZPersistent.PrevRunRecord = record
    end
end

-- clean up data if the version is not matched
OnAnyLoad { "DeathArea", function(triggerArgs)
    if DZPersistent.PrevRunRecord and DZPersistent.PrevRunRecord.Version ~= DarkZagreus.DataVersion then
        DZDebugPrintString("DataVersion is not matched, clear all previous data")
        DZClearAllRecordInMemory()
    end 
end}