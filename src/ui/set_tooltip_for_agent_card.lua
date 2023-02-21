---@param component UIC
---@param character CHARACTER_SCRIPT_INTERFACE
function Flexible_unit_caps:set_agent_tooltip(component, character)
  local agent_supply_cost = 0;

  if character:has_military_force() then
    local charlist = character:military_force():character_list()
    local agent_number = component:Id():match("(%d+)") or 0
    if (tonumber(agent_number) >= charlist:num_items()) then return end

    local character = charlist:item_at(agent_number);
    if not character then return end

    self:logDebug("Character # " .. tostring(agent_number) .. " is " .. tostring(character:character_subtype_key()))
    agent_supply_cost = self:get_this_agent_supply(character);
  else
    self:logDebug("Selected agent rank is " .. tostring(character:rank()))
    agent_supply_cost = self:get_this_agent_supply(character);
  end


  local supply_text = self:get_localised_string("fluc_agent_supply_cost")
  supply_text = string.gsub(supply_text, "FLUC_SUPPLY", agent_supply_cost);


  self:finalize_unit_tooltip(component, self:form_yellow_line(supply_text), "\n")
end

--BUG fix agent card tooltip