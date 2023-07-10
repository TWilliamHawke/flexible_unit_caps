---@param unit_name string
---@param text_key string
---@param unit_count_callback fun(unit_group: string) : number, number
---@return string
---@return integer unit_cost_with_cap
function Flexible_unit_caps:construct_unit_supply_text(unit_name, text_key, unit_count_callback)

  local lord_cost, base_cost, unit_groups = self:get_unit_supply_params(unit_name, self.supply_change_cache);
  local full_unit_group_text = "";
  local unit_cost_with_cap = 0;

  for _, group in ipairs(unit_groups) do
    local unit_index, group_capacity = unit_count_callback(group);
    local unit_supply = self:apply_unit_cap(base_cost, lord_cost, unit_index, group_capacity);
    unit_cost_with_cap = math.max(unit_cost_with_cap, unit_supply)
    local unit_group_text = self:construct_unit_group_text(group, group_capacity);

    if full_unit_group_text == "" then
      full_unit_group_text = full_unit_group_text..unit_group_text;
    else
      full_unit_group_text = full_unit_group_text.."\n"..unit_group_text;
    end
  end

  local start_text_key = "fluc_unit_supply_cost_zero";
  if unit_cost_with_cap == 1 then
    start_text_key = "fluc_unit_supply_cost_one";
  elseif unit_cost_with_cap > 1 then
    start_text_key = "fluc_unit_supply_cost_many";
  end

  local supply_text = self:get_localised_string(start_text_key);

  local function create_base_cost_text()
    if not self.show_base_supply then return "" end
    local base_cost_text = self:get_localised_string("fluc_base_cost_text");
    return string.gsub(base_cost_text, "FLUC_SUPPLY", tostring(base_cost));
  end

  if lord_cost ~= unit_cost_with_cap then
    local unit_cap_text = self:get_localised_string("fluc_unit_cap_text");
    supply_text = self:form_yellow_line(supply_text .. " " .. unit_cap_text) .. create_base_cost_text();
  elseif lord_cost ~= base_cost then
    local lord_text = self:get_localised_string("fluc_lord_text");
    supply_text = self:form_yellow_line(supply_text .. " " .. lord_text) .. create_base_cost_text();
  else
    supply_text = self:form_yellow_line(supply_text);
  end

  supply_text = string.gsub(supply_text, "FLUC_CONSUME", self:get_localised_string(text_key));

  return string.gsub(supply_text, "FLUC_SUPPLY", tostring(unit_cost_with_cap)) .. full_unit_group_text, unit_cost_with_cap;
end
