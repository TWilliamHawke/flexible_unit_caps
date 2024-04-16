---@param building_key string
---@param climate_penalty integer
---@return integer
function Flexible_unit_caps:get_bulding_supply_balance(building_key, climate_penalty)
  if self.walls_reduces_balance and self.garrison_buildings[building_key] then
    return -1
  end

  local supply_balance_change = self.building_unit_bonus[building_key];
  local is_port = self.port_buildings[building_key];
  local balance_change_cap = self.max_balance_per_buildings + climate_penalty;

  if not supply_balance_change and not is_port then
    self:add_unknown_building(building_key);
    supply_balance_change = self.building_unit_bonus[building_key];
    is_port = self.port_buildings[building_key];
  end

  if not supply_balance_change and not is_port then return 0 end

  if is_port then
    supply_balance_change = 1;
    balance_change_cap = climate_penalty + 1;
  end

  supply_balance_change = math.min(supply_balance_change, balance_change_cap)

  return math.max(0, supply_balance_change);
end