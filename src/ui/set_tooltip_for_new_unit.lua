---@param string_end string
---@param caches {}
---@return function
function Flexible_unit_caps:set_tooltip_for_new_unit(string_end, caches)
  ---@param component UIC
  return function(component)
    local component_name = component:Id();
    local unit_name = string.gsub(component_name, string_end, "")

    local supply_text = self:construct_unit_supply_text(unit_name, "fluc_unit_consume_future", function(unit_group)
      local units_in_army = self:get_units_count_from_cache(caches.selected_force_units_cache, unit_group);
      local units_in_queue = self:get_units_count_from_cache(caches.queued_units_cache, unit_group);
      local unit_index = units_in_army + units_in_queue + 1;
      local group_capacity, is_found = self:get_unit_cap_from_cache(caches.selected_force_units_cache, unit_group);

      if not is_found then
        group_capacity = self:get_unit_max_capacity(unit_group, caches.supply_change_cache);
      end
      return unit_index, group_capacity;
    end, caches);

    self:finalize_unit_tooltip(component, supply_text, "\n")

  end;
end
