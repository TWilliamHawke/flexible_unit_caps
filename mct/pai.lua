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

local PAI_AGRESSIVE_PERSONALITIES = {
  wh_main_dwf_dwarfs ="pai_dwarf_aggressive",
  wh_main_emp_empire ="pai_empire_aggressive",
  wh_main_grn_greenskins ="pai_greenskin_aggressive",
  wh2_main_skv_skaven ="pai_skaven_aggressive",
  wh2_dlc09_tmb_tomb_kings ="pai_tombking_aggressive",
  wh_main_vmp_vampire_counts ="pai_vampire_aggressive",
  wh_dlc05_wef_wood_elves ="pai_woodelf_aggressive",
  wh_main_brt_bretonnia ="pai_bretonnia_aggressive",
  wh_dlc08_nor_norsca ="pai_norsca_aggressive",
  wh_main_chs_chaos ="pai_chaos_aggressive",
  wh2_main_hef_high_elves ="pai_high_elves_aggressive",
  wh2_main_def_dark_elves ="pai_dark_elves_aggressive",
  wh2_main_lzd_lizardmen ="pai_lizardmen_aggressive",
  wh2_dlc11_cst_vampire_coast ="pai_vcoast_aggressive",
  wh3_main_ksl_kislev ="pai_kislev_aggressive",
  wh3_main_cth_cathay ="pai_cathay_aggressive",
  wh3_main_ogr_ogre_kingdoms ="pai_ogres_aggressive",
  wh3_main_kho_khorne ="pai_khorne_aggressive",
  wh3_main_nur_nurgle ="pai_nurgle_aggressive",
  wh3_main_tze_tzeentch ="pai_tzeench_aggressive",
  wh3_main_sla_slaanesh ="pai_slaanesh_aggressive",
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

---comment
---@param faction FACTION_SCRIPT_INTERFACE
---@param tier integer
local function replace_personality(faction, tier)
  local player_faction = cm:get_human_factions()[1]; ---@type string
  local culture = faction:culture();
  local personality = PAI_AGRESSIVE_PERSONALITIES[culture];
  if not personality then return end;

  local relations_to_player = faction:diplomatic_attitude_towards(player_faction);


  if personality then
    cm:force_change_cai_faction_personality(faction:name(), personality);
  end;



  PAILOG(faction:name() .. "has changed personality");


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

local function init_mcm(context)
  local mct = context:mct()
  local pai_mcm_options = mct:get_mod_by_key("progressive_ai_bonuses")

  local a_max_tiers = pai_mcm_options:get_option_by_key("a_max_tiers")
  PAI_COUNT = a_max_tiers:get_finalized_setting()

  local a_tier_interval = pai_mcm_options:get_option_by_key("a_tier_interval")
  PAI_TIMEOUT = a_tier_interval:get_finalized_setting()

  for _, data in pairs(PAI_EFFECTS_MCM) do
    local base_option = pai_mcm_options:get_option_by_key(data[2] .. data[1] .. "_first_turn")
    PAI_EFFECTS_VALUES[data[1] .. "_first_turn"] = base_option:get_finalized_setting()

    local option_per_turn = pai_mcm_options:get_option_by_key(data[2] .. data[1] .. "_per_level")
    PAI_EFFECTS_VALUES[data[1] .. "_per_level"] = option_per_turn:get_finalized_setting()
  end

end

local function finalize_mcm()
  local faction_list = cm:model():world():faction_list();
  for i = 0, faction_list:num_items() - 1 do
    local current_faction = faction_list:item_at(i);
    cm:remove_effect_bundle(pai_effect_name, current_faction:name());
  end
end

core:add_listener(
  "progressive_ai_mct",
  "MctInitialized",
  true,
  function(context)
    init_mcm(context)
  end,
  true
)

core:add_listener(
  "progressive_ai_MctFinalized",
  "MctFinalized",
  true,
  function(context)
    init_mcm(context)
    finalize_mcm()
  end,
  true
)
