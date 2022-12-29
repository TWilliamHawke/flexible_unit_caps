---@param string string
---@return string
function Flexible_unit_caps:get_localised_string(string)
  local game_language = self:get_game_language()
  if game_language == "RU" then
    local text_ru = common.get_localised_string(string.."_ru")
    if( text_ru ~= "") then
      return text_ru;
    end;
  end;

  local text = common.get_localised_string(string);

  if(text == "") then
    return string;
  else
    return text;
  end;
end;

