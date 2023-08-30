---@param unit_cost integer
---@return integer
function Flexible_unit_caps:get_unit_supply_from_cost(unit_cost)
  return math.floor(unit_cost / 500);
end