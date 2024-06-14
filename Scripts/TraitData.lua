if not DarkZagreus.Config.Enabled then return end 

ModUtil.Table.Merge(
    DarkZagreus.AvailableTraits, {
        "DZSwordCriticalParryTrait",
        "DZDislodgeAmmoTrait",
        "DZSwordConsecrationTrait"
    }
)