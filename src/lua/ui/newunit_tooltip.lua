function Flexible_unit_caps:set_unit_tooltip(string_end)
  return function(component)
    if not self.selected_character then return end;
    if not self.selected_character:faction():is_human() then return end;
    if not self.selected_character:has_military_force() then return end;

    self:logDebug("--------");
    self:logDebug("SET UNIT TOOLTIP FUNCTION IS STARTED");

    local component_name = component:Id();
    local unit_name = string.gsub(component_name, string_end, "")

    self:logDebug("SET SUPPLY TEXT FUNCTION IS STARTED");

    local supply_text = self:construct_unit_supply_text(unit_name, nil, function(unit_group)
      local units_in_army = self:get_units_count_in_army(self.selected_character:military_force(), unit_group);
      local units_in_queue = self:get_queued_units_count(unit_group);
      local unit_index = units_in_army + units_in_queue + 1;

      return units_in_army, units_in_queue, unit_index;
    end);

    self:logDebug("SET SUPPLY TEXT FUNCTION IS FINISHED");

    self:finalize_unit_tooltip(component, supply_text, "\n")

    self:logDebug("SET UNIT TOOLTIP FUNCTION IS FINISHED");
  end;
end;
