---@param unit_name string
---@param lord CHARACTER_SCRIPT_INTERFACE
---@return integer
---@return integer
function Flexible_unit_caps:get_unit_supply_params(unit_name, lord)
  self:logDebug("GET SUPPLY PARAMS FUNCTION IS STARTED");

  local unit_data = self.units_data[unit_name];

  if unit_data == nil then
    local unit_supply = self:get_unit_cost_from_key(unit_name);
    return unit_supply, unit_supply;
  end;

  local base_unit_cost = unit_data[1] or 0;
  base_unit_cost = base_unit_cost + self.basic_unit_supply;

  if not lord then
    return base_unit_cost, base_unit_cost
  end;

  local unit_group = unit_data[2] or "";
  local lord_name = lord:character_subtype_key();
  local lord_discount = 0;

  if self.lord_supply_change[lord_name] and self.lord_supply_change[lord_name][unit_group] then
    lord_discount = self.lord_supply_change[lord_name][unit_group].change or 0;
  end;

  local lord_alias = self.lord_aliases[lord_name]

  if lord_alias ~= nil and self.skill_supply_change[lord_alias] ~= nil then
    local lord_skill_data = self.skill_supply_change[lord_alias][unit_group];

    if lord_skill_data ~= nil then
      local potential_discount = lord_skill_data[1] or 0;

      local bonus_skill = lord_skill_data[3] or "fluc_skill"
      local bonus_skill2 = lord_skill_data[4] or "fluc_skill"
      if lord:has_skill(bonus_skill) or lord:has_skill(bonus_skill2) then
        lord_discount = lord_discount + potential_discount;
      end
    end
  end

  local unit_cost = base_unit_cost
  if lord_discount ~= 0 then
    unit_cost = math.max(base_unit_cost + lord_discount, 0);
    self:logDebug(unit_name.." in "..lord_name.." army costs "..tostring(unit_cost).." points");
  end


  return unit_cost, base_unit_cost
end