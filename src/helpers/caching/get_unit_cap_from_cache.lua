---@param cache UnitsCache<Force_units_props>
---@param unit_group string
---@param lord CHARACTER_SCRIPT_INTERFACE
---@return integer
function Flexible_unit_caps:get_unit_cap_from_cache(cache, unit_group, lord)
  if cache and cache[unit_group] then
    return cache[unit_group].cap or 10;
  else
    return self:get_unit_max_capacity(unit_group, lord)
  end


end;