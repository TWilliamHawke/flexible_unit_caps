function Flexible_caps_api:set_unit_data(unit_key, unit_value, ...)
  if (type(unit_value) ~= "number" or unit_value == nil) then
    self:handle_error("ERROR: Second argument in set_unit_data method should be a number")
    return;
  end;

  if (unit_value < 0) then
    self:handle_error("ERROR: Second argument in set_unit_data method shouldn't be negative")
    return;
  end;

  if (type(unit_key) ~= "string") then
    self:handle_error("ERROR: First argument in set_unit_data method should be a string")
    return;
  end;

  local unit_data = { unit_value }

  if arg and #arg > 0 then
    for i = 1, #arg do
      table.insert(unit_data, arg[i])
    end
  else
    table.insert(unit_data, "none")
  end

  Flexible_unit_caps.units_data[unit_key] = unit_data;
end;