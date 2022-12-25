--========================
-- Main Listeners start HERE
--========================
function Flexible_unit_caps:add_player_listeners()
core:add_listener(
  "fluc_FactionTurnStart",
  "FactionTurnStart",
  function(context)
    local faction = context:faction()
    return self:faction_has_supply_lines(faction)
  end,
  -- true,
  function(context)
    local faction = context:faction();
    self:log("======================");
    self:log("APPLY UPKEEP (TURN START)");
    self:apply_upkeep_penalty(faction);
    self:calculate_supply_balance(faction);
  end,
  true
);

core:add_listener(
  "fluc_FactionTurnEnd",
  "FactionTurnEnd",
  function(context)
    local faction = context:faction()
    return self:faction_has_supply_lines(faction)
  end,
  -- true,
  function(context)
    local faction = context:faction();
    self:log("======================");
    self:log("APPLY UPKEEP (TURN END)");
    self:apply_upkeep_penalty(faction);
  end,
  true
);

core:add_listener(
  "fluc_RaiseDead",
  "ComponentLClickUp",
  function(context)
    return (context.string == "button_raise_dead" and self:player_faction_has_suply_lines())

  end,
  function(_)
    local faction = cm:model():world():whose_turn_is_it()
    cm:callback(function()
      self:log("======================");
      self:log("APPLY UPKEEP (RAISE DEAD)");
      self:apply_upkeep_penalty(faction) 
    end, 0.1);
  end,
  true
);

core:add_listener(
  "fluc_Hire_Blessed",
  "ComponentLClickUp",
  function(context)
    return (context.string == "button_hire_blessed" and self:player_faction_has_suply_lines())
  end,
  function(_)
    local faction = cm:model():world():whose_turn_is_it()
    cm:callback(function()
      self:log("======================");
      self:log("APPLY UPKEEP (HIRE BLESSED)");
      self:apply_upkeep_penalty(faction) 
    end, 0.1);
  end,
  true
);

core:add_listener(
  "fluc_Hire_Imperial",
  "ComponentLClickUp",
  function(context)
    local faction = cm:model():world():whose_turn_is_it()
    return (UIComponent(context.component):Id() == "button_hire_imperial" and self:faction_has_supply_lines(faction))
  end,
  function(_)
    local faction = cm:model():world():whose_turn_is_it()
    cm:callback(function()
      self:log("======================");
      self:log("APPLY UPKEEP (HIRE IMPERIAL)");
      self:apply_upkeep_penalty(faction) 
    end, 0.1);
  end,
  true
);

core:add_listener(
  "fluc_Hire_Renown",
  "ComponentLClickUp",
  function(context)
    local faction = cm:model():world():whose_turn_is_it()
    return (UIComponent(context.component):Id() == "button_hire_renown" and self:faction_has_supply_lines(faction))
  end,
  function(_)
    local faction = cm:model():world():whose_turn_is_it()
    cm:callback(function()
      self:log("======================");
      self:log("APPLY UPKEEP (HIRE ROR)");
      self:apply_upkeep_penalty(faction) 
    end, 0.1);
  end,
  true
);

core:add_listener(
  "fluc_FactionJoinsConfederation",
  "FactionJoinsConfederation",
  function(context)
    local faction = context:confederation();
    return self:faction_has_supply_lines(faction)
  end,
  function(context)
    local faction = context:confederation();
    cm:callback(function()
      self:log("======================");
      self:log("APPLY UPKEEP (CONFEDERATION)");
      self:apply_upkeep_penalty(faction);
      self:calculate_supply_balance(faction)
    end, 0.1);
  end,
  true
);

core:add_listener(
  "fluc_player_army_created_listener",
  "MilitaryForceCreated",
  function(context)
    local faction = context:military_force_created():faction();
    return self:faction_has_supply_lines(faction)
  end,
  function(context)
    local faction = context:military_force_created():faction();
    cm:callback(function()
      self:log("======================");
      self:log("APPLY UPKEEP (NEW FORCE)");
      self:apply_upkeep_penalty(faction);
      self:calculate_supply_balance(faction);
      self:set_finance_button_tooltip(faction);
    end, 0.1);
  end,
  true
);


core:add_listener(
  "fluc_SETTLEMENT_CAPTURED",
  "RegionFactionChangeEvent",
  function(context)
    local faction = context:region():owning_faction();
    return (self:faction_has_supply_lines(faction))
  end,
  function(context)
    self:log("======================");
    self:log("SETTLEMENT CAPTURED")
    local faction = context:region():owning_faction();
    self:calculate_supply_balance(faction)
    self:set_finance_button_tooltip(faction);
  end,
  true
);

core:add_listener(
  "fluc_Agent_created",
  "CharacterCreated",
  function(context)
    local faction = context:character():faction();
    return (self:faction_has_supply_lines(faction))
  end,
  function(context)
    local character = context:character();
    if not cm:char_is_agent(character) then return end;

    self:log("======================");
    self:log("AGENT Recruted")
    local faction = context:character():faction();
    self:apply_upkeep_penalty(faction)
    self:set_finance_button_tooltip(faction);
  end,
  true
);

core:add_listener(
  "fluc_UNIT_DISBANDED",
  "UnitDisbanded",
  function(context)
    local faction = context:unit():faction()
    return (self:factionChecker(faction))
  end,
  function(context)
    if self.block_scripts then return end;
    local faction_name = context:unit():faction():name();
    self.block_scripts = faction_name;

    cm:callback(function()
      if not self.block_scripts then return end;
      local faction = cm:get_faction(self.block_scripts);

      if faction then

        self:log("======================");
        self:log("UNIT DISBANDED");
        self:apply_upkeep_penalty(faction);
        self:calculate_supply_balance(faction);
        self.block_scripts = false;
      end;
    end, 0.2);

  end,
  true
);


end;