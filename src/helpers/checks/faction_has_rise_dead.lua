---@diagnostic disable: redundant-parameter
---@param faction FACTION_SCRIPT_INTERFACE
function Flexible_unit_caps:faction_has_rise_dead(faction)
  return cm:faction_has_campaign_feature(faction:name(), "undead_unit_saving_postbattle")

end