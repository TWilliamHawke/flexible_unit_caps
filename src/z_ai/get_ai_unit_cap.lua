---@param unit_group string
---@return integer
function Flexible_unit_caps:get_ai_unit_caps(unit_group)
  if self.ai_unit_cap_mult <= 0 then return 20 end
  local max_capacity = 10;

  if(Flexible_unit_caps.unit_group_caps[unit_group]) then
    max_capacity = Flexible_unit_caps.unit_group_caps[unit_group][1];
  end;

  max_capacity = self:apply_linear_interpolation(max_capacity, self.ai_unit_cap_mult)
  return self:round_unit_cap(max_capacity);
end;
