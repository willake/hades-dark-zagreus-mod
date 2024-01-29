if not TestMod.Config.Enabled then return end

OnAnyLoad { "DeathArea", function(triggerArgs)
    -- DebugPrint({ Text = "Hello World!" })
    -- DebugPrint({ Text = "Try read file" })
    -- -- Open the file in read mode
    -- local file = io.open("..\\Content\\Mods\\TestMod\\model.txt", "r")

    -- DebugPrint({ Text = "Loading" })
    -- -- Check if the file was successfully opened
    -- if file then
    --     DebugPrint({ Text = "Successfully loaded" })
    --     -- Read the entire content of the file
    --     local content = file:read("*a")
    --     -- Output the content to the console
    --     DebugPrint({ Text = content })

    --     -- Close the file when done
    --     file:close()
    -- else
    --     DebugPrint({ Text = "Failed loaded" })
    -- end
end }

OnControlPressed { "MoveUp",
    function(triggerArgs)
        DebugPrintf({ Text = "MoveUp" })

        while IsControlDown({ Name = "MoveUp" }) do
            if IsControlDown({ Name = "Reload" }) then
                DebugPrintf({ Text = "helo" })
                -- do stuff here
                ForceNextRoom = "A_Boss01"

                -- Stomp any rooms already assigned to doors
                for doorId, door in pairs(OfferedExitDoors) do
                    local room = door.Room
                    if room ~= nil then
                        if ForceNextRoom ~= nil then
                            DebugPrint({ Text = "ForceNextRoom = " .. tostring(ForceNextRoom) })
                        end

                        local forcedRoomData = RoomData[ForceNextRoom]
                        local forcedRoom = CreateRoom(forcedRoomData)
                        AssignRoomToExitDoor(door, forcedRoom)
                    end
                end
                return
            end
            wait(0.1)
        end
    end }
