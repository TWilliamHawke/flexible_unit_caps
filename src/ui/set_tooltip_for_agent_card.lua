---@param component UIC
---@param character CHARACTER_SCRIPT_INTERFACE
function Flexible_unit_caps:set_agent_tooltip(component, character)
  local agent_supply_cost = 0;

  if character:has_military_force() then
    local charlist = character:military_force():character_list()
    local agent_number = component:Id():match("(%d+)")
    agent_number = tonumber(agent_number) or 0;
    if (agent_number >= charlist:num_items()) then return end

    character = charlist:item_at(agent_number);
    if not character then return end

    self:logDebug("Character # " .. tostring(agent_number) .. " is " .. tostring(character:character_subtype_key()))
  else
    self:logDebug("Selected agent rank is " .. tostring(character:rank()))
  end

  local supply_text = self:construct_agent_tooltip(character)

  self:finalize_unit_tooltip(component, self:form_yellow_line(supply_text), "||")
end
