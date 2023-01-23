---@param unit_key string
function Flexible_unit_caps:add_unknown_unit_to_db(unit_key)
  if self.units_data[unit_key] then return end

  self:logCore("unknown unit: "..unit_key)
  local gold_cost = cco("CcoMainUnitRecord", unit_key):Call("Cost") or 700; ---@type number
  supply_cost = self:get_unit_supply_from_cost(gold_cost)

  self.units_data[unit_key] = { supply_cost, "fluc_unknown" }
end
