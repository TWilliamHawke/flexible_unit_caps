---@param lord_name string
---@return boolean
function Flexible_unit_caps:army_is_black_ark(lord_name)
  return lord_name == "wh2_main_def_black_ark" or lord_name == "wh2_main_def_black_ark_blessed_dread"
end;