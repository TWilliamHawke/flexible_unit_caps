function Flexible_unit_caps:apply_unit_cap(base_cost, unit_pos, unit_cap)
  if (unit_pos <= unit_cap) then
    return base_cost;
  end

  local cost_mult = math.floor(unit_pos / unit_cap);

  if (base_cost == 0) then
    base_cost = 1;
    cost_mult = cost_mult - 1;
  end;

  
  local cost_add = math.min(base_cost, unit_pos % unit_cap);
  return base_cost * cost_mult + cost_add;
end
