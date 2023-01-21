---@param cache UnitsCache
---@param unit_group string
---@return integer  unit_cap
---@return boolean is_found
function Flexible_unit_caps:get_unit_cap_from_cache(cache, unit_group)
  if cache and cache[unit_group] and cache[unit_group].cap then
    return cache[unit_group].cap, true;
  else
    return 10, false
  end


end;