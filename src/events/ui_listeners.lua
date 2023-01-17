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
          self:log("UNIT REMOVED FROM QUEUE")
          self:set_all_army_panel_tooltips();
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
      if string.find(context.string, "option") then
        cm:callback(function()
          self:log("ALLIES UNITS PANEL SWITCHED")
          self:set_all_army_panel_tooltips();
        end, 0.2);
      end
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
        self:set_all_army_panel_tooltips();
      end, 0.2, self.ui_debounce_key);
    end,
    true
  );

  --TODO add construction menu event
  core:add_listener(
    "fluc_building_browser_open",
    "PanelOpenedCampaign",
    function(context)
      return context.string == "building_browser";
    end,
    function()
      local player_culture = cm:get_local_faction_culture();
      local chain_list_key = player_culture == "wh3_main_nur_nurgle" and "cyclic_chain_list" or "chain_list"

      cm:callback(function()
        local climate_penalty = 0;
        local superchains = find_uicomponent(core:get_ui_root(), "building_browser", "building_superchains")

        if superchains then
          local region_key = superchains:GetContextObjectId("CcoCampaignSettlement")
          climate_penalty = self:get_climate_penalty(region_key, cm:get_local_faction())
        end

        local building_categories = find_uicomponent(core:get_ui_root(), "building_browser", "category_list");

        for _, building_category in uic_pairs(building_categories) do
          local building_chain_list = find_uicomponent(building_category, chain_list_key);
          if building_chain_list then

            for _, chain in uic_pairs(building_chain_list) do
              local building_list = find_uicomponent(chain, "slot_parent");

              for _, building in uic_pairs(building_list) do
                self:replace_dev_points_text(building, climate_penalty);
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
        self:set_all_army_panel_tooltips();
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
    function(context)
      cm:remove_callback(self.ui_debounce_key)

      cm:callback(function()
        self:set_all_army_panel_tooltips();
        self:set_tooltip_for_army_upkeep();

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
    "fluc_non_player_Character_Selected",
    "CharacterSelected",
    ---@param context CharacterSelected
    ---@return boolean
    function(context)
      return not context:character():faction():is_human();
    end,
    function()
      self.selected_character = nil;
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
      self.selected_character = context:character();
      local faction = self.selected_character:faction()
      if not self:faction_has_supply_lines(faction) then return end
      self:log("ARMY SELECTED");

      cm:callback(function()
        self:set_tooltip_for_finance_button(faction)
        self:set_all_army_panel_tooltips();
        self:set_tooltip_for_army_upkeep();
      end, 0.2);

    end,
    true
  )
  core:add_listener(
    "fluc_Character_Selected",
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
        self:set_all_army_panel_tooltips();
        self:set_tooltip_for_army_upkeep();
      end, 0.2, self.ui_debounce_key);

    end,
    true
  )



end

--TODO add new lord button tooltip