function Flexible_unit_caps:replace_dev_points_text(ui_component)
  --"CcoBuildingLevelRecord"
  local building_id = string.gsub(ui_component:Id(), "CcoBuildingLevelRecord", "");
  local supply_balance_change = self.building_unit_bonus[building_id]
  if not supply_balance_change then return end;
  local dev_points = find_uicomponent(ui_component, "dev_points");
  if not dev_points then return end;
  dev_points:SetVisible(true);
  

  local dev_points_text = find_uicomponent(dev_points, "dy_num_points_required");
  supply_balance_change = math.min(supply_balance_change, self.max_balance_per_buildings)

  if supply_balance_change > 0 then
    supply_balance_change = "+"..supply_balance_change
  end

  dev_points_text:SetVisible(true);
  dev_points_text:SetText(tostring(supply_balance_change));
end;