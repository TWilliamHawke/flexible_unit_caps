function Flexible_unit_caps:benchmark(name, callback, ...)
  local time = os.clock()
  callback(...);
  time = os.clock() - time;

  self:logCore("time for " ..name..": "..tostring(time))
end