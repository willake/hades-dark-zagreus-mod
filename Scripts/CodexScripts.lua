-- The script is inspired by CodexMenu mod by LRevolution
-- https://www.nexusmods.com/hades/mods/15

if not DarkZagreus.Config.Enabled then return end

-- add a new section in codex
local DZCommands = {
	Order = {
		"ExportRecordToFile",
		"LoadRecordFromFile",
        "ClearRecord",
        "ForceNextRoomBossRoom"
	}
}

table.insert(CodexOrdering.Order, "DZCommands")
CodexOrdering.DZCommands = DZCommands

DZCommands = {
	UnlockType = CodexUnlockTypes.Mystery,
	TitleText = "Dark Zagreus",
	Entries = {
		ExportRecordToFile = {
			Entries = {
				{
					Text = "Export training data to a file. Only works on x86(32 bit) version. It will save a file to the x86 folder of the root folder with the name of DZRecord.log"
				}
			}
		},
		LoadRecordFromFile = {
			Entries = {
				{
					Text = "Load trainign data from a file. Only works on x86(32 bit) version. It will load a file in the x86 folder of the root folder with the name of DZRecord.log"
				}
			}
		},
		ClearRecord = {
			Entries = {
				{
					Text = "Clear the training data in the save file. Will reset the AI to random behavior with regular weapon."
				}
			}
		},
		ForceNextRoomBossRoom = {
			Entries = {
				{
					Text = "Use this function while you have started a run. It will force the next room to Hades boss room."
				}
			}
		},
	}
}

Codex.DZCommands = DZCommands

-- handle confirm
OnControlPressed{ "Confirm",
	function( triggerArgs )
		DZUIMain(triggerArgs)
	end
}

function DZUIUseCommand(commandName, triggerArgs)
    local command = "DZUIHandle" .. commandName
	local commandFunction = _G[command]
	if commandFunction ~= nil then
		CloseCodexScreen()
		commandFunction(triggerArgs)
	end
end

function DZUIMain(triggerArgs)
    if CodexUI.Screen == nil or not IsScreenOpen("Codex") or IsScreenOpen("BoonInfoScreen") then
		return
	end

    local selection = CodexStatus.SelectedEntryNames[CodexStatus.SelectedChapterName]

    if Codex.DZCommands.Entries[selection] ~= nil then
		DebugPrint({Text = "@DarkZagreus Trying to execute command : "..selection})
		DZUIUseCommand(selection, triggerArgs)
    end
end

-- x86 only
function DZUIHandleExportRecordToFile()
	if io == nil then
		ModUtil.Hades.PrintDisplay("Can't export record. This feature only works on x86(32 bits) version", 3, {255, 0, 0, 255})
	else
		DZSavePrevRunRecordToFile()	
		ModUtil.Hades.PrintDisplay("Successfully export record. The file name is DZRecord.log", 3, {0, 255, 255, 255})
	end
end

-- x86 only
function DZUIHandleLoadRecordFromFile()
	if io == nil then
		ModUtil.Hades.PrintDisplay("Can't load record. This feature only works on x86(32 bits) version", 3, {255, 0, 0, 255})
	else
		DZLoadPreRunRecordFromFile()
		ModUtil.Hades.PrintDisplay("Successfully load record", 3, {0, 255, 255, 255})
	end
end

function DZUIHandleClearRecord()
	DZClearAllRecordInMemory()
	ModUtil.Hades.PrintDisplay("Successfully clear record", 3, {0, 255, 255, 255})
end

function DZUIHandleForceNextRoomBossRoom()
	DZDebugForceNextRoomBossRoom()
	ModUtil.Hades.PrintDisplay("Successfully set next room to boss room", 3, {0, 255, 255, 255})
end