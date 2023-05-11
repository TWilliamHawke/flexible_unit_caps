local PAI_DIFF = {
  [1] = { 0, 60 },
  [0] = { 1, 60 },
  [-1] = { 2, 50 },
  [-2] = { 4, 30 },
  [-3] = { 4, 30 },
}

local PAI_TIMEOUT = nil;
local PAI_COUNT = nil;
local enable_log = true;
local enable_debug = false;
local pai_effect_name = "pai_bonus_dynamic"

local PAI_EFFECTS_VALUES = {
  ["upkeep_first_turn"] = -5,
  ["upkeep_per_level"] = -5,
  ["unit_exp_first_turn"] = 0,
  ["unit_exp_per_level"] = 30,
  ["research_first_turn"] = 0,
  ["research_per_level"] = 25,
  ["lord_exp_first_turn"] = 25,
  ["lord_exp_per_level"] = 25,
  ["growth_first_turn"] = 25,
  ["growth_per_level"] = 25,
  ["horde_growth_per_level"] = 5,
  ["horde_growth_first_turn"] = 5,
}

-- research buff doesn't apply for tomb kings
-- so it doesn't include here
local PAI_EFFECTS_DB = {
  { "upkeep", "wh_main_effect_force_all_campaign_upkeep", "faction_to_force_own" },
  { "growth", "wh_main_effect_province_growth_building", "faction_to_province_own" },
  { "unit_exp", "wh3_dlc20_effect_xp_gain_all_units", "faction_to_force_own" },
  { "lord_exp", "wh3_main_effect_character_campaign_experience_mod", "faction_to_character_own" },
  { "horde_growth", "wh_main_effect_hordebuilding_growth_core", "faction_to_force_own" },
}

local PAI_EFFECTS_MCM = {
  { "upkeep", "b_" },
  { "growth", "c_" },
  { "unit_exp", "d_" },
  { "research", "e_" },
  { "lord_exp", "f_" },
  { "horde_growth", "g_" },
}

--logging function.
local function PAILOG(text)
  if enable_log == false then
    return;
  end

  local logFile = io.open("progressive_ai_bonus.txt", "a");
  if (logFile == nil) then return end
  logFile:write("PAI:  " .. tostring(text) .. "  \n")
  logFile:flush()
  logFile:close()
end

local function PAINEWLOG()
  if enable_log == false then
    return;
  end
  local logTimeStamp = os.date("%d, %m %Y %X")
  --# assume logTimeStamp: string

  local popLog = io.open("progressive_ai_bonus.txt", "w+")
  if (popLog == nil) then return end

  popLog:write("NEW LOG [" .. logTimeStamp .. "] \n")
  popLog:flush()
  popLog:close()
end

PAINEWLOG()

local function get_pai_params()
  if PAI_TIMEOUT ~= nil and PAI_COUNT ~= nil then
    return PAI_TIMEOUT, PAI_TIMEOUT;
  else
    local difficulty = cm:model():combined_difficulty_level();
    return PAI_DIFF[difficulty][1], PAI_DIFF[difficulty][2];
  end
end

local function update_effect(faction, tier)
  cm:remove_effect_bundle(pai_effect_name, faction:name());


  local effect_bundle = cm:create_new_custom_effect_bundle(pai_effect_name);
  PAILOG("Start effect creating");

  for _, data in pairs(PAI_EFFECTS_DB) do
    local name = data[1]
    local value = PAI_EFFECTS_VALUES[name .. "_per_level"] * tier + PAI_EFFECTS_VALUES[name .. "_first_turn"]
    if value ~= 0 then
      effect_bundle:add_effect(data[2], data[3], value);
    end
  end

  if faction:subculture() ~= "wh2_dlc09_sc_tmb_tomb_kings" then
    effect_bundle:add_effect(
      "wh_main_effect_technology_research_points_mod",
      "faction_to_faction_own_unseen",
      PAI_EFFECTS_VALUES["research_per_level"] * tier + PAI_EFFECTS_VALUES["research_first_turn"]);
  end
  cm:apply_custom_effect_bundle_to_faction(effect_bundle, faction);
  PAILOG("APPLY TIER" .. tier .. " BONUS TO FACTION " .. tostring(faction:name()));

end

core:add_listener(
  "PAI_FactionTurnStart",
  "FactionTurnStart",
  function(context)
    local faction = context:faction()
    return not faction:is_human()
  end,
  -- true,
  ---comment
  ---@param context FactionTurnStart
  function(context)
    local faction = context:faction();
    
    local this_turn = cm:model():turn_number();


    local maxtier, timeout = get_pai_params();

    if not faction:has_effect_bundle(pai_effect_name) or (this_turn % timeout == 0) then
      local tier = math.floor(this_turn / timeout);
      tier = math.min(tier, maxtier);

      update_effect(faction, tier)
    end

    -- if faction:is_vassal() then return end
    -- replace_personality(faction, math.floor(this_turn / timeout));

  end,
  true
);

core:add_listener(
  "PAI_FactionTurnStart_test",
  "FactionTurnStart",
  function(context)
    local faction = context:faction()
    return faction:is_human() and enable_debug == true;
  end,
  -- true,
  function(context)
    local faction = context:faction();
    local this_turn = cm:model():turn_number();

    local maxtier, timeout = get_pai_params();

    if not faction:has_effect_bundle(pai_effect_name) or (this_turn % timeout == 0) then
      local tier = math.floor(this_turn / timeout);
      tier = math.min(tier, maxtier);

      update_effect(faction, 5)
    end

  end,
  true
);

core:add_listener(
  "PAI_FactionTurnStart_test",
  "FlexibleUnitCapsInit",
  true,
  ---@param context FlexibleUnitCapsInit
  function(context)

    local ok, err = pcall(function()
      local fluc_api = context:api();
      fluc_api:add_unit_group("my_group", 5, "")
      fluc_api:set_unit_data("wh_main_emp_inf_swordsmen", 0, "my_group")
      fluc_api:add_lord_skill_discount("wh_main_emp_karl_franz", "fluc_emp_artillery", -1, "wh_main_skill_emp_lord_battle_hold_the_line")
      fluc_api:add_unit_group_discount("wh_main_emp_karl_franz", "fluc_emp_halberdiers", -1)
      fluc_api:set_military_building_level("wh_main_emp_barracks_1", 5)
    end);
  
    if not ok then
      PAILOG(tostring(err));
    end
  
  end,
  true
);

