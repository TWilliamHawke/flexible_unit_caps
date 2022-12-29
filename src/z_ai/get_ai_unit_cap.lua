---@param unit_group string
---@return integer
function Flexible_unit_caps:get_ai_unit_caps(unit_group)
  local max_capacity = 10;

  if(Flexible_unit_caps.unit_group_caps[unit_group]) then
    max_capacity = Flexible_unit_caps.unit_group_caps[unit_group][1];
  end;

  max_capacity = math.floor(max_capacity * self.ai_unit_cap_mult);
  return max_capacity;
end;