if not DarkZagreus.Config.Enabled then return end

OnAnyLoad { "RoomOpening", function(triggerArgs)
    DebugPrintf({ Text = "Enter RoomOpening, Force next room to Hades boss room" })
    -- do stuff here
    ForceNextRoom = "D_Boss01"

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
end }

-- force training a model with reload key
OnControlPressed { "Reload",
function(triggerArgs)
    -- DZTrainAI()
    DZClearPrevRecordInMemory()
end
}