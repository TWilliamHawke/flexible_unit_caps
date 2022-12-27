function Flexible_unit_caps:get_queued_units_from_cache(unit_group)
  if(self.queued_units_cache and self.queued_units_cache[unit_group]) then
    return self.queued_units_cache[unit_group]
  else
    return 0
  end;
end;