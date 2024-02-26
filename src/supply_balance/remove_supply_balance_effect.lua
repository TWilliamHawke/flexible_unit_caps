---@param faction FACTION_SCRIPT_INTERFACE
function Flexible_unit_caps:remove_supply_balance_effect(faction)
  for i = 1, 25 do
    local effect_bundle = "fluc_bundle_supply_balance_" .. i;
    if self:get_game_language() == "RU" then
      effect_bundle = effect_bundle.."_ru";
    end

    if faction:has_effect_bundle(effect_bundle) then
      cm:remove_effect_bundle(effect_bundle, faction:name());
    end

  end

  local negative_balance_bundle = "fluc_bundle_supply_balance_negative";

  if self:get_game_language() == "RU" then
    negative_balance_bundle = "fluc_bundle_supply_balance_negative_ru";
  end

  if faction:has_effect_bundle(negative_balance_bundle) then
    cm:remove_effect_bundle(negative_balance_bundle, faction:name());
  end

end
