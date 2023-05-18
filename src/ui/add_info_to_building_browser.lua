function Flexible_unit_caps:add_info_to_building_browser()
  if not self:player_faction_has_suply_lines() then return end

  local player_culture = cm:get_local_faction_culture();
  local chain_list_key = player_culture == "wh3_main_nur_nurgle" and "cyclic_chain_list" or "chain_list"

  cm:callback(function()
    local climate_penalty = 0;
    local superchains = find_uicomponent(core:get_ui_root(), "building_browser", "building_superchains")

    if superchains then
      local region_key = superchains:GetContextObjectId("CcoCampaignSettlement")
      climate_penalty = self:get_climate_penalty(region_key, cm:get_local_faction())
    end

    local building_categories = find_uicomponent(core:get_ui_root(), "building_browser", "category_list");

    for _, building_category in uic_pairs(building_categories) do
      local is_major = not not string.match(building_category:Id(), "wh_main_set_settlement_major") or not not string.match(building_category:Id(), "chd_settlement_tower")
      local building_chain_list = find_uicomponent(building_category, chain_list_key);
      if building_chain_list then
        for _, chain in uic_pairs(building_chain_list) do
          is_major = is_major and not chain:Id():match("_gate_") and not chain:Id():match("_empire_fort")
          local building_list = find_uicomponent(chain, "slot_parent");

          for _, building in uic_pairs(building_list) do
            self:replace_dev_points_text(building, climate_penalty, is_major);
          end
        end --of second child loop
      end --of chain list check
    end --of first child loop
  end, 0.5)

end