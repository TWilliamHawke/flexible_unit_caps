function Flexible_caps_api:handle_error(message)
  local info = debug.getinfo(3, "Sl");

  self:log(message .. "\n\tin file [\"" .. tostring(info.source) .. "\"] at line " .. tostring(info.currentline))
end
