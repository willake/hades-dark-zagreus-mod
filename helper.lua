local modName = "EvilZagreus" -- put your unique mod codename here
local Print = function(...) print(modName .. ":", ...) end
if io then
    local logFilePath = modName .. ".log"
    io.open(logFilePath, "w"):close()

    Print = function(...)
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

function DebugPrintTable(tableName, table, depth)
    if table == nil then
        DebugPrint({ Text = tableName .. " is nil" })
        Print(tableName .. " is nil")
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
    Print(whiteSpaceBegin:sub(0, (depth - 1) * 2) .. (tostring(tableName) or "Table") .. " ={")
    for k, v in pairs(table) do
        if type(v) == "table" then
            DebugPrintTable(tostring(k), v, newDepth)
        else
            DebugPrint({ Text = whiteSpaceBegin .. tostring(k) .. "=" .. tostring(v) })
            Print(whiteSpaceBegin .. tostring(k) .. "=" .. tostring(v))
        end
    end
    DebugPrint({ Text = whiteSpaceBegin:sub(0, ((depth - 1) * 2) + 1) .. "}" })
    Print(whiteSpaceBegin:sub(0, ((depth - 1) * 2) + 1) .. "}")
end

function DebugPrintString(text)
    DebugPrint({ Text = text })
    Print(text)
end
