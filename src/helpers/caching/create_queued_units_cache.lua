---@param units_holder UIC
---@return UnitsCache<Queued_units_props>
function Flexible_unit_caps:create_queued_units_cache(units_holder)
  local cache = {}; ---@type UnitsCache<Queued_units_props>
  if not units_holder then return cache end

  ---@param unit_group string
  ---@param component_name string
  local function add_unit_group_to_cache(unit_group, component_name)
    if not cache[unit_group] then
      cache[unit_group] = { count = 0 };
    end

    local count = cache[unit_group].count + 1;
    cache[unit_group][component_name] = count;
    cache[unit_group].count = count;
  end;

  local function iterate_through_queue(prefix)
    local iteration_index = 0;
    local ui_component = find_uicomponent(units_holder, prefix .. "0");

    while (ui_component) do
      local component_name = ui_component:Id();
      local queued_unit_name = self:get_queued_unit_name(ui_component);
      local queued_unit_group, parent_group = self:get_unit_group(queued_unit_name);

      add_unit_group_to_cache(queued_unit_group, component_name);

      if parent_group ~= "" then
        add_unit_group_to_cache(parent_group, component_name);
      end;

      iteration_index = iteration_index + 1;
      ui_component = find_uicomponent(units_holder, prefix .. iteration_index);
    end
  end

  iterate_through_queue("QueuedLandUnit ");
  --iterate_through_queue("temp_merc_");
  return cache;
end
