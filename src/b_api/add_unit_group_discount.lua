function Flexible_caps_api:add_unit_group_discount(lord_key, unit_group, value)
  if (type(value) ~= "number" or value == nil) then
    self:log("ERROR: Third argument in add_unit_group_discount method should be a number")
    return;
  end;

  if (type(lord_key) ~= "string") then
    self:log("ERROR: First argument in add_unit_group_discount method should be a string")
    return;
  end;

  if (type(unit_group) ~= "string") then
    self:log("ERROR: Second argument in add_unit_group_discount method should be a string")
    return;
  end;

  if(Flexible_unit_caps.group_discount[lord_key]) then
    Flexible_unit_caps.group_discount[lord_key][unit_group] = value;
  else
    Flexible_unit_caps.group_discount[lord_key] = {[unit_group] = value}
  end;
end;