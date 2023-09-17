---@diagnostic disable: undefined-field
function Flexible_unit_caps:set_new_lord_text()
  local upkeep_alert = find_uicomponent(core:get_ui_root(), "character_panel", "general_selection_panel", "upkeep_alert");

  if not upkeep_alert then return end

  local line1 = find_uicomponent(upkeep_alert, "tx_line1")
  local line2 = find_uicomponent(upkeep_alert, "tx_line2")

  if not line1 or not line2 then return end

  local faction = cm:get_local_faction(true);
  if not self:faction_has_supply_lines(faction) then return end

  local supply_balance = self:get_supply_balance(faction)

  local force_list = faction:military_force_list();
  local current_army_count = self:get_armies_count(force_list, self.no_balance_lords)
  local future_army_count = current_army_count + 1
  local supply_decreasing = current_army_count

  local current_supply_penalty = 0
  if supply_balance < 0 then
    current_supply_penalty = self:calculate_supply_penalty(supply_balance * -1, current_army_count) * current_army_count
  end

  local negative_balance = supply_decreasing - supply_balance

  if negative_balance < 0 then
    negative_balance = 0
  end

  local cout_of_armies_with_penalty = self:get_armies_count(force_list) + 1

  local future_supply_penalty = self:calculate_supply_penalty(negative_balance, future_army_count) * cout_of_armies_with_penalty -
  current_supply_penalty
  self:logDebug("future supply penalty is " .. tostring(future_supply_penalty))

  if not self.enable_supply_balance then
    supply_decreasing = 0;
    future_supply_penalty = 0;
  end

  future_supply_penalty = future_supply_penalty + self.basic_lord_supply;

  local decreasing_text = self:get_localised_string("fluc_new_lord_decrease") ..
      supply_decreasing;

  local penalty_text = self:get_localised_string("fluc_new_lord_consumption")
  penalty_text = string.gsub(penalty_text, "FLUC_SUPPLY", tostring(future_supply_penalty))


  line1:SetText(decreasing_text)
  line2:SetText(penalty_text)
end
