function Flexible_unit_caps:construct_agent_tooltip(character, index, cap)
  local base_supply = self:get_this_agent_supply(character);
  local final_supply = base_supply;

  if index then
    final_supply = self:apply_unit_cap(4, final_supply, index, cap);
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

  if index then
    tooltip_text = tooltip_text .. self:construct_unit_group_text("fluc_all_heroes", cap, index, 0);
  end

  return tooltip_text, final_supply
end
