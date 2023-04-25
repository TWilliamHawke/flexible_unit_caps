---@param unit_name string
---@return string[]
function Flexible_unit_caps:get_unit_group(unit_name)
  if not self.units_data[unit_name] then
    self:add_unknown_unit_to_db(unit_name);
  end

  local main_group = self.units_data[unit_name][2];
  local groups = { main_group };

  local parent_group = self.units_group_parent_player[main_group] or {};

  for _, group in ipairs(parent_group) do
    table.insert(groups, group)
  end

  return groups
end
