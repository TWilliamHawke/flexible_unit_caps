function Flexible_unit_caps:create_queued_units_cache()
  self.queued_units_cache = {};
  local iteration_index = 0;
  local ui_component = find_uicomponent(core:get_ui_root(), "main_units_panel", "units", "QueuedLandUnit 0");

  while (ui_component) do
    local queued_unit_name = self:get_queued_unit_name(ui_component);
    local queued_unit_group = self:get_unit_caps_group(queued_unit_name);

    self:increment_value_in_table(self.queued_units_cache, queued_unit_group);

    iteration_index = iteration_index + 1;
    ui_component = find_uicomponent(core:get_ui_root(), "main_units_panel", "units", "QueuedLandUnit " .. iteration_index);

  end

end
