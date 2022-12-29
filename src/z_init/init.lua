local function flexible_unit_caps_init()
    Flexible_unit_caps:create_new_log();
    Flexible_unit_caps:add_player_listeners();
    Flexible_unit_caps:add_ui_listeners();
    Flexible_unit_caps:add_ai_listeners();
    Flexible_unit_caps:add_mct_listeners();
    Flexible_unit_caps:add_api_listeners();
end;

flexible_unit_caps_init();
