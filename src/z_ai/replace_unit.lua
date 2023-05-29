---@param unit_key string
---@param unit_group string
---@param commander CHARACTER_SCRIPT_INTERFACE
function Flexible_unit_caps:replace_unit(unit_key, unit_group, commander)
  local unit_replacement_data = self.unit_group_caps[unit_group];
  if(unit_replacement_data == nil) then return end;

  local replacer = unit_replacement_data[2];
  if replacer == "" or replacer == unit_key then return end;

  local char_cqi = commander:command_queue_index();

  self:logAI("Try to replace \""..unit_key.."\" with \""..replacer)
  cm:remove_unit_from_character(cm:char_lookup_str(char_cqi), unit_key);
  cm:grant_unit_to_character(cm:char_lookup_str(char_cqi), replacer);

end;