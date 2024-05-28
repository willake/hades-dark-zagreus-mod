ModUtil.Path.Wrap("MarkTargetApply", function(base, triggerArgs)
    if not triggerArgs.Reapplied then
        DZTemp.LastMarkedTargetTime = _worldTime
        DZTemp.ValidMarkTime = 3
    end
    
    return base(triggerArgs)
end, DarkZagreus)

-- for aspect of chiron
function DZAIMarkTargetApply( triggerArgs )
	if not triggerArgs.Reapplied then
        DZTemp.AI.LastMarkedTargetTime = _worldTime
        DZTemp.AI.ValidMarkTime = 3
        SetWeaponProperty({ WeaponName = "DarkChironBowSplitShot", DestinationId = DZTemp.AI.ObjectId, Property = "OverrideFireRequestTarget", Value = triggerArgs.triggeredById, DataValue = false})
	end
end

function DZAIMarkTargetClear( triggerArgs )
	SetWeaponProperty({ WeaponName = "DarkChironBowSplitShot", DestinationId = DZTemp.AI.ObjectId, Property = "OverrideFireRequestTarget", Value = -1, DataValue = false})
end