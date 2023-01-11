---@param units_in_army number
---@param units_in_queue number
---@param unit_group string
---@return string
function Flexible_unit_caps:construct_unit_group_text(units_in_army, units_in_queue, unit_group)

  local unit_group_text = self:get_localised_string("SRW_this_army")..self:get_localised_string(unit_group);
  local group_capacity = self:get_unit_cap_from_cache(self.selected_force_units_cache, unit_group, self.selected_character);

  unit_group_text = unit_group_text .. ": "..units_in_army.."/"..group_capacity;

  if(units_in_queue > 0) then
    unit_group_text = unit_group_text..self:try_add_plus(units_in_queue);
  end;

  return unit_group_text;

end;