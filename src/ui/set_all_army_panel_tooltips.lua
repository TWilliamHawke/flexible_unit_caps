---@param lord CHARACTER_SCRIPT_INTERFACE
function Flexible_unit_caps:set_all_army_panel_tooltips(lord)
  local unitList = find_uicomponent(core:get_ui_root(), "units_panel", "main_units_panel", "units");
  if not unitList then return end

  local force = lord:military_force();
  local caches = {}

  caches.supply_change_cache = self:create_supply_change_cache(force);
  caches.queued_units_cache = self:create_queued_units_cache(unitList, caches.supply_change_cache);
  caches.selected_force_units_cache = self:create_force_cache(force, caches.supply_change_cache);

  local faction = lord:faction();
  local supply_balance = self:get_supply_balance(faction);
  local supply_penalty = self:get_supply_penalty(faction, supply_balance);
  local queued_units = { supply = 0 }

  
  for _, unit_card in uic_pairs(unitList) do
    local component_id = unit_card:Id();
    
    if string.find(component_id, "QueuedLandUnit") then
      self:set_tooltip_for_unit_in_queue(unit_card, queued_units, caches);
      -- elseif string.find(component_id, "temp_merc_") then
      --   self:set_queued_unit_tooltip(unit_card, "temp_merc_"); --doesnt work now
    elseif component_id == "LandUnit 0" then
      self:set_tooltip_for_lord_icon(unit_card, supply_penalty);
    elseif string.find(component_id, "LandUnit") then
      self:set_tooltip_for_unit_in_army(unit_card, lord, caches);
    elseif string.find(component_id, "AgentUnit") then
      self:log("tooltip for agent")
      self:set_agent_tooltip(unit_card, lord);
    end
  end

  self:set_tooltip_for_army_upkeep(lord, supply_penalty, queued_units.supply, caches);

  if not cm:get_campaign_ui_manager():is_panel_open("recruitment_options") then return end
  local recruitment_options = find_uicomponent(core:get_ui_root(), "units_panel", "recruitment_options");

  local local_recruitment = find_uicomponent(recruitment_options, "recruitment_listbox", "local1", "list_box");
  self:apply_callback_to_children(local_recruitment, self:set_tooltip_for_new_unit("_recruitable", caches));

  local local_recruitment = find_uicomponent(recruitment_options, "recruitment_listbox", "local2", "list_box");
  self:apply_callback_to_children(local_recruitment, self:set_tooltip_for_new_unit("_recruitable", caches));

  local global_recruitment = find_uicomponent(recruitment_options, "recruitment_listbox", "global", "list_box");
  self:apply_callback_to_children(global_recruitment, self:set_tooltip_for_new_unit("_recruitable", caches));

  local mercenaries = find_uicomponent(recruitment_options, "mercenary_display", "frame", "list_box");
  self:apply_callback_to_children(mercenaries, self:set_tooltip_for_new_unit("_mercenary", caches));

  local allied_units = find_uicomponent(recruitment_options, "allied_recuitment_display", "unit_list", "allied_unit_list");
  self:apply_callback_to_children(allied_units, self:set_tooltip_for_new_unit("_recruitable", caches));

end
