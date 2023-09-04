---@param component UIC
---@param character CHARACTER_SCRIPT_INTERFACE
---@param caches {}
function Flexible_unit_caps:set_agent_tooltip(component, character, caches)
  local agent_supply_cost = 0;
  local agent_number = component:Id():match("(%d+)")
  agent_number = tonumber(agent_number) or 0;

  if character:has_military_force() then
    local charlist = character:military_force():character_list()
    if (agent_number >= charlist:num_items()) then return end

    character = charlist:item_at(agent_number);
    if not character then return end

    self:logDebug("Character # " .. tostring(agent_number) .. " is " .. tostring(character:character_subtype_key()))
  else
    self:logDebug("Selected agent rank is " .. tostring(character:rank()))
  end

  local _, unit_index = self:get_units_count_from_cache(
    caches.selected_force_units_cache, "fluc_all_heroes", tostring(agent_number + 2));
  local group_capacity = self:get_unit_cap_from_cache(caches.selected_force_units_cache, "fluc_all_heroes");


  local supply_text = self:construct_agent_tooltip(character, unit_index, group_capacity)

  self:finalize_unit_tooltip(component, supply_text, "||")
end
