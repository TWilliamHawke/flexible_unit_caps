function Flexible_unit_caps:construct_treasury_tooltip(faction)
  self:logDebug("Constructor IS STARTED");

  local culture = faction:subculture();
  local force_list = faction:military_force_list();
  local upkeep_percent, supply_points, supply_balance = self:get_player_faction_supply(faction);

  local armies_count = 0

  for i = 0, force_list:num_items() - 1 do
    local force = force_list:item_at(i);

    if self:check_army_type(force, false) then
      armies_count = armies_count + 1;
    end
  end

  if armies_count > 1 then
    local upkeep_per_army = upkeep_percent / (armies_count - 1);
    common.set_context_value("supply_lines_upkeep_value", upkeep_per_army)
  end

  local supply_text = self:get_localised_string("SRW_treasury_tooltip_supply")
  supply_text = string.gsub(supply_text, "SRW_supply", tostring(supply_points))

  local supply_balance_text = ""

  if self.enable_supply_balance and not (culture == "wh_dlc05_sc_wef_wood_elves") then
    supply_balance_text = self:get_localised_string("SRW_supply_balance_text") .. supply_balance
  end

  local tooltip_text = self:get_localised_string("SRW_treasury_tooltip_main") ..
      supply_text ..
      self:get_localised_string("SRW_treasury_tooltip_upkeep") .. tostring(upkeep_percent) .. "%" .. supply_balance_text

  self:logDebug("-------------");
  self:logDebug("Constructor IS FINISHED");
  return tooltip_text
end
