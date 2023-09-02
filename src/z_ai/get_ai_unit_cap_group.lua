---@param unit_name string
---@return string, string
function Flexible_unit_caps:get_ai_unit_cap_group(unit_name)
  if not self.units_data[unit_name] then
    self:add_unknown_unit_to_db(unit_name);
  end

  local main_group = self.units_data[unit_name][2];
  return self.units_group_parent_ai[main_group] or main_group, main_group;
end;