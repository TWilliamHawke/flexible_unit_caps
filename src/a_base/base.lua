Flexible_unit_caps = {
    log_level = 0; -- 0=none, 1=player, 2=player and ai, 3=debug
    ui_debounce_key = "fluc_ui_debounce",
    disband_debounce_key = "fluc_disband_debounce",
    loaned_army_effect = "FLUC_loaned_army",
    --main
    selected_character = nil,
    ai_supply_enabled = false,
    ai_supply_mult = 0,
    player_supply_custom_mult = -1,
    bretonnia_supply = false,
    basic_unit_supply = 0,
    basic_lord_supply = 0,
    --balance
    enable_supply_balance = true,
    max_balance_per_buildings = 3,
    big_empire_penalty_start = 50,
    big_city_penalty = 2,
    --unit cap
    player_unit_cap_mult = 1,
    ai_unit_cap_mult = 1.25,
    MIN_UNIT_CAP = 2, --const
    LORD_FACTOR_CAP_MULT = 0.5, --transform supply discount into unit cap
    --Cached values
    ui_faction_check = nil,
    block_scripts = false,
    game_lang = nil,
    queued_units_cache = {}, ---@type uits_cache
}

