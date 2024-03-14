function Flexible_unit_caps:mct_finalize()

  local faction = cm:get_local_faction(true);
  if not self:faction_has_supply_lines(faction) then
    self.player_supply_custom_mult = 0
  else
    self:apply_upkeep_penalty(faction);
    self:reapply_supply_balance_effect(faction);
  end

  self:set_tooltip_for_finance_button(faction);

  self:log("Player supply now is "..tostring(self.player_supply_custom_mult));

  local balance_icon = find_uicomponent(core:get_ui_root(), "hud_campaign", "resources_bar", "treasury_holder_standard", "fluc_balance") or find_uicomponent(core:get_ui_root(), "hud_campaign", "resources_bar", "treasury_holder", "fluc_balance")
  if balance_icon then
    balance_icon:SetVisible(self.enable_supply_balance);
  end

end;