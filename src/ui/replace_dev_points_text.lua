---@diagnostic disable: undefined-field
---@param ui_component UIC
---@param climate_penalty integer
---@param is_major boolean
function Flexible_unit_caps:replace_dev_points_text(ui_component, climate_penalty, is_major, chain)
  local building_id = string.gsub(ui_component:Id(), "CcoBuildingLevelRecord", "");
  local supply_balance_change = 0;

  if is_major then
    chain = string.gsub(chain, "CcoBuildingChainRecord", "");
    supply_balance_change = self:get_major_building_change(building_id, chain, climate_penalty);
  else
    supply_balance_change = self:get_bulding_supply_balance(building_id, climate_penalty);
  end

  if supply_balance_change == 0 then return end

  local docker = find_uicomponent(ui_component, "known_parent")
  local fluc_points = find_uicomponent(docker, "fluc_points")

  if not fluc_points then
    fluc_points = UIComponent(docker:CreateComponent("fluc_points",
      "ui/templates/dev_square_text_buttom_template.twui.xml"))
  end

  fluc_points:SetVisible(true);
  fluc_points:SetDockingPoint(5)
  fluc_points:Resize(45, 40, true)
  fluc_points:SetImagePath("ui/skins/default/button_beastmen_panel_underlay.png", 0)

  if is_major then
    local dev_points = find_uicomponent(ui_component, "dev_points");
    dev_points:SetDockingPoint(5)
    dev_points:SetDockOffset(-45, 20)

    fluc_points:SetDockOffset(-45, -15)
  else
    fluc_points:SetDockOffset(-37, 0)
  end

  local dev_points_text = find_uicomponent(fluc_points, "button_txt");
  dev_points_text:SetDockingPoint(5)
  dev_points_text:SetText(self:try_add_plus(supply_balance_change));

  if self.building_tooltip_text == nil then
    self.building_tooltip_text = self:get_localised_string("fluc_building_text") or ""
  end

  ---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
  fluc_points:SetTooltipText(self.building_tooltip_text, true)
end
