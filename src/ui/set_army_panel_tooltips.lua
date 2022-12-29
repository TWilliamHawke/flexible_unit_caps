function Flexible_unit_caps:set_army_panel_tooltips()
  if not cm then return end
  local ui_manager = cm:get_campaign_ui_manager();
  if not ui_manager then return end
  if not ui_manager:is_panel_open("units_panel") then return end
  if not self.selected_character then return end;
  if self.selected_character:is_null_interface() then return end;
  if not self.selected_character:faction():is_human() then return end;
  if not self.selected_character:has_military_force() then return end;

  self:create_queued_units_cache();

    ---@param component UIC
  ---@param callback function
  local function apply_callback_to_children(component, callback)
    if not component then return end
    for _, child in uic_pairs(component) do
      callback(child);
    end
  end

  local unitList = find_uicomponent(core:get_ui_root(), "units_panel", "main_units_panel", "units");

  if not unitList then return end

  for _, unit_card in uic_pairs(unitList) do
    local component_id = unit_card:Id();

    if string.find(component_id, "QueuedLandUnit") then
      self:set_queued_unit_tooltip(unit_card);
    elseif string.find(component_id, "LandUnit") then
      self:set_unit_in_army_tooltip(unit_card);
    elseif string.find(component_id, "AgentUnit") then
      self:set_agent_tooltip(unit_card);
    end
  end

  if not (ui_manager:is_panel_open("recruitment_options")) then return end

  local local_recruitment = find_uicomponent(core:get_ui_root(), "units_panel",
    "recruitment_options", "recruitment_listbox", "local1", "list_box");
  apply_callback_to_children(local_recruitment, self:set_unit_tooltip("_recruitable"))

  local global_recruitment = find_uicomponent(core:get_ui_root(), "units_panel",
    "recruitment_options", "recruitment_listbox", "global", "list_box");
  apply_callback_to_children(global_recruitment, self:set_unit_tooltip("_recruitable"))

  local mercenaries = find_uicomponent(core:get_ui_root(), "units_panel",
    "recruitment_options", "mercenary_display", "frame", "list_box");
  apply_callback_to_children(mercenaries, self:set_unit_tooltip("_mercenary"))

  local allied_units = find_uicomponent(core:get_ui_root(), "units_panel",
    "recruitment_options", "allied_recuitment_display", "unit_list", "allied_unit_list");
  apply_callback_to_children(allied_units, self:set_unit_tooltip("_recruitable"))

end
