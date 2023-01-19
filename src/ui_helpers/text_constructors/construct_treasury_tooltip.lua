---@param faction FACTION_SCRIPT_INTERFACE
---@return string
function Flexible_unit_caps:construct_treasury_tooltip(faction)
  self:logDebug("Constructor IS STARTED");

  local culture = faction:subculture();
  local force_list = faction:military_force_list();
  local upkeep_percent, supply_points = self:get_player_faction_supply(faction);
  local supply_balance, region_supply, buildings_supply, ogre_camps_supply, army_supply, garrisons_supply = self:
      get_supply_balance(faction)

  local armies_count = 0

  for i = 0, force_list:num_items() - 1 do
    local force = force_list:item_at(i);

    if self:force_needs_supply(force, self.no_balance_lords) then
      armies_count = armies_count + 1;
    end
  end

  if armies_count > 1 then
    local upkeep_per_army = upkeep_percent / (armies_count - 1);
    ---@diagnostic disable-next-line: redundant-parameter
    common.set_context_value("supply_lines_upkeep_value", upkeep_per_army)
  end

  local supply_text = self:get_localised_string("SRW_treasury_tooltip_supply")
  supply_text = string.gsub(supply_text, "SRW_supply", tostring(supply_points))

  local supply_balance_text = ""

  local function add_supply_source(text, loc_key, value, is_final_string)
    if value ~= 0 or is_final_string then
      return text .. self:get_localised_string(loc_key) .. self:try_add_plus(value);
    else
      return text;
    end
  end

  if self.enable_supply_balance and not (culture == "wh_dlc05_sc_wef_wood_elves") then
    supply_balance_text = self:get_localised_string("SRW_supply_balance_text");
    supply_balance_text = add_supply_source(supply_balance_text, "fluc_supply_source_settlements", region_supply);
    supply_balance_text = add_supply_source(supply_balance_text, "fluc_supply_source_military", buildings_supply);
    supply_balance_text = add_supply_source(supply_balance_text, "fluc_supply_source_garrisons", garrisons_supply);
    supply_balance_text = add_supply_source(supply_balance_text, "fluc_supply_source_forces", army_supply);
    supply_balance_text = add_supply_source(supply_balance_text, "fluc_supply_source_camps", ogre_camps_supply);
    supply_balance_text = add_supply_source(supply_balance_text, "fluc_supply_source_total", supply_balance, true);
  end

  local tooltip_text = self:get_localised_string("SRW_treasury_tooltip_main") ..
      "\n" .. supply_balance_text .. "\n" ..
      supply_text ..
      self:get_localised_string("SRW_treasury_tooltip_upkeep") .. tostring(upkeep_percent) .. "%";

  self:logDebug("-------------");
  self:logDebug("Constructor IS FINISHED");
  return tooltip_text
end

--BUG remove \n\n\n for wood elves
