--calculate upkeep modificator
function Flexible_unit_caps:get_player_upkeep_mod()
  if self.player_supply_custom_mult == -1 then
    self:set_player_upkeep_mod();
  end

  return self.player_supply_custom_mult
end;

function Flexible_unit_caps:set_player_upkeep_mod()
  local difficulty = cm:model():combined_difficulty_level();
  self.player_supply_custom_mult = 2;				-- easy
  
  if difficulty == 0 then
    self.player_supply_custom_mult = 3;				-- normal
  elseif difficulty == -1 then
    self.player_supply_custom_mult = 4;					-- hard
  elseif difficulty == -2 then
    self.player_supply_custom_mult = 6;			-- very hard
  elseif difficulty == -3 then
    self.player_supply_custom_mult = 6;			-- legendary
  end;
end;


