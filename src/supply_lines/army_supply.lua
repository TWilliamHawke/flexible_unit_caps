---@param force MILITARY_FORCE_SCRIPT_INTERFACE
---@param supply_penalty integer
---@return integer this_army_supply
function Flexible_unit_caps:get_army_supply(force, supply_penalty)

  local unit_list = force:unit_list();
  local lord = force:general_character();
  local this_army_supply = self.basic_lord_supply + supply_penalty;
  local lord_name = lord:character_subtype_key()
  self:log("--------");
  self:log("Lord of this army is " .. lord_name);
  local supply_change_cache = self:create_supply_change_cache(force);
  local unit_cache = self:create_force_cache(force, supply_change_cache);

  for j = 0, unit_list:num_items() - 1 do
    local unit = unit_list:item_at(j);
    local unit_key = unit:unit_key();
    local unit_supply = 0;

    if unit:unit_class() == "com" then
      unit_supply = 0;
    else
      local unit_group, parent_group = self:get_unit_group(unit_key);
      local unit_cap = self:get_unit_cap_from_cache(unit_cache, unit_group);
      local _, unit_index = self:get_units_count_from_cache(unit_cache, unit_group, tostring(j))

      local lord_cost, base_cost = self:get_unit_supply_params(unit_key, supply_change_cache);

      unit_supply = self:apply_unit_cap(base_cost, lord_cost, unit_index, unit_cap);

      if parent_group ~= "" then
        local unit_cap_p = self:get_unit_cap_from_cache(unit_cache, parent_group);
        local _, unit_index_p = self:get_units_count_from_cache(unit_cache, parent_group, tostring(j))
        local unit_supply_p = self:apply_unit_cap(base_cost, lord_cost, unit_index_p, unit_cap_p);
        unit_supply = math.max(unit_supply, unit_supply_p)
      end
    end

    if (unit_supply > 0) then
      this_army_supply = this_army_supply + unit_supply;
    end
  end --of units loop

  self:log("THIS ARMY REQUIRES " .. tostring(this_army_supply) .. " SUPPLY POINTS")
  self:logDebug("CALCULATION SUPPLY FOR THIS ARMY IS FINISHED");
  return this_army_supply;
end
