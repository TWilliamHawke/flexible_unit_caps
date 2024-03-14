---@param faction FACTION_SCRIPT_INTERFACE
function Flexible_unit_caps:set_tooltip_for_finance_button(faction)
  self:logDebug("--------");
  self:logDebug("SET TREASURY TOOLTIP FUNCTION IS STARTED");

  local finance_button = find_uicomponent(core:get_ui_root(), "hud_campaign", "resources_bar", "button_finance")
  local tooltip_text, supply_balance = self:construct_treasury_tooltip(faction);

  --apply text
  if is_uicomponent(finance_button) then
    ---@diagnostic disable: missing-parameter, param-type-mismatch
    finance_button:SetTooltipText(tooltip_text, true)
  end
  self:logDebug("SET TREASURY TOOLTIP FUNCTION IS FINISHED");
  if not self:faction_has_supply_balance(faction) then return end

  self:create_balance_counter(supply_balance);
end
