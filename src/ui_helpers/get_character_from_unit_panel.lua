---@return CHARACTER_SCRIPT_INTERFACE | nil
function Flexible_unit_caps:get_character_from_unit_panel()
  local ui_manager = cm:get_campaign_ui_manager();
  if not ui_manager:is_panel_open("units_panel") then return end

  local units_panel = find_uicomponent(core:get_ui_root(), "units_panel")
  if not units_panel then return end

  local character_cqi = units_panel:GetContextObjectId("CcoCampaignCharacter")
  local character = cm:get_character_by_cqi(tonumber(character_cqi) or -1);
  if character:is_null_interface() then return end
  if not character:faction():is_human() then return end

  return character;
end
