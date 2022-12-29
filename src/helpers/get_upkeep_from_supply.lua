---return upkeep percent
---@param supply integer
---@param dif_mod integer
---@return integer
function Flexible_unit_caps:get_upkeep_from_supply(supply, dif_mod)
  return math.floor(supply*dif_mod/24)
end;