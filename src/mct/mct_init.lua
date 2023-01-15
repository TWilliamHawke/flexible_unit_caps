function Flexible_unit_caps:mct_init(context)
  local mct = context:mct()
  local fluc_mct = mct:get_mod_by_key("flexible_unit_caps")
  local settings = fluc_mct:get_settings() ---@type Fluc_mct_config

  self.player_supply_custom_mult = settings.a_player_effect;
  self.ai_supply_mult = settings.c_ai_effect;
  self.log_level = settings.f_enable_logging;
  self.basic_lord_supply = settings.b_lord_supply;
  self.basic_unit_supply = settings.a_unit_supply;
  self.use_harsh_mode = settings.b_unit_caps_penalty == "harsh";

  local player_cap = tonumber(settings.a_player_unit_caps);
  local ai_cap = tonumber(settings.c_ai_unit_caps);

  self.player_unit_cap_mult = player_cap == -1 and -1 or player_cap / 100;
  self.ai_unit_cap_mult = ai_cap == -1 and -1 or ai_cap / 100;

  local supply_balance_diff = tonumber(settings.a_supply_balance_diff);

  self.enable_supply_balance = supply_balance_diff > 0 and true or false;
  self.walls_reduces_balance = supply_balance_diff > 1 and true or false;
  self.big_empire_penalty_start = supply_balance_diff > 2 and 50 or 999;

  self:logDebug("Ai supply now is " .. tostring(self.ai_supply_mult));

end
