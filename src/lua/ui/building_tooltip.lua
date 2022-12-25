function Flexible_unit_caps:set_building_tooltip(component, component_name)

  --wood elves fix
  if self.main_building_wef[component_name] then return end

  local supply_balance_change = self.building_unit_bonus[component_name]

  if supply_balance_change == nil then
    for i = 1, #self.main_building_matches do
      local is_main_building = component_name:match(self.main_building_matches[i])
      if is_main_building then
        local building_level = (component_name:match("_(%d+)") - 3) * self.big_city_penalty;
        if building_level > 0 then
          supply_balance_change = -building_level
        end
        break;

      end --of match check
      
    end; --of loop

    if supply_balance_change == nil then
      return
    end;
  
  end;

  supply_balance_change = math.min(supply_balance_change, self.max_balance_per_buildings)
  self:logDebug("supply_balance_change was calculated correctly");

  if supply_balance_change > 0 then
    supply_balance_change = "+"..supply_balance_change
  end

  local supply_text = supply_balance_change.." "..self:get_localised_string("SRW_building_supply")
  self:logDebug("supply_balance_text was set correctly");

  component:SetTooltipText(supply_text, true)

end;

