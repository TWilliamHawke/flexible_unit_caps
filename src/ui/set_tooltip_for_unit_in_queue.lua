---@param component UIC
---@param queued_units { supply: integer }
function Flexible_unit_caps:set_tooltip_for_unit_in_queue(component, queued_units)

  --local number_in_queue = tonumber(component:Id():match("(%d+)")) + 1;
  local unit_name = self:get_queued_unit_name(component);
  local component_name = component:Id();
  self:logDebug("CONSTRUCT SUPPLY TEXT FUNCTION IS STARTED");

  local supply_text, unit_cost = self:construct_unit_supply_text(unit_name, "fluc_unit_consume_future", function(unit_group)
    local units_in_army = self:get_units_count_from_cache(self.selected_force_units_cache, unit_group);
    local _, unit_index_in_queue = self:get_units_count_from_cache(self.queued_units_cache, unit_group,
      component_name);
    local unit_index = units_in_army + unit_index_in_queue;
    local group_capacity = self:get_unit_cap_from_cache(self.queued_units_cache, unit_group);

    return unit_index, group_capacity;
  end);

  self:logDebug("CONSTRUCT SUPPLY TEXT FUNCTION IS FINISHED");
  queued_units.supply = queued_units.supply + unit_cost
  self:finalize_unit_tooltip(component, supply_text .. "\n", "||");

  return unit_cost;
end
