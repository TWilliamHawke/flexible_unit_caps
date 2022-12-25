function Flexible_caps_api:add_garrison_building(building_key)

  if (type(building_key) ~= "string") then
    self:log("ERROR: Argument in \"add_garrison_building\" method should be a string")
    return;
  end;


  Flexible_unit_caps.building_unit_bonus[building_key] = -1;
end;