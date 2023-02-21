function Flexible_unit_caps:remove_vanila_upkeep_penalty(faction)
  local upkeep_penalty_effect_bundle_key = "wh3_main_bundle_force_additional_army_upkeep";

  Flexible_unit_caps:set_tooltip_for_finance_button(faction);

  local mf_list = faction:military_force_list();

  for i = 0, mf_list:num_items() - 1 do
    local current_mf = mf_list:item_at(i);

    if current_mf:has_effect_bundle(upkeep_penalty_effect_bundle_key) then
      cm:remove_effect_bundle_from_force(upkeep_penalty_effect_bundle_key, current_mf:command_queue_index());
    end
  end
end
