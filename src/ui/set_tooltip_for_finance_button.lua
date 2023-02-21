---@param faction FACTION_SCRIPT_INTERFACE
function Flexible_unit_caps:set_tooltip_for_finance_button(faction)
  self:logDebug("--------");
  self:logDebug("SET TREASURY TOOLTIP FUNCTION IS STARTED");
  
  local culture = faction:subculture();
  local component = find_uicomponent(core:get_ui_root(), "hud_campaign", "resources_bar", "button_finance")
  
  local tooltip_text = ""
  
  if self:faction_is_horde(faction) or culture == "wh_main_sc_nor_warp" or culture == "wh_main_sc_nor_troll" then
    tooltip_text = self:get_localised_string("fluc_Subculture_Text_hordes")
  elseif culture == "wh2_dlc09_sc_tmb_tomb_kings" then
    tooltip_text = self:get_localised_string("fluc_Subculture_Text_tomb_kings")
  elseif culture == "wh_main_sc_brt_bretonnia" then
    tooltip_text = self:get_localised_string("fluc_Subculture_Text_bretonnia")
  else
    tooltip_text = self:construct_treasury_tooltip(faction)
  end;

  --apply text
  if is_uicomponent(component) then 
    ---@diagnostic disable: missing-parameter, param-type-mismatch
    component:SetTooltipText(tooltip_text, true)
  end;
  self:logDebug("SET TREASURY TOOLTIP FUNCTION IS FINISHED");

end;

