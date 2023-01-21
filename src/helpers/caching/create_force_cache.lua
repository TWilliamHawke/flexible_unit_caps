---@param force MILITARY_FORCE_SCRIPT_INTERFACE
---@return UnitsCache<Force_units_props>
function Flexible_unit_caps:create_force_cache(force)
  local units_group_data = {}; ---@type UnitsCache<Force_units_props>
  local commander = force:general_character();
  local unit_list = force:unit_list();

  ---@param unit_group string
  ---@param index integer
  local function add_to_group_data(unit_group, index)
    if not units_group_data[unit_group] then
      local unit_cap = self:get_unit_max_capacity(unit_group, commander);
      units_group_data[unit_group] = { cap = unit_cap, count = 0 };
    end

    local count = units_group_data[unit_group].count + 1;
    units_group_data[unit_group].count = count;
    units_group_data[unit_group][index] = count;
  end

  for j = 0, unit_list:num_items() - 1 do
    local unit = unit_list:item_at(j);

    if unit:unit_class() ~= "com" then
      local key = unit:unit_key();
      local unit_group, parent_group = self:get_unit_group(key);

      if unit_group ~= "" then
        add_to_group_data(unit_group, j)
      end

      if parent_group ~= "" then
        add_to_group_data(parent_group, j)
      end

    end
  end


  for group, data in pairs(units_group_data) do
    local group_parent = self.units_group_parent_player[group];

    if group_parent and units_group_data[group_parent] then
      local parent_cap = units_group_data[group_parent].cap;
      units_group_data[group_parent].cap = math.max(data.cap, parent_cap);
    end
  end

  return units_group_data
end
