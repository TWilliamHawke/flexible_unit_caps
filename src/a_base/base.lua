Flexible_unit_caps = {
    log_level = 0; -- 0=none, 1=player, 2=player and ai, 3=debug
    ui_debounce_key = "fluc_debounce_ui",
    main_debounce_key = "fluc_debounce_main",
    loaned_army_effect = "FLUC_loaned_army",
  --main
    ai_supply_mult = 0,
    player_supply_custom_mult = -1,
    basic_unit_supply = 0,
    basic_lord_supply = 0,
  --balance
    enable_supply_balance = false,
    walls_reduces_balance = true,
    max_balance_per_buildings = 3,
    big_empire_penalty_start = 999,
    big_city_penalty = 2,
  --unit cap
    player_unit_cap_mult = 1,
    ai_unit_cap_mult = 1.25,
    use_harsh_mode = false,
    MIN_UNIT_CAP = 1,
    LORD_FACTOR_CAP_MULT = -0.3, --transform supply discount into unit cap
  --Cached values
    ui_faction_check = nil,
    block_scripts = false,
    game_lang = nil,
    queued_units_cache = {}, ---@type UnitsCache
    selected_force_units_cache = {}, ---@type UnitsCache
    supply_change_cache = {} ---@type Supply_change_cache
}

--TODO check config without mct

