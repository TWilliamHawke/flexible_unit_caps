---@param faction FACTION_SCRIPT_INTERFACE
function Flexible_unit_caps:replace_unit_caps_faction(faction)
  local force_list = faction:military_force_list();

  for i = 0, force_list:num_items() - 1 do
    local force = force_list:item_at(i);

    if self:check_force_for_unit_caps(force) then
      self:replace_unit_caps_force(force);
    end; --of army check
  end; --of army call


end;