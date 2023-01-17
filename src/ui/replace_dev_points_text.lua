---@param ui_component UIC
---@param climate_penalty integer
function Flexible_unit_caps:replace_dev_points_text(ui_component, climate_penalty)

  local building_id = string.gsub(ui_component:Id(), "CcoBuildingLevelRecord", "");
  local supply_balance_change = self:get_bulding_supply_balance(building_id, climate_penalty);

  if supply_balance_change == 0 then return end

  local dev_points = find_uicomponent(ui_component, "dev_points");
  local dev_points_text = find_uicomponent(dev_points, "dy_num_points_required");
  if not dev_points or not dev_points_text then return end

  dev_points:SetVisible(true);
  dev_points_text:SetVisible(true);

  ---@diagnostic disable-next-line: undefined-field
  dev_points_text:SetText(self:try_add_plus(supply_balance_change));
end

--TODO replace with custom icon
--TODO add tooltips for mct options