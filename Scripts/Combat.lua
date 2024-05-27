-- check if is damaged
ModUtil.Path.Wrap("DamageHero", function(base, victim, triggerArgs)
    if DZCheckCanRecord() then
        -- for record
        DZPersistent.LastGetDamagedTime = _worldTime

        DZPersistent.AI.LastDamageEnemyTime = _worldTime
    end 
    
    return base(victim, triggerArgs)
end, DarkZagreus)

-- check if damaged enemies
ModUtil.Path.Wrap("DamageEnemy", function(base, victim, triggerArgs)

    if DZCheckCanRecord() then
        DZPersistent.LastDamageEnemyTime = _worldTime
    
        DZPersistent.AI.LastGetDamagedTime = _worldTime    
    end
    return base(victim, triggerArgs)
end, DarkZagreus)