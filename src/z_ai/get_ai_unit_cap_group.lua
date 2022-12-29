---@param unit_name string
---@return string
function Flexible_unit_caps:get_ai_unit_cap_group(unit_name)
  local main_group = not self.units_data[unit_name] and "fluc_unknown" or self.units_data[unit_name][2];
  return self.unit_caps_group_overwriting[main_group] or main_group;
end;