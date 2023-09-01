---@alias lord_skill_data {[1]: number, [2]:boolean, [3]:string, [4]:string | nil}

---@type table<string, table<string, lord_skill_data >>
Flexible_unit_caps.skill_supply_change = {
  --empire
  wh2_dlc13_emp_cha_huntsmarshal_0 = {
    fluc_emp_huntsmen = { -1, false, "wh2_dlc13_skill_emp_hunts_marshal_unique_1" },
    fluc_emp_archers = { -1, false, "wh2_dlc13_skill_emp_hunts_marshal_unique_1" },
    fluc_emp_greatswords = { -1, false, "wh2_dlc13_skill_emp_hunts_marshal_unique_0" },
    fluc_emp_halberdiers = { -1, false, "wh2_dlc13_skill_emp_hunts_marshal_unique_0" },
  },
  wh_main_emp_balthasar_gelt = {
    fluc_emp_outriders = { -1, false, "wh_dlc08_skill_emp_lord_unique_balthasar_unique_2" },
    fluc_emp_handgunners = { -1, false, "wh_dlc08_skill_emp_lord_unique_balthasar_unique_2" },
    fluc_emp_magic_machines = { -1, false, "wh_dlc08_skill_emp_lord_unique_balthasar_unique_3" },
    fluc_emp_tank = { -1, false, "wh_dlc08_skill_emp_lord_unique_balthasar_unique_3" },
  },
  ulric_grandmaster = {
    fluc_emp_ulric_cult = { -2, false, "ulric_cult_of_ulric_stats" },
  },
  mixu_elspeth_von_draken = {
    fluc_emp_artillery = { -2, false, "mixu_emp_elspeth_von_draken_special_guns_of_nuln" },
  },
  emp_cha_helborg = {
    fluc_emp_reiksguard = { -1, false, "skill_emp_lord_unique_campaign_kurt_helborg_grand_order" },
    fluc_emp_greatswords = { -1, false, "skill_emp_lord_unique_campaign_kurt_helborg_for_emperor" },
    fluc_emp_halberdiers = { -1, false, "skill_emp_lord_unique_campaign_kurt_helborg_reiksguard_supply" },
    fluc_emp_handgunners = { -1, false, "skill_emp_lord_unique_campaign_kurt_helborg_reiksguard_supply" },
  },
  wh_pro01_dwf_grombrindal = {
    fluc_dwf_irondrakes = { -2, false, "wh2_dlc17_dwf_grombrindal_unique_rouse_the_engineers" },
    fluc_dwf_artillery_classic = { -1, false, "wh2_dlc17_dwf_grombrindal_unique_rouse_the_engineers" },
    fluc_dwf_artillery_gun = { -1, false, "wh2_dlc17_dwf_grombrindal_unique_rouse_the_engineers" },
    fluc_dwf_flying_machine = { -2, true, "wh2_dlc17_dwf_grombrindal_unique_rouse_the_engineers" },
    fluc_dwf_land_machine = { -2, true, "wh2_dlc17_dwf_grombrindal_unique_rouse_the_engineers" },
    fluc_dwf_war_machines = { -2, false, "wh2_dlc17_dwf_grombrindal_unique_rouse_the_engineers" },
  },
  wh_dlc06_dwf_belegar = {
    fluc_dwf_rangers = { -2, false, "wh2_dlc17_dwf_belegar_unique_tunnel_warfare" },
  },
  wh_main_dwf_thorgrim_grudgebearer = {
    fluc_dwf_artillery_classic = { -2, true, "wh_dlc08_skill_dwf_lord_thorgrim_unique_2" },
    fluc_dwf_artillery_gun = { -2, true, "wh_dlc08_skill_dwf_lord_thorgrim_unique_2" },
    fluc_dwf_artillery_fire = { -2, true, "wh_dlc08_skill_dwf_lord_thorgrim_unique_2" },
    fluc_dwf_artillery = { -2, false, "wh_dlc08_skill_dwf_lord_thorgrim_unique_2" },
  },
  dwf_byrrnoth_grundadrakk = {
    fluc_dwf_artillery_fire = { -2, true, "parte_skill_dwf_byrrnoth_grundadrakk_unique_zul_barag" },
    fluc_dwf_artillery_gun = { -2, true, "parte_skill_dwf_byrrnoth_grundadrakk_unique_zul_barag" },
    fluc_dwf_artillery_classic = { -2, true, "parte_skill_dwf_byrrnoth_grundadrakk_unique_zul_barag" },
    fluc_dwf_artillery = { -2, false, "wh_dlc08_skill_dwf_lord_thorgrim_unique_2" },
    fluc_dwf_longbeards = { -1, false, "parte_skill_dwf_byrrnoth_grundadrakk_unique_glory_of_the_ancestors" },
    fluc_dwf_hammerers = { -1, false, "parte_skill_dwf_byrrnoth_grundadrakk_unique_glory_of_the_ancestors" },
  },
  wh_main_dwf_cha_greybeard = {
    fluc_dwf_artillery_gun = { -2, true, "elo_greybeard_automatization" },
    fluc_dwf_artillery_fire = { -2, true, "elo_greybeard_automatization" },
    fluc_dwf_artillery_classic = { -2, true, "elo_greybeard_automatization" },
    fluc_dwf_artillery = { -2, false, "wh_dlc08_skill_dwf_lord_thorgrim_unique_2" },
  },
  Goblin = {
    fluc_grn_goblins = { -1, false, "wh_dlc06_skill_grn_lord_battle_ard_ladz" },
    fluc_grn_goblin_riderz = { -1, true, "wh_dlc06_skill_grn_lord_battle_ard_ladz" },
    fluc_grn_night_goblins = { -1, false, "wh_dlc06_skill_grn_lord_battle_ard_ladz" },
    fluc_grn_squig = { -1, false, "wh_dlc06_skill_grn_lord_battle_riderz" },
  },
  wh_main_grn_azhag_the_slaughterer = {
    fluc_grn_big_uns_boar = { -2, true, "wh_dlc08_skill_grn_azhag_unique_0" },
    fluc_grn_big_uns = { -2, true, "wh_dlc08_skill_grn_azhag_unique_0" },
    fluc_grn_savage = { -2, false, "wh_dlc08_skill_grn_azhag_unique_0" },
    fluc_grn_savage_boar = { -2, true, "wh_dlc08_skill_grn_azhag_unique_0" },
  },
  wh_dlc06_grn_wurrzag_da_great_prophet = {
    fluc_grn_trolls = { -2, false, "wh2_dlc15_skill_unique_grn_wurrzag_colossal_warpaint" },
    fluc_grn_giants = { -2, false, "wh2_dlc15_skill_unique_grn_wurrzag_colossal_warpaint" },
    fluc_grn_other_monsters = { -2, true, "wh2_dlc15_skill_unique_grn_wurrzag_colossal_warpaint" },
    fluc_grn_arachnarok = { -2, false, "wh2_dlc15_skill_unique_grn_wurrzag_colossal_warpaint" },
    fluc_all_rare_creatures = { -1, true, "wh2_dlc15_skill_unique_grn_wurrzag_colossal_warpaint" },
  },
  frb_warboss_lord = {
    fluc_grn_black_orcs = { -1, false, "frb_warboss_lord_black_orc_superiority" },
  },
  ws_grn_tinitt_foureyes = {
    fluc_grn_arachnarok = { -2, false, "ws_skill_tinitt_foureyes_ancient_behemoths" },
  },
  ws_sporctacus = {
    fluc_def_hydra = { -2, false, "ws_skill_sporctacus_solid_snekz" },
  },
  wh_pro02_vmp_isabella_von_carstein = {
    fluc_vmp_vargheists = { -2, false, "wh2_dlc11_skill_vmp_isabella_unique_5" },
    fluc_vmp_varghulf = { -2, false, "wh2_dlc11_skill_vmp_isabella_unique_5" },
    fluc_vmp_terrorgheist = { -2, false, "wh2_dlc11_skill_vmp_isabella_unique_5" },
  },
  wh_main_vmp_heinrich_kemmler = {
    fluc_vmp_ghosts = { -2, false, "wh2_dlc17_skill_vmp_heinrich_kemmler_unique_wightblades" },
    fluc_vmp_ghost_cav = { -2, false, "wh2_dlc17_skill_vmp_heinrich_kemmler_unique_wightblades" },
  },
  wh2_dlc11_vmp_bloodline_von_carstein = {
    fluc_vmp_vargheists = { -2, false, "wh2_dlc11_skill_vmp_bloodline_von_carstein_unique_brooding_horrors" },
  },
  Blood_Dragon = {
    fluc_vmp_black_knights = { -2, false, "wh2_dlc11_skill_vmp_bloodline_blood_dragon_unique_doomrider" },
    fluc_vmp_grave_guard = { -2, false, "wh2_dlc11_skill_vmp_bloodline_blood_dragon_unique_grave_sentinels" },
    fluc_vmp_blood_knights = { -2, false, "wh2_dlc11_skill_vmp_bloodline_blood_dragon_unique_the_ordo_draconis" },
  },
  wh2_dlc11_vmp_bloodline_strigoi = {
    fluc_vmp_ghouls = { -2, false, "wh2_dlc11_skill_vmp_bloodline_strigoi_unique_grave_eaters" },
    fluc_vmp_crypt_horrors = { -2, false, "wh2_dlc11_skill_vmp_bloodline_strigoi_unique_monstrosities_of_morr" },
  },
  wh_dlc04_vmp_helman_ghorst = {
    fluc_vmp_machines = { -2, false, "wh_dlc04_skill_vmp_lord_unique_helman_ghorst_corpse_cart_boost" },
  },
  vmp_abh = {
    fluc_vmp_blood_knights = { -3, false, "vmp_fbktm" },
    fluc_vmp_black_knights = { -3, false, "vmp_fbk50" },
    fluc_vmp_ghost_cav = { -3, false, "vmp_fbk50" },
    fluc_vmp_grave_guard = { -3, false, "wh2_dlc11_skill_vmp_bloodline_blood_dragon_unique_grave_sentinels" },
  },
  wh_dlc04_vmp_vlad_con_carstein = {
    fluc_vmp_black_knights = { -1, true, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_blood_knights = { -1, true, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_crypt_horrors = { -1, true, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_ghosts = { -1, true, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_ghost_cav = { -1, true, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_ghouls = { -1, true, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_grave_guard = { -1, true, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_lahmian = { -1, true, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_terrorgheist = { -1, true, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_vargheists = { -1, true, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_varghulf = { -1, true, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_vampiress = { -1, true, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_ror = { -1, true, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_machines = { -1, true, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_forest = { -1, true, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_zombies = { -1, true, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    none = { -1, true, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_undead = { -1, false, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
  },
  vmp_bloodline_fallen_knight = {
    fluc_vmp_black_knights = { -1, false, "mixu_vmp_bloodline_fallen_knight_special_2_brothers_in_death" },
    fluc_vmp_blood_knights = { -1, false, "mixu_vmp_bloodline_fallen_knight_special_2_brothers_in_death" },
    fluc_vmp_ghost_cav = { -1, false, "mixu_vmp_bloodline_fallen_knight_special_2_brothers_in_death" },
  },
  Treeman = {
    fluc_wef_treekin = { -1, false, "wh_dlc05_skill_wef_ancient_treeman_unique_damage_resistance_treekin" },
    fluc_wef_treemen = { -1, false, "wh_dlc05_skill_wef_ancient_treeman_unique_damage_resistance_treekin" },
  },
  roy_zoat_lord = {
    fluc_wef_zoats = { -1, false, "roy_zoat_lord_army_defense_zoats" },
  },
  wef_daith = {
    fluc_wef_glade_guard = { -2, false, "mixu_wef_daith_special_quality_arrows" },
    fluc_wef_deepwood_scouts = { -2, false, "mixu_wef_daith_special_quality_arrows" },
    fluc_wef_waywatchers = { -2, false, "mixu_wef_daith_special_quality_arrows" },
    fluc_all_missiles = { -1, true, "mixu_wef_daith_special_quality_arrows" },
  },
  wh_dlc08_nor_wulfrik = {
    fluc_nor_skinwolves = { -1, false, "wh_dlc08_skill_nor_wulfrik_battle_fervent_creatures" },
  },
  wh_dlc08_nor_throgg = {
    fluc_nor_fimirs = { -1, false, "wh_dlc08_skill_nor_throgg_unique_king_of_trolls" },
    fluc_nor_skinwolves = { -1, false, "wh_dlc08_skill_nor_throgg_unique_king_of_trolls" },
    fluc_nor_flying_beast = { -1, false, "wh_dlc08_skill_nor_throgg_battle_primordial_masters" },
  },
  Hef_lord = {
    fluc_hef_phoenixes = { -1, false, "wh2_main_skill_hef_dedication_asuryan" },
    fluc_hef_phoenix_guard = { -1, false, "wh2_main_skill_hef_dedication_asuryan" },
    fluc_hef_swordmasters = { -1, false, "wh2_main_skill_hef_dedication_hoeth" },
    fluc_hef_dragon_princes = { -1, false, "wh2_main_skill_hef_dedication_vaul" },
    fluc_hef_dragons = { -1, false, "wh2_main_skill_hef_dedication_addaioth" },
    fluc_hef_lions = { -1, false, "wh2_main_skill_hef_dedication_kurnous" },
    fluc_hef_lion_inf = { -1, false, "wh2_main_skill_hef_dedication_kurnous" },
    fluc_hef_lion_chariots = { -1, true, "wh2_main_skill_hef_dedication_hukon" },
    fluc_hef_chariots = { -1, false, "wh2_main_skill_hef_dedication_hukon" },
    fluc_hef_spearmen = { -1, false, "wh2_main_skill_hef_dedication_isha" },
    fluc_hef_archers = { -1, false, "wh2_main_skill_hef_dedication_isha" },
    fluc_hef_avelorn = { -1, false, "wh2_main_skill_hef_dedication_isha" },
    fluc_hef_sea_guard = { -1, false, "wh2_main_skill_hef_dedication_mathlann" },
  },
  wh2_dlc10_hef_alarielle = {
    fluc_hef_trees = { -1, false, "wh2_dlc10_skill_hef_alarielle_fire_and_blood_4" },
  },
  AK_aislinn = {
    fluc_hef_sea_guard = { -2, false, "wh2_main_skill_hef_dedication_mathlann" },
    fluc_hef_lions = { -1, false, "AK_aislinn_unique_king" },
    fluc_hef_lion_inf = { -1, false, "AK_aislinn_unique_king" },
  },
  wh2_main_def_morathi = {
    fluc_def_doomfire = { -2, false, "wh2_main_skill_def_morathi_unique_3_3" },
    fluc_def_dark_riders = { -2, false, "wh2_main_skill_def_morathi_unique_3_3" },
    fluc_def_shades = { -2, false, "wh2_main_skill_def_morathi_unique_3_3" },
    fluc_def_scourgerunner = { -2, false, "wh2_main_skill_def_morathi_unique_3_3" },
  },
  wh2_dlc14_def_high_beastmaster = {
    fluc_def_cold_one = { -1, false, "wh2_dlc14_skill_def_beastmaster_cold_ones" },
    fluc_def_cold_one_chariot = { -1, false, "wh2_dlc14_skill_def_beastmaster_cold_ones" },
    fluc_def_medusa = { -1, false, "wh2_dlc14_skill_def_beastmaster_medusas" },
    fluc_def_dragons = { -1, false, "wh2_dlc14_skill_def_beastmaster_black_dragon" },
    fluc_def_hydra = { -1, false, "wh2_dlc14_skill_def_beastmaster_war_hydra_kharibdyss" },
  },
  wh2_twa03_def_rakarth = {
    fluc_def_artillery = { -2, false, "wh2_twa03_skill_def_rakarth_harpyclaw_bolts" },
    fluc_def_scourgerunner = { -2, false, "wh2_twa03_skill_def_rakarth_harpyclaw_bolts" },
    fluc_def_cold_one = { -2, false, "wh2_twa03_skill_def_rakarth_pack_hunters" },
    fluc_def_cold_one_chariot = { -2, false, "wh2_twa03_skill_def_rakarth_pack_hunters" },
  },
  volilosh = {
    fluc_def_shades_melee = { -2, false, "volilosh_skill_rors1" },
  },
  Lzd_lord = {
    fluc_lzd_saurus = { -1, false, "wh2_main_skill_lzd_blessing_quetzl" },
    fluc_lzd_temple_guards = { -1, false, "wh2_main_skill_lzd_blessing_quetzl" },
    fluc_lzd_bastiladons = { -1, false, "wh2_main_skill_lzd_blessing_itzl" },
    fluc_lzd_carnosaurs = { -1, false, "wh2_main_skill_lzd_blessing_itzl" },
    fluc_lzd_cold_one = { -1, false, "wh2_main_skill_lzd_blessing_itzl" },
    fluc_lzd_dread_saurian = { -1, false, "wh2_main_skill_lzd_blessing_itzl" },
    fluc_lzd_coatl = { -1, false, "wh2_main_skill_lzd_blessing_itzl" },
    fluc_lzd_ripperdactyl = { -1, false, "wh2_main_skill_lzd_blessing_itzl" },
    fluc_lzd_razordons = { -1, false, "wh2_main_skill_lzd_blessing_itzl" },
    fluc_lzd_teranodons = { -1, false, "wh2_main_skill_lzd_blessing_itzl" },
    fluc_lzd_salamanders = { -1, false, "wh2_main_skill_lzd_blessing_itzl" },
    fluc_lzd_stegadons = { -1, false, "wh2_main_skill_lzd_blessing_itzl" },
    fluc_lzd_troglodons = { -1, false, "wh2_main_skill_lzd_blessing_itzl" },
    fluc_all_rare_creatures = { -1, true, "wh2_main_skill_lzd_blessing_itzl" },
  },
  Skink = {
    fluc_lzd_cold_one = { -1, false, "wh2_dlc12_skill_lzd_skink_chief_unique_3" },
    fluc_lzd_teranodons = { -1, false, "wh2_dlc12_skill_lzd_skink_chief_unique_3" },
  },
  Kroxi = {
    fluc_lzd_kroxigors = { -2, false, "wh2_dlc13_skill_lzd_ancient_kroxigor_unique_3",
      "wh2_dlc13_skill_lzd_ancient_kroxigor_unique_4" },
  },
  wh2_dlc12_lzd_tehenhauin = {
    fluc_lzd_bastiladons = { -2, false, "wh2_dlc12_skill_lzd_tehenhauin_2", "wh2_dlc12_skill_lzd_tehenhauin_6" },
  },
  wh2_dlc17_lzd_oxyotl = {
    fluc_lzd_coatl = { -2, false, "wh2_dlc17_skill_lzd_oxyotl_unique_explorer_of_lost_worlds" },
    fluc_lzd_troglodons = { -2, false, "wh2_dlc17_skill_lzd_oxyotl_unique_explorer_of_lost_worlds" },
  },
  wh2_dlc09_skv_tretch_craventail = {
    fluc_skv_stormvermin = { -2, false, "wh2_dlc09_skill_skv_lord_unique_tretch_craventail_tretchs_raiders" },
  },
  wh2_dlc12_skv_ikit_claw = {
    fluc_skv_doomwheel_flayer = { -2, false, "wh2_dlc12_skill_skv_ikit_unique_4" },
  },
  wh2_dlc12_skv_warlock_master = {
    fluc_skv_jezzails = { -1, false, "wh2_dlc12_skill_skv_engineer_unique_3" },
    fluc_skv_ratlings = { -1, false, "wh2_dlc12_skill_skv_engineer_unique_3" },
    fluc_skv_warpfire_thrower = { -1, false, "wh2_dlc12_skill_skv_engineer_unique_3" },
    fluc_skv_stormfiend = { -1, false, "wh2_dlc12_skill_skv_engineer_unique_3" },
    fluc_skv_doomwheel_flayer = { -1, false, "wh2_dlc12_skill_skv_engineer_unique_2" },
  },
  wh2_dlc14_skv_master_assassin = {
    fluc_skv_missile_runners = { -1, false, "wh2_dlc14_skill_skv_assassins_missile_damage" },
  },
  thom_iron_mask = {
    fluc_skv_stormvermin = { -2, false, "thom_ferrik_ironmask_unique_raiding_party" },
  },
  Thom_vulkan_moltskin_searflesh = {
    fluc_arachnarat = { -2, false, "thom_vulkan_master_of_obsidian" },
  },
  wh2_dlc11_cst_harkon = {
    fluc_cst_mobs_melee = { -2, false, "wh2_dlc11_skill_cst_luthor_unique_1" },
    fluc_cst_depth_guard = { -2, false, "wh2_dlc11_skill_cst_luthor_unique_1" },
    fluc_cst_mobs_missile = { -2, false, "wh2_dlc11_skill_cst_luthor_unique_3" },
    fluc_cst_prometheans = { -2, false, "wh2_dlc11_skill_cst_luthor_unique_3" },
    fluc_cst_artillery = { -1, false, "wh2_dlc11_skill_cst_lord_crime_3" },
  },
  Pirate = {
    fluc_cst_artillery = { -1, false, "wh2_dlc11_skill_cst_lord_crime_3" },
  },
  wh2_dlc11_cst_aranessa = {
    fluc_cst_prometheans = { -2, false, "wh2_dlc11_skill_cst_aranessa_unique_2" },
    fluc_cst_leviathan = { -2, false, "wh2_dlc11_skill_cst_aranessa_unique_2" },
    fluc_cst_artillery = { -2, false, "wh2_dlc11_skill_cst_aranessa_unique_4" },
  },
  wh2_dlc11_cst_noctilus = {
    fluc_cst_droppers = { -2, false, "wh2_dlc11_skill_cst_noctilus_unique_4" },
    fluc_cst_depth_guard = { -2, false, "wh2_dlc11_skill_cst_noctilus_unique_4" },
    fluc_vmp_terrorgheist = { -2, false, "wh2_dlc11_skill_cst_noctilus_unique_4" },
  },
  wh_main_chs_archaon = {
    fluc_chs_warriors = { -2, false, "wh_dlc08_skill_chs_lord_unique_archaon_1" },
    fluc_chs_chosen = { -2, false, "wh_dlc08_skill_chs_lord_unique_archaon_2" },
    fluc_chs_knights = { -2, false, "wh_dlc08_skill_chs_lord_unique_archaon_3" },
    fluc_kho_warriors = { -2, true, "wh_dlc08_skill_chs_lord_unique_archaon_1" },
    fluc_kho_chosen = { -2, true, "wh_dlc08_skill_chs_lord_unique_archaon_2" },
    fluc_kho_knights = { -2, true, "wh_dlc08_skill_chs_lord_unique_archaon_3" },
    fluc_nur_warriors = { -2, true, "wh_dlc08_skill_chs_lord_unique_archaon_1" },
    fluc_nur_chosen = { -2, true, "wh_dlc08_skill_chs_lord_unique_archaon_2" },
    fluc_nur_knights = { -2, true, "wh_dlc08_skill_chs_lord_unique_archaon_3" },
    fluc_tze_warriors = { -2, true, "wh_dlc08_skill_chs_lord_unique_archaon_1" },
    fluc_tze_chosen = { -2, true, "wh_dlc08_skill_chs_lord_unique_archaon_2" },
    fluc_tze_knights = { -2, true, "wh_dlc08_skill_chs_lord_unique_archaon_3" },
    fluc_sla_warriors = { -2, true, "wh_dlc08_skill_chs_lord_unique_archaon_1" },
    fluc_sla_chosen = { -2, true, "wh_dlc08_skill_chs_lord_unique_archaon_2" },
    fluc_sla_knights = { -2, true, "wh_dlc08_skill_chs_lord_unique_archaon_3" },
  },
  wh3_dlc20_tze_vilitch = {
    fluc_tze_spawn = { -2, false, "wh3_dlc20_skill_chs_vilitch_unique_twist_of_fate" },
    fluc_tze_forsaken = { -2, false, "wh3_dlc20_skill_chs_vilitch_unique_twist_of_fate" },
  },
  wh3_main_tze_kairos = {
    fluc_tze_greater_daemons = { -2, false, "wh3_main_skill_tze_kairos_self_4" },
  },
  wh3_main_ksl_katarin = {
    fluc_ksl_leopards = { -2, false, "wh3_main_skill_ksl_katarin_unique_snow_leopard_buffs" },
  },
  wh3_main_ksl_boris = {
    fluc_ksl_tzar_guard = { -2, false, "wh3_main_skill_ksl_boris_unique_04" },
    fluc_ksl_elemental = { -2, false, "wh3_main_skill_ksl_boris_unique_elemental_bear_regen" },
  },
  Daemonsmith = {
    fluc_chd_bull_centaurs = { -1, false, "wh3_dlc23_skill_chd_sorcerer_prophet_voice_of_hashut"},
    fluc_chd_taurus = { -1, false, "wh3_dlc23_skill_chd_sorcerer_prophet_voice_of_hashut"},
    fluc_chd_fireborn = { -1, false, "wh3_dlc23_skill_chd_sorcerer_prophet_voice_of_hashut"},
    fluc_chd_destroyer = { -1, false, "wh3_dlc23_skill_chd_sorcerer_prophet_voice_of_hashut"},
  },
  wh3_dlc23_chd_overseer = {
    fluc_chd_warriors = { -1, false, "wh3_dlc23_skill_chd_overseer_armourer"},
    fluc_chd_infernal_guard = { -1, false, "wh3_dlc23_skill_chd_overseer_armourer"},
    fluc_chd_blunderbusses = { -1, false, "wh3_dlc23_skill_chd_overseer_armourer"},
    fluc_chd_fireglaves = { -1, false, "wh3_dlc23_skill_chd_overseer_armourer"},
    fluc_chd_ironsworn = { -1, false, "wh3_dlc23_skill_chd_overseer_armourer"},
    fluc_chd_hobgoblins = { -1, false, "wh3_dlc23_skill_chd_overseer_harsh_master"},
    fluc_chd_hobgoblin_archers = { -1, false, "wh3_dlc23_skill_chd_overseer_harsh_master"},
    fluc_chd_hobgoblin_raiders = { -1, false, "wh3_dlc23_skill_chd_overseer_harsh_master"},
  },
  wh3_dlc23_chd_drazhoath = {
    fluc_chd_ironsworn = { -2, false, "wh3_dlc23_skill_chd_drazhoath_we_are_legion"},
    fluc_chd_infernal_guard = { -2, false, "wh3_dlc23_skill_chd_drazhoath_we_are_legion"},
    fluc_chd_fireglaves = { -2, false, "wh3_dlc23_skill_chd_drazhoath_we_are_legion"},
  },
  wh2_dlc09_tmb_khalida = {
    fluc_tmb_stalkers = { -2, false, "wh2_dlc09_skill_tmb_khalida_unique_4"},
    fluc_tmb_necropolis_knights = { -2, false, "wh2_dlc09_skill_tmb_khalida_unique_4"},
    fluc_tmb_archers = { -1, false, "wh2_dlc09_skill_tmb_god_blessing_3"},
  },
  wh2_dlc09_tmb_settra = {
    fluc_tmb_tomb_guard = { -1, false, "wh2_dlc09_skill_tmb_god_blessing_0" },
    fluc_tmb_chariots = { -1, false, "wh2_dlc09_skill_tmb_god_blessing_0" },
  },
  wh2_dlc09_tmb_arkhan = {
    fluc_tmb_artillery = { -1, false, "wh2_dlc09_skill_tmb_god_blessing_2" },
  },
  tomb_king = {
    fluc_tmb_archers = { -1, false, "wh2_dlc09_skill_tmb_god_blessing_3"},
    fluc_tmb_stalkers= { -1, false, "wh2_dlc09_skill_tmb_god_blessing_3"},
    fluc_tmb_tomb_guard = { -1, false, "wh2_dlc09_skill_tmb_god_blessing_0" },
    fluc_tmb_chariots = { -1, false, "wh2_dlc09_skill_tmb_god_blessing_0" },
    fluc_tmb_artillery = { -1, false, "wh2_dlc09_skill_tmb_god_blessing_2" },
    fluc_tmb_ushabti = { -1, false, "wh2_dlc09_skill_tmb_god_blessing_1" },
  },
  wh2_dlc09_tmb_khatep = {
    fluc_tmb_ushabti = { -1, false, "wh2_dlc09_skill_tmb_god_blessing_1" },
    fluc_tmb_chariots = { -1, false, "wh2_dlc09_skill_tmb_khatep_unique_2" },
    fluc_tmb_horsemen = { -1, false, "wh2_dlc09_skill_tmb_khatep_unique_2" },
    fluc_tmb_tomb_guard = { -1, false, "wh2_dlc09_skill_tmb_khatep_unique_3" },
  },
  wh_dlc03_bst_khazrak = {
    fluc_bst_gors = { -1, false, "wh2_dlc17_bst_khazrak_unique_drakwald_hordes" },
    fluc_bst_harpies = { -1, false, "wh2_dlc17_bst_khazrak_unique_houndmaster" },
    fluc_bst_hounds = { -1, false, "wh2_dlc17_bst_khazrak_unique_houndmaster" },
    fluc_bst_manticores = { -1, false, "wh2_dlc17_bst_khazrak_unique_houndmaster" },
  },
  wh2_dlc17_bst_taurox = {
    fluc_all_rare_creatures = { -1, true, "wh2_dlc17_skill_bst_taurox_unique_titans_of_the_deep_forest" },
    fluc_bst_giants = { -2, false, "wh2_dlc17_skill_bst_taurox_unique_titans_of_the_deep_forest" },
    fluc_bst_jabberslythes = { -2, false, "wh2_dlc17_skill_bst_taurox_unique_titans_of_the_deep_forest" },
    fluc_bst_cygors = { -2, false, "wh2_dlc17_skill_bst_taurox_unique_titans_of_the_deep_forest" },
  },
  wh_dlc05_bst_morghur = {
    fluc_bst_centigors = { -2, false, "wh_dlc03_skill_bst_morghur_unique_upgraded_spawn_1" },
    fluc_bst_jabberslythes = { -2, false, "wh_dlc03_skill_bst_morghur_unique_upgraded_spawn_1" },
  },
  wh3_dlc24_ksl_mother_ostankya = {
    fluc_ksl_incarnate_elemental = { -2, false, "wh3_dlc24_skill_node_ksl_ostankya_top_line_3" },
    fluc_ksl_things = { -2, false, "wh3_dlc24_skill_node_ksl_ostankya_top_line_3" },
    --bears
    --spiders
    --bats
  },
  wh3_dlc24_tze_the_changeling = {
    fluc_tze_forsaken = { -2, false, "wh3_dlc24_skill_tze_changeling_top_3" },
    fluc_tze_spawn = { -2, false, "wh3_dlc24_skill_tze_changeling_top_3" },
    fluc_tze_vortex_beast = { -2, false, "wh3_dlc24_skill_tze_changeling_top_3" },
  },
}
