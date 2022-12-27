function Flexible_unit_caps:create_queued_units_cache()
  self.queued_units_cache = {};
  local iteration_index = 0;
  local ui_component = find_uicomponent(core:get_ui_root(), "main_units_panel", "units", "QueuedLandUnit 0");

  while (ui_component) do
    local queued_unit_name = self:get_queued_unit_name(ui_component);
    local queued_unit_group = self:get_unit_caps_group(queued_unit_name);
    local cached_count = self.queued_units_cache[queued_unit_group];

    if cached_count == nil then
      self.queued_units_cache[queued_unit_group] = 0
    else
      self.queued_units_cache[queued_unit_group] = cached_count + 1;
    end


    iteration_index = iteration_index + 1;
    ui_component = find_uicomponent(core:get_ui_root(), "main_units_panel", "units", "QueuedLandUnit " .. iteration_index);

  end

end
