---@param unit UNIT_SCRIPT_INTERFACE
---@param cache Supply_change_cache
---@return integer base_supply_cost
---@return integer lord_supply_cost
function Flexible_unit_caps:get_unit_supply_params_from_unit(unit, cache)
  local unit_name = unit:unit_key();

  if self.units_data[unit_name] then
    local base_cost, lord_cost = self:get_unit_supply_params(unit_name, cache);
    return base_cost, lord_cost;
  else
    local unit_supply = self:get_unknown_unit_supply(unit);
    return unit_supply, unit_supply;
  end

end
