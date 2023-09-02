---@param faction FACTION_SCRIPT_INTERFACE
---@return boolean
function Flexible_unit_caps:faction_has_supply_balance(faction)
  if self:faction_has_army_cap(faction) then
    return false;
  elseif faction:name() == "wh3_dlc24_tze_the_deceivers" then
    return false
  elseif not self.enable_supply_balance then
    return false;
  else
    return true;
  end
end
