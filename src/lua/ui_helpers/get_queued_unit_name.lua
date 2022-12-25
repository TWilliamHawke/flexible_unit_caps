function Flexible_unit_caps:get_queued_unit_name(ui_component)
  if not is_uicomponent(ui_component) then return end;

  ui_component:SimulateMouseOn();
  local queued_unit_name = "";

  local ok, err = pcall(function()
    local unit_info = find_uicomponent(core:get_ui_root(), "hud_campaign", "unit_information_parent",
                                       "unit_info_panel_holder_parent", "unit_info_panel_holder");
    queued_unit_name = string.gsub(string.gsub(unit_info:GetContextObjectId("CcoUnitDetails"), "RecruitmentUnit_", ""),
    "_%d+_%d+_%d+_%d+$", "");

  end);

  if not ok then
    self:logCore("Error reading a queued unit card: " .. ui_component:Id());
    self:logCore(tostring(err));

  end
  ui_component:SimulateMouseOff();

  return queued_unit_name;
end;
