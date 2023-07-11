cm:add_first_tick_callback(function()
  --doesn't work in api function (too early)
  for unit_group, replacer in pairs(Flexible_caps_api.replacers) do

    if not cco("CcoMainUnitRecord", replacer):Call("Key") then
      Flexible_unit_caps:logCore("ERROR: Unit \""..replacer.."\" for replacement of \""..unit_group.."\" group does not exists")
      local group_data = Flexible_unit_caps.unit_group_caps[unit_group];

      if group_data and type(group_data) == "table" and type(group_data[1]) == "number" then
        Flexible_unit_caps.unit_group_caps[unit_group][2] = "";
      end
    end
  end

  Flexible_caps_api.replacers = {};
end)