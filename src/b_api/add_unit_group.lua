---@param group string
---@param unit_cap integer
---@param ai_replacer string
---@param ... string[]
function Flexible_caps_api:add_unit_group(group, unit_cap, ai_replacer, ...)
  Flexible_unit_caps.unit_group_caps[group] = { unit_cap, ai_replacer }

  if type(group) ~="string" then
    self:handle_error("ERROR: Unit group should be a string")
    return
  end

  if type(ai_replacer) ~="string" then
    self:handle_error("ERROR: AI replacer for unit group should be a string")
    return
  end

  if type(unit_cap) ~= "number" or unit_cap < 1 then
    self:handle_error("ERROR: unit cap should be a positive number");
    return
  end

  if ai_replacer ~= "" then
    self.replacers[group] = ai_replacer;
  end

  if arg and #arg > 0 then
    local parents = {};

    for i = 1, #arg do
      local parent = arg[i];

      if type(parent == "string") then
        if not Flexible_unit_caps.unit_group_caps[parent] then
          self:handle_error("WARNING: parent unit group \"" .. parent .. "\" does not exist!")
        end
        table.insert(parents, parent)
      else
        self:handle_error("Error: parents of unit group shoul be a string")
      end
    end
  end
end
