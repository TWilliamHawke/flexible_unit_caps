---@param building_key string
---@param climate_penalty integer
---@return integer
function Flexible_unit_caps:get_bulding_supply_balance(building_key, climate_penalty)
  if self.walls_reduces_balance and self.garrison_buildings[building_key] then
    return -1
  end

  local supply_balance_change = self.building_unit_bonus[building_key];
  if not supply_balance_change then return 0 end

  supply_balance_change = math.min(supply_balance_change, self.max_balance_per_buildings)

  return math.max(0, supply_balance_change + climate_penalty);
end;