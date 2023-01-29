---@param unit_cap number
---@return integer
function Flexible_unit_caps:round_unit_cap(unit_cap)
  if unit_cap > 10 then --round to nearest even
    return self:round_unit_cap(unit_cap / 2) * 2;
  end

  local round_cap = math.floor(unit_cap);

  if unit_cap - round_cap > 0.5 then
    round_cap = round_cap + 1;
  end

  return math.max(self.MIN_UNIT_CAP, round_cap);
end
