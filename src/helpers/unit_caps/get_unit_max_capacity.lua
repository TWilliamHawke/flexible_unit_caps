---@param unit_group string
---@param lord CHARACTER_SCRIPT_INTERFACE
---@return integer
function Flexible_unit_caps:get_unit_max_capacity(unit_group, lord)
  if self.player_unit_cap_mult <= 0 then
    return 20;
  end

  local max_capacity = 10;
  local lord_factor = 0;
  local lord_name = lord:character_subtype_key();
  local lord_alias = self.lord_aliases[lord_name];

  if self.unit_group_caps[unit_group] then
    max_capacity = self.unit_group_caps[unit_group][1];
  end

  max_capacity = self:apply_linear_interpolation(max_capacity, self.player_unit_cap_mult)

  if (self.lord_supply_change[lord_name] and self.lord_supply_change[lord_name][unit_group]) then
    lord_factor = lord_factor + self.lord_supply_change[lord_name][unit_group].change;
  end

  if (lord_alias and self.skill_supply_change[lord_alias]) then
    local lord_skill_data = self.skill_supply_change[lord_alias][unit_group];

    if (lord_skill_data ~= nil) then
      local bonus_skill = lord_skill_data[3] or "fluc_skill";
      local bonus_skill2 = lord_skill_data[4] or "fluc_skill";
      if lord:has_skill(bonus_skill) or lord:has_skill(bonus_skill2) then
        lord_factor = lord_factor + lord_skill_data[1];
      end
    end
  end

  -- lord_factor == -1 => +50% or +1
  -- lord_factor == -2 => +100% or +2
  local unit_cap_lord_add = math.max(max_capacity * lord_factor * self.LORD_FACTOR_CAP_MULT, lord_factor * -1)

  max_capacity = max_capacity + unit_cap_lord_add;

  return self:round_unit_cap(max_capacity);
end
