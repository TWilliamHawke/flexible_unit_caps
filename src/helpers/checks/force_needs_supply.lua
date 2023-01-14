---@param force MILITARY_FORCE_SCRIPT_INTERFACE
---@param excluded_lords table<string, boolean> | nil
---@return boolean
function Flexible_unit_caps:force_needs_supply(force, excluded_lords)
  --garrisons check
  if force:is_armed_citizenry() then
    return false;
  elseif not force:has_general() then
    return false
  end

  --armies start
  local force_general = force:general_character():character_subtype_key();
  local force_type = force:force_type():key();

  if excluded_lords and excluded_lords[force_general] then
    return false;
  elseif excluded_lords and self:force_is_black_ark_or_camp(force) then
    return false;
  elseif self.forcetype_exclusions[force_type] then
    return false;
  elseif force:has_effect_bundle("wh2_dlc12_bundle_underempire_army_spawn") then
    return false;
  elseif force:has_effect_bundle(self.loaned_army_effect) then
    return false;
  else
    return true;
  end
end
