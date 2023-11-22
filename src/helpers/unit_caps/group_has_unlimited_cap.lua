function Flexible_unit_caps:group_has_unlimited_cap(unit_group, lord_factor)
  if lord_factor == self.UNLIMITED_CAP then
    return true;
  end

  if unit_group == self.heroes_unit_group then
    return self.hero_cap <= 0;
  else
    return self.player_unit_cap_mult <= 0;
  end
end
