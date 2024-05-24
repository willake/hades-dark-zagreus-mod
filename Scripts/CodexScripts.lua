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
					Text = "This function exports the record to a file. It only works on the x86 (32-bit) version. The file will be saved in the x86 folder of the root directory with the name DZRecord.log."
				}
			}
		},
		LoadRecordFromFile = {
			Entries = {
				{
					Text = "This function loads record from a file. It only works on the x86 (32-bit) version. The file must be located in the x86 folder of the root directory and named DZRecord.log. Dark Zagreus in your next encounter will be driven by this record."
				}
			}
		},
		ClearRecord = {
			Entries = {
				{
					Text = "This function clears the previous run data, resetting Dark Zagreus's AI to its default state, which is driven by random probabilities."
				}
			}
		},
		ForceNextRoomBossRoom = {
			Entries = {
				{
					Text = "This function skips directly to the final boss level, which is useful if you have a successful previous run and want to quickly test fighting Dark Zagreus. It changes your next room to the boss room."
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
		DZDebugPrintString("Trying to execute command : " .. selection)
		DZUIUseCommand(selection, triggerArgs)
    end
end

-- x86 only
function DZUIHandleExportRecordToFile()
	if io == nil then
		ModUtil.Hades.PrintDisplay("Can't export record. This feature only works on x86(32-bit) version", 3, {255, 0, 0, 255})
	else
		DZSavePrevRunRecordToFile()	
		ModUtil.Hades.PrintDisplay("Successfully export record. The file name is DZRecord.log", 3, {0, 255, 255, 255})
	end
end

-- x86 only
function DZUIHandleLoadRecordFromFile()
	if io == nil then
		ModUtil.Hades.PrintDisplay("Can't load record. This feature only works on x86(32-bit) version", 3, {255, 0, 0, 255})
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
	if CurrentRun.CurrentRoom == nil or CurrentRun.CurrentRoom.Name == nil or CurrentRun.CurrentRoom.Name == "D_Boss01" then
		ModUtil.Hades.PrintDisplay("Can't set next room to boss room. Either you haven't started a run or you're already in boss room", 3, {255, 0, 0, 255})
	else
		DZDebugForceNextRoomBossRoom()
		ModUtil.Hades.PrintDisplay("Successfully set next room to boss room", 3, {0, 255, 255, 255})
	end
end