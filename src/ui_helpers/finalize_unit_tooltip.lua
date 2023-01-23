---@param component UIC
---@param supply_text string
---@param regexp string
function Flexible_unit_caps:finalize_unit_tooltip(component, supply_text, regexp)
  if not is_uicomponent(component) then return end

  local first_line_end = supply_text:find("\n");
  local first_line = supply_text:sub(1, first_line_end);
  

  local old_text = component:GetTooltipText();

  if string.find(first_line, supply_text) then return end

  local final_text = string.gsub(old_text, regexp, "\n" .. supply_text .. regexp, 1)

  ---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
  component:SetTooltipText(final_text, true)

end
-- BUG multiply tooltip text bug