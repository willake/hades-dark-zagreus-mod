local DarkZagreus = ModUtil.Mod.Register("DarkZagreus")
DarkZagreus.Config = {
    Enabled = true
}

DarkZagreus.Version = "beta1.1"
DarkZagreus.DataVersion = "v4" -- for training data, when the data structure chages, the version increases

-- State Scheme
-- {
--     OwnHP,
--     ClosestEnemyHP,
--     Distance,
--     GetDamagedRecently,
--     DamageEnemyRecently,
--     MarkTargetRecently
-- }

-- Action Scheme
-- {    
--     DashToward,
--     DashAway,
--     Attack,
--     SpecialAttack,
--     ChargeTime
-- }