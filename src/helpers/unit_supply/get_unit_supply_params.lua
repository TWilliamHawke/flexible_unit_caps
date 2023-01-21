---@param unit_name string
---@param cache Supply_change_cache
---@return integer lord_unit_cost
---@return integer base_unit_cost
function Flexible_unit_caps:get_unit_supply_params(unit_name, cache)
  local unit_data = self.units_data[unit_name];

  if unit_data == nil then
    local unit_supply = self:get_unit_cost_from_key(unit_name);
    return unit_supply, unit_supply;
  end

  local base_unit_cost = unit_data[1] or 0;
  base_unit_cost = base_unit_cost + self.basic_unit_supply;

  local unit_group = unit_data[2] or "";
  local lord_supply_change = self:get_supply_change_from_cache(cache, unit_group);
  local unit_cost = math.max(base_unit_cost + lord_supply_change, 0);

  return unit_cost, base_unit_cost;
end
