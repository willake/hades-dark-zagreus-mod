if not DarkZagreus.Config.Enabled then return end

local modName = "DarkZagreus" -- put your unique mod codename here
-- DZPrint actually write text to files
local DZPrint = function(...) print(modName .. ":", ...) end
if io then
    local logFilePath = modName .. ".log"
    io.open(logFilePath, "w"):close()

    DZPrint = function(...)
        local file = io.open(logFilePath, "a")

        local out = {}
        local args = { ... }
        for i, v in ipairs(args) do
            table.insert(out, "\t")
            table.insert(out, tostring(v))
        end
        table.insert(out, "\n")
        table.remove(out, 1)

        file:write(table.unpack(out))
        file:close()
        print(modName .. ":", ...)
    end
end

function DZDebugPrintTable(tableName, table, depth)
    if table == nil then
        DebugPrint({ Text = tableName .. " is nil" })
        DZPrint(tableName .. " is nil")
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
    DebugPrint({ Text = whiteSpaceBegin:sub(0, (depth - 1) * 2) .. (tostring(tableName) or "Table") .. " ={" })
    DZPrint(whiteSpaceBegin:sub(0, (depth - 1) * 2) .. (tostring(tableName) or "Table") .. " ={")
    for k, v in pairs(table) do
        if type(v) == "table" then
            DZDebugPrintTable(tostring(k), v, newDepth)
        else
            DebugPrint({ Text = whiteSpaceBegin .. tostring(k) .. "=" .. tostring(v) })
            DZPrint(whiteSpaceBegin .. tostring(k) .. "=" .. tostring(v))
        end
    end
    DebugPrint({ Text = whiteSpaceBegin:sub(0, ((depth - 1) * 2) + 1) .. "}" })
    DZPrint(whiteSpaceBegin:sub(0, ((depth - 1) * 2) + 1) .. "}")
end

function DZDebugPrintString(text)
    DebugPrint({ Text = text })
    DZPrint(text)
end