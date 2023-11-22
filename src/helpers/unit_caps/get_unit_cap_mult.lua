function Flexible_unit_caps:get_unit_cap_mult(unit_group)
  if unit_group == self.heroes_unit_group then
    return self.hero_cap / 4;
  else
    return self.player_unit_cap_mult;
  end
end