---@param force MILITARY_FORCE_SCRIPT_INTERFACE
---@return boolean
function Flexible_unit_caps:force_is_black_ark_or_camp(force)
  local lord_name = force:general_character():character_subtype_key();
  local force_type = force:force_type():key();

  return lord_name == "wh2_main_def_black_ark"
      or lord_name == "wh2_main_def_black_ark_blessed_dread"
      or force_type == "OGRE_CAMP";
end
