--return upkeep percent
function Flexible_unit_caps:get_upkeep_from_supply(supply, dif_mod)
  return math.floor(supply*dif_mod/24)
end;