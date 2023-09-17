--========================
-- UI Listeners start HERE
--========================
function Flexible_unit_caps:add_ui_listeners()
  cm:add_post_first_tick_callback(function()
    local faction = cm:get_local_faction(true);
    Flexible_unit_caps:set_tooltip_for_finance_button(faction);
  end)

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
      self:add_info_to_building_browser();
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
    "fluc_hire_lord_open",
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
    "fluc_hire_lord_panel_updated",
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
      return true;
    end,
    function()
      cm:remove_callback(self.ui_debounce_key)

      cm:callback(function()
        local character = self:get_character_from_unit_panel();
        if not character then return end

        if character:has_military_force() then
          self:log("PanelClosed");
          local force = character:military_force();
          if self:force_needs_supply(force) then
            self:set_all_army_panel_tooltips(character);
            self:set_tooltip_for_finance_button(cm:get_local_faction(true));
          else
            self:hide_supply_counter()
          end
        else
          local tooltip_text, agent_supply = self:construct_agent_tooltip(character);
          self:create_supply_counter(tostring(agent_supply), tooltip_text)
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
      cm:callback(function()
        local character = self:get_character_from_unit_panel();
        if not character then return end

        if character:has_military_force() then
          self:log("ARMY SELECTED");
          local force = character:military_force();
          if self:force_needs_supply(force) then
            self:set_all_army_panel_tooltips(character);
            self:set_tooltip_for_finance_button(force:faction());
          else
            self:hide_supply_counter()
          end
        else
          self:log("Agent SELECTED");
          local tooltip_text, agent_supply = self:construct_agent_tooltip(character);
          self:create_supply_counter(tostring(agent_supply), tooltip_text)
        end
      end, 0.2);
    end,
    true
  )

  core:add_listener(
    "fluc_ai_Character_Selected",
    "CharacterSelected",
    ---@param context CharacterSelected
    ---@return boolean
    function(context)
      return not context:character():faction():is_human();
    end,
    function()
      self:hide_supply_counter()
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
