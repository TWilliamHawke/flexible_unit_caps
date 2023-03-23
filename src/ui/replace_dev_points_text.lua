---@diagnostic disable: undefined-field
---@param ui_component UIC
---@param climate_penalty integer
function Flexible_unit_caps:replace_dev_points_text(ui_component, climate_penalty)
  local building_id = string.gsub(ui_component:Id(), "CcoBuildingLevelRecord", "");
  local supply_balance_change = self:get_bulding_supply_balance(building_id, climate_penalty);

  if supply_balance_change == 0 then return end

  local docker = find_uicomponent(ui_component, "known_parent")
  local dev_points = UIComponent(docker:CreateComponent("fluc_points",
  "ui/templates/dev_square_text_buttom_template.twui.xml"))

  -- local dev_points = find_uicomponent(ui_component, "button_txt");
  -- if not dev_points or not dev_points_text then return end
  dev_points:SetVisible(true);
  --dev_points:Resize(40, 40, true)
  dev_points:SetDockingPoint(5)
  dev_points:SetDockOffset(-37, 0)
  dev_points:Resize(45, 40, true)
  dev_points:SetImagePath("ui/skins/default/button_beastmen_panel_underlay.png", 0)
  -- dev_points_text:SetVisible(true);
  local dev_points_text = find_uicomponent(dev_points, "button_txt");
  dev_points_text:SetDockingPoint(5)
  dev_points_text:SetText(self:try_add_plus(supply_balance_change));

  if self.building_tooltip_text == nil then
    self.building_tooltip_text = self:get_localised_string("fluc_building_text") or ""
  end

  dev_points:SetTooltipText(self.building_tooltip_text, true)
end
