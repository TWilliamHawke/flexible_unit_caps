function Flexible_unit_caps:construct_agent_tooltip(character, index, cap)
  agent_supply_cost = self:get_this_agent_supply(character);
  agent_supply_cost = self:apply_unit_cap(4, agent_supply_cost, index, cap);

  local tooltip_text

  if agent_supply_cost < 1 then
    tooltip_text = self:get_localised_string("fluc_agent_supply_cost_zero")
  else
    tooltip_text = self:get_localised_string("fluc_agent_supply_cost")
    tooltip_text = string.gsub(tooltip_text, "FLUC_SUPPLY", agent_supply_cost);
  end

  tooltip_text = self:form_yellow_line(tooltip_text)

  if index then
    tooltip_text = tooltip_text..self:construct_unit_group_text("fluc_all_heroes", cap, index, 0);
  end

  return tooltip_text, agent_supply_cost
end
