if not DarkZagreus.Config.Enabled then return end

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