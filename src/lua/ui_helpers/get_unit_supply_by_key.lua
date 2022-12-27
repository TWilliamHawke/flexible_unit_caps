function Flexible_unit_caps:get_unit_cost_from_key(unit_key)
  local unit_cost = cco("CcoMainUnitRecord", unit_key):Call("Cost");
  return self:get_unit_supply_from_cost(unit_cost)
end
