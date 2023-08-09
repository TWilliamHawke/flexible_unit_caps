---@param faction FACTION_SCRIPT_INTERFACE
---@return boolean
function Flexible_unit_caps:faction_has_army_cap(faction)
  if self:faction_is_horde(faction) then
    return true;
  end

  local faction_culture = faction:culture();

  if self.special_effects[faction_culture] then
    return true;
  end

  return false;
end