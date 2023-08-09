---@param faction FACTION_SCRIPT_INTERFACE
function Flexible_unit_caps:set_tooltip_for_finance_button(faction)
  self:logDebug("--------");
  self:logDebug("SET TREASURY TOOLTIP FUNCTION IS STARTED");

  local component = find_uicomponent(core:get_ui_root(), "hud_campaign", "resources_bar", "button_finance")
  local tooltip_text = self:construct_treasury_tooltip(faction);

  --apply text
  if is_uicomponent(component) then
    ---@diagnostic disable: missing-parameter, param-type-mismatch
    component:SetTooltipText(tooltip_text, true)
  end
  self:logDebug("SET TREASURY TOOLTIP FUNCTION IS FINISHED");
end
