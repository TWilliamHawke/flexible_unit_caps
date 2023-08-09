---@param building_id string
---@param building_chain string
---@param climate_penalty integer
---@return integer
function Flexible_unit_caps:get_major_building_change(building_id, building_chain, climate_penalty)
  if self.free_settlement_chains[building_chain] then
    return 0
  end

  if building_chain:match("_gate_") or building_chain:match("_empire_fort") then
    return 1
  end

  local building_level = building_id:match("%d$")
  local supply_balance_change = -1;

  if not building_level then
    building_level = building_id:match("%d_a")
    building_level = building_level and building_level:sub(0, -3) or 0;
  end
  building_level = tonumber(building_level) or 0;

  if building_level > 3 then
    supply_balance_change = (3 - building_level) * math.max(2 + climate_penalty, 0) - 1;
  end


  return supply_balance_change

end