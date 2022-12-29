---@param table table<string, number>
---@param field string
function Flexible_unit_caps:increment_value_in_table(table, field)
  local value = table[field];

  if value == nil then
    table[field] = 0
  else
    table[field] = value + 1;
  end

end;