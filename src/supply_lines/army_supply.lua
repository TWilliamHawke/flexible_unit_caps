---@param force MILITARY_FORCE_SCRIPT_INTERFACE
---@param supply_penalty integer
---@param queued_units_cache UnitsCache
---@return integer this_army_supply
---@return integer future_army_supply
function Flexible_unit_caps:get_army_supply(force, supply_penalty, queued_units_cache)
  local hero_count = force:character_list():num_items() - 1;

  local unit_list = force:unit_list();
  local lord = force:general_character();
  local lord_name = lord:character_subtype_key()
  self:log("--------");
  self:log("Lord of this army is " .. lord_name);
  local supply_change_cache = self:create_supply_change_cache(force);
  local base_hero_cost = self:get_unit_supply_params("fluc_any_hero", supply_change_cache)
  local unit_cache = self:create_force_cache(force, supply_change_cache);
  --cost for agents calculates separately
  local this_army_supply = self.basic_lord_supply + supply_penalty - hero_count * base_hero_cost;
  local future_army_supply = this_army_supply;

  for j = 1, unit_list:num_items() - 1 do
    local unit = unit_list:item_at(j);
    local unit_key = unit:unit_key();
    local unit_supply, future_unit_supply = 0, 0;

    if unit:unit_class() == "com" then
      unit_key = "fluc_any_hero";
    end

    local lord_cost, base_cost, unit_groups = self:get_unit_supply_params(unit_key, supply_change_cache);

    for _, group in ipairs(unit_groups) do
      local unit_cap = self:get_unit_cap_from_cache(unit_cache, group);
      local _, unit_index = self:get_units_count_from_cache(unit_cache, group, tostring(j + 1))
      temp_unit_supply = self:apply_unit_cap(base_cost, lord_cost, unit_index, unit_cap);
      unit_supply = math.max(unit_supply, temp_unit_supply)

      if self.use_harsh_mode then
        local queued_units_count = self:get_units_count_from_cache(queued_units_cache, group)
        unit_index = unit_index + queued_units_count;
        temp_unit_supply = self:apply_unit_cap(base_cost, lord_cost, unit_index, unit_cap);
        future_unit_supply = math.max(future_unit_supply, temp_unit_supply)
      else
        future_unit_supply = unit_supply;
      end
    end

    this_army_supply = this_army_supply + unit_supply;
    future_army_supply = future_army_supply + future_unit_supply;
  end --of units loop

  self:log("THIS ARMY REQUIRES " .. tostring(this_army_supply) .. " SUPPLY POINTS")
  self:logDebug("CALCULATION SUPPLY FOR THIS ARMY IS FINISHED");
  return this_army_supply, future_army_supply;
end
