function Flexible_unit_caps:get_game_language()
  if self.game_lang then return self.game_lang end

  local langfile, _ = io.open("data/language.txt", "r")

  if langfile then
    self.game_lang = langfile:read()
    langfile:close()
  else
    self.game_lang = "EN"
  end

  return self.game_lang
end
