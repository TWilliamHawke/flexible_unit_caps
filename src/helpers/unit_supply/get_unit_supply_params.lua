---@param unit_name string
---@param supply_change_cache Supply_change_cache
---@return integer lord_unit_cost
---@return integer base_unit_cost
---@return string[] unit_groups
function Flexible_unit_caps:get_unit_supply_params(unit_name, supply_change_cache)

  if not self.units_data[unit_name] then
    self:add_unknown_unit_to_db(unit_name)
  end

  local unit_groups = self:get_unit_group(unit_name);
  local unit_data = self.units_data[unit_name];

  local base_unit_cost = unit_data[1] or 0;
  base_unit_cost = base_unit_cost + self.basic_unit_supply;
  local lord_supply_change = 0;

  for i = 1, #unit_groups do
    local unit_group = unit_groups[i] or "";
    local temp_supply_change = self:get_supply_change_from_cache(supply_change_cache, unit_group);
    lord_supply_change = math.min(lord_supply_change, temp_supply_change)
  end

  local unit_cost = math.max(base_unit_cost + lord_supply_change, 0);

  if supply_change_cache.ark_or_camp then
    unit_cost = 0;
  end

  return unit_cost, base_unit_cost, unit_groups;
end
