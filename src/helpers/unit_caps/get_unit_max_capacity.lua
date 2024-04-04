---@param unit_group string
---@param cache Supply_change_cache
---@return integer
function Flexible_unit_caps:get_unit_max_capacity(unit_group, cache)
  --negative in most cases
  local lord_factor = cache.cap_change[unit_group] or 0;

  if self:group_has_unlimited_cap(unit_group, lord_factor) then
    return 20;
  end

  local max_capacity = 10;

  if self.unit_group_caps[unit_group] then
    max_capacity = self.unit_group_caps[unit_group][1];
  end

  max_capacity = self:apply_linear_interpolation(max_capacity, self:get_unit_cap_mult(unit_group))

  -- lord_factor == -1 => +30% or +2
  -- lord_factor == -2 => +60% or +1
  local unit_cap_lord_add = math.max(max_capacity * lord_factor * self.LORD_FACTOR_CAP_MULT, lord_factor * -1)

  -- 1 => 2
  if unit_cap_lord_add > 0 then
    unit_cap_lord_add = math.max(unit_cap_lord_add, 2);
  end

  max_capacity = max_capacity + unit_cap_lord_add;

  return self:round_unit_cap(max_capacity);
end
