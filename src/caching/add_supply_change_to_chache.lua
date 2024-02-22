---@param cache Simple_cache
---@param unit_group string
---@param change integer
---@param is_hidden boolean
function Flexible_unit_caps:add_supply_change_to_chache(cache, unit_group, change, is_hidden)
  if cache[unit_group] == nil then
    cache[unit_group] = { change = change, isHidden = is_hidden }
  else
    cache[unit_group].change = cache[unit_group].change + change;
  end
end