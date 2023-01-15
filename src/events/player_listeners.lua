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
      self:reapply_supply_balance_effect(faction);
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
        self:reapply_supply_balance_effect(faction)
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
        self:reapply_supply_balance_effect(faction);
        self:set_tooltip_for_finance_button(faction);
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
      self:reapply_supply_balance_effect(faction)
      self:set_tooltip_for_finance_button(faction);
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
      if not cm:char_is_agent(character) then return end

      self:log("======================");
      self:log("AGENT Recruted")
      local faction = context:character():faction();
      self:apply_upkeep_penalty(faction)
      self:set_tooltip_for_finance_button(faction);
    end,
    true
  );

  core:add_listener(
    "fluc_OgreCampCreated",
    "SpawnableForceCreatedEvent",
    function()
      return true;
    end,
    function(context)
      local character = context:parent_character()
      if character:is_null_interface() then return end
      local faction = character:faction()
      if faction:is_null_interface() then return end

      if faction:is_human() and faction:culture() == "wh3_main_ogr_ogre_kingdoms" then
        self:reapply_supply_balance_effect(faction)
        self:set_tooltip_for_finance_button(faction);

      end
    end,
    true
  );

  core:add_listener(
    "fluc_army_loaned",
    "CharacterLoanedEvent",
    function()
      return true;
    end,
    ---@param context CharacterLoanedEvent | CharacterEvent
    function(context)
      self:log("Army loaned")
      local force = context:character():military_force();
      if not force then return end;
      local faction = context:original_faction();
      if faction and faction:is_human() then return end

      if force:has_effect_bundle(self.loaned_army_effect) then return end;

      local force_cqi = force:command_queue_index();

      cm:apply_effect_bundle_to_force(self.loaned_army_effect, force_cqi, 0);
      self:log("Effect applied")
    end,
    true
  );

  core:add_listener(
    "fluc_UNIT_DISBANDED",
    "UnitDisbanded",
    function(context)
      local faction = context:unit():faction()
      return self:faction_has_supply_lines(faction)
    end,
    function(context)
      local faction_name = context:unit():faction():name();

      if context:unit():has_unit_commander() then
        self.selected_character = nil;
      end

      cm:remove_callback(self.disband_debounce_key)

      cm:callback(function()
        local faction = cm:get_faction(faction_name);

        if faction then

          self:log("======================");
          self:log("UNIT DISBANDED");
          self:apply_upkeep_penalty(faction);
          self:reapply_supply_balance_effect(faction);
        end
      end, 0.2, self.disband_debounce_key);

    end,
    true
  );


end

--TODO replace click event with unit recruitment debounce
