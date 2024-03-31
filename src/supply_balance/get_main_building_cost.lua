---@param building BUILDING_SCRIPT_INTERFACE
---@param climate_penalty integer
---@return integer main_building_cost
function Flexible_unit_caps:get_main_building_cost(building, climate_penalty)
  local main_building_level = building:building_level()
  local main_building_superchain = building:superchain()
  local main_building_chain = building:chain();
  --local culture = faction:culture()

  if self.fixed_chain_cost[main_building_chain] ~= nil then
    return self.fixed_chain_cost[main_building_chain];
  end

  if self.gates_superchain[main_building_superchain] then
    return 1
  end

  -- 1 for tier 1-3, 3 for tier 4, 5 for tier 5
  if main_building_level == 5 then
    return 2 * math.max(2 + climate_penalty, 0) + 1;
  elseif main_building_level == 4 then
    return math.max(2 + climate_penalty, 0) + 1;
  else
    return 1
  end
end
