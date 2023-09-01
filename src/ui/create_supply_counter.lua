function Flexible_unit_caps:create_supply_counter(text, tooltip)
  local icons_holder = find_uicomponent(core:get_ui_root(), "units_panel", "main_units_panel", "icon_list")
  if not icons_holder then return end

  local component = find_uicomponent(icons_holder, "fluc_supply");

  if not component then
    local cargo = find_uicomponent(icons_holder, "dy_upkeep")
    component = UIComponent(cargo:CopyComponent("fluc_supply"))
  end

  component:SetVisible(true)
  ---@diagnostic disable-next-line: undefined-field
  component:SetText(text)
  component:SetImagePath("ui/skins/fluc_icon_supplies.png", 1)
  ---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
  component:SetTooltipText(tooltip, true);

end