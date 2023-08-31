function Flexible_unit_caps:hide_supply_counter()
  cm:callback(function()
    local component = find_uicomponent(core:get_ui_root(), "units_panel", "main_units_panel", "icon_list", "fluc_supply")
    if not component then return end
    component:SetVisible(false)
  end, 0.2);
end