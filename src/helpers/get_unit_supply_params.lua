---@param unit_name string
---@param lord CHARACTER_SCRIPT_INTERFACE
---@return nil|integer
---@return nil|integer
function Flexible_unit_caps:get_unit_supply_params(unit_name, lord)
  self:logDebug("GET SUPPLY PARAMS FUNCTION IS STARTED");

  local unit_data = self.units_data[unit_name];

  if unit_data == nil then
    return nil, nil;
  end;

  local base_unit_cost = unit_data[1] or 0;
  base_unit_cost = base_unit_cost + self.basic_unit_supply;
  self:logDebug("BASE UNIT COST TAKEN");

  if not lord then
    return base_unit_cost, base_unit_cost
  end;

  local unit_group = unit_data[2] or "";
  local lord_name = lord:character_subtype_key();
  local lord_discount = 0;

  if self.group_discount[lord_name] ~= nil then
    lord_discount = self.group_discount[lord_name][unit_group] or 0;
  end;

  local lord_alias = self.lord_aliases[lord_name]
  self:logDebug("LORD AND UNIT TYPE CHECKED");

  if lord_alias ~= nil and self.lord_skills_discount[lord_alias] ~= nil then
    local lord_skill_data = self.lord_skills_discount[lord_alias][unit_group];

    if lord_skill_data ~= nil then
      local potential_discount = lord_skill_data[1] or 0;

      local bonus_skill = lord_skill_data[2] or "fluc_skill"
      local bonus_skill2 = lord_skill_data[3] or "fluc_skill"
      if lord:has_skill(bonus_skill) or lord:has_skill(bonus_skill2) then
        lord_discount = lord_discount + potential_discount;
      end
    end
  end

  self:logDebug("LORD SKILL CHECKED");

  local unit_cost = base_unit_cost
  if lord_discount ~= 0 then
    unit_cost = math.max(base_unit_cost + lord_discount, 0);
    self:logDebug(unit_name.." in "..lord_name.." army costs "..tostring(unit_cost).." points");
  end

  if self:army_is_black_ark(lord_name) and unit_cost ~= 0 then
    unit_cost = 0
  end

  return unit_cost, base_unit_cost
end