-- The script is inspired by CodexMenu mod by LRevolution
-- https://www.nexusmods.com/hades/mods/15

if not DarkZagreus.Config.Enabled then return end

-- add a new section in codex
local DZCommands = {
	Order = {
        "ClearRecord",
        "ForceNextRoomBossRoom",
	}
}

if io then
	table.insert(DZCommands.Order, "ExportRecordToFile")
	table.insert(DZCommands.Order, "LoadRecordFromFile")
end

if StyxScribe then
	-- table.insert(DZCommands.Order, "ExportRecordToFileStyxScribe")
	table.insert(DZCommands.Order, "LoadRecordFromFileStyxScribe")
end

table.insert(CodexOrdering.Order, "DZCommands")
CodexOrdering.DZCommands = DZCommands

DZCommands = {
	UnlockType = CodexUnlockTypes.Mystery,
	TitleText = "Dark Zagreus",
	Entries = {
		ClearRecord = {
			Entries = {
				{
					Text = "This function clears the previous run data, resetting Dark Zagreus's AI to its default state, which is driven by random probabilities. Press confirm to execute."
				}
			}
		},
		ForceNextRoomBossRoom = {
			Entries = {
				{
					Text = "This function skips directly to the final boss level, which is useful if you have a successful previous run and want to quickly test fighting Dark Zagreus. It changes your next room to the boss room. You can run this anytime after you start a run. Press confirm to execute."
				}
			}
		},
	}
}

if io then
	DZCommands.Entries.ExportRecordToFile = {
		Entries = {
			{
				Text = "This function exports the record to a file. It only works on the x86 (32-bit) version. The file will be saved in the x86 folder of the root directory with the name DZRecord.log. Press confirm to execute."
			}
		}
	}
	DZCommands.Entries.LoadRecordFromFile = {
		Entries = {
			{
				Text = "This function loads record from a file. It only works on the x86 (32-bit) version. The file must be located in the x86 folder of the root directory and named DZRecord.log. Dark Zagreus in your next encounter will be driven by this record. Press confirm to execute."
			}
		}
	}
end

if StyxScribe then
	-- DZCommands.Entries.ExportRecordToFileStyxScribe = {
	-- 	Entries = {
	-- 		{
	-- 			Text = "This function exports the record to a file.  It could work on any version but only with StyxScribe installed. The file will be saved in the Hades root folder with the name DZRecord.log. Press confirm to execute."
	-- 		}
	-- 	}
	-- }
	DZCommands.Entries.LoadRecordFromFileStyxScribe = {
		Entries = {
			{
				Text = "This function loads record from a file. It could work on any version but only with StyxScribe installed. The file must be located in the Hades root folder and named DZRecord.log. Dark Zagreus in your next encounter will be driven by this record. Press confirm to execute."
			}
		}
	}
end

Codex.DZCommands = DZCommands

-- handle confirm
OnControlPressed{ "Confirm",
	function( triggerArgs )
		DZUIHandleConfirm(triggerArgs)
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

function DZUIHandleConfirm(triggerArgs)
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
		ModUtil.Hades.NewMenuYesNo("ConfirmLoadRecord", nil, nil, function ()
			DZLoadPreRunRecordFromFile()
			ModUtil.Hades.PrintDisplay("Successfully load record", 3, {0, 255, 255, 255})
		end, nil, 
		"Sure to load record?", 
		"It will override your lastest record. Are you sure to load a record?",
		"Yes", "No")
	end
end

function DZUIHandleClearRecord()
	ModUtil.Hades.NewMenuYesNo("ConfirmClearRecord", nil, nil, function ()
		DZClearAllRecordInMemory()
		ModUtil.Hades.PrintDisplay("Successfully clear record", 3, {0, 255, 255, 255})
	end, nil, 
	"Sure to clear record?", 
	"Clearing the record means the record will be not accessible anymore. You can export your record in x86 version before cleaning up. Are you sure to clear it?",
	"Yes", "No")
end

function DZUIHandleForceNextRoomBossRoom()
	if CurrentRun.CurrentRoom == nil or CurrentRun.CurrentRoom.Name == nil or CurrentRun.CurrentRoom.Name == "D_Boss01" then
		ModUtil.Hades.PrintDisplay("Can't set next room to boss room. Either you haven't started a run or you're already in boss room", 3, {255, 0, 0, 255})
	else
		DZDebugForceNextRoomBossRoom()
		ModUtil.Hades.PrintDisplay("Successfully set next room to boss room", 3, {0, 255, 255, 255})
	end
end

-- StyxScribe only
function DZUIHandleExportRecordToFileStyxScribe()
	-- TODO: It's not working now. Can't send long message from lua

	-- if StyxScribe == nil then
	-- 	ModUtil.Hades.PrintDisplay("Can't export record. This feature only works with StyxScribe installed", 3, {255, 0, 0, 255})
	-- else
	-- 	-- TODO: bad design, not consistent
	-- 	DZStyxScribeSaveTrainingData(DZPersistent.PrevRunRecord)
	-- end
end

-- StyxScribe only
function DZUIHandleLoadRecordFromFileStyxScribe()
	if StyxScribe == nil then
		ModUtil.Hades.PrintDisplay("Can't load record. This feature only works with StyxScribe installed", 3, {255, 0, 0, 255})
	else
		ModUtil.Hades.NewMenuYesNo("Confirm load record", nil, nil, function ()
			DZStyxScribeLoadTrainingData()
		end, nil, 
		"Sure to load record?", 
		"It will override your lastest record. Are you sure to load a record?",
		"Yes", "No")
	end
end