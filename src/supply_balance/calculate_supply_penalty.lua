---@param supply_balance integer
---@param num_of_armies integer
---@return integer
function Flexible_unit_caps:calculate_supply_penalty(supply_balance, num_of_armies)
  return math.ceil(supply_balance/(num_of_armies^0.35))
end