---@param force MILITARY_FORCE_SCRIPT_INTERFACE
---@return Supply_change_cache cache
function Flexible_unit_caps:create_supply_change_cache(force)
  local cache = {}; ---@type Supply_change_cache
  local lord = force:general_character();

  cache.ark_or_camp = self:force_is_black_ark_or_camp(force)

  local lord_name = lord:character_subtype_key();
  local lord_alias = self.lord_aliases[lord_name] or lord_name;
  local skills_supply_changes = {}; ---@type Supply_change_cache

  if self.lord_supply_change[lord_name] then
    for key, data in pairs(self.lord_supply_change[lord_name]) do
      cache[key] = { change = data.change, isHidden = data.hidden };
    end --of loop
  end

  if self.skill_supply_change[lord_alias] then
    for key, value in pairs(self.skill_supply_change[lord_alias]) do
      local has_skill1 = value[3] and lord:has_skill(value[3]) or false;
      local has_skill2 = value[4] and lord:has_skill(value[4]) or false;

      if has_skill1 or has_skill2 then
        skills_supply_changes[key] = { change = value[1], isHidden = value[2] };
      end
    end --of loop
  end

  --concat tables
  for key, data in pairs(skills_supply_changes) do
    if (cache[key] == nil) then
      cache[key] = data;
    else
      cache[key].change = cache[key].change + data.change;
    end
  end

  return cache;
end
