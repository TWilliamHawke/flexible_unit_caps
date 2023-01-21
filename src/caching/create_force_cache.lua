---@param force MILITARY_FORCE_SCRIPT_INTERFACE
---@param cache Supply_change_cache
---@return UnitsCache
function Flexible_unit_caps:create_force_cache(force, cache)
  local unit_list = force:unit_list();

  local units_group_data = self:create_units_cache(cache, function()
    local j = 0;
    return function()
      while j < unit_list:num_items() do
        local unit = unit_list:item_at(j);
        j = j + 1;

        if unit:unit_class() ~= "com" then
          local key = unit:unit_key();
          return key, tostring(j)
        end
      end
      return nil, nil;
    end
  end);

  return units_group_data;
end
