---@diagnostic disable: redundant-parameter
---@param force MILITARY_FORCE_SCRIPT_INTERFACE
---@return Supply_change_cache cache
function Flexible_unit_caps:create_supply_change_cache(force)
  local cache = {}; ---@type Supply_change_cache
  local lord = force:general_character();
  local faction_culture = force:faction():culture();
  local unlimited_group = self.unlimited_unit_groups[faction_culture];

  cache.ark_or_camp = self.zero_cost_cultures[faction_culture] or self:force_is_black_ark_or_camp(force) or self:faction_has_army_cap(force:faction())
  cache.cap_change = {};
  cache.supply_change = {};

  local lord_name = lord:character_subtype_key();
  local lord_alias = self.lord_aliases[lord_name] or lord_name;
  local skills_supply_changes = {}; ---@type Simple_cache

  if self.lord_supply_change[lord_name] then
    for unit_group, data in pairs(self.lord_supply_change[lord_name]) do
      cache.supply_change[unit_group] = { change = data.change, isHidden = data.hidden };
      cache.cap_change[unit_group] = data.change;
    end --of loop
  end

  if self.skill_supply_change[lord_alias] then
    for unit_group, value in pairs(self.skill_supply_change[lord_alias]) do
      local has_skill1 = value[3] and lord:has_skill(value[3]) or false;
      local has_skill2 = value[4] and lord:has_skill(value[4]) or false;

      if has_skill1 or has_skill2 then
        skills_supply_changes[unit_group] = { change = value[1], isHidden = value[2] };
      end
    end --of loop
  end

  --concat tables
  for key, data in pairs(skills_supply_changes) do
    if (cache.supply_change[key] == nil) then
      cache.supply_change[key] = data;
    else
      cache.supply_change[key].change = cache.supply_change[key].change + data.change;
    end

    if (cache.cap_change[key] == nil) then
      cache.cap_change[key] = data.change;
    else
      cache.cap_change[key] = cache.cap_change[key] + data.change;
    end
  end

  if unlimited_group then
    cache.cap_change[unlimited_group] = self.UNLIMITED_CAP;
  end

  return cache;
end
