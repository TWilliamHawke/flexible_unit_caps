---@param cache UnitsCache<Force_units_props>
---@param unit_group string
---@return integer
function Flexible_unit_caps:get_unit_cap_from_cache(cache, unit_group)
  if cache and cache[unit_group] then
    return cache[unit_group].cap or 10;
  else
    return 10
  end


end;