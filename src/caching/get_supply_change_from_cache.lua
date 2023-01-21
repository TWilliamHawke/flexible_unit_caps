---comment
---@param cache Supply_change_cache
---@param unit_group string
---@return integer
function Flexible_unit_caps:get_supply_change_from_cache(cache, unit_group)
  if not cache[unit_group] or not cache[unit_group].change then return 0 end

  return cache[unit_group].change;
end;