---@diagnostic disable: undefined-field
local PAI_DIFF = {
  [1] = { 1, 90 },
  [0] = { 2, 60 },
  [-1] = { 3, 40 },
  [-2] = { 4, 30 },
  [-3] = { 4, 30 },
}

local PAI_TIMEOUT = nil;
local PAI_COUNT = nil;
local enable_log = true;
local pai_main_effect = "pai_bonus_dynamic";
local pai_aggressive_effect = "pai_aggressive_buff";
local pai_special_effect = "pai_special_effects";


local PAI_SPECIAL_EFFECTS = {
  wh2_main_skv_clan_eshin = {
    "wh2_dlc14_faction_trait_snikch_recruitment_cost_increase", "faction_to_force_own", -200
  }
}

local major_factions = {
  ["wh2_dlc09_skv_clan_rictus"] = true,
  ["wh2_dlc09_tmb_exiles_of_nehek"] = true,
  ["wh2_dlc09_tmb_followers_of_nagash"] = true,
  ["wh2_dlc09_tmb_khemri"] = true,
  ["wh2_dlc09_tmb_lybaras"] = true,
  ["wh2_dlc11_cst_noctilus"] = true,
  ["wh2_dlc11_cst_pirates_of_sartosa"] = true,
  ["wh2_dlc11_cst_the_drowned"] = true,
  ["wh2_dlc11_cst_vampire_coast"] = true,
  ["wh2_dlc11_def_the_blessed_dread"] = true,
  ["wh2_dlc11_vmp_the_barrow_legion"] = true,
  ["wh2_dlc12_lzd_cult_of_sotek"] = true,
  ["wh2_dlc13_emp_golden_order"] = true,
  ["wh2_dlc13_emp_the_huntmarshals_expedition"] = true,
  ["wh2_dlc13_lzd_spirits_of_the_jungle"] = true,
  ["wh2_dlc14_brt_chevaliers_de_lyonesse"] = true,
  ["wh2_dlc15_grn_bonerattlaz"] = true,
  ["wh2_dlc15_grn_broken_axe"] = true,
  ["wh2_dlc15_hef_imrik"] = true,
  ["wh2_dlc16_wef_drycha"] = true,
  ["wh2_dlc16_wef_sisters_of_twilight"] = true,
  ["wh2_dlc17_bst_malagor"] = true,
  ["wh2_dlc17_bst_taurox"] = true,
  ["wh2_dlc17_dwf_thorek_ironbrow"] = true,
  ["wh2_dlc17_lzd_oxyotl"] = true,
  ["wh2_main_def_cult_of_pleasure"] = true,
  ["wh2_main_def_hag_graef"] = true,
  ["wh2_main_def_har_ganeth"] = true,
  ["wh2_main_def_naggarond"] = true,
  ["wh2_main_hef_avelorn"] = true,
  ["wh2_main_hef_eataine"] = true,
  ["wh2_main_hef_nagarythe"] = true,
  ["wh2_main_hef_order_of_loremasters"] = true,
  ["wh2_main_hef_yvresse"] = true,
  ["wh2_main_lzd_hexoatl"] = true,
  ["wh2_main_lzd_itza"] = true,
  ["wh2_main_lzd_last_defenders"] = true,
  ["wh2_main_lzd_tlaqua"] = true,
  ["wh2_main_skv_clan_eshin"] = true,
  ["wh2_main_skv_clan_mors"] = true,
  ["wh2_main_skv_clan_moulder"] = true,
  ["wh2_main_skv_clan_pestilens"] = true,
  ["wh2_main_skv_clan_skryre"] = true,
  ["wh2_twa03_def_rakarth"] = true,
  ["wh3_dlc20_chs_azazel"] = true,
  ["wh3_dlc20_chs_festus"] = true,
  ["wh3_dlc20_chs_kholek"] = true,
  ["wh3_dlc20_chs_sigvald"] = true,
  ["wh3_dlc20_chs_valkia"] = true,
  ["wh3_dlc20_chs_vilitch"] = true,
  ["wh3_main_chs_shadow_legion"] = true,
  ["wh3_main_cth_the_northern_provinces"] = true,
  ["wh3_main_cth_the_western_provinces"] = true,
  ["wh3_main_dae_daemon_prince"] = true,
  ["wh3_main_dwf_the_ancestral_throng"] = true,
  ["wh3_main_emp_cult_of_sigmar"] = true,
  ["wh3_main_kho_exiles_of_khorne"] = true,
  ["wh3_main_ksl_the_great_orthodoxy"] = true,
  ["wh3_main_ksl_the_ice_court"] = true,
  ["wh3_main_ksl_ursun_revivalists"] = true,
  ["wh3_main_nur_poxmakers_of_nurgle"] = true,
  ["wh3_main_ogr_disciples_of_the_maw"] = true,
  ["wh3_main_ogr_goldtooth"] = true,
  ["wh3_main_sla_seducers_of_slaanesh"] = true,
  ["wh3_main_tze_oracles_of_tzeentch"] = true,
  ["wh3_main_vmp_caravan_of_blue_roses"] = true,
  ["wh3_prologue_kislev_expedition"] = true,
  ["wh_dlc03_bst_beastmen"] = true,
  ["wh_dlc05_bst_morghur_herd"] = true,
  ["wh_dlc05_wef_argwylon"] = true,
  ["wh_dlc05_wef_wood_elves"] = true,
  ["wh_dlc08_nor_norsca"] = true,
  ["wh_dlc08_nor_wintertooth"] = true,
  ["wh_main_brt_bordeleaux"] = true,
  ["wh_main_brt_bretonnia"] = true,
  ["wh_main_brt_carcassonne"] = true,
  ["wh_main_chs_chaos"] = true,
  ["wh_main_dwf_dwarfs"] = true,
  ["wh_main_dwf_karak_izor"] = true,
  ["wh_main_dwf_karak_kadrin"] = true,
  ["wh_main_emp_empire"] = true,
  ["wh_main_grn_crooked_moon"] = true,
  ["wh_main_grn_greenskins"] = true,
  ["wh_main_grn_orcs_of_the_bloody_hand"] = true,
  ["wh_main_vmp_schwartzhafen"] = true,
  ["wh_main_vmp_vampire_counts"] = true,
}

--logging function.
local function PAILOG(text)
  if enable_log == false then
    return;
  end

  local logFile = io.open("progressive_ai.txt", "a");
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

  local popLog = io.open("progressive_ai.txt", "w+")
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

local function apply_special_effect(faction)
  local effect_bundle = cm:create_new_custom_effect_bundle(pai_special_effect);
  local faction_name = faction:name();

  for _, data in pairs(PAI_SPECIAL_EFFECTS[faction_name]) do
    effect_bundle:add_effect(data[1], data[2], data[3]);
  end

  cm:apply_custom_effect_bundle_to_faction(effect_bundle, faction);
end

core:add_listener(
  "PAI_FactionTurnStart",
  "FactionTurnStart",
  function(context)
    local faction = context:faction()
    return not faction:is_human()
  end,
  ---@param context FactionTurnStart
  function(context)
    local faction = context:faction();
    local faction_name = faction:name();

    if faction:has_effect_bundle(pai_aggressive_effect) then
      cm:remove_effect_bundle(pai_aggressive_effect, faction:name());
    end
    if faction:has_effect_bundle(pai_main_effect) then
      cm:remove_effect_bundle(pai_main_effect, faction:name());
    end

    local this_turn = cm:model():turn_number();
    local maxtier, timeout = get_pai_params();
    local tier = math.floor(this_turn / timeout);
    tier = math.min(tier, maxtier);

    local potential = 80 + 80 * tier;
    if major_factions[faction_name] then
      potential = potential + 80;
    end

    cm:faction_set_potential_modifier(faction, potential);

    if PAI_SPECIAL_EFFECTS[faction_name] and not faction:has_effect_bundle(pai_special_effect) then
      apply_special_effect(faction)
    end

  end,
  true
);

local function init_mcm(context)
  local mct = context:mct()
  local pai_mcm_options = mct:get_mod_by_key("progressive_ai_bonuses")

end

local function finalize_mcm()
  local faction_list = cm:model():world():faction_list();
  for i = 0, faction_list:num_items() - 1 do
    local current_faction = faction_list:item_at(i);
    cm:remove_effect_bundle(pai_main_effect, current_faction:name());
  end
end

core:add_listener(
  "progressive_ai_mct",
  "MctInitialized",
  true,
  function(context)
    --init_mcm(context)
  end,
  true
)

core:add_listener(
  "progressive_ai_MctFinalized",
  "MctFinalized",
  true,
  function(context)
    --init_mcm(context)
    --finalize_mcm()
  end,
  true
)
