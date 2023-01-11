---@param faction FACTION_SCRIPT_INTERFACE
---@return boolean
function Flexible_unit_caps:faction_has_supply_lines(faction)

  if not faction:is_human() then
    return false
  end

---@diagnostic disable-next-line: undefined-field
  return cm:faction_has_campaign_feature(faction:name(), "additional_army_upkeep")
end;

function Flexible_unit_caps:player_faction_has_suply_lines()
  local faction = cm:get_local_faction();

  return self:faction_has_supply_lines(faction)
end;