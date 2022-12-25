function Flexible_unit_caps:get_queued_units_count(target_unit_group, target_unit_index)
  local total_units_count = 0;
  local units_count_before_target = 0;
  local iteration_index = 0;
  target_unit_index = tonumber(target_unit_index);

  while (find_uicomponent(core:get_ui_root(), "main_units_panel", "units", "QueuedLandUnit "..iteration_index)) do
    local current_queued_unit = find_uicomponent(core:get_ui_root(), "main_units_panel", "units", "QueuedLandUnit "..iteration_index);
    local queued_unit_name = self:get_queued_unit_name(current_queued_unit);

    local queued_unit_group = self:get_unit_caps_group(queued_unit_name);
    
    if(queued_unit_group == target_unit_group) then
      total_units_count = total_units_count + 1;

      if(target_unit_index ~= nil and iteration_index < target_unit_index) then
        units_count_before_target = units_count_before_target + 1;
      end;
    end;

    iteration_index = iteration_index + 1;
  end;

  return total_units_count, units_count_before_target;

end;