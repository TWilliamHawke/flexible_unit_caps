---@param lord CHARACTER_SCRIPT_INTERFACE
---@param supply_penalty integer
function Flexible_unit_caps:set_tooltip_for_army_upkeep(lord, supply_penalty, queued_units_supply)
  local force = lord:military_force();

  local army_supply, future_army_supply = self:get_army_supply(force, supply_penalty);
  local lord_name = lord:character_subtype_key();
  local char_list = force:character_list();
  future_army_supply = future_army_supply + queued_units_supply;

  for j = 0, char_list:num_items() - 1 do
    local char = char_list:item_at(j);

    if char:character_subtype_key() ~= lord_name then
      local agent_supply = self:get_this_agent_supply(char)
      army_supply = army_supply + agent_supply;
      future_army_supply = future_army_supply + agent_supply;
    end
  end

  --construct tooltip
  local tooltip_text = self:get_localised_string("fluc_army_suply_cost");
  tooltip_text = string.gsub(tooltip_text, "FLUC_SUPPLY", tostring(army_supply));

  local units_list_text = "";

  for group_key, data in pairs(self.supply_change_cache) do
    if type(data) == "table" and not data.isHidden and data.change ~= 0 then
      local value = data.change
      local groupText = self:get_localised_string(group_key);

      groupText = groupText == "" and group_key or groupText;
      units_list_text = units_list_text .. "\n[[col:yellow]]" .. groupText .. ":[[/col]] " .. self:try_add_plus(value);
    end
  end

  if units_list_text ~= "" then
    tooltip_text = tooltip_text .. self:get_localised_string("fluc_army_tooltip_explanation") .. units_list_text;
  end

  if future_army_supply > army_supply then
    local supply_change = self:try_add_plus(future_army_supply - army_supply)
    army_supply = tostring(army_supply).."("..supply_change..")";
  end

  self:create_supply_counter(tostring(army_supply), tooltip_text)
end
