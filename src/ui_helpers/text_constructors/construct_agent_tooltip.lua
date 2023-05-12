function Flexible_unit_caps:construct_agent_tooltip(character)
  agent_supply_cost = self:get_this_agent_supply(character);
  local tooltip_text

  if agent_supply_cost < 1 then
    tooltip_text = self:get_localised_string("fluc_agent_supply_cost_zero")
  else
    tooltip_text = self:get_localised_string("fluc_agent_supply_cost")
    tooltip_text = string.gsub(tooltip_text, "FLUC_SUPPLY", agent_supply_cost);
  end

  return tooltip_text, agent_supply_cost
end
