---@param unit_group string
---@param lord CHARACTER_SCRIPT_INTERFACE
---@return integer
function Flexible_unit_caps:get_unit_max_capacity(unit_group, lord)
  local max_capacity = 10;
  local lord_factor = 0;
  local lord_name = lord:character_subtype_key();
  local lord_alias = self.lord_aliases[lord_name];

  if(Flexible_unit_caps.unit_group_caps[unit_group]) then
    max_capacity = Flexible_unit_caps.unit_group_caps[unit_group][1];
  end;

  max_capacity = max_capacity * self.player_unit_cap_mult;

  if(self.group_discount[lord_name] and self.group_discount[lord_name][unit_group]) then
    lord_factor = lord_factor - self.group_discount[lord_name][unit_group];
  end;

  if(lord_alias and self.lord_skills_discount[lord_alias]) then
    local lord_skill_data = self.lord_skills_discount[lord_alias][unit_group];

    if(lord_skill_data ~= nil) then
      local bonus_skill = lord_skill_data[2] or "fluc_skill"
      local bonus_skill2 = lord_skill_data[3] or "fluc_skill"
      if lord:has_skill(bonus_skill) or lord:has_skill(bonus_skill2) then
        lord_factor = lord_factor - lord_skill_data[1];
      end;
    end;
  end;

  -- -1 => +50%
  -- -2 => +100%
  max_capacity = math.floor(max_capacity * (1 + lord_factor * self.LORD_FACTOR_CAP_MULT));

  return math.max(max_capacity, self.MIN_UNIT_CAP);
end;