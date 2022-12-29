---@param faction FACTION_SCRIPT_INTERFACE
---@return boolean
function Flexible_unit_caps:faction_has_supply_lines(faction)
  local culture = faction:culture()
  local subculture = faction:subculture()

  if not faction:is_human() then
    return false
  end
  if self:faction_is_horde(faction) then
    return false
  end
  if culture == "wh_main_brt_bretonnia" then
    return false
  end
  if subculture == "wh_main_sc_nor_warp" then
    return false
  end
  if subculture == "wh_main_sc_nor_troll" then
    return false
  end
  if culture == "wh2_dlc09_tmb_tomb_kings" then
    return false
  end
  return true
end;

function Flexible_unit_caps:player_faction_has_suply_lines()
  local faction;

  if self.selected_character then
    faction = self.selected_character:faction();
  else
    faction = cm:model():world():whose_turn_is_it();
  end;

  return self:faction_has_supply_lines(faction)
end;