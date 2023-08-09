---@param character CHARACTER_SCRIPT_INTERFACE
---@return integer
function Flexible_unit_caps:get_base_agent_supply(character)
    local char_rank = character:rank();
    if char_rank < 10 then
      return 1;
    elseif char_rank < 20 then
      return 2;
    else
      return 3;
    end
end;

---@param character CHARACTER_SCRIPT_INTERFACE
---@return integer
function Flexible_unit_caps:get_this_agent_supply(character)
  local faction = character:faction();

  if self:faction_has_army_cap(faction) then
    return 0
  end

  local base_agent_supply_cost = self:get_base_agent_supply(character)
  local agent_type = character:character_subtype_key();

  if self.free_agents[agent_type] then
    return 0;
  end;

  if agent_type == "wh_dlc05_vmp_vampire_shadow" or agent_type == "vmp_vampire" then
    if character:is_embedded_in_military_force() then
      local force = character:embedded_in_military_force();
      local lord_type = force:general_character():character_subtype_key();

      if lord_type == "pro02_vmp_isabella_von_carstein" then
        self:log("Vampire in Isabella army")
        return math.max(0, base_agent_supply_cost - 2)
      end;

    end;
  end;

  return base_agent_supply_cost;
end;

---@param faction FACTION_SCRIPT_INTERFACE
---@return integer
function Flexible_unit_caps:get_agents_supply(faction)
  local char_list = faction:character_list();

  local agents_supply = 0;

  for i = 0, char_list:num_items() - 1 do
    local character = char_list:item_at(i);
    if cm:char_is_agent(character) then
      local char_supply = self:get_this_agent_supply(character)
      agents_supply = agents_supply + char_supply;
    end;
  end

  return agents_supply

end;
