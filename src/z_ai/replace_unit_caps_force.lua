---@param force MILITARY_FORCE_SCRIPT_INTERFACE
function Flexible_unit_caps:replace_unit_caps_force(force)
  local commander = force:general_character();
  local unit_groups = {};
  local units_for_replace = {};
  local unit_list = force:unit_list();

  for j = 0, unit_list:num_items() - 1 do
    local unit = unit_list:item_at(j);
    local unit_key = unit:unit_key();

    if unit:unit_class() ~= "com" then
      local cap_group, replacement_group = self:get_ai_unit_cap_group(unit_key);
      if (unit_groups[cap_group] ~= nil) then
        local unit_cap = unit_groups[cap_group][1];
        local unit_count = unit_groups[cap_group][2] + 1;

        if (unit_count > unit_cap) then
          table.insert(units_for_replace, { unit_key, replacement_group })
        else
          unit_groups[cap_group][2] = unit_count;
        end
      else
        local unit_cap = self:get_ai_unit_caps(cap_group);
        unit_groups[cap_group] = { unit_cap, 1 };
      end
    end; --of class check
  end; --of units loop

  if #units_for_replace > 0 then
    self:logAI("Faction: "..commander:faction():name())
    for i=1, (#units_for_replace) do
      self:replace_unit(units_for_replace[i][1], units_for_replace[i][2], commander);
    end
  end;
end;
