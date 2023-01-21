---@param lord CHARACTER_SCRIPT_INTERFACE
function Flexible_unit_caps:set_all_army_panel_tooltips(lord)
  local unitList = find_uicomponent(core:get_ui_root(), "units_panel", "main_units_panel", "units");
  if not unitList then return end

  local force = lord:military_force();
  if not self:force_needs_supply(force) then return end;

  self.supply_change_cache = self:create_supply_change_cache(lord);
  self.queued_units_cache = self:create_queued_units_cache(unitList, self.supply_change_cache);
  self.selected_force_units_cache = self:create_force_cache(force, self.supply_change_cache);

--TODO add tooltip for lord card

  for _, unit_card in uic_pairs(unitList) do
    local component_id = unit_card:Id();

    if string.find(component_id, "QueuedLandUnit") then
      self:set_tooltip_for_unit_in_queue(unit_card, lord);
      -- elseif string.find(component_id, "temp_merc_") then
      --   self:set_queued_unit_tooltip(unit_card, "temp_merc_"); --dont work now
    elseif string.find(component_id, "LandUnit") then
      self:set_tooltip_for_unit_in_army(unit_card, lord);
    elseif string.find(component_id, "AgentUnit") then
      self:set_agent_tooltip(unit_card, lord);
    end
  end

  if not cm:get_campaign_ui_manager():is_panel_open("recruitment_options") then return end

  local local_recruitment = find_uicomponent(core:get_ui_root(), "units_panel",
    "recruitment_options", "recruitment_listbox", "local1", "list_box");
  self:apply_callback_to_children(local_recruitment, self:set_tooltip_for_new_unit("_recruitable", lord))

  local global_recruitment = find_uicomponent(core:get_ui_root(), "units_panel",
    "recruitment_options", "recruitment_listbox", "global", "list_box");
  self:apply_callback_to_children(global_recruitment, self:set_tooltip_for_new_unit("_recruitable", lord))

  local mercenaries = find_uicomponent(core:get_ui_root(), "units_panel",
    "recruitment_options", "mercenary_display", "frame", "list_box");
  self:apply_callback_to_children(mercenaries, self:set_tooltip_for_new_unit("_mercenary", lord))

  local allied_units = find_uicomponent(core:get_ui_root(), "units_panel",
    "recruitment_options", "allied_recuitment_display", "unit_list", "allied_unit_list");
  self:apply_callback_to_children(allied_units, self:set_tooltip_for_new_unit("_recruitable", lord))

end
