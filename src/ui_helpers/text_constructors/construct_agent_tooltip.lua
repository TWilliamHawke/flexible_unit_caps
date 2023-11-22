---@param character CHARACTER_SCRIPT_INTERFACE
---@param index integer | nil
---@param cap integer | nil
---@return string
---@return integer
function Flexible_unit_caps:construct_agent_tooltip(character, index, cap)
  local base_supply = self:get_this_agent_supply(character);
  local final_supply = base_supply;
  local agent_count = 1;

  if index and cap then
    final_supply = self:apply_unit_cap(4, final_supply, index, cap);
  end

  if character:is_embedded_in_military_force() then
    agent_count = character:embedded_in_military_force():character_list():num_items() - 1;
  end

  local tooltip_text

  if final_supply < 1 then
    tooltip_text = self:get_localised_string("fluc_agent_supply_cost_zero")
  else
    tooltip_text = self:get_localised_string("fluc_agent_supply_cost")
    tooltip_text = string.gsub(tooltip_text, "FLUC_SUPPLY", final_supply);
    if final_supply > base_supply then
      tooltip_text = tooltip_text .. " " .. self:get_localised_string("fluc_unit_cap_text");
    end
  end

  tooltip_text = self:form_yellow_line(tooltip_text)

  if cap then
    tooltip_text = tooltip_text .. self:construct_unit_group_text(self.heroes_unit_group, cap, agent_count, 0);
  end

  return tooltip_text, final_supply;
end
