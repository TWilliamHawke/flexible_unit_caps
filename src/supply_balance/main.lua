---return current supply_balance
---@param faction FACTION_SCRIPT_INTERFACE
---@return integer
---@return integer
---@return integer
---@return integer
---@return integer
---@return integer
function Flexible_unit_caps:get_supply_balance(faction)

  local army_supply, ogre_camps_supply = self:get_armies_total_cost(faction);

  local region_supply, buildings_supply, garrisons_supply = self:get_regions_supply(faction);
  local total_balance = region_supply + buildings_supply + ogre_camps_supply + garrisons_supply - army_supply;

  return total_balance, region_supply, buildings_supply, ogre_camps_supply, -army_supply, garrisons_supply
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
