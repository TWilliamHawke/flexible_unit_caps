---return current supply_balance
---@param faction FACTION_SCRIPT_INTERFACE
---@return integer
---@return table<string, integer>
function Flexible_unit_caps:get_supply_balance(faction)

  local army_supply, ogre_camps_supply = self:get_armies_total_cost(faction);

  local region_supply, buildings_supply, garrisons_supply = self:get_regions_supply(faction);
  local total_balance = region_supply + buildings_supply + ogre_camps_supply + garrisons_supply - army_supply;

  local balance_data = {
    settlements = region_supply,
    military = buildings_supply,
    garrisons = garrisons_supply,
    camps = ogre_camps_supply,
    forces = -army_supply,
  }

  if not self:faction_has_supply_balance(faction) then
    total_balance = 0;
  end

  return total_balance, balance_data
end

---main script used in listeners
---@param faction FACTION_SCRIPT_INTERFACE
function Flexible_unit_caps:reapply_supply_balance_effect(faction)
  self:remove_supply_balance_effect(faction)

  local supply_balance = self:get_supply_balance(faction)

  if supply_balance > 0 then
    self:apply_supply_balance_effect(faction, supply_balance)
  end

  if supply_balance < 0 then
    self:create_negative_sb_effect(faction, supply_balance)
  end
end
