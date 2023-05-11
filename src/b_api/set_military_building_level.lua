function Flexible_caps_api:set_military_building_level(building_key, settlement_level)
  if (type(settlement_level) ~= "number" or settlement_level == nil) then
    self:handle_error("ERROR: Second argument in set_military_building_level method should be a number")
    return;
  end;

  if (settlement_level < 0) then
    self:handle_error("ERROR: Second argument in set_military_building_level method shouldn't be above a zero")
    return;
  end;

  if (type(building_key) ~= "string") then
    self:handle_error("ERROR: First argument in set_military_building_level method should be a string")
    return;
  end;

  Flexible_unit_caps.building_unit_bonus[building_key] = settlement_level;

end;