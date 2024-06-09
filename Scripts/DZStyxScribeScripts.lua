
if not DarkZagreus.Config.Enabled then return end

function DZStyxScribeSaveTrainingData(curRunRecord)
    DZDebugPrintString("DZStyxScribeLoadTrainingData() - Not really save the file because StyxScribe is not found.")
end

function DZStyxScribeLoadTrainingData()
    DZDebugPrintString("DZStyxScribeLoadTrainingData() - Not really load the file because StyxScribe is not found.")
end

function DZStyxScribeSaveTrainingDataCallback(message)
    
end

function DZStyxScribeLoadTrainingDataCallback(message)
    
end

if StyxScribe then
    -- TODO: it's not working now, the message is too big and unable to send it from Lua
    -- DZStyxScribeSaveTrainingData = function(curRunRecord)
    --     if curRunRecord == nil or curRunRecord.Weapon == nil or curRunRecord.History == nil then
    --         DZDebugPrintString("DZStyxScribeSaveTrainingData() - curRunRecord is nil")
    --         return nil
    --     end
        
    --     local weapon = curRunRecord.Weapon
    --     local dataString = ""
    
    --     -- write what weapon player's holding into the string
    --     dataString = dataString .. curRunRecord.Version .. "|"
    --     dataString = dataString .. weapon.WeaponName .. "|"
    --     dataString = dataString .. weapon.ItemIndex .. "|"
    
    --     for i = 1, #curRunRecord.History do
    --         local record = curRunRecord.History[i]
            
    --         local state = ""
    --         -- format state
    --         for i, v in ipairs(record[1]) do
    --             -- Format the float to 2 decimal places and concatenate it to the string
    --             state = state .. string.format("%.2f", v)
    
    --             -- Add a separator after each float except the last one
    --             if i < #record[1] then
    --                 state = state .. " "
    --             end
    --         end
    
    --         state = state .. "|"
    
    --         local action = ""
    --         -- format action
    --         for i, v in ipairs(record[2]) do
    --             -- Format the float to 2 decimal places and concatenate it to the string
    --             action = action .. string.format("%.2f", v)
    
    --             -- Add a separator after each float except the last one
    --             if i < #record[2] then
    --                 action = action .. " "
    --             end
    --         end
    
    --         action = action .. "|"
        
    --         dataString = dataString .. state
    --         dataString = dataString .. action
    --     end
        
    --     StyxScribe.Send("DarkZagreus: DZStyxScribeSaveTrainingData: " .. dataString)
    -- end

    -- DZStyxScribeSaveTrainingDataCallback = function (message)
    --     DZDebugPrintString(message)
    --     if message == "true" then
    --         ModUtil.Hades.PrintDisplay("Successfully export record. The file name is DZRecord.log", 3, {0, 255, 255, 255})
    --     else
    --         ModUtil.Hades.PrintDisplay("Export record failed. Check the error message on StyxScribe", 3, {255, 0, 0, 255})
    --     end
    -- end

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
            DZPersistent.PrevRunRecord = data
            ModUtil.Hades.PrintDisplay("Successfully load record", 3, {0, 255, 255, 255})
        end 
    end    
    
    -- listen for messages that start with a given prefix
    StyxScribe.AddHook(DZStyxScribeLoadTrainingDataCallback, "DarkZagreus: DZStyxScribeLoadTrainingDataCallback: ", DarkZagreus)
    StyxScribe.AddHook(DZStyxScribeSaveTrainingDataCallback, "DarkZagreus: DZStyxScribeSaveTrainingDataCallback: ", DarkZagreus)  
end