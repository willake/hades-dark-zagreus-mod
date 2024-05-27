ModUtil.Path.Wrap("MarkTargetApply", function(base, triggerArgs)
    if not triggerArgs.Reapplied then
        DZDebugPrintString("MarkTargetApply")
        DZTemp.LastMarkedTargetTime = _worldTime
        DZTemp.ValidMarkTime = 3
    end
    
    return base(triggerArgs)
end, DarkZagreus)