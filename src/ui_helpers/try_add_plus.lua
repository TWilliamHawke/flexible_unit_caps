---@param number number|string
---@return string
function Flexible_unit_caps:try_add_plus(number)
  if (tonumber(number) > 0) then
    return "+"..tostring(number);
  else
    return tostring(number);
  end
end
