---@param unit_name string
---@param consume_text_key string
---@param unit_count_callback fun(unit_group: string) : number, number
---@param unit_cost_callback fun() : number, number
---@return string
function Flexible_unit_caps:construct_unit_supply_text(unit_name, consume_text_key, unit_count_callback, unit_cost_callback)

  local lord_cost, base_cost = unit_cost_callback();
  local unit_group, parent_unit_group = self:get_unit_group(unit_name);
  local unit_index, group_capacity = unit_count_callback(unit_group);

  local unit_cost_with_cap = self:apply_unit_cap(base_cost, lord_cost, unit_index, group_capacity);

  if parent_unit_group ~= "" then
    local unit_index_p, group_capacity_p = unit_count_callback(parent_unit_group);

    local unit_supply_p = self:apply_unit_cap(base_cost, lord_cost, unit_index_p, group_capacity_p);
    unit_cost_with_cap = math.max(unit_cost_with_cap, unit_supply_p)
  end


  local start_text_key = "SRW_unit_supply_cost_zero";
  if unit_cost_with_cap == 1 then
    start_text_key = "SRW_unit_supply_cost_one";
  elseif unit_cost_with_cap > 1 then
    start_text_key = "SRW_unit_supply_cost_many";
  end

  local supply_text = self:get_localised_string(start_text_key);

  local function create_base_cost_text()
    local base_cost_text = self:get_localised_string("SRW_base_cost_text");
    return string.gsub(base_cost_text, "SRW_base_Cost", tostring(base_cost));
  end

  if lord_cost ~= unit_cost_with_cap then
    local unit_cap_text = self:get_localised_string("SRW_unit_cap_text");
    supply_text = self:form_yellow_line(supply_text .. " " .. unit_cap_text) .. create_base_cost_text();
  elseif lord_cost ~= base_cost then
    local lord_text = self:get_localised_string("SRW_lord_text");
    supply_text = self:form_yellow_line(supply_text .. " " .. lord_text) .. create_base_cost_text();
  else
    supply_text = self:form_yellow_line(supply_text);
  end

  supply_text = string.gsub(supply_text, "SRW_consume", self:get_localised_string(consume_text_key));

  --SECOND LINE
  local unit_group_text = self:construct_unit_group_text(unit_group);

  if parent_unit_group ~= "" then
    unit_group_text = unit_group_text ..
        "\n" .. self:construct_unit_group_text(parent_unit_group);
  end

  return string.gsub(supply_text, "SRW_Cost", tostring(unit_cost_with_cap)) .. unit_group_text .. "\n";
end

--TODO replace all srw_ prefixes with fluc_
--BUG fix \n\n\n for new unit
