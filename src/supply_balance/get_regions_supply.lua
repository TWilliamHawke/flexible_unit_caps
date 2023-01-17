---@diagnostic disable: undefined-field
---@param faction FACTION_SCRIPT_INTERFACE
---@return integer
---@return integer
---@return integer
function Flexible_unit_caps:get_regions_supply(faction)
  local supply_form_regions = 0
  local supply_from_buildings = 0;
  local regions_list = faction:region_list()
  local supply_form_garrisons = 0;

  for i = 0, regions_list:num_items() - 1 do
    if i >= self.big_empire_penalty_start then
      supply_form_regions = supply_form_regions - 1;
    end

    local slot_list = regions_list:item_at(i):slot_list();
    if not slot_list:is_empty() then
      local region_key = regions_list:item_at(i):name();
      local climate_penalty = self:get_climate_penalty(region_key, faction);

      for j = 0, slot_list:num_items() - 1 do
        if slot_list:item_at(j):has_building() then
          local building = slot_list:item_at(j):building();
          local building_name = building:name();

          if j == 0 then --main building
            supply_form_regions = supply_form_regions - self:get_main_building_cost(building)
          else
            local building_supply = self:get_bulding_supply_balance(building_name, climate_penalty);
            if building_supply < 0 then
              supply_form_garrisons = supply_form_garrisons + building_supply;
            else
              supply_from_buildings = supply_from_buildings + building_supply;
            end
          end
        end -- of has_building check
      end -- of slot loop
    end -- of is_emty check
  end -- of region loop

  return supply_form_regions, supply_from_buildings, supply_form_garrisons
end
