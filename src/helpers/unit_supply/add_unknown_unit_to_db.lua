---@diagnostic disable: redundant-parameter
---@param unit_key string
function Flexible_unit_caps:add_unknown_unit_to_db(unit_key)
  if self.units_data[unit_key] then return end

  self:logCore("unknown unit: "..unit_key)
  local unit_data = cco("CcoMainUnitRecord", unit_key);
  local gold_cost = unit_data and unit_data:Call("Cost") or 700; ---@type number
  supply_cost = self:get_unit_supply_from_cost(gold_cost)

  self.units_data[unit_key] = { supply_cost, "fluc_unknown" }

  local unit_name = unit_data:Call("Name");
  if not unit_name or unit_name == "" then return end

  if string.find(unit_name, "(") and string.find(unit_name, "(") > 5 then
    unit_name = string.gsub(unit_name, "%s?%(.*", "");
  end

  local unit_cap = 10 - math.min(supply_cost, 3) * 2;
  self.units_data[unit_key][2] = unit_name;

  --is cavalry
  if common.get_context_value("CcoMainUnitRecord", unit_key, "UnitLandRecordContext.NumMounts") > 5 then
    table.insert(self.units_data[unit_key], "fluc_all_cavalry")
    unit_cap = math.min(unit_cap, 6);
  end

  --is missile
  if common.get_context_value("CcoMainUnitRecord", unit_key, "UnitLandRecordContext.CanSkirmish") then
    table.insert(self.units_data[unit_key], "fluc_all_missiles")
    unit_cap = math.min(unit_cap, 6);
  end

  --is artillery
  if common.get_context_value("CcoMainUnitRecord", unit_key, "UnitLandRecordContext.NumEngines") > 1 then
    table.insert(self.units_data[unit_key], "fluc_all_long_range")
    self.units_data[unit_key][1] = 3;
    unit_cap = math.min(unit_cap, 4);
  end

  --is ror
  if unit_data and unit_data:Call("IsRenown") then
    table.insert(self.units_data[unit_key], "fluc_all_ror")
    unit_cap = math.min(unit_cap, 1);
  end

  --is single entity
  if unit_data:Call("UsesHitpointsInCampaign") then
    table.insert(self.units_data[unit_key], "fluc_all_rare_creatures")
    unit_cap = math.min(unit_cap, 4);
  end

  self.unit_group_caps[unit_name] = { unit_cap, "" }

end
