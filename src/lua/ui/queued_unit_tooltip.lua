function Flexible_unit_caps:set_queued_unit_tooltip(component)
    if not self.selected_character then return end;
    if not self.selected_character:faction():is_human() then return end;
    if not self.selected_character:has_military_force() then return end;

    local number_in_queue = tonumber(component:Id():match("(%d+)")) + 1;
    local unit_name = self:get_queued_unit_name(component);
    self:logDebug("CONSTRUCT SUPPLY TEXT FUNCTION IS STARTED");

    local supply_text = self:construct_unit_supply_text(unit_name, nil, function(unit_group)
      local units_in_army = self:get_units_count_in_army(self.selected_character:military_force(), unit_group);
      local units_in_queue, unit_index_in_queue = self:get_queued_units_count(unit_group, number_in_queue);
      local unit_index = units_in_army + unit_index_in_queue;
      
      return units_in_army, units_in_queue, unit_index;
    end);

    self:logDebug("CONSTRUCT SUPPLY TEXT FUNCTION IS FINISHED");

    self:finalize_unit_tooltip(component, supply_text, "||");

end;