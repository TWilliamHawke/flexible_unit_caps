---@diagnostic disable: undefined-field, return-type-mismatch, redundant-parameter
---@param faction FACTION_SCRIPT_INTERFACE
---@return boolean
function Flexible_unit_caps:faction_has_supply_lines(faction)
  return cm:faction_has_campaign_feature(faction:name(), "additional_army_upkeep")
end;

function Flexible_unit_caps:player_faction_has_suply_reserves()
  local faction = cm:get_local_faction();

  return self:faction_has_supply_balance(faction)
end;