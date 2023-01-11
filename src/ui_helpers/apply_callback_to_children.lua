---@param component UIC
---@param callback function
function Flexible_unit_caps:apply_callback_to_children(component, callback)
  if not component then return end
  for _, child in uic_pairs(component) do
    callback(child);
  end
end
