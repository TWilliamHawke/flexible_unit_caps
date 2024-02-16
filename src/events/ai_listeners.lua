---@diagnostic disable: undefined-field
function Flexible_unit_caps:add_ai_listeners()
  core:add_listener(
    "fluc_FactionTurnStart_ai",
    "FactionTurnStart",
    function(context)
      local faction = context:faction()
      return not faction:is_human() and
      faction:name() ~= "rebels" and self:faction_has_supply_lines(faction)
    end,
    function(context)
      local faction = context:faction();
      self:logAI("--------");
      self:logAI("CURRENT FACTION IS " .. tostring(faction:name()));
      self:apply_upkeep_penalty(faction);
      self:logDebug("CALCULATION SUPPLY FOR THIS fACTION IS FINISHED");

    end,
    true
  );

  core:add_listener(
    "fluc_Unit_caps_ai",
    "FactionTurnStart",
    ---@param context FactionTurnStart
    function(context)
      local faction = context:faction()
      return not faction:is_human() and faction:region_list():num_items() > 0 and
      faction:name() ~= "rebels" and self:faction_has_supply_lines(faction)
    end,
    -- true,
    function(context)
      local faction = context:faction()
      self:logAI("--------");
      self:logAI("TRY TO REPLACE UNITS FOR " .. tostring(faction:name()));
      self:replace_unit_caps_faction(faction);
      self:logDebug("REPLACEMENT HAS BEEN FINISHED");
    end,
    true
  );
end
