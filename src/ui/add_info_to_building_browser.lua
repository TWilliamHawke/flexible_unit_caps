function Flexible_unit_caps:add_info_to_building_browser()
  if not self:player_faction_has_suply_reserves() then return end

  cm:callback(function()
    local climate_penalty = 0;
    local superchains = find_uicomponent(core:get_ui_root(), "building_browser", "building_superchains")

    if superchains then
      local region_key = superchains:GetContextObjectId("CcoCampaignSettlement")
      if not region_key then return end
      climate_penalty = self:get_climate_penalty(region_key, cm:get_local_faction(true))
    end

    local building_categories = find_uicomponent(superchains, "category_list");

    for _, building_category in uic_pairs(building_categories) do
      local category_name = building_category:Id();
      local is_major = self:is_main_building_chain(category_name);
      local is_circular = not not self.circular_buildings[category_name];
      local chain_list_key = not is_major and is_circular and "cyclic_chain_list" or "chain_list"

      local building_chain_list = find_uicomponent(building_category, chain_list_key);
      if building_chain_list then
        for _, chain in uic_pairs(building_chain_list) do
          local building_list = find_uicomponent(chain, "slot_parent");

          for _, building in uic_pairs(building_list) do
            self:replace_dev_points_text(building, climate_penalty, is_major, chain:Id());
          end
        end --of second child loop
      end --of chain list check
    end --of first child loop
  end, 0.5)

end