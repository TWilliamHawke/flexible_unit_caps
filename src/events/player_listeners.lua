--========================
-- Main Listeners start HERE
--========================
function Flexible_unit_caps:add_player_listeners()
  core:add_listener(
    "fluc_FactionTurnStart",
    "FactionTurnStart",
    function(context)
      local faction = context:faction()
      return faction:is_human()
    end,
    -- true,
    function(context)
      local faction_name = context:faction():name();
      cm:remove_callback(self.main_debounce_key..faction_name)
      self:reapply_supply_balance_effect(context:faction());

      cm:callback(function()
        self:log("======================");
        self:log("APPLY UPKEEP (TURN START)");
        local faction = cm:get_faction(faction_name)
        self:apply_upkeep_penalty(faction);
        self:set_tooltip_for_finance_button(faction);
      end, 0.2, self.main_debounce_key..faction_name);
    end,
    true
  );

  core:add_listener(
    "fluc_FactionTurnEnd",
    "FactionTurnEnd",
    function(context)
      local faction = context:faction()
      return faction:is_human()
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
    "fluc_UnitCreated",
    "UnitCreated",
    ---@param context UnitCreated
    ---@return boolean
    function(context)
      local faction = context:unit():faction();
      return faction:is_human()
    end,
    ---@param context UnitCreated
    function(context)
      local faction_name = context:unit():faction():name();
      cm:remove_callback(self.main_debounce_key..faction_name)

      cm:callback(function()
        self:log("======================");
        self:log("APPLY UPKEEP (Unit Created)");
        local faction = cm:get_faction(faction_name)
        self:set_tooltip_for_finance_button(faction)
        self:apply_upkeep_penalty(faction)
      end, 0.2, self.main_debounce_key..faction_name);
    end,
    true
  );

  core:add_listener(
    "fluc_FactionJoinsConfederation",
    "FactionJoinsConfederation",
    function(context)
      local faction = context:confederation();
      return faction:is_human()
    end,
    function(context)
      local faction = context:confederation();
      cm:callback(function()
        self:log("======================");
        self:log("APPLY UPKEEP (CONFEDERATION)");
        self:apply_upkeep_penalty(faction);
        self:reapply_supply_balance_effect(faction)
        self:set_tooltip_for_finance_button(faction)
      end, 0.1);
    end,
    true
  );

  core:add_listener(
    "fluc_player_army_created_listener",
    "MilitaryForceCreated",
    function(context)
      local faction = context:military_force_created():faction();
      return faction:is_human() and self:faction_has_supply_lines(faction)
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
      return faction:is_human() and self:faction_has_supply_lines(faction)
    end,
    function(context)
      local faction = context:region():owning_faction();

      cm:callback(function()
        self:log("======================");
        self:log("SETTLEMENT CAPTURED")
        self:reapply_supply_balance_effect(faction)
        self:set_tooltip_for_finance_button(faction);
      end, 0.5)
    end,
    true
  );

  core:add_listener(
    "fluc_Agent_created",
    "CharacterCreated",
    function(context)
      local faction = context:character():faction();
      return faction:is_human() and self:faction_has_supply_lines(faction)
    end,
    function(context)
      local character = context:character();
      if not cm:char_is_agent(character) then return end
      local faction = context:character():faction();

      self:log("======================");
      self:log("AGENT Recruted")
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
      local force = context:character():military_force();
      if not force then return end
      local faction = context:original_faction();
      if faction and faction:is_human() then return end
      self:log("Army loaned")
      local force_cqi = force:command_queue_index();

      if force:has_effect_bundle(self.loaned_army_effect) then
        ---@diagnostic disable-next-line: param-type-mismatch
        cm:remove_effect_bundle_from_force(self.loaned_army_effect, force_cqi);
      end

      ---@diagnostic disable-next-line: param-type-mismatch
      cm:apply_effect_bundle_to_force(self.loaned_army_effect, force_cqi, 10);
      self:log("Effect applied")
    end,
    true
  );

  core:add_listener(
    "fluc_UNIT_DISBANDED",
    "UnitDisbanded",
    function(context)
      local faction = context:unit():faction()
      return faction:is_human()
    end,
    function(context)
      local faction_name = context:unit():faction():name();

      cm:remove_callback(self.main_debounce_key..faction_name)

      cm:callback(function()
        local faction = cm:get_faction(faction_name);

        if faction then
          self:log("======================");
          self:log("UNIT DISBANDED");
          self:set_tooltip_for_finance_button(cm:get_local_faction(true));
          self:reapply_supply_balance_effect(faction);
          self:apply_upkeep_penalty(faction);
        end
      end, 0.2, self.main_debounce_key..faction_name);
    end,
    true
  );
end

