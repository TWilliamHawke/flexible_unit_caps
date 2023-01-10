---@param unit UNIT_SCRIPT_INTERFACE
---@return integer
function Flexible_unit_caps:get_unknown_unit_supply(unit)
  self:logCore("unknown unit: "..unit:unit_key())

  local ucost = unit:get_unit_custom_battle_cost()
  return self:get_unit_supply_from_cost(ucost);
end;

