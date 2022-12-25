function Flexible_unit_caps:set_finance_button_tooltip(faction)
  self:logDebug("--------");
  self:logDebug("SET TREASURY TOOLTIP FUNCTION IS STARTED");

  local culture = faction:subculture();
  local component = find_uicomponent(core:get_ui_root(), "hud_campaign", "resources_bar", "button_finance")

  local tooltip_text = ""

  if self:faction_is_horde(faction) or culture == "wh_main_sc_nor_warp" or culture == "wh_main_sc_nor_troll" then
    tooltip_text = self:get_localised_string("SRW_Subculture_Text_hordes")
  elseif culture == "wh2_dlc09_sc_tmb_tomb_kings" then
    tooltip_text = self:get_localised_string("SRW_Subculture_Text_tomb_kings")
  elseif culture == "wh_main_sc_brt_bretonnia" then
    tooltip_text = self:get_localised_string("SRW_Subculture_Text_bretonnia")
  elseif self.player_supply_custom_mult == 0 then
    tooltip_text = self:get_localised_string("SRW_zero_mult_text")
  else
    tooltip_text = self:construct_treasury_tooltip(faction)
  end;

  --apply text
  if is_uicomponent(component) then 
    component:SetTooltipText(tooltip_text, true)
  end;
  self:logDebug("SET TREASURY TOOLTIP FUNCTION IS FINISHED");

end;

