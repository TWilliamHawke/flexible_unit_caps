function Flexible_unit_caps:create_queued_units_cache()
  self.queued_units_cache = {};
  local units_holder = find_uicomponent(core:get_ui_root(), "main_units_panel", "units");
  if not units_holder then return end

  local function add_unit_group_to_cache(unit_group, component_name)
    if not self.queued_units_cache[unit_group] then
      self.queued_units_cache[unit_group] = { count = 0 };
    end

    local count = self.queued_units_cache[unit_group].count + 1;
    self.queued_units_cache[unit_group][component_name] = count;
    self.queued_units_cache[unit_group].count = count;
  end;

  local function iterate_through_queue(prefix)
    local iteration_index = 0;
    local ui_component = find_uicomponent(units_holder, prefix .. "0");

    while (ui_component) do
      local component_name = ui_component:Id();
      local queued_unit_name = self:get_queued_unit_name(ui_component);
      local queued_unit_group, parent_group = self:get_unit_caps_group(queued_unit_name);

      add_unit_group_to_cache(queued_unit_group, component_name);

      if parent_group ~= "" then
        add_unit_group_to_cache(parent_group, component_name);
      end;

      iteration_index = iteration_index + 1;
      ui_component = find_uicomponent(units_holder, prefix .. iteration_index);
    end
  end

  iterate_through_queue("QueuedLandUnit ");
  --iterate_through_queue("temp_merc_");

end
