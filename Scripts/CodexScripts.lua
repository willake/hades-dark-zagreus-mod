-- The script is inspired by CodexMenu mod by LRevolution
-- https://www.nexusmods.com/hades/mods/15

if not DarkZagreus.Config.Enabled then return end

-- add a new section in codex
local DZCommands = {
	Order = {
		"ExportTrainingData",
		"LoadTrainingData",
        "ClearTrainingData",
        "ForceNextRoomBossRoom"
	}
}

table.insert(CodexOrdering.Order, "DZCommands")
CodexOrdering.DZCommands = DZCommands

DZCommands = {
	UnlockType = CodexUnlockTypes.Mystery,
	TitleText = "Dark Zagreus",
	Entries = {
		ExportTrainingData = {
			Entries = {
				{
					Text = "Export training data to a file. Only works on x86(32 bit) version. It will save a file to the x86 folder of the root folder with the name of DZRecord.log"
				}
			}
		},
		LoadTrainingData = {
			Entries = {
				{
					Text = "Load trainign data from a file. Only works on x86(32 bit) version. It will load a file in the x86 folder of the root folder with the name of DZRecord.log"
				}
			}
		},
		ClearTrainingData = {
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
function DZUIHandleExportTrainingData()
	if io == nil then
		DebugPrint({Text = "Can't export file"})	
	end
	DebugPrint({Text = "DZUIHandleExportTrainingData"})
	DZSaveCurRunRecordToFile()
end

-- x86 only
function DZUIHandleLoadTrainingData()
	if io == nil then
		DebugPrint({Text = "Can't export file"})	
	end
	DebugPrint({Text = "DZUIHandleLoadTrainingData"})
end

function DZUIHandleClearTrainingData()
	DebugPrint({Text = "DZUIHandleClearTrainingData"})
	DZClearAllRecordInMemory()
end

function DZUIHandleForceNextRoomBossRoom()
	DebugPrint({Text = "DZUIHandleForceNextRoomBossRoom"})
	DZDebugForceNextRoomBossRoom()
end