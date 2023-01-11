---@param component UIC
function Flexible_unit_caps:set_tooltip_for_unit_in_army(component)
    if not self.selected_character then return end;
    if not self.selected_character:faction():is_human() then return end;
    if not self.selected_character:has_military_force() then return end;
    
    local component_name = component:Id()
    local force = self.selected_character:military_force()
    local unit_list = force:unit_list()
    local unit_number = component_name:match("(%d+)")

    if unit_number == "0" then return end;

    --we need unit from selected army
    local index = tonumber(unit_number) + self:get_num_of_agents_in_army(unit_list)
    if (index >= unit_list:num_items()) then return end;

    local unit = unit_list:item_at(index);
    if not unit then return end;

    local unit_name = unit:unit_key();

    local supply_text = self:construct_unit_supply_text(unit_name, unit,
      function(unit_group)
        local units_in_army, unit_index = self:get_units_count_from_cache(
          self.selected_force_units_cache, unit_group, tostring(index));

        local units_in_queue = self:get_units_count_from_cache(self.queued_units_cache, unit_group);

        return units_in_army, units_in_queue, unit_index;
      end);

    self:finalize_unit_tooltip(component, supply_text, "||")
end;