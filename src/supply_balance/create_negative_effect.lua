---@diagnostic disable: undefined-field
---@param faction FACTION_SCRIPT_INTERFACE
---@param supply_balance integer
function Flexible_unit_caps:create_negative_sb_effect(faction, supply_balance)
  local force_list = faction:military_force_list();
  local num_of_armies = Flexible_unit_caps:get_armies_count(force_list, self.no_balance_lords)
  local recruitment_cost = math.ceil(-supply_balance * (num_of_armies^0.75))
  local replenishment = math.ceil(supply_balance * (num_of_armies^0.3))

  local additional_supply = Flexible_unit_caps:calculate_supply_penalty(-supply_balance, num_of_armies);

  local supply_balance_bundle_name = "fluc_bundle_supply_balance_negative";
  local supply_balance_effect_name = "fluc_supply_balance_points";
  local raise_dead_effect = "fluc_all_raise_dead_dummy";

  if self:get_game_language() == "RU" then
    supply_balance_effect_name = supply_balance_effect_name.."_ru";
    supply_balance_bundle_name = supply_balance_bundle_name.."_ru";
    raise_dead_effect = raise_dead_effect.."_ru";
  end;



  local effect_bundle = cm:create_new_custom_effect_bundle(supply_balance_bundle_name);
	effect_bundle:add_effect("wh_main_effect_force_all_campaign_recruitment_cost_all", "faction_to_force_own_unseen", recruitment_cost);
	effect_bundle:add_effect("fluc_all_mercenary_cost_hidden", "faction_to_character_own_unseen", recruitment_cost);

  if (self:faction_has_rise_dead(faction)) then
    effect_bundle:add_effect(raise_dead_effect, "faction_to_force_own_unseen", recruitment_cost);
  end
	effect_bundle:add_effect(supply_balance_effect_name, "faction_to_region_own_unseen", additional_supply);
	effect_bundle:add_effect("fluc_all_replenishment_hidden", "faction_to_general_own_enemy_territory", replenishment);
	effect_bundle:add_effect("fluc_all_replenishment_hidden", "faction_to_general_own_neutral_territory", replenishment);
	effect_bundle:add_effect("fluc_all_replenishment", "faction_to_faction_own", replenishment);
  effect_bundle:set_duration(0);

  cm:apply_custom_effect_bundle_to_faction(effect_bundle, faction);

end;
