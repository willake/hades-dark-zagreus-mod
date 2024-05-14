if not DarkZagreus.Config.Enabled then return end

function DZTrainAI()
    local learningRate = 50 -- set between 1, 100
    local attempts = 10 -- number of times to do backpropagation
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


function LoadTrainingData(fileName)
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