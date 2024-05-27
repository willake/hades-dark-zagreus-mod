-- check if is damaged
ModUtil.Path.Wrap("DamageHero", function(base, victim, triggerArgs)
    -- for record
    DZPersistent.LastGetDamagedTime = _worldTime

    DZPersistent.AI.LastDamageEnemyTime = _worldTime
    
    return base(victim, triggerArgs)
end, DarkZagreus)

-- check if damaged enemies
ModUtil.Path.Wrap("DamageEnemy", function(base, victim, triggerArgs)
    DZPersistent.LastDamageEnemyTime = _worldTime
    
    DZPersistent.AI.LastGetDamagedTime = _worldTime

    return base(victim, triggerArgs)
end, DarkZagreus)