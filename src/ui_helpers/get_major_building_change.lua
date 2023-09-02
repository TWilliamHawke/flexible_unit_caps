---@diagnostic disable: redundant-parameter
---@param building_id string
---@param building_chain string
---@param climate_penalty integer
---@return integer
function Flexible_unit_caps:get_major_building_change(building_id, building_chain, climate_penalty)
  if self.free_settlement_chains[building_chain] then
    return 0
  end

  if building_chain:match("_gate_") or building_chain:match("_empire_fort") then
    return -1;
  end

  local building_level = common.get_context_value("CcoBuildingLevelRecord", building_id, "Level") or 1;
  local supply_balance_change = -1;

  building_level = tonumber(building_level) or 0;

  if building_level > 3 then
    supply_balance_change = (3 - building_level) * math.max(2 + climate_penalty, 0) - 1;
  end


  return supply_balance_change

end