---@param component UIC
---@param lord CHARACTER_SCRIPT_INTERFACE
function Flexible_unit_caps:set_tooltip_for_unit_in_army(component, lord)
  local waagh_marker = find_uicomponent(component, "waaagh_unit_marker")
  if waagh_marker and waagh_marker:Visible() then
    local supply_text = self:get_localised_string("SRW_unit_supply_cost_zero");
    self:finalize_unit_tooltip(component, self:form_yellow_line(supply_text), "||")
    return;
  end

  local component_name = component:Id()
  local unit_number = component_name:match("(%d+)")
  if unit_number == "0" then return end

  local force = lord:military_force();
  local unit_list = force:unit_list()

  --we need unit from selected army
  local index = tonumber(unit_number) + self:get_num_of_agents_in_army(unit_list)
  if (index >= unit_list:num_items()) then return end

  local unit = unit_list:item_at(index);
  if not unit then return end

  local unit_name = unit:unit_key();

  local supply_text = self:construct_unit_supply_text(unit_name, "SRW_unit_consume_present",
    function(unit_group)
      local _, unit_index = self:get_units_count_from_cache(
        self.selected_force_units_cache, unit_group, tostring(index));
      local group_capacity = self:get_unit_cap_from_cache(self.selected_force_units_cache, unit_group);

      return unit_index, group_capacity;
    end,
    function()
      local base_supply, lord_supply = self:get_unit_supply_params_from_unit(unit, self.supply_change_cache);
      if self:force_is_black_ark_or_camp(force) then
        lord_supply = 0;
      end
      return base_supply, lord_supply;
    end);

  self:finalize_unit_tooltip(component, supply_text, "||")
end
