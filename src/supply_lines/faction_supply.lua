---@param faction FACTION_SCRIPT_INTERFACE
---@return integer
---@return integer
---@return integer
function Flexible_unit_caps:get_player_faction_supply(faction)
  local upkeep_mult = self:get_player_upkeep_mod();
  local faction_supply_points = self:get_agents_supply(faction);
  local force_list = faction:military_force_list();
  local supply_balance = self:get_supply_balance(faction);
  local supply_penalty = self:get_supply_penalty(faction, supply_balance);
  local culture = faction:culture();
  local effect_mult = self.special_effects[culture] and 3 or 1;

  if upkeep_mult == 0 then
    return 0, 0, supply_balance;
  end;

  for i = 0, force_list:num_items() - 1 do
      local force = force_list:item_at(i);

      if self:force_needs_supply(force) then
        local army_supply = self:get_army_supply(force, supply_penalty, {});
        faction_supply_points = faction_supply_points + army_supply;
      end; --of army check
  end; --of force_list loop

  local upkeep_penalty = self:get_upkeep_from_supply(faction_supply_points * effect_mult, upkeep_mult);

  self:log("-----------");
  self:log("TOTAL SUPPLY FOR FACTION: "..tostring(faction_supply_points));

  return upkeep_penalty, faction_supply_points, supply_balance;
end;