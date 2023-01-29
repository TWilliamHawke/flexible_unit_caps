---@param units_holder UIC
---@param cache Supply_change_cache
---@return UnitsCache
function Flexible_unit_caps:create_queued_units_cache(units_holder, cache)
  if not units_holder then return {} end

  local units_group_data = self:create_units_cache(cache, function()
    local iteration_index = 0;
    local ui_component = find_uicomponent(units_holder, "QueuedLandUnit 0");

    return function()
      while ui_component do
        local component_name = ui_component:Id();
        local queued_unit_name = self:get_queued_unit_name(ui_component);
        iteration_index = iteration_index + 1;
        ui_component = find_uicomponent(units_holder, "QueuedLandUnit " .. iteration_index);

        return queued_unit_name, component_name;
      end
      return nil
    end
  end);

  return units_group_data;
end
