-- check if is damaged
ModUtil.Path.Wrap("DamageHero", function(base, victim, triggerArgs)
    if DZCheckCanRecord() then
        -- for record
        DZTemp.LastGetDamagedTime = _worldTime

        if DZTemp.AI then
            local attacker = triggerArgs.AttackerTable
            
            -- id is DarkZagreus's ObjectId
            if attacker and attacker.ObjectId == DZTemp.AI.ObjectId then
                DZTemp.AI.LastDamageEnemyTime = _worldTime 

                -- for aspect of gilgamesh
                local sourceWeaponData = GetWeaponData( attacker, triggerArgs.SourceWeapon )
                thread( DZAICheckComboPowers, victim, attacker, triggerArgs, sourceWeaponData )
                thread( DZAICheckFistDetonation, attacker, victim, triggerArgs)
            end 
        end
    end 
    
    return base(victim, triggerArgs)
end, DarkZagreus)

-- check if damaged enemies
ModUtil.Path.Wrap("DamageEnemy", function(base, victim, triggerArgs)

    if DZCheckCanRecord() then
        DZTemp.LastDamageEnemyTime = _worldTime
        
        if DZTemp.AI then
            if victim and victim.ObjectId == DZTemp.AI.ObjectId then
                DZTemp.AI.LastDamageEnemyTime = _worldTime 
            end  
        end    
    end
    return base(victim, triggerArgs)
end, DarkZagreus)