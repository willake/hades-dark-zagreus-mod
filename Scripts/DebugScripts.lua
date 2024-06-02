if not DarkZagreus.Config.Enabled then return end 

function DZDebugForceNextRoomBossRoom()
    -- RoomOpening
    ForceNextRoom = "D_Boss01"

    -- Stomp any rooms already assigned to doors
    for doorId, door in pairs(OfferedExitDoors) do
        local room = door.Room
        if room ~= nil then
            if ForceNextRoom ~= nil then
                DZDebugPrintString("ForceNextRoom = " .. tostring(ForceNextRoom))
            end

            local forcedRoomData = RoomData[ForceNextRoom]
            local forcedRoom = CreateRoom(forcedRoomData)
            AssignRoomToExitDoor(door, forcedRoom)
        end
    end
end

function DZDebugPrintString(text)
    DebugPrint({ Text = "@DarkZagreus " .. text })
end

function DZDebugPrintTable(tableName, table, depth)
    if table == nil then
        DebugPrint({ Text = "@DarkZagreus " .. tableName .. " is nil" })
        return
    end
    if depth == nil then
        depth = 0
    end
    local whiteSpaceBegin = "";
    local newDepth = depth
    if depth == -1 then
        newDepth = -1
    else
        for i = 1, depth do
            for x = 1, 2 do
                whiteSpaceBegin = whiteSpaceBegin .. " "
            end
        end
        newDepth = depth + 1
    end
    DebugPrint({ Text = "@DarkZagreus " .. whiteSpaceBegin:sub(0, (depth - 1) * 2) .. (tostring(tableName) or "Table") .. " ={" })
    for k, v in pairs(table) do
        if type(v) == "table" then
            DZDebugPrintTable(tostring(k), v, newDepth)
        else
            DebugPrint({ Text = whiteSpaceBegin .. tostring(k) .. "=" .. tostring(v) })
        end
    end
    DebugPrint({ Text = whiteSpaceBegin:sub(0, ((depth - 1) * 2) + 1) .. "}" })
end

-- local DZDebugPrintToFile = function(...) print("Not working on x64.") end
-- local DZDebugPrintTableToFile = function(...) print("Not working on x64.") end
-- if io then
--     local logFilePath = "DarkZagreus.log"
--     io.open(logFilePath, "w"):close()

--     DZDebugPrintToFile = function(...)
--         local file = io.open(logFilePath, "a")

--         local out = {}
--         local args = { ... }
--         for i, v in ipairs(args) do
--             table.insert(out, "\t")
--             table.insert(out, tostring(v))
--         end
--         table.insert(out, "\n")
--         table.remove(out, 1)

--         file:write(table.unpack(out))
--         file:close()
--     end

--     function DZDebugPrintTableToFile(tableName, table, depth)
--         if table == nil then
--             DZDebugPrintToFile(tableName .. " is nil")
--             return
--         end
--         if depth == nil then
--             depth = 0
--         end
--         local whiteSpaceBegin = "";
--         local newDepth = depth
--         if depth == -1 then
--             newDepth = -1
--         else
--             for i = 1, depth do
--                 for x = 1, 2 do
--                     whiteSpaceBegin = whiteSpaceBegin .. " "
--                 end
--             end
--             newDepth = depth + 1
--         end
--         DZDebugPrintToFile(whiteSpaceBegin:sub(0, (depth - 1) * 2) .. (tostring(tableName) or "Table") .. " ={")
--         for k, v in pairs(table) do
--             if type(v) == "table" then
--                 DZDebugPrintTableToFile(tostring(k), v, newDepth)
--             else
--                 DZDebugPrintToFile(whiteSpaceBegin .. tostring(k) .. "=" .. tostring(v))
--             end
--         end
--         DZDebugPrintToFile(whiteSpaceBegin:sub(0, ((depth - 1) * 2) + 1) .. "}")
--     end    
-- end


-- test weapon charge time
OnWeaponCharging { "ShieldWeapon ShieldWeaponDash ShieldThrow ShieldThrowDash",
    function(triggerArgs)        
        DZTemp.StartChargingTime = _worldTime
    end 
}

OnWeaponFired{ "ShieldWeapon ShieldWeaponDash ShieldWeaponRush ShieldThrow ShieldThrowDash",
    function( triggerArgs )
        local duration = _worldTime - DZTemp.StartChargingTime
        
        -- DebugPrint({ Text = "Attack" })
        DZDebugPrintString(string.format("Charge time: %.2f", duration))
    end
}