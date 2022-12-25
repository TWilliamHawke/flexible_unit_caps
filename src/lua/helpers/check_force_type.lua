function Flexible_unit_caps:check_army_type(force, is_upkeep_check)
  --garrisons check
  if force:is_armed_citizenry() then
    return false;
  elseif not force:has_general() then
    return false
  end

  --armies start
  local force_general = force:general_character():character_subtype_key();
  local force_type = force:force_type():key();

  if self.no_balance_lords[force_general] == 1 and not is_upkeep_check then
    return false;
  elseif self.forcetype_exclusions[force_type] then
    return false;
  elseif force:has_effect_bundle("wh2_dlc12_bundle_underempire_army_spawn") then
    return false;
  else
    return true;
  end;
end;
