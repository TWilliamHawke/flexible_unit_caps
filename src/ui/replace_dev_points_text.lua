---@diagnostic disable: undefined-field
---@param ui_component UIC
---@param climate_penalty integer
---@param is_major boolean
function Flexible_unit_caps:replace_dev_points_text(ui_component, climate_penalty, is_major)
  local building_id = string.gsub(ui_component:Id(), "CcoBuildingLevelRecord", "");
  local supply_balance_change = 0;

  if is_major then
    local building_level = building_id:match("%d$")

    if not building_level then
      building_level = building_id:match("%d_a")
      building_level = building_level and building_level:sub(0, -3) or 0;
    end
    building_level = tonumber(building_level) or 0;

    if building_level > 3 then
      supply_balance_change = (3 - building_level) * math.max(2 + climate_penalty, 0)
    end
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

  fluc_points:SetTooltipText(self.building_tooltip_text, true)
end
