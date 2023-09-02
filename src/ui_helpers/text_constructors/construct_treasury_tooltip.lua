---@diagnostic disable: redundant-parameter
---@param faction FACTION_SCRIPT_INTERFACE
---@return string tooltip_text
function Flexible_unit_caps:construct_treasury_tooltip(faction)
  self:logDebug("Constructor IS STARTED");

  local force_list = faction:military_force_list();
  local upkeep_percent, supply_points = self:get_player_faction_supply(faction);
  local supply_balance, balance_data = self:get_supply_balance(faction);
  local culture = faction:culture();

  local armies_count = 0

  for i = 0, force_list:num_items() - 1 do
    local force = force_list:item_at(i);

    if self:force_needs_supply(force, self.no_balance_lords) then
      armies_count = armies_count + 1;
    end
  end

  if armies_count > 1 then
    local upkeep_per_army = upkeep_percent / (armies_count - 1);
  ---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
    common.set_context_value("supply_lines_upkeep_value", upkeep_per_army)
  end

  local supply_text = self:get_localised_string("fluc_treasury_tooltip_supply")
  supply_text = string.gsub(supply_text, "FLUC_SUPPLY", tostring(supply_points))

  local supply_balance_text = ""

  local function create_supply_source_text(loc_key, value)
    return self:get_localised_string(loc_key) .. self:try_add_plus(value);
  end

  local function add_supply_source(text, loc_key, value)
    if value ~= 0 then
      return text .. create_supply_source_text(loc_key, value);
    else
      return text;
    end
  end

  if self:faction_has_supply_balance(faction) then
    supply_balance_text = self:get_localised_string("fluc_supply_balance_text");
    for key, value in pairs(balance_data) do
      supply_balance_text = add_supply_source(supply_balance_text, "fluc_supply_source_"..key, value);
    end
    supply_balance_text = supply_balance_text .. create_supply_source_text("fluc_supply_source_total", supply_balance);
  end

  local effect_key = self.special_effects[culture] and "rituals" or "upkeep";
  local main_text_key = "fluc_treasury_tooltip_main";
  if self.zero_cost_cultures[culture] or self:faction_has_army_cap(faction) then
    main_text_key = "fluc_treasury_tooltip_main_cap";
  end

  local tooltip_text = self:get_localised_string(main_text_key) ..
      supply_balance_text .. "\n" ..
      supply_text ..
      self:get_localised_string("fluc_treasury_tooltip_"..effect_key) ..
      tostring(upkeep_percent) .. "%";

  self:logDebug("-------------");
  self:logDebug("Constructor IS FINISHED");
  return tooltip_text
end
