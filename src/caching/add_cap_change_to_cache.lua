---@param cache table<string, integer>
---@param unit_group string
---@param change integer
function Flexible_unit_caps:add_cap_change_to_cache(cache, unit_group, change)
  if cache[unit_group] == nil then
    cache[unit_group] = change;
  else
    cache[unit_group] = cache[unit_group] + change;
  end

end