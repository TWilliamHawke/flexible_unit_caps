---@param base_cost integer
---@param lord_cost integer
---@param unit_pos integer
---@param unit_cap integer
---@return integer
function Flexible_unit_caps:apply_unit_cap(base_cost, lord_cost, unit_pos, unit_cap)
  if (unit_pos <= unit_cap) then
    return lord_cost;
  end

  local cost_mult = math.floor((unit_pos - 1) / unit_cap);

  if base_cost == 0 then
    return cost_mult;
  end

  local cost_add = math.min(base_cost, unit_pos % unit_cap);
  local base_cost_with_cap = base_cost * cost_mult + cost_add;

  return math.max(base_cost_with_cap - (base_cost - lord_cost), 0)
end

--TODO add weak and harsh mode for unit cap
