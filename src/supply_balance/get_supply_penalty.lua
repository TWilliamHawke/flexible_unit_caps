---return additional supply for each army if balance is negative
---@param faction FACTION_SCRIPT_INTERFACE
---@param supply_balance integer
---@return integer
function Flexible_unit_caps:get_supply_penalty(faction, supply_balance)

  if supply_balance >= 0 then
    return 0
  end

  local force_list = faction:military_force_list();
  local num_of_armies = self:get_armies_count(force_list);

  return self:calculate_supply_penalty(0 - supply_balance, num_of_armies)

end