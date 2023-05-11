--========================
-- UI Listeners start HERE
--========================
function Flexible_unit_caps:add_ui_listeners()
  core:add_listener(
    "fluc_click_on_queued_unit",
    "ComponentLClickUp",
    function()
      return cm:get_campaign_ui_manager():is_panel_open("units_panel");
    end,
    function(context)
      if string.find(context.string, "QueuedLandUnit") then
        cm:remove_callback(self.ui_debounce_key)
        cm:callback(function()
          if not self:player_faction_has_suply_lines() then return end

          self:log("UNIT REMOVED FROM QUEUE")
          local character = self:get_character_from_unit_panel();
          if character and character:has_military_force() then
            self:set_all_army_panel_tooltips(character);
          end
        end, 0.2, self.ui_debounce_key);
      end
    end,
    true
  );

  core:add_listener(
    "fluc_change_allied_units",
    "ComponentLClickUp",
    function()
      return cm:get_campaign_ui_manager():is_panel_open("mercenary_recruitment");
    end,
    function(context)
      if not string.find(context.string, "option") then return end

      cm:callback(function()
        if not self:player_faction_has_suply_lines() then return end

        self:log("ALLIES UNITS PANEL SWITCHED")
        local character = self:get_character_from_unit_panel();
        if character and character:has_military_force() then
          self:set_all_army_panel_tooltips(character);
        end
      end, 0.2);
    end,
    true
  );

  core:add_listener(
    "fluc_add_unit_to_queue",
    "ComponentLClickUp",
    function()
      return cm:get_campaign_ui_manager():is_panel_open("recruitment_options");
    end,
    ---@param context any
    function(context)
      if not string.find(context.string, "_recruitable")
          and not string.find(context.string, "_mercenary") then
        return
      end

      cm:remove_callback(self.ui_debounce_key)
      cm:callback(function()
        if not self:player_faction_has_suply_lines() then return end

        self:log("UNIT ADDED TO QUEUE")
        local character = self:get_character_from_unit_panel();
        if character and character:has_military_force() then
          self:set_all_army_panel_tooltips(character);
        end
      end, 0.2, self.ui_debounce_key);
    end,
    true
  );

  core:add_listener(
    "fluc_building_browser_open",
    "PanelOpenedCampaign",
    function(context)
      return self.enable_supply_balance and context.string == "building_browser";
    end,
    function()
      local ok, err = pcall(function()
        self:add_info_to_building_browser();
      end);

      if not ok then
        self:logCore(tostring(err));
      end
    end,
    true
  )
  core:add_listener(
    "fluc_SettlementSelected_browser",
    "SettlementSelected",
    function(context)
      return self.enable_supply_balance and cm:get_campaign_ui_manager():is_panel_open("building_browser");
    end,
    function()
      self:add_info_to_building_browser();
    end,
    true
  )
  core:add_listener(
    "fluc_recruitment_options_open",
    "PanelOpenedCampaign",
    function(context)
      return context.string == "recruitment_options";
    end,
    function()
      cm:callback(function()
        self:log("RECRUITMENT PANEL OPEN")
        local character = self:get_character_from_unit_panel();
        if character and character:has_military_force() then
          self:set_all_army_panel_tooltips(character);
        end
      end, 0.2);
    end,
    true
  )

  core:add_listener(
    "fluc_character_panel_open",
    "PanelOpenedCampaign",
    function(context)
      return context.string == "character_panel";
    end,
    function()
      local lord_list = find_uicomponent(core:get_ui_root(), "character_panel", "lord_parent", "list_box");

      self:apply_callback_to_children(lord_list, function(component)
        local id = component:Id();

        if type(id) == "string" and id:len() > 0 then
          self.character_panel_lords[id] = true
        end
      end)

      cm:callback(function()
        self:set_new_lord_text()
      end, 0.2);
    end,
    true
  )

  core:add_listener(
    "fluc_character_panel_updated",
    "ComponentLClickUp",
    function(context)
      if not cm:get_campaign_ui_manager():is_panel_open("character_panel") then
        return false
      end

      local is_lord = self.character_panel_lords[context.string]
      return is_lord or context.string == "button_create_army" or string.find(context.string, "general_candidate_")
    end,
    ---@param context any
    function(context)
      cm:callback(function()
        self:set_new_lord_text()
      end, 0.2);
    end,
    true
  );

  core:add_listener(
    "fluc_character_panel_clicked",
    "ComponentLClickUp",
    function(context)
      local is_lord_button = context.string == "button_create_army"
      return is_lord_button and cm:get_campaign_ui_manager():is_panel_open("character_panel");
    end,
    ---@param context any
    function(context)
      cm:callback(function()
        self:set_new_lord_text();

        local lord_list = find_uicomponent(core:get_ui_root(), "character_panel", "lord_parent", "list_box");

        self:apply_callback_to_children(lord_list, function(component)
          local id = component:Id();

          if type(id) == "string" and id:len() > 0 then
            self.character_panel_lords[id] = true
          end
        end)
      end, 0.2);
    end,
    true
  );


  core:add_listener(
    "fluc_any_panel_closed",
    "PanelClosedCampaign",
    function()
      return self:player_faction_has_suply_lines();
    end,
    function()
      cm:remove_callback(self.ui_debounce_key)

      cm:callback(function()
        local character = self:get_character_from_unit_panel();
        if character and character:has_military_force() then
          self:set_all_army_panel_tooltips(character);
        end
      end, 0.5, self.ui_debounce_key);
    end,
    true
  )

  core:add_listener(
    "fluc_Character_Selected",
    "CharacterSelected",
    ---@param context CharacterSelected
    ---@return boolean
    function(context)
      return context:character():faction():is_human();
    end,
    ---@param context CharacterSelected
    function(context)
      local faction = context:character():faction()
      if not self:faction_has_supply_lines(faction) then return end

      cm:callback(function()
        local character = self:get_character_from_unit_panel();
        if not character then return end
        ;
        if character:has_military_force() then
          self:log("ARMY SELECTED");
          self:set_tooltip_for_finance_button(faction);
          self:set_all_army_panel_tooltips(character);
        else
          self:log("Agent SELECTED");
          local agentCard = find_uicomponent(core:get_ui_root(), "units_panel", "main_units_panel", "units",
          "AgentUnit 0");
          if not agentCard then return end
          self:set_agent_tooltip(agentCard, character);
        end
      end, 0.2);
    end,
    true
  )

  core:add_listener(
    "fluc_UnitUpgraded",
    "UnitUpgraded",
    function(context)
      return context:unit():faction():is_human();
    end,
    function(context)
      local faction = context:unit():faction()
      if not self:faction_has_supply_lines(faction) then return end
      cm:remove_callback(self.ui_debounce_key)

      cm:callback(function()
        self:log("Unit upgraded");
        self:set_tooltip_for_finance_button(faction)
        local character = self:get_character_from_unit_panel();
        if character and character:has_military_force() then
          self:set_all_army_panel_tooltips(character);
        end
      end, 0.2, self.ui_debounce_key);
    end,
    true
  )
end
