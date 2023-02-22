---@param get_iterator fun() : fun() : string, string
---@param supply_change_cache Supply_change_cache
---@return UnitsCache
function Flexible_unit_caps:create_units_cache(supply_change_cache, get_iterator)
  local units_group_data = {}; ---@type UnitsCache

  ---@param unit_group string
  local function add_unit_group_to_cache(unit_group)
    if units_group_data[unit_group] then return end
    local supply_change = self:get_supply_change_from_cache(supply_change_cache, unit_group)
    local unit_cap = self:get_unit_max_capacity(unit_group, supply_change);
    units_group_data[unit_group] = { cap = unit_cap, count = 0 };
  end

  ---@param unit_group string
  ---@param component_name string
  local function add_component_to_cache(unit_group, component_name)
    add_unit_group_to_cache(unit_group)
    local count = units_group_data[unit_group].count + 1;
    units_group_data[unit_group].count = count;
    units_group_data[unit_group][component_name] = count;
  end

  for group in pairs(supply_change_cache) do
    local parent_group = self.units_group_parent_player[group];
    add_unit_group_to_cache(group);

    if parent_group then
      add_unit_group_to_cache(parent_group);
    end
  end

  for unit_key, component_name in get_iterator() do
    local unit_group, parent_group = self:get_unit_group(unit_key);

    if unit_group ~= "" then
      add_component_to_cache(unit_group, component_name);
    end

    if parent_group ~= "" then
      add_component_to_cache(parent_group, component_name);
    end
  end

  --increace parent unit cap if its bellow children cap
  for group, data in pairs(units_group_data) do
    local parent_group = self.units_group_parent_player[group];

    if parent_group and units_group_data[parent_group] then
      local parent_cap = units_group_data[parent_group].cap;
      units_group_data[parent_group].cap = math.max(data.cap, parent_cap);
    end
  end

  return units_group_data;
end
