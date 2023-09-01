---@param building_set string
function Flexible_unit_caps:is_main_building_chain(building_set)
  if string.match(building_set, "wh_main_set_settlement_m[ai][nj]or") then
    return true;
  elseif string.match(building_set, "chd_settlement_tower") then
    return true
  else
    return false;
  end
end