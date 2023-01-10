---@param target_unit_group string
---@param target_unit_index number
---@param component_prefix string
---@return integer
---@return integer
function Flexible_unit_caps:get_queued_units_count(target_unit_group, target_unit_index, component_prefix)
  local total_units_count = 0;
  local units_count_before_target = 0;
  local iteration_index = 0;
  target_unit_index = tonumber(target_unit_index);
  local unit_component = find_uicomponent(core:get_ui_root(), "main_units_panel", "units", component_prefix.."0");

  while (unit_component) do
    local queued_unit_name = self:get_queued_unit_name(unit_component);
    local queued_unit_group, parent_unit_group = self:get_unit_caps_group(queued_unit_name);
    
    if queued_unit_group == target_unit_group or parent_unit_group == target_unit_group then
      total_units_count = total_units_count + 1;
      
      if(target_unit_index ~= nil and iteration_index < target_unit_index) then
        units_count_before_target = units_count_before_target + 1;
      end;
    end;

    iteration_index = iteration_index + 1;
    unit_component = find_uicomponent(core:get_ui_root(), "main_units_panel", "units", component_prefix..iteration_index);
  end;

  return total_units_count, units_count_before_target;

end;