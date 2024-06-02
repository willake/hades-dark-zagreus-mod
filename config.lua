local DarkZagreus = ModUtil.Mod.Register("DarkZagreus")
DarkZagreus.Config = {
    Enabled = true
}

DarkZagreus.Version = "beta1.3"
DarkZagreus.DataVersion = "v6" -- for training data, when the data structure chages, the version increases

DarkZagreus.DefaultAIWeapon = {
    WeaponName = "SwordWeapon",
    ItemIndex = 1
}

DarkZagreus.DefaultAIActionData = { -- these are the action probabilities
    DashToward = 0.1, -- 0.2
    Attack = 0.5, -- 0.5
    SpecialAttack = 0.2, -- 0.2
    DashAway = 0.05,
    ChargeAttack = 0.2,
    ManualReload = 0.00
}
-- State Scheme
-- {
--     OwnHP,
--     ClosestEnemyHP,
--     Distance,
--     GetDamagedRecently, -- added in v3
--     DamageEnemyRecently, -- added in v3
--     MarkTargetRecently -- added in v4
--     IsReloading -- added in v6
--     Ammo -- added in v6
--     
-- }

-- Action Scheme
-- {    
--     DashToward,
--     Attack,
--     SpecialAttack,
--     DashAway, -- added in v2
--     ChargeTime -- deprecated in v5
--     ChargeAttack, -- added in v5, for weapons like spear or shield,
--                      whcih have a additional charge attack from the attack action
--     ManualReload, -- added in v6
-- }