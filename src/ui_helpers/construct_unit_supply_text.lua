---@param unit_name string
---@param unit UNIT_SCRIPT_INTERFACE | nil
---@param unit_count_callback function
---@return string
function Flexible_unit_caps:construct_unit_supply_text(unit_name, unit, unit_count_callback)
  local lord_cost, basic_cost = self:get_unit_supply_params(unit_name, self.selected_character);
  local consume_text_key = unit == nil and "SRW_unit_consume_future" or "SRW_unit_consume_present";

  if (lord_cost == nil) then
    if(unit ~= nil) then
      lord_cost = self:get_unknown_unit_supply(unit);
    else
      lord_cost = self:get_unit_cost_from_key(unit_name);
    end;
    basic_cost = lord_cost;
  end;

  local unit_group = self:get_unit_caps_group(unit_name);
  local group_capacity = self:get_unit_max_capacity(unit_group, self.selected_character);
  local units_in_army, units_in_queue, unit_index = unit_count_callback(unit_group); ---@type number, number, number

  local unit_cost_with_cap = self:apply_unit_cap(lord_cost, unit_index, group_capacity);
  
  if(self:army_is_black_ark(self.selected_character:character_subtype_key())) then
    unit_cost_with_cap = self:apply_unit_cap(basic_cost, unit_index, group_capacity) - basic_cost;
    unit_cost_with_cap = math.max(unit_cost_with_cap, 0);
  end;

  local start_text_key = "SRW_unit_supply_cost_zero";
  if unit_cost_with_cap == 1 then
    start_text_key ="SRW_unit_supply_cost_one";
  elseif unit_cost_with_cap > 1 then
    start_text_key ="SRW_unit_supply_cost_many";
  end;

  local supply_text = self:get_localised_string(start_text_key);

  local function create_base_cost_text()
    local base_cost_text = self:get_localised_string("SRW_base_cost_text");
    return string.gsub(base_cost_text, "SRW_base_Cost", tostring(basic_cost));
  end;

  if lord_cost ~= unit_cost_with_cap then
    local unit_cap_text = self:get_localised_string("SRW_unit_cap_text");
    supply_text = self:form_yellow_line(supply_text.." "..unit_cap_text)..create_base_cost_text();
  elseif lord_cost ~= basic_cost then
    local lord_text = self:get_localised_string("SRW_lord_text");
    supply_text = self:form_yellow_line(supply_text.." "..lord_text)..create_base_cost_text();
  else
    supply_text = self:form_yellow_line(supply_text);
  end;

  supply_text = string.gsub(supply_text, "SRW_consume", self:get_localised_string(consume_text_key));

  --SECOND LINE
  local unit_group_text = self:get_localised_string("SRW_this_army")..self:get_localised_string(unit_group);

  if(units_in_queue > 0) then
    units_in_army = units_in_army.."(+"..units_in_queue..")";
  end;

  unit_group_text = unit_group_text..": ["..units_in_army.."/"..group_capacity.."]";

  return string.gsub(supply_text, "SRW_Cost", tostring(unit_cost_with_cap))..unit_group_text.."\n";
end;
