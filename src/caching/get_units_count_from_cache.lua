---@param cache UnitsCache
---@param unit_group string
---@param component_name string | nil
---@return number units_count
---@return number unit_index
function Flexible_unit_caps:get_units_count_from_cache(cache, unit_group, component_name)
  local units_count = 0;
  local unit_index = 0;

  if cache and cache[unit_group] then
    units_count = cache[unit_group].count or 0;

    if component_name and not self.use_harsh_mode then
      unit_index = cache[unit_group][component_name] or 0;
    else
      unit_index = units_count;
    end
  end

  return units_count, unit_index;
end
