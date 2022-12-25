function Flexible_unit_caps:add_ai_listeners()
  core:add_listener(
  "fluc_FactionTurnStart_ai",
  "FactionTurnStart",
  function(context)
    local faction = context:faction()
    return not faction:is_human() and not self:faction_is_horde(faction) and not (faction:culture() == "wh2_dlc09_tmb_tomb_kings")
  end,  
  -- true,
  function(context) 
    local faction = context:faction();
    self:logAI("--------");
    self:logAI("CURRENT FACTION IS "..tostring(faction:name()));
    self:apply_upkeep_penalty(faction);
    self:logDebug("CALCULATION SUPPLY FOR THIS fACTION IS FINISHED");

  end,
  true
  );

  core:add_listener(
  "fluc_Unit_caps_ai",
  "FactionTurnStart",
  function(context)
    local faction = context:faction();
    local culture = faction:culture();
    return faction:region_list():num_items() > 0 and not faction:is_human() and not self:faction_is_horde(faction) and culture ~= "wh2_dlc09_tmb_tomb_kings" and culture ~= "wh2_main_rogue";
  end,
  -- true,
  function(context) 
    local faction = context:faction()
    self:logAI("--------");
    self:logAI("TRY TO REPLACE UNITS FOR "..tostring(faction:name()));
    self:replace_unit_caps_faction(faction);
    self:logDebug("REPLACEMENT HAS BEEN FINISHED");
  end,
  true
  );
end;

