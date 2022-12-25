function Flexible_unit_caps:get_unit_caps_group(unit_name)
  local main_group = not self.units_data[unit_name] and "none" or self.units_data[unit_name][2];
  main_group = self.unit_caps_group_overwriting[main_group] or main_group;
  main_group = self.unit_caps_groups_player[main_group] or main_group;
  return main_group;
end;