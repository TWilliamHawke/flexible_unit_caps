---@param lord CHARACTER_SCRIPT_INTERFACE
function Flexible_unit_caps:set_tooltip_for_army_upkeep(lord)
  local component = find_uicomponent(core:get_ui_root(), "units_panel", "dy_upkeep");
  if not component then return end

  local faction = lord:faction();
  local supply_balance = self:get_supply_balance(faction);
  local supply_penalty = self:get_supply_penalty(faction, supply_balance);
  local force = lord:military_force();

  local army_supply = self:get_army_supply(force, supply_penalty);
  local lord_name = lord:character_subtype_key();
  local char_list = force:character_list();

--TODO add queued units suppy
  for j = 0, char_list:num_items() - 1 do
    local char = char_list:item_at(j);

    if char:character_subtype_key() ~= lord_name then
      army_supply = army_supply + self:get_this_agent_supply(char);
    end
  end

  --construct tooltip
  local tooltip_text = self:get_localised_string("SRW_army_suply_cost");
  tooltip_text = string.gsub(tooltip_text, "SRW_Cost", tostring(army_supply));

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
    tooltip_text = tooltip_text .. self:get_localised_string("SRW_army_tooltip_explanation") .. units_list_text;
  end

  if is_uicomponent(component) then
    component:SetTooltipText(tooltip_text, true);
  end
end
