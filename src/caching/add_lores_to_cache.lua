function Flexible_unit_caps:add_lores_to_cache()
  local lore_list = find_uicomponent(core:get_ui_root(), "character_panel", "general_selection_panel", "main_holder", "lore_select_parent", "lore_type_list");

  if not lore_list then return end;

  self:apply_callback_to_children(lore_list, function(component)
    local id = component:Id();

    if type(id) == "string" and id:len() > 0 then
      self.character_panel_lords[id] = true
    end
  end)


end