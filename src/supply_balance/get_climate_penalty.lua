---@param region_key string
---@param faction FACTION_SCRIPT_INTERFACE
---@return integer
function Flexible_unit_caps:get_climate_penalty(region_key, faction)
  local region = cm:get_region(region_key)

  if not region or region:is_null_interface() then
    return 0;
  end

  local climate = region:settlement():get_climate();
  local sutability = faction:get_climate_suitability(climate);

  if sutability == "suitability_good" then
    return 0;
  elseif sutability == "suitability_poor" then
    return -1;
  else
    return -2;
  end
end;