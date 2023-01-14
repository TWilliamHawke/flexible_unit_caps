---@param faction FACTION_SCRIPT_INTERFACE
---@return integer
---@return integer
function Flexible_unit_caps:get_armies_total_cost(faction)
  local force_list = faction:military_force_list();
  local armies_total_cost = 0;
  local army_cost = 0;
  local ogre_camps_supply = 0;

  for i = 0, force_list:num_items() - 1 do
    local force = force_list:item_at(i);
    local force_type = force:force_type():key();

    if force_type == "OGRE_CAMP" then
      ogre_camps_supply = ogre_camps_supply + 3;
    end

    if self:force_needs_supply(force, self.no_balance_lords) then

      armies_total_cost = armies_total_cost + army_cost;
      army_cost = army_cost + 1
    end --of army check
  end --of force list loop

  return armies_total_cost, ogre_camps_supply;
end
