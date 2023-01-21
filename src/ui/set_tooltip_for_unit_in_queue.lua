---@param component UIC
---@param lord CHARACTER_SCRIPT_INTERFACE
function Flexible_unit_caps:set_tooltip_for_unit_in_queue(component, lord)

  --local number_in_queue = tonumber(component:Id():match("(%d+)")) + 1;
  local unit_name = self:get_queued_unit_name(component);
  local component_name = component:Id();
  self:logDebug("CONSTRUCT SUPPLY TEXT FUNCTION IS STARTED");

  local supply_text = self:construct_unit_supply_text(unit_name, "SRW_unit_consume_future", function(unit_group)
    local units_in_army = self:get_units_count_from_cache(self.selected_force_units_cache, unit_group);
    local _, unit_index_in_queue = self:get_units_count_from_cache(self.queued_units_cache, unit_group,
      component_name);
    local unit_index = units_in_army + unit_index_in_queue;
    local group_capacity = self:get_unit_cap_from_cache(self.queued_units_cache, unit_group);

    return unit_index, group_capacity;
end,
  function ()
    local base_supply, lord_supply = self:get_unit_supply_params(unit_name, lord);
    if self:force_is_black_ark_or_camp(lord:military_force()) then
      lord_supply = 0;
    end
    return base_supply, lord_supply;
  end);

  self:logDebug("CONSTRUCT SUPPLY TEXT FUNCTION IS FINISHED");

  self:finalize_unit_tooltip(component, supply_text, "||");

end
