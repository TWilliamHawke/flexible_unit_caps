---@param unit_group string
---@param group_capacity integer
---@param units_in_army integer
---@param units_in_queue integer
---@return string
function Flexible_unit_caps:construct_unit_group_text(unit_group, group_capacity, units_in_army, units_in_queue)
  if group_capacity >= 19 then
    return "";
  end

  local unit_group_text = self:get_localised_string(unit_group);

  unit_group_text = unit_group_text .. ": " .. units_in_army .. "/" .. tostring(group_capacity);

  if (units_in_queue > 0) then
    unit_group_text = unit_group_text .. self:try_add_plus(units_in_queue);
  end

  return unit_group_text;

end
