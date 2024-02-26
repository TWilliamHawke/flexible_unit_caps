---@diagnostic disable: undefined-field, undefined-global
---@param faction FACTION_SCRIPT_INTERFACE
---@param effect_strength integer
function Flexible_unit_caps:apply_supply_balance_effect(faction, effect_strength)
  local effect_power = math.min(effect_strength, 25)
  local effect_bundle_name = "fluc_bundle_supply_balance_" .. effect_power;
  local raise_dead_effect = "fluc_all_raise_dead_dummy";

  if self:get_game_language() == "RU" then
    raise_dead_effect = raise_dead_effect.."_ru";
    effect_bundle_name = effect_bundle_name.."_ru";
  end

  effect_power = -effect_power;
  local effect_bundle = cm:create_new_custom_effect_bundle(effect_bundle_name);
  effect_bundle:set_duration(0);

  if (self:faction_has_rise_dead(faction)) then
    effect_bundle:add_effect(raise_dead_effect, "faction_to_force_own_unseen", effect_power);
  end

  effect_bundle:add_effect("wh_main_effect_force_all_campaign_recruitment_cost_all", "faction_to_force_own_unseen", effect_power);
  effect_bundle:add_effect("wh2_dlc15_effect_construction_cost_mod_hef_walls", "faction_to_region_own", effect_power);
	effect_bundle:add_effect("fluc_all_mercenary_cost_hidden", "faction_to_character_own_unseen", recruitment_cost);

  if effect_power == -25 then
    effect_bundle:add_effect("wh_dlc05_effect_building_global_recruitment_duration", "faction_to_force_own", -1);
    effect_bundle:add_effect("wh2_dlc15_effect_construction_time_mod_hef_walls", "faction_to_region_own", -1);
  end

    cm:apply_custom_effect_bundle_to_faction(effect_bundle, faction);
  end

