if not DarkZagreus.Config.Enabled then return end 

function DZTrainAI()

    if DZPersistent.PrevRunRecord.Version ~= DarkZagreus.DataVersion then
        DZDebugPrintString("DZTrainAI() - Mod version does not match with the current one")
        return
    end

    local learningRate = 3 -- set between 1, 100
    local epoch = 10 -- number of times to do backpropagation
    local threshold = 1 -- steepness of the sigmoid curve

    -- Input: PlayerHP, ClosetEnemyHP, ClosetEnemyDistance, IsLastActionDash, IsLastActionAttack, IsLastActionSpecialAttack
    -- Output: DashProb, AttackProb, SpecialAttackProb, ChargeTime
    local network = Luann:new({20, 13, 13, 6}, learningRate, threshold)

    if DZPersistent.PrevRunRecord == nil then
        DZDebugPrintString("DZTrainAI() - PrevRunRecord is missing")
        return
    end

    if DZPersistent.PrevRunRecord.History == nil or #DZPersistent.PrevRunRecord.History == 0 then
        DZDebugPrintString("DZTrainAI() - History is missing")
        return
    end

    local dataset = DeepCopyTable(DZPersistent.PrevRunRecord.History)
    local consideration = 1 -- conside how many past actions, 2 means 2 past actions
    -- insert last actions to each data, this provides more information for training the model
    for i = 1 + consideration, #dataset do
        for j = 1, consideration do
            local prev = dataset[i - j][2]    
            
            for k = 1, #prev do
                table.insert(dataset[i][1], prev[k])
            end
        end
    end

    -- remove first data since it has not last action, it's fine 
    table.remove(dataset, 1)

    -- improve generalizability
    DZShuffleDataset(dataset)

    DZDebugPrintString("DZTrainAI() - Start training, data count: " .. tostring(#dataset))

    for i = 1, epoch do
        for _, data in ipairs(dataset) do
            network:bp(data[1], data[2])
        end
    end

    DZTemp.Model = network
end

function DZSaveTrainingData(curRunRecord, filePath)
    DZDebugPrintString("DZSaveTrainingData() - Not really save the file because it is x64 version.")
end

function DZLoadTrainingData(filePath)
    DZDebugPrintString("DZLoadTrainingData() - Not really load a file because it is x64 version.")
    return nil
end


-- if io module is avilable, create a new record file then start logging
if io then
    DZSaveTrainingData = function(curRunRecord, filePath)
        local file = io.open(filePath, "w+")

        if curRunRecord == nil or curRunRecord.Weapon == nil or curRunRecord.History == nil then
            DZDebugPrintString("DZSaveTrainingData() - curRunRecord is nil")
            return
        end
        
        local weapon = curRunRecord.Weapon

        -- write what weapon player's holding into the file
        file:write(string.format("%s\n", curRunRecord.Version))
        file:write(string.format("%s\n", weapon.WeaponName))
        file:write(string.format("%d\n", weapon.ItemIndex))

        for i = 1, #curRunRecord.History do
            local record = curRunRecord.History[i]
            
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

            local action = ""
            -- format action
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

    DZLoadTrainingData = function(filePath)
        local data = {
            Version = "",
            Weapon = {},
            History = {}
        }
        local fileLines = {}
        local file = io.open(filePath, "rb")
            
        for line in file:lines() do
            table.insert (fileLines, line);
        end

        file:close()

        if #fileLines < 3 then
            return nil
        end

        for input in fileLines[1]:gmatch("%S+") do
            data.Version = input
            break
        end

        for input in fileLines[2]:gmatch("%S+") do
            data.Weapon.WeaponName = input
            break
        end

        for input in fileLines[3]:gmatch("%S+") do
            data.Weapon.ItemIndex = tonumber(input)
            break
        end

        for i = 4, #fileLines do
            if i%2 == 0 then
                    local tempState = {}
                    for input in fileLines[i]:gmatch("%S+") do table.insert(tempState, tonumber(input)) end
                    local tempAction = {}
                    for output in fileLines[i+1]:gmatch("%S+") do table.insert(tempAction, tonumber(output)) end
                table.insert(data.History, {tempState, tempAction})
            end
        end
        return data
    end
end

function DZShuffleDataset(dataset)
    -- Fisher–Yates shuffle
    for i = #dataset, 1, -1 do
        local r = math.random(1, i)
        local temp = dataset[r]
        dataset[r] = dataset[i]
        dataset[i] = temp
    end
end