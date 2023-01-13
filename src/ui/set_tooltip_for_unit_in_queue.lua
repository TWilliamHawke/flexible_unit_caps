---@param component UIC
function Flexible_unit_caps:set_tooltip_for_unit_in_queue(component)
  if not self.selected_character then return end
  if not self.selected_character:faction():is_human() then return end
  if not self.selected_character:has_military_force() then return end

  --local number_in_queue = tonumber(component:Id():match("(%d+)")) + 1;
  local unit_name = self:get_queued_unit_name(component);
  local component_name = component:Id();
  self:logDebug("CONSTRUCT SUPPLY TEXT FUNCTION IS STARTED");

  local supply_text = self:construct_unit_supply_text(unit_name, "SRW_unit_consume_future", function(unit_group)
    local units_in_army = self:get_units_count_from_cache(self.selected_force_units_cache, unit_group);
    local units_in_queue, unit_index_in_queue = self:get_units_count_from_cache(self.queued_units_cache, unit_group,
      component_name);
    local unit_index = units_in_army + unit_index_in_queue;

    return units_in_army, units_in_queue, unit_index;
  end,
  function ()
    return self:get_unit_supply_params(unit_name, self.selected_character);
  end);

  self:logDebug("CONSTRUCT SUPPLY TEXT FUNCTION IS FINISHED");

  self:finalize_unit_tooltip(component, supply_text, "||");

end
