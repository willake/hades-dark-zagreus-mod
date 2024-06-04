
function DZStyxScribeLoadTrainingData()
    DZDebugPrintString("DZStyxScribeLoadTrainingData() - Not really load the file because it is x64 version.")
end

function DZStyxScribeLoadTrainingDataCallback(message)
    
end

if StyxScribe then
    DZStyxScribeLoadTrainingData = function()
        StyxScribe.Send("DarkZagreus: DZStyxScribeLoadTrainingData: ")
    end
    
    DZStyxScribeLoadTrainingDataCallback = function (message)
        DZDebugPrintString("DZStyxScribeLoadTrainingDataCallback: Recieved data from StyxScribe.")
    
        local data = {
            Version = "",
            Weapon = {},
            History = {}
        }
        local fileLines = {}
        
        -- Split the message string into lines
        for line in message:gmatch("[^\r\n]+") do
            table.insert(fileLines, line)
        end
    
        if #fileLines < 3 then
            return nil
        end
    
        for input in fileLines[1]:gmatch("%S+") do
            data.Version = input
            break
        end

        if data.Version ~= DarkZagreus.DataVersion then
            DZDebugPrintString("Loaded data version not matched with current data version. Aborting...")
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
            if i % 2 == 0 then
                local tempState = {}
                for input in fileLines[i]:gmatch("%S+") do table.insert(tempState, tonumber(input)) end
                local tempAction = {}
                for output in fileLines[i + 1]:gmatch("%S+") do table.insert(tempAction, tonumber(output)) end
                table.insert(data.History, {tempState, tempAction})
            end
        end
    
        DZDebugPrintString(string.format("Version: %s", data.Version))
        DZDebugPrintTable("Weapon", data.Weapon)
        DZDebugPrintString(string.format("Data count: %d", #data.History))

        if data.Weapon ~= nil and data.History ~= nil then
            DZPersistent.PrevRunRecord = record
        end 
    end    
    
    -- listen for messages that start with a given prefix
    StyxScribe.AddHook(DZStyxScribeLoadTrainingDataCallback, "DarkZagreus: DZStyxScribeLoadTrainingDataCallback: ", DarkZagreus) 
end