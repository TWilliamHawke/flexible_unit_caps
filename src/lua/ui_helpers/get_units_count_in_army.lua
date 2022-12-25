function Flexible_unit_caps:get_units_count_in_army(force, target_unit_group, unit_index)
  local unit_list = force:unit_list();
  local units_count = 0;
  local group_unit_idx = 1;

  for j = 0, unit_list:num_items() - 1 do
    local unit = unit_list:item_at(j);
    local key = unit:unit_key();
    local unit_group = self:get_unit_caps_group(key);

    if unit_group == target_unit_group and unit:unit_class() ~= "com" then
      units_count = units_count + 1;
      if(j == unit_index) then
        group_unit_idx = units_count;
      end;
    end;
  end;

  return units_count, group_unit_idx;

end;