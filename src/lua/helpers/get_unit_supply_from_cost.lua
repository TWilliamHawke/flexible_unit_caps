function Flexible_unit_caps:get_unit_supply_from_cost(unit_cost)
  local unit_supply = 0;
  
  if unit_cost >= 1800 then
    unit_supply = 4;
  elseif unit_cost >= 1400 then
    unit_supply = 3;
  elseif unit_cost >= 1000 then
    unit_supply = 2;
  elseif unit_cost >= 600 then
    unit_supply = 1;
  end;

  return unit_supply + self.basic_unit_supply;
end;