function Flexible_unit_caps:change_army_tooltip()
  local component = find_uicomponent(core:get_ui_root(), "units_panel", "dy_upkeep");
  
  if not component then return end;
  if not self.selected_character then return end;
  if not self.selected_character:has_military_force() then return end;

  local faction = self.selected_character:faction();
  local supply_balance = self:get_supply_balance(faction);
  local supply_penalty = self:get_supply_penalty(faction, supply_balance);
  local force = self.selected_character:military_force();

  local army_supply = self:get_army_supply(force, supply_penalty);
  local lord_name = self.selected_character:character_subtype_key();
  local lord_alias = self.lord_aliases[lord_name] or "empty";
  local char_list = force:character_list();
  local army_discounts = {};
  local skills_discounts = {};
  
  for j = 0, char_list:num_items() - 1 do
    local char = char_list:item_at(j);

    if (char:character_subtype_key() ~= lord_name) then
      army_supply = army_supply + self:get_this_agent_supply(char);
    end;
  end;

  if (self.group_discount[lord_name]) then
    for key, value in pairs(self.group_discount[lord_name]) do
      local group_key = self.army_upkeep_tooltip_overwriting[lord_name] and self.army_upkeep_tooltip_overwriting[lord_name][key] or key;
      army_discounts[group_key] = value;
    end; --of loop
  end;

  if (self.lord_skills_discount[lord_alias]) then
    for key, value in pairs(self.lord_skills_discount[lord_alias]) do
      local skill1 = value[2] or "empty";
      local skill2 = value[3] or "empty";

      if (self.selected_character:has_skill(skill1) or self.selected_character:has_skill(skill2)) then
        local group_key = self.army_upkeep_tooltip_overwriting[lord_name] and self.army_upkeep_tooltip_overwriting[lord_name][key] or key;
        skills_discounts[group_key] = value[1];
      end;
    end; --of loop
  end;

  --concat tables
  for key, value in pairs(skills_discounts) do
    if (army_discounts[key] == nil) then
      army_discounts[key] = value;
    else
      army_discounts[key] = army_discounts[key] + value;
    end;
  end;

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
    end;
  end;

  if units_list_text ~= "" then
    tooltip_text = tooltip_text .. self:get_localised_string("SRW_army_tooltip_explanation") .. units_list_text;
  end;

  if is_uicomponent(component) then
    component:SetTooltipText(tooltip_text, true);
  end;
end;
