function Flexible_caps_api:set_unit_data(unit_key, unit_value, unit_group)
  if (type(unit_value) ~= "number" or unit_value == nil) then
    self:log("ERROR: Second argument in set_unit_data method should be a number")
    return;
  end;

  if (unit_value < 0) then
    self:log("ERROR: Second argument in set_unit_data method shouldn't be above a zero")
    return;
  end;

  if (type(unit_key) ~= "string") then
    self:log("ERROR: First argument in set_unit_data method should be a string")
    return;
  end;

  if(unit_group == nil or unit_group == "") then
    unit_group = "none";
  end;

  Flexible_unit_caps.units_data[unit_key] = {unit_value, unit_group}
end;