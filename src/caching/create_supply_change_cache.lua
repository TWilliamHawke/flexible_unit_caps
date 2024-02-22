---@diagnostic disable: redundant-parameter
---@param force MILITARY_FORCE_SCRIPT_INTERFACE
---@return Supply_change_cache cache
function Flexible_unit_caps:create_supply_change_cache(force)
  local cache = {}; ---@type Supply_change_cache
  local faction_culture = force:faction():culture();
  local unlimited_group = self.unlimited_unit_groups[faction_culture];
  local char_list = force:character_list();

  cache.ark_or_camp = self.zero_cost_cultures[faction_culture] or self:force_is_black_ark_or_camp(force) or
  self:faction_has_army_cap(force:faction())
  cache.cap_change = {};
  cache.supply_change = {};

  for _, char in model_pairs(char_list) do
    local char_name = char:character_subtype_key();
    local lord_alias = self.lord_aliases[char_name] or char_name;

    if self.lord_supply_change[char_name] then
      for unit_group, data in pairs(self.lord_supply_change[char_name]) do
        self:add_supply_change_to_chache(cache.supply_change, unit_group, data.change, data.hidden);
        self:add_cap_change_to_cache(cache.cap_change, unit_group, data.change)
      end --of loop
    end

    if self.skill_supply_change[lord_alias] then
      for unit_group, value in pairs(self.skill_supply_change[lord_alias]) do
        local has_skill1 = value[3] and char:has_skill(value[3]) or false;
        local has_skill2 = value[4] and char:has_skill(value[4]) or false;

        if has_skill1 or has_skill2 then
          self:add_supply_change_to_chache(cache.supply_change, unit_group, value[1], value[2]);
          self:add_cap_change_to_cache(cache.cap_change, unit_group, value[1])
        end
      end --of loop
    end
  end

  if unlimited_group then
    cache.cap_change[unlimited_group] = self.UNLIMITED_CAP;
  end

  --remove heroes
  cache.supply_change["fluc_all_heroes"] = { change = 0, isHidden = false }

  return cache;
end
