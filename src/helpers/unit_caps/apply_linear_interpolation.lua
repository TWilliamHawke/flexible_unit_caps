---@param unit_cap number
---@param mult number
---@return number
function Flexible_unit_caps:apply_linear_interpolation(unit_cap, mult)

  if mult >= 1 then
    return unit_cap * mult;
  elseif unit_cap >= 10 then
    return unit_cap;
  else
    mult = 1 + (unit_cap - 10) * (mult - 1) / (4 - 10)
    return math.max(unit_cap * mult, 1);
  end
end
