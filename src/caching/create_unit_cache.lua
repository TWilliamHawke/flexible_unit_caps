---@param iterator fun() : fun() : string, string
---@param cache Supply_change_cache
---@return UnitsCache
function Flexible_unit_caps:create_units_cache(cache, iterator)
  local units_group_data = {}; ---@type UnitsCache

  ---@param unit_group string
  local function add_unit_group_to_cache(unit_group)
    if not units_group_data[unit_group] then
      local supply_change = self:get_supply_change_from_cache(cache, unit_group)
      local unit_cap = self:get_unit_max_capacity(unit_group, supply_change);
      units_group_data[unit_group] = { cap = unit_cap, count = 0 };
    end
  end;

  ---@param unit_group string
  ---@param compinent_name string
  local function add_component_to_cache(unit_group, compinent_name)
    add_unit_group_to_cache(unit_group)
    local count = units_group_data[unit_group].count + 1;
    units_group_data[unit_group].count = count;
    units_group_data[unit_group][compinent_name] = count;
  end

  for group in pairs(cache) do
    add_unit_group_to_cache(group);
  end

  for key, component_name in iterator() do
    local unit_group, parent_group = self:get_unit_group(key);

    if unit_group ~= "" then
      add_component_to_cache(unit_group, component_name);
    end

    if parent_group ~= "" then
      add_component_to_cache(parent_group, component_name);
    end
  end

  for group, data in pairs(units_group_data) do
    local group_parent = self.units_group_parent_player[group];

    if group_parent and units_group_data[group_parent] then
      local parent_cap = units_group_data[group_parent].cap;
      units_group_data[group_parent].cap = math.max(data.cap, parent_cap);
    end
  end

  return units_group_data;
end;