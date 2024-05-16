if not DarkZagreus.Config.Enabled then return end

function DZTrainAI()
    local learningRate = 1 -- set between 1, 100
    local attempts = 1 -- number of times to do backpropagation
    local threshold = 1 -- steepness of the sigmoid curve

    local network = Luann:new({6, 6, 6, 4}, learningRate, threshold)

    if DZPersistent.PrevRunRecord == nil then
        DebugPrint({ Text = "DZTrainAI() - PrevRunRecord is missing"})
        return
    end

    local trainingData = DZPersistent.PrevRunRecord.History

    if #trainingData == 0 then
        return
    end

    DebugPrint({ Text = "DZTrainAI() - Start training, data count: " .. tostring(#trainingData)})

    for i = 1, attempts do
        for _, data in ipairs(trainingData) do
            network:bp(data[1], data[2])
        end
    end

    DZTemp.Model = network
end

function DZSaveTrainingData(CurRunRecord)
    DebugPrint({ Text = "DZSaveTrainingData() - Not really save the file because it is x64 version."})
end

-- if io module is avilable, create a new record file then start logging
if io then
    local recordFilePath = "DZrecord" .. ".log"

    DZSaveTrainingData = function (CurRunRecord)
        local file = io.open(recordFilePath, "w+")
        
        local weapon = CurRunRecord.Weapon

        -- write what weapon player's holding into the file
        file:write(string.format("%s\n", weapon.WeaponName))
        file:write(string.format("%d\n", weapon.ItemIndex))

        for i = 1, #CurRunRecord.History do
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

function DZLoadTrainingData(fileName)
    local data = {}
    data.WeaponData = {}
    data.TrainingData = {}
    local fileLines = {}
    local file = io.open(fileName, "rb")
        
    for line in file:lines() do
        table.insert (fileLines, line);
    end

    file:close()

    for input in fileLines[1]:gmatch("%S+") do
        data.WeaponData.WeaponName = input
        break
    end

    for input in fileLines[2]:gmatch("%S+") do
        data.WeaponData.ItemIndex = tonumber(input)
        break
    end

    for i = 3, #fileLines do
        if i%2 == 1 then
                local tempInputs = {}
                for input in fileLines[i]:gmatch("%S+") do table.insert(tempInputs, tonumber(input)) end
                local tempOutputs = {}
                for output in fileLines[i+1]:gmatch("%S+") do table.insert(tempOutputs, tonumber(output)) end
            table.insert(data.TrainingData, {tempInputs, tempOutputs})
        end
    end
    return (data)
end