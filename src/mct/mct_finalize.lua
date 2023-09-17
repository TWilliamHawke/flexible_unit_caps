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
end;