---@param force_list MILITARY_FORCE_LIST_SCRIPT_INTERFACE
---@param excluded_lords table<string, boolean> | nil
---@return integer
function Flexible_unit_caps:get_armies_count(force_list, excluded_lords)
  local army_count = 0

  for i = 0, force_list:num_items() - 1 do
    local force = force_list:item_at(i);

    if self:force_needs_supply(force, excluded_lords) then
      army_count = army_count + 1
    end --of army check
  end --of army call

  return army_count
end
