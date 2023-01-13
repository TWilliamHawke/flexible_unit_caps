---@param force MILITARY_FORCE_SCRIPT_INTERFACE
---@param supply_penalty integer
---@return integer
function Flexible_unit_caps:get_army_supply(force, supply_penalty)

  local unit_list = force:unit_list();
  local lord = force:general_character();
  local this_army_supply = self.basic_lord_supply + supply_penalty;
  local lord_name = lord:character_subtype_key()
  local unit_groups = {};
  self:log("--------");
  self:log("Lord of this army is " .. lord_name);

  for j = 0, unit_list:num_items() - 1 do
    local unit = unit_list:item_at(j);
    local key = unit:unit_key();
    local unit_supply = 0;

    if unit:unit_class() == "com" then
      unit_supply = 0;
    else
      local unit_group = self:get_unit_caps_group(key);
      if (unit_groups[unit_group] ~= nil) then
        unit_groups[unit_group][2] = unit_groups[unit_group][2] + 1;
      else
        local unit_cap = self:get_unit_max_capacity(unit_group, lord);
        unit_groups[unit_group] = { unit_cap, 1 };
      end

      local lord_cost, base_cost = self:get_unit_supply_params_from_unit(unit, lord);

      if self:army_is_black_ark_or_camp(force) then
        lord_cost = 0;
      end

      unit_supply = self:apply_unit_cap(base_cost, lord_cost, unit_groups[unit_group][2], unit_groups[unit_group][1]);
    end

    if (unit_supply > 0) then
      this_army_supply = this_army_supply + unit_supply;
    end
  end --of units loop

  self:log("THIS ARMY REQUIRES " .. tostring(this_army_supply) .. " SUPPLY POINTS")
  self:logDebug("CALCULATION SUPPLY FOR THIS ARMY IS FINISHED");
  return this_army_supply;
end
