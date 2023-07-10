---simplify function without lord check
---@param force MILITARY_FORCE_SCRIPT_INTERFACE
---@return integer
function Flexible_unit_caps:get_ai_army_supply(force)
  local this_army_supply = self.basic_lord_supply;
  local unit_list = force:unit_list();


  for j = 0, unit_list:num_items() - 1 do
    local unit = unit_list:item_at(j);

    if unit:unit_class() ~= "com" then
      local key = unit:unit_key();
      if not self.units_data[key] then
        self:add_unknown_unit_to_db(key)
      end

      local unit_cost = self.units_data[key][1] or 0;
      this_army_supply = this_army_supply + unit_cost;
    end
  end

  self:logAI("THIS ARMY HAS " .. tostring(unit_list:num_items()) .. " UNITS");
  self:logAI("THIS ARMY REQUIRED " .. tostring(this_army_supply) .. " SUPPLY POINTS");

  return this_army_supply;
end
