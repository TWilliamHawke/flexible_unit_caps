function Flexible_unit_caps:check_force_for_unit_caps(force)
  if force:is_armed_citizenry() then return false end;
  if not force:has_general() then return false end;

  local region = force:general_character():region();
  if region:is_null_interface() then return false end;
  if region:region_data_interface():is_sea() then return false end;
  if region:is_abandoned() then return false end;

  local region_owner = region:owning_faction();
  if region_owner ~= force:faction() then return false end;

  return true;
end;