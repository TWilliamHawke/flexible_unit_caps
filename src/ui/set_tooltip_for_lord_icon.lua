---@param component UIC
---@param supply_penalty integer
function Flexible_unit_caps:set_tooltip_for_lord_icon(component, supply_penalty)
  local supply_text = self:get_localised_string("fluc_supply_lord_zero");
  local lord_supply = self.basic_lord_supply + supply_penalty;

  if lord_supply > 0 then
    supply_text = self:get_localised_string("fluc_supply_lord_negative");
    supply_text = string.gsub(supply_text, "FLUC_SUPPLY", tostring(lord_supply))
    if supply_penalty > 0 then
      supply_text = supply_text..self:get_localised_string("");
    end

  end

  supply_text = self:form_yellow_line(supply_text);
  self:finalize_unit_tooltip(component, supply_text, "||")

end