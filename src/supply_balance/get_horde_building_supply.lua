---@param force MILITARY_FORCE_SCRIPT_INTERFACE
function Flexible_unit_caps:get_horde_building_supply(force)
  local cqi = force:general_character():command_queue_index();
  local list_query = "MilitaryForceContext.HordeContext.BuildingSlotList";

  --local building_count = common.call_context_command("CcoCampaignMilitaryForce", cqi, "HordeContext.BuildingSlotList.Size")
  local building_count = common.get_context_value("CcoCampaignCharacter", tostring(cqi), list_query..".Size") or 0;
  
  for i = 0, building_count - 1 do
    local building_key = common.get_context_value("CcoCampaignCharacter", tostring(cqi), list_query..".At("..i..").BuildingContext.BuildingLevelRecordContext.Key")
    self:logCore(building_key);
  end
end