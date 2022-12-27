--========================
-- UI Listeners start HERE
--========================
function Flexible_unit_caps:add_ui_listeners()
  -- core:add_listener(
  --   "fluc_BuildingTooltip",
  --   "ComponentMouseOn",
  --   function()
  --     return cm.campaign_ui_manager:is_panel_open("settlement_panel") and (self.enable_supply_balance == true) and
  --         self:uiFactionChecker();
  --   end,
  --   function(context)
  --     self:logDebug("Hover the building icon");
  --     local component = UIComponent(context.component)
  --     self:set_building_tooltip(component)
  --   end,
  --   true
  -- )

  -- core:add_listener(
  --   "fluc_TreasuryTooltip",
  --   "ComponentLClickUp",
  --   true,
  --   function(context)

  --     --root > units_panel > main_units_panel > units > LandUnit 7
  --     local unitList = find_uicomponent(core:get_ui_root(), "units_panel", "main_units_panel", "units");

  --     --self:logDebug(uicomponent_to_str(component));
  --     for _, unit in uic_pairs(unitList) do
  --       self:logDebug(unit:Id());
  --       --self:finalize_unit_tooltip(unit, "fuck you", "\n");
  --       local handler = self:set_unit_in_army_tooltip();
  --       handler(unit);
  --     end
  --     local faction = cm:model():world():whose_turn_is_it()
  --     self:set_tooltip_text_treasury(faction, "button_finance")
  --   end,
  --   true
  -- )


  -- core:add_listener(
  --   "fluc_new_lord_tooltip",
  --   "ComponentMouseOn",
  --   function(context)
  --     local component = UIComponent(context.component):Id()
  --     --this is raise new lord button, not undead button
  --     return component == "button_raise" --and self.player_supply_custom_mult ~= 0 and self:uiFactionChecker();
  --   end,
  --   function(context)
  --     local component = UIComponent(context.component)
  --     self:logDebug("Component created");
  --     self:set_new_lord_tooltip(component)

  --   end,
  --   true
  -- );

  -- core:add_listener(
  --   "fluc_unit_card_click",
  --   "ComponentLClickUp",
  --   function()
  --     return not self.tooltip_not_finished --and cm.campaign_ui_manager:is_panel_open("units_panel") and self.player_supply_custom_mult ~= 0 and self:uiFactionChecker();
  --   end,
  --   function(context)
  --     local component = UIComponent(context.component)
  --     local component_id = component:Id();
  --     local handler;

  --     if string.find(component_id, "_recruitable") then
  --       handler = self:set_unit_tooltip("_recruitable");
  --     elseif string.find(component_id, "_mercenary") then
  --       handler = self:set_unit_tooltip("_mercenary");
  --     end;

  --     if handler then
  --       self.tooltip_not_finished = true;

  --       cm:callback(function()
  --         handler(component);
  --         component:SimulateMouseOn();
  --         self.tooltip_not_finished = false;
  --       end,
  --       0.15)
  --     end;
  --   end,
  --   true
  -- )



  -- core:add_listener(
  --   "fluc_UnitCardTooltip",
  --   "ComponentMouseOn",
  --   function()
  --     return not self.tooltip_not_finished and cm.campaign_ui_manager:is_panel_open("units_panel") and
  --         self.player_supply_custom_mult ~= 0 and self:uiFactionChecker()
  --   end,
  --   function(context)
  --     local component = UIComponent(context.component)
  --     local component_id = component:Id();
  --     local handler;

  --     if string.find(component_id, "QueuedLandUnit") then
  --       handler = self:set_queued_unit_tooltip();
  --     elseif string.find(component_id, "LandUnit") then
  --       handler = self:set_unit_in_army_tooltip();
  --     elseif string.find(component_id, "_recruitable") then
  --       handler = self:set_unit_tooltip("_recruitable");
  --     elseif string.find(component_id, "_mercenary") then
  --       handler = self:set_unit_tooltip("_mercenary");
  --     elseif string.find(component_id, "Agent ") then
  --       handler = self:set_agent_tooltip();
  --     end;

  --     if handler then
  --       self.tooltip_not_finished = true;
  --       handler(component);
  --       component:SimulateMouseOn();

  --       cm:callback(function()
  --         self.tooltip_not_finished = false;
  --       end, 0.1);
  --     end;

  --   end,
  --   true
  -- )

  -- core:add_listener(
  --   "fluc_test",
  --   "PanelOpenedCampaign",
  --   function(context)
  --     return true;
  --   end,
  --   function(context)
  --     self:logCore(context.string);
  --   end,
  --   true
  -- );

  -- core:add_listener(
  --   "fluc_test_1",
  --   "ComponentLClickUp",
  --   function(context)
  --     return true;
  --   end,
  --   function(context)
  --     self:logCore(uicomponent_to_str(UIComponent(context.component)));

  --   end,
  --   true
  -- );

  core:add_listener(
    "fluc_click_on_queued_unit",
    "ComponentLClickUp",
    function()
      return cm.campaign_ui_manager:is_panel_open("units_panel");
    end,
    function(context)
      if string.find(context.string, "QueuedLandUnit") then
        cm:remove_callback(self.ui_debounce_key)
        cm:callback(function()
          self:log("UNIT REMOVED FROM QUEUE")
          self:set_army_panel_tooltips();
        end, 0.2, self.ui_debounce_key);
      end
    end,
    true
  );

  core:add_listener(
    "fluc_change_allied_units",
    "ComponentLClickUp",
    function()
      return cm.campaign_ui_manager:is_panel_open("mercenary_recruitment");
    end,
    function(context)
      if string.find(context.string, "option") then
        cm:callback(function()
          self:log("ALLIES UNITS PANEL SWITCHED")
          self:set_army_panel_tooltips();
        end, 0.2);
      end
    end,
    true
  );

  core:add_listener(
    "fluc_add_unit_to_queue",
    "ComponentLClickUp",
    function()
      return cm.campaign_ui_manager:is_panel_open("recruitment_options");
    end,
    function(context)
      if not string.find(context.string, "_recruitable")
          and not string.find(context.string, "_mercenary") then
        return
      end

      cm:remove_callback(self.ui_debounce_key)
      cm:callback(function()
        self:log("UNIT ADDED TO QUEUE")
        self:set_army_panel_tooltips();
      end, 0.2, self.ui_debounce_key);
    end,
    true
  );

  core:add_listener(
    "fluc_building_browser_open",
    "PanelOpenedCampaign",
    function(context)
      return context.string == "building_browser";
    end,
    function()

      cm:callback(function()
        self:log("BUILDING BROWSER OPEN")
        local chain_list = "cyclic_chain_list" or "chain_list";
        --cm:faction_has_campaign_feature(faction:name(), "additional_army_upkeep")
        local building_categories = find_uicomponent(core:get_ui_root(), "building_browser", "category_list");
        for _, building_category in uic_pairs(building_categories) do
          local building_chain_list = find_uicomponent(building_category, "chain_list");

          if (building_chain_list) then

            for __, chain in uic_pairs(building_chain_list) do

              local building_list = find_uicomponent(chain, "slot_parent");
              for ___, building in uic_pairs(building_list) do
                self:replace_dev_points_text(building)
              end
            end --of second child loop
          end --of chain list check
        end --of first child loop
      end, 0.5)

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
        self:set_army_panel_tooltips();
      end, 0.2);

    end,
    true
  )

  core:add_listener(
    "fluc_any_panel_closed",
    "PanelClosedCampaign",
    function()
      return self:player_faction_has_suply_lines();
    end,
    function()
      cm:remove_callback(self.ui_debounce_key)
      self:log("any PANEL Closed")

      cm:callback(function()
        self:set_army_panel_tooltips();
        self:change_army_upkeep_tooltip();

      end, 0.5, self.ui_debounce_key);

    end,
    true
  )

  core:add_listener(
    "fluc_any_panel_closed",
    "PanelClosedCampaign",
    function(context)
      return context.string == "units_panel"
    end,
    function()
      self.selected_character = nil;

    end,
    true
  )


  core:add_listener(
    "fluc_Character_Selected",
    "CharacterSelected",
    function(context)
      return context:character():faction():is_human();
    end,
    function(context)
      self.selected_character = context:character();
      local faction = self.selected_character:faction()
      if not self:faction_has_supply_lines(faction) then return end
      self:log("ARMY SELECTED");

      cm:callback(function()
        self:set_finance_button_tooltip(faction)
        self:set_army_panel_tooltips();
        self:change_army_upkeep_tooltip();
      end, 0.2);

    end,
    true
  )

  -- core:add_listener(
  --   "fluc_UnitTooltip_lord_upkeep",
  --   "ComponentMouseOn",
  --   function(context)
  --     local component = UIComponent(context.component):Id()
  --     return component == "dy_upkeep" and self.player_supply_custom_mult ~= 0 and self:uiFactionChecker()
  --   end,
  --   function(context)
  --     local component = UIComponent(context.component)

  --     self:change_army_tooltip(component)
  --   end,
  --   true
  -- )

end
