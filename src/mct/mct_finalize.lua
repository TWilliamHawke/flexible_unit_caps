function Flexible_unit_caps:mct_finalize()

  local faction = cm:model():world():whose_turn_is_it()
  if not self:faction_has_supply_lines(faction) then
    self.player_supply_custom_mult = 0
  else
    self:apply_upkeep_penalty(faction);
    self:reapply_supply_balance_effect(faction);
  end

  self:logDebug("Player supply now is "..tostring(self.player_supply_custom_mult));
end;