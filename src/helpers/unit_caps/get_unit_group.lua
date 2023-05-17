---@param unit_name string
---@return string[]
function Flexible_unit_caps:get_unit_group(unit_name)
  if not self.units_data[unit_name] then
    self:add_unknown_unit_to_db(unit_name);
  end

  local unit_data = self.units_data[unit_name]


  local main_group = unit_data[2];
  local groups = { };

  for i = 2, #unit_data do
    table.insert(groups, unit_data[i])
  end

  local parent_groups = self.units_group_parent_player[main_group];

  if parent_groups then
    for i = 1, #parent_groups do
      table.insert(groups, parent_groups[i])
    end
  end

  return groups
end
