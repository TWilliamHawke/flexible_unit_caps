---@param unit_group string
---@param group_capacity integer
---@return string
function Flexible_unit_caps:construct_unit_group_text(unit_group, group_capacity)

  local units_in_army = self:get_units_count_from_cache(self.selected_force_units_cache, unit_group)
  local units_in_queue = self:get_units_count_from_cache(self.queued_units_cache, unit_group)

  local unit_group_text = self:get_localised_string("fluc_this_army") .. self:get_localised_string(unit_group);

  unit_group_text = unit_group_text .. ": " .. units_in_army .. "/" .. tostring(group_capacity);

  if (units_in_queue > 0) then
    unit_group_text = unit_group_text .. self:try_add_plus(units_in_queue);
  end

  return unit_group_text;

end
