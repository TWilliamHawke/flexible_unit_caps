---@diagnostic disable: redundant-parameter
---@param building_key string
function Flexible_unit_caps:add_unknown_building(building_key)
  local levelQuery = "PrimarySlotBuildingLevelRequirement";
  local setQuery = "BuildingChainRecordContext.BuildingSetContext.Key";
  local ccoType = "CcoBuildingLevelRecord";
  local superchainQuery = "BuildingChainRecordContext.BuildingSuperchainContext.Key";

  local superchain = common.get_context_value(ccoType, building_key, superchainQuery) or superchainQuery;

  if self.port_superchains[superchain] then
    self.port_buildings[building_key] = true;
    return
  end

  local set = common.get_context_value(ccoType, building_key, setQuery)
  local building_level = 0;

  if set and string.find(set, "military") then
    building_level = common.get_context_value(ccoType, building_key, levelQuery) or 0;
  end

  self.building_unit_bonus[building_key] = building_level;
end