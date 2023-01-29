local loc_prefix = "flexible_unit_caps_";

if not get_mct then return end
local mct = get_mct();

if not mct then return end;

local unit_caps_size_options = {
  { key = "-1", text = "Disable", tt = "", default = false },
  { key = "25", text = "25%", tt = "Affects only if unit cap less then 10", default = false },
  { key = "50", text = "50%", tt = "Affects only if unit cap less then 10", default = false },
  { key = "75", text = "75%", tt = "Affects only if unit cap less then 10", default = false },
  { key = "100", text = "100%", tt = "", default = false },
  { key = "125", text = "125%", tt = "", default = false },
  { key = "150", text = "150%", tt = "", default = false },
}

local supply_balance_options = {
  { key = "0", text = "Disable", tt = "", default = true },
  { key = "1", text = "Easy", tt = "", default = false },
  { key = "2", text = "Normal", tt = "", default = false },
  { key = "3", text = "Hard", tt = "", default = false },
}

local unit_caps_penalty_options = {
  { key = "weak", text = "Weak", tt = "Only units above cap will require more supply", default = true },
  { key = "harsh", text = "Harsh", tt = "All units of this type will require more supply", default = false },
}

local flexible_unit_caps = mct:register_mod("flexible_unit_caps")
flexible_unit_caps:set_title(loc_prefix.."mod_title", true)
flexible_unit_caps:set_description(loc_prefix.."mod_desc", true)
flexible_unit_caps:set_log_file_path("flexible_unit_caps_log.txt")
flexible_unit_caps:set_author("TWilliam")

local first_section = flexible_unit_caps:get_section_by_key ("default")
first_section:set_localised_text ("Supply Lines", false)

local player_effect = flexible_unit_caps:add_new_option("a_player_effect", "slider")
player_effect:set_text(loc_prefix.."b_player_effect_text", true)
player_effect:set_tooltip_text(loc_prefix.."b_player_effect_tt", true)
player_effect:slider_set_min_max(1, 20)
player_effect:set_default_value(5)
player_effect:slider_set_step_size(1)

local ai_effect = flexible_unit_caps:add_new_option("b_ai_effect", "slider")
ai_effect:set_text(loc_prefix.."e_ai_effect_text", true)
ai_effect:set_tooltip_text(loc_prefix.."e_ai_effect_tt", true)
ai_effect:slider_set_min_max(0, 20)
ai_effect:set_default_value(0)
ai_effect:slider_set_step_size(1)

local unit_caps_section = flexible_unit_caps:add_new_section("n_unit_caps_section")
unit_caps_section:set_localised_text("Unit Caps")

local player_unit_caps = flexible_unit_caps:add_new_option("a_player_unit_caps", "dropdown")
player_unit_caps:set_text("Unit Caps for Player")
player_unit_caps:add_dropdown_values(unit_caps_size_options)
player_unit_caps:set_default_value("100")

local player_unit_caps = flexible_unit_caps:add_new_option("b_unit_caps_penalty", "dropdown")
player_unit_caps:set_text("Penalty for exceeding the cap")
player_unit_caps:add_dropdown_values(unit_caps_penalty_options)

local ai_unit_caps = flexible_unit_caps:add_new_option("c_ai_unit_caps", "dropdown")
ai_unit_caps:set_text("Unit Caps for AI")
ai_unit_caps:add_dropdown_values(unit_caps_size_options)
ai_unit_caps:set_default_value("125")

local supply_balance_section = flexible_unit_caps:add_new_section("o_balance_section")
supply_balance_section:set_localised_text("Militant Supply Reserves")

local enable_balance = flexible_unit_caps:add_new_option("a_supply_balance_diff", "dropdown")
enable_balance:add_dropdown_values(supply_balance_options)
enable_balance:set_text(loc_prefix.."balance_enable_text", true)
enable_balance:set_tooltip_text(loc_prefix.."balance_enable_tt", true)


local settings_section = flexible_unit_caps:add_new_section("settings_section")
settings_section:set_localised_text("Advanced settings")

local unit_base_supply = flexible_unit_caps:add_new_option("a_unit_supply", "slider")
unit_base_supply:set_text(loc_prefix.."c_c_unit_supply_text", true)
unit_base_supply:set_tooltip_text(loc_prefix.."c_c_unit_supply_tt", true)
unit_base_supply:slider_set_min_max(-3, 3)
unit_base_supply:set_default_value(0)
unit_base_supply:slider_set_step_size(1)

local lord_base_supply = flexible_unit_caps:add_new_option("b_lord_supply", "slider")
lord_base_supply:set_text(loc_prefix.."c_d_lord_supply_text", true)
lord_base_supply:set_tooltip_text(loc_prefix.."c_d_lord_supply_tt", true)
lord_base_supply:slider_set_min_max(0, 30)
lord_base_supply:set_default_value(0)
lord_base_supply:slider_set_step_size(1)

local technical = flexible_unit_caps:add_new_section("technical_section")
technical:set_localised_text("Debug section")

local log_level = flexible_unit_caps:add_new_option("f_enable_logging", "slider")
log_level:slider_set_min_max(0, 3)
log_level:set_default_value(0)
log_level:slider_set_step_size(1)
log_level:set_text(loc_prefix.."f_enable_logging_text", true)
log_level:set_tooltip_text(loc_prefix.."f_enable_logging_tt", true)

-- TODO add tooltips fo new options
