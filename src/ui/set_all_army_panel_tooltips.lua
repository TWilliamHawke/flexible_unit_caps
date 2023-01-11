function Flexible_unit_caps:set_all_army_panel_tooltips()
  if not cm then return end
  local ui_manager = cm:get_campaign_ui_manager();
  if not ui_manager then return end
  if not ui_manager:is_panel_open("units_panel") then return end
  if not self.selected_character then return end
  if self.selected_character:is_null_interface() then return end
  if not self.selected_character:faction():is_human() then return end
  if not self.selected_character:has_military_force() then return end
  if self.selected_character:military_force():has_effect_bundle(self.loaned_army_effect) then return end
  local units_holder = find_uicomponent(core:get_ui_root(), "main_units_panel", "units");

  self.queued_units_cache = self:get_queued_units_cache(units_holder);
  self.selected_force_units_cache = self:get_force_units_cache(self.selected_character:military_force())

  local unitList = find_uicomponent(core:get_ui_root(), "units_panel", "main_units_panel", "units");

  if not unitList then return end

  for _, unit_card in uic_pairs(unitList) do
    local component_id = unit_card:Id();


    if string.find(component_id, "QueuedLandUnit") then
      self:set_tooltip_for_unit_in_queue(unit_card);
      -- elseif string.find(component_id, "temp_merc_") then
      --   self:set_queued_unit_tooltip(unit_card, "temp_merc_"); --dont work now
    elseif string.find(component_id, "LandUnit") then
      self:set_tooltip_for_unit_in_army(unit_card);
    elseif string.find(component_id, "AgentUnit") then
      self:set_agent_tooltip(unit_card);
    end
  end

  if not (ui_manager:is_panel_open("recruitment_options")) then return end

  local local_recruitment = find_uicomponent(core:get_ui_root(), "units_panel",
    "recruitment_options", "recruitment_listbox", "local1", "list_box");
  self:apply_callback_to_children(local_recruitment, self:set_tooltip_for_new_unit("_recruitable"))

  local global_recruitment = find_uicomponent(core:get_ui_root(), "units_panel",
    "recruitment_options", "recruitment_listbox", "global", "list_box");
  self:apply_callback_to_children(global_recruitment, self:set_tooltip_for_new_unit("_recruitable"))

  local mercenaries = find_uicomponent(core:get_ui_root(), "units_panel",
    "recruitment_options", "mercenary_display", "frame", "list_box");
  self:apply_callback_to_children(mercenaries, self:set_tooltip_for_new_unit("_mercenary"))

  local allied_units = find_uicomponent(core:get_ui_root(), "units_panel",
    "recruitment_options", "allied_recuitment_display", "unit_list", "allied_unit_list");
  self:apply_callback_to_children(allied_units, self:set_tooltip_for_new_unit("_recruitable"))

end