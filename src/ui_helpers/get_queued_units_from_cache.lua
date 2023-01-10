---@param unit_group string
---@param component_name string | nil
---@return number
---@return number
function Flexible_unit_caps:get_queued_units_from_cache(unit_group, component_name)
  local units_count = 0;
  local unit_index = 0;

  if(self.queued_units_cache and self.queued_units_cache[unit_group]) then
    units_count = self.queued_units_cache[unit_group].count or 0;

    if component_name then
      unit_index = self.queued_units_cache[unit_group][component_name] or 0;
    end;
  end;

  return units_count, unit_index;
end;