function LoadTrainingData(fileName)
    local trainingData = {}
    local fileLines = {}
    local file = io.open(fileName, "rb")
        
    for line in file:lines() do
        table.insert (fileLines, line);
    end

    file:close()

    for i = 1, #fileLines do
        if i%2 == 1 then
                local tempInputs = {}
                for input in fileLines[i]:gmatch("%S+") do table.insert(tempInputs, tonumber(input)) end
                local tempOutputs = {}
                for output in fileLines[i+1]:gmatch("%S+") do table.insert(tempOutputs, tonumber(output)) end
            table.insert(trainingData, {tempInputs, tempOutputs})
        end
    end
    return(trainingData)
end