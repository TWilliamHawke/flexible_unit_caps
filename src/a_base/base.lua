Flexible_unit_caps = {
    log_level = 0; -- 0=none, 1=player, 2=player and ai, 3=debug
    ui_debounce_key = "fluc_debounce_ui",
    main_debounce_key = "fluc_debounce_main",
    loaned_army_effect = "FLUC_loaned_army",
    heroes_unit_group = "fluc_all_heroes",
    show_base_supply = false,
  --main
    ai_supply_mult = 0,
    player_supply_custom_mult = -1,
    basic_unit_supply = 0,
    basic_lord_supply = 0,
  --balance
    enable_supply_balance = true,
    walls_reduces_balance = true,
    max_balance_per_buildings = 3,
    big_empire_penalty_start = 999,
    max_balance_per_army = 8,
  --unit cap
    hero_cap = 4,
    player_unit_cap_mult = 1,
    ai_unit_cap_mult = 1.25,
    use_harsh_mode = false,
    MIN_UNIT_CAP = 1,
    LORD_FACTOR_CAP_MULT = -0.3, --transform supply discount into unit cap
    UNLIMITED_CAP = -99,
  --Cached values
    game_lang = nil,
    character_panel_lords = {},
    building_tooltip_text = nil,
    port_buildings = {},
}

--TODO check config without mct

