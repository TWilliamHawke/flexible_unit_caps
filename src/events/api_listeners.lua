function Flexible_unit_caps:add_api_listeners()
  if not core:is_campaign() then
    core:add_listener(
      "Supply_lines_init",
      "ScriptEventAllModsLoaded",
      true,
      function(_)
        self:trigger_api_event();
      end,
      false
    )
  else
    core:add_listener(
      "Supply_lines_init",
      "LoadingGame",
      true,
      function(_)
        self:trigger_api_event();
      end,
      true
    )
  end
  self:logCore("added events")
end

function Flexible_unit_caps:trigger_api_event()
  core:trigger_custom_event("FlexibleUnitCapsInit", { ["api"] = Flexible_caps_api });
  self:logCore("api event has triggered");
end
