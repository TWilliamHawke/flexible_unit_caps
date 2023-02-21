---@param faction FACTION_SCRIPT_INTERFACE
---@param effect_strength integer
function Flexible_unit_caps:apply_supply_balance_effect(faction, effect_strength)
  local effect_name = "fluc_bundle_supply_balance_" .. math.min(effect_strength, 25);
  cm:apply_effect_bundle(effect_name, faction:name(), 0);
end

---@param faction FACTION_SCRIPT_INTERFACE
function Flexible_unit_caps:remove_supply_balance_effect(faction)
  for i = 1, 25 do
    local effect_name = "fluc_bundle_supply_balance_" .. i;

    if faction:has_effect_bundle(effect_name) then
      cm:remove_effect_bundle(effect_name, faction:name());
    end

  end

  local negative_balance = "fluc_bundle_supply_balance_negative";

  if faction:has_effect_bundle(negative_balance) then
    cm:remove_effect_bundle(negative_balance, faction:name());
  end

end
