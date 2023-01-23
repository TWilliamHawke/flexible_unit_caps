---@param lord_key string
---@param unit_group string
---@param value integer
---@param lord_skill_key string
function Flexible_caps_api:add_lord_skill_discount(lord_key, unit_group, value, lord_skill_key)
  if (type(lord_key) ~= "string") then
    self:log("ERROR: First argument in add_lord_skill_discount method should be a string")
    return;
  end

  if (type(unit_group) ~= "string") then
    self:log("ERROR: Second argument in add_lord_skill_discount method should be a string")
    return;
  end

  local text = effect.get_localised_string(string);
  if (text == "") then
    self:log("WARNING: Localisation string for unit group does not exist")

  end

  if (type(value) ~= "number" or value == nil) then
    self:log("ERROR: Third argument in add_lord_skill_discount method should be a number")
    return;
  end

  if (type(lord_skill_key) ~= "string") then
    self:log("ERROR: Forth argument in add_lord_skill_discount method should be a string")
    return;
  end

  local lord_alias = Flexible_unit_caps.lord_aliases[lord_key] or lord_key

  if Flexible_unit_caps.skill_supply_change[lord_alias] ~= nil then
    Flexible_unit_caps.skill_supply_change[lord_alias][unit_group] = { value, false, lord_skill_key }
  else
    Flexible_unit_caps.skill_supply_change[lord_alias] = { [unit_group] = { value, false, lord_skill_key } }
  end
end
