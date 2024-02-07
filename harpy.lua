-- UnitSetData.Enemies.Harpy.WeaponOptions = { "EnemySwordWeapon", "EnemySwordWeapon2", "EnemySwordWeapon3",
--     "EnemySwordWeaponDash", "EnemySwordParry" }
-- UnitSetData.Enemies.Harpy.DisarmedWeapon = "EnemySwordWeapon"

UnitSetData.Enemies.Harpy.WeaponOptions = { "EnemyBowWeapon", "EnemyBowSplitShot" }
UnitSetData.Enemies.Harpy.DisarmedWeapon = "EnemyBowWeapon"

local StartChargingTime = 0

OnWeaponCharging { "BowWeapon BowWeaponDash",
    function(triggerArgs)
        DebugPrint({ Text = "Start Charging" })
        StartChargingTime = _worldTime
    end }


OnWeaponTriggerRelease { "BowWeapon BowWeaponDash",
    function(triggerArgs)
        local duration = _worldTime - StartChargingTime
        DebugPrint({ Text = "ChargeDuration: " .. duration })
        DebugPrintString("ButtonX" .. duration)
    end }

OnWeaponFired { "BowSplitShot",
    function(triggerArgs)
        DebugPrint({ Text = "SplitShot" })
        DebugPrintString("ButtonY")
    end }

OnWeaponFired { "RushWeapon",
    function(triggerArgs)
        DebugPrint({ Text = "RushWeapon" })
        DebugPrintString("ButtonA")
    end }

local fistStartHoldtime = 0

OnWeaponCharging { "FistWeapon",
    function(triggerArgs)
        DebugPrint({ Text = "Start Charging" })
        fistStartHoldtime = _worldTime
    end }

OnWeaponTriggerRelease { "FistWeapon",
    function(triggerArgs)
        local duration = _worldTime - fistStartHoldtime
        DebugPrint({ Text = "Fist ChargeDuration: " .. duration })
    end }

local gunStartHoldtime = 0

OnWeaponCharging { "GunWeapon GunWeaponDash SniperGunWeapon SniperGunWeaponDash",
    function(triggerArgs)
        DebugPrint({ Text = "Start Charging" })
        gunStartHoldtime = _worldTime
    end }

OnWeaponTriggerRelease { "GunWeapon GunWeaponDash SniperGunWeapon SniperGunWeaponDash",
    function(triggerArgs)
        local duration = _worldTime - gunStartHoldtime
        DebugPrint({ Text = "Gun ChargeDuration: " .. duration })
    end }
