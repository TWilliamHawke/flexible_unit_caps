---@param unit_name string
---@return string, string
function Flexible_unit_caps:get_unit_caps_group(unit_name)
  
  local main_group = not self.units_data[unit_name] and "fluc_unknown" or self.units_data[unit_name][2];
  local parent_group = self.units_group_parent_player[main_group] or "";

  return main_group, parent_group;
end;