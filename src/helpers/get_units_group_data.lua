---@param force MILITARY_FORCE_SCRIPT_INTERFACE
---@return Units_group_data
function Flexible_unit_caps:get_units_group_data(force)
  local units_group_data = {}; ---@type Units_group_data
  local commander = force:general_character();
  local unit_list = force:unit_list();

  local function add_to_group_data(unit_group, unit_cap)
    if(units_group_data[unit_group] ~= nil) then
      units_group_data[unit_group].units_count = units_group_data[unit_group].units_count + 1;
    else
      units_group_data[unit_group] = {unit_cap = unit_cap, units_count = 1};
    end;
  end;

  for j = 0, unit_list:num_items() - 1 do
    local unit = unit_list:item_at(j);
    local key = unit:unit_key();

    local unit_group, parent_group = self:get_unit_caps_group(key);
    
    if unit_group ~= "" then
      local unit_cap = self:get_unit_max_capacity(unit_group, commander);
      add_to_group_data(unit_group, unit_cap)
    end;

    if parent_group ~= "" then
      local parent_cap = self:get_unit_max_capacity(parent_group, commander);
      add_to_group_data(parent_group, parent_cap)
    end;
  end;

  for group, data in pairs(units_group_data) do
    local group_parent = self.units_group_parent_player[group];

    if group_parent and units_group_data[group_parent] then
      local parent_cap = units_group_data[group_parent].unit_cap;
      units_group_data[group_parent].unit_cap = math.max(data.unit_cap, parent_cap);
    end;
  end;

  return units_group_data
end;