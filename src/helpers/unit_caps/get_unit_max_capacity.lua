---@param unit_group string
---@param lord_factor integer
---@return integer
function Flexible_unit_caps:get_unit_max_capacity(unit_group, lord_factor)
  if self.player_unit_cap_mult <= 0 then
    return 20;
  end

  local max_capacity = 10;

  if self.unit_group_caps[unit_group] then
    max_capacity = self.unit_group_caps[unit_group][1];
  end

  max_capacity = self:apply_linear_interpolation(max_capacity, self.player_unit_cap_mult)

  -- lord_factor == -1 => +50% or +1
  -- lord_factor == -2 => +100% or +2
  local unit_cap_lord_add = math.max(max_capacity * lord_factor * self.LORD_FACTOR_CAP_MULT, lord_factor * -1)

  max_capacity = max_capacity + unit_cap_lord_add;

  return self:round_unit_cap(max_capacity);
end
