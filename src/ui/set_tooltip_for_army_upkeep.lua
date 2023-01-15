function Flexible_unit_caps:set_tooltip_for_army_upkeep()
  local component = find_uicomponent(core:get_ui_root(), "units_panel", "dy_upkeep");

  if not cm then return end
  local ui_manager = cm:get_campaign_ui_manager();
  if not ui_manager then return end
  if not ui_manager:is_panel_open("units_panel") then return end
  if not component then return end
  if not self.selected_character then return end
  if self.selected_character:is_null_interface() then return end
  if not self.selected_character:has_military_force() then return end
  if not self.selected_character:faction():is_human() then return end

  local faction = self.selected_character:faction();
  local supply_balance = self:get_supply_balance(faction);
  local supply_penalty = self:get_supply_penalty(faction, supply_balance);
  local force = self.selected_character:military_force();

  local army_supply = self:get_army_supply(force, supply_penalty);
  local lord_name = self.selected_character:character_subtype_key();
  local lord_alias = self.lord_aliases[lord_name] or "empty";
  local char_list = force:character_list();
  local army_discounts = {}; ---@type table<string, integer>
  local skills_discounts = {}; ---@type table<string, integer>

--TODO add queued units suppy
  for j = 0, char_list:num_items() - 1 do
    local char = char_list:item_at(j);

    if char:character_subtype_key() ~= lord_name then
      army_supply = army_supply + self:get_this_agent_supply(char);
    end
  end

  if self.lord_supply_change[lord_name] then
    for key, data in pairs(self.lord_supply_change[lord_name]) do
      if not data.hidden and data.change then
        army_discounts[key] = data.change;
      end
    end --of loop
  end

  if self.skill_supply_change[lord_alias] then
    for key, value in pairs(self.skill_supply_change[lord_alias]) do
      local is_hidden = value[2];

      if not is_hidden then
        local skill1 = value[3] or "empty";
        local skill2 = value[4] or "empty";

        if (self.selected_character:has_skill(skill1) or self.selected_character:has_skill(skill2)) then
          skills_discounts[key] = value[1];
        end
      end
    end --of loop
  end

  --concat tables
  for key, value in pairs(skills_discounts) do
    if (army_discounts[key] == nil) then
      army_discounts[key] = value;
    else
      army_discounts[key] = army_discounts[key] + value;
    end
  end

  --construct tooltip
  local tooltip_text = self:get_localised_string("SRW_army_suply_cost");
  tooltip_text = string.gsub(tooltip_text, "SRW_Cost", tostring(army_supply));

  local units_list_text = "";

  for group_key, value in pairs(army_discounts) do
    if group_key ~= "" and value ~= 0 then
      ----value > 0 ? "+1" : "-1"
      local valueText = value > 0 and "+" .. tostring(value) or tostring(value);
      local groupText = self:get_localised_string(group_key);
      --its like a ||= b
      groupText = groupText == "" and group_key:sub(4, -1) or groupText;
      units_list_text = units_list_text .. "\n[[col:yellow]]" .. groupText .. ":[[/col]] " .. valueText;
    end
  end

  if units_list_text ~= "" then
    tooltip_text = tooltip_text .. self:get_localised_string("SRW_army_tooltip_explanation") .. units_list_text;
  end

  if is_uicomponent(component) then
    ---@diagnostic disable-next-line: missing-parameter, param-type-mismatch
    component:SetTooltipText(tooltip_text, true);
  end
end
