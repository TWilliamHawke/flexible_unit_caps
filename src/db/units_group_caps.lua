---@type table<string, { [1]: group_unit_cap, [2]: ai_replacer }>
Flexible_unit_caps.unit_group_caps = {
  fluc_unknown = { 15, "" }, --
  fluc_all_cavalry = { 10, "" },
  fluc_all_chariots_war_machines = { 8, "" },
  fluc_all_flying_units = { 8, "" },
  fluc_all_heavy_infantry = { 10, "" },
  fluc_all_long_range = { 8, "" }, -- includes artillery
  fluc_all_short_range = { 8, "" },
  fluc_all_hybrid_infantry = { 8, "" },
  fluc_all_missiles = { 10, "" },
  fluc_all_rare_creatures = { 8, "" }, --single entities
  fluc_all_monstrous_units = { 10, ""},
  fluc_all_ror = { 6, ""},
  --Beastmen
  fluc_bst_bestigors = { 6, "" },
  fluc_bst_centigors = { 4, "" },
  fluc_bst_cygors = { 4, "" },
  fluc_bst_giants = { 4, "" },
  fluc_bst_gors = { 8, "" },
  fluc_bst_harpies = { 6, "" },
  fluc_bst_hounds = { 6, "" },
  fluc_bst_jabberslythes = { 4, "" },
  fluc_bst_minotaurs = { 6, "" },
  fluc_bst_manticores = { 4, "" },
  fluc_bst_raiders = { 6, "" },
  fluc_bst_razorgors = { 6, "" },
  fluc_bst_spawns = { 6, "" },
  fluc_bst_ungors = { 10, "" },
  --Bretonnia
  fluc_brt_artillery = { 4, "wh_main_brt_inf_men_at_arms" },
  fluc_brt_errant = { 4, "wh_main_brt_inf_men_at_arms" },
  fluc_brt_pegasus = { 4, "wh_dlc07_brt_inf_battle_pilgrims_0" },
  fluc_brt_hippogryph = { 4, "wh_main_brt_cav_pegasus_knights" },
  fluc_brt_grail = { 4, "wh_dlc07_brt_inf_foot_squires_0" },
  fluc_brt_militia = { 10, "" },
  fluc_brt_questing = { 4, "wh_dlc07_brt_inf_foot_squires_0" },
  fluc_brt_peasants = { 10, "wh_main_brt_inf_men_at_arms" },
  fluc_brt_peasant_bowmen = { 6, "wh_main_brt_inf_men_at_arms" },
  fluc_brt_piligrims = { 6, "wh_dlc07_brt_inf_men_at_arms_1" },
  fluc_brt_realm = { 4, "wh_main_brt_cav_mounted_yeomen_0" },
  fluc_brt_squires = { 6, "wh_main_brt_inf_men_at_arms" },
  fluc_brt_yeomen = { 6, "wh_main_brt_inf_spearmen_at_arms" },
  fluc_brt_guardians = { 4, "wh_main_brt_inf_spearmen_at_arms" },
  fluc_brt_questing_vow = { 6, "wh_main_brt_inf_spearmen_at_arms" },
  fluc_brt_knight_vow = { 6, "wh_main_brt_inf_spearmen_at_arms" },
  fluc_brt_grail_vow = { 6, "wh_main_brt_inf_spearmen_at_arms" },

  --Vampire Coast
  fluc_cst_artillery = { 4, "wh2_dlc11_cst_inf_zombie_gunnery_mob_2" },
  fluc_cst_dogs = { 6, "" },
  fluc_cst_bats = { 6, "wh2_dlc11_cst_inf_zombie_deckhands_mob_0" },
  fluc_cst_corpses = { 4, "wh2_dlc11_cst_inf_zombie_deckhands_mob_0" },
  fluc_cst_deck_gunners = { 4, "wh2_dlc11_cst_inf_zombie_gunnery_mob_1" },
  fluc_cst_depth_guard = { 6, "wh2_dlc11_cst_inf_zombie_deckhands_mob_1" },
  fluc_cst_droppers = { 6, "wh2_dlc11_cst_inf_zombie_deckhands_mob_0" },
  fluc_cst_leviathan = { 4, "wh2_dlc11_cst_inf_depth_guard_0" },
  fluc_cst_mobs_melee = { 10, "" },
  fluc_cst_mobs_missile = { 10, "" },
  fluc_cst_mournguls = { 4, "wh2_dlc11_cst_inf_zombie_deckhands_mob_0" },
  fluc_cst_necrofex = { 4, "wh2_dlc11_cst_inf_zombie_gunnery_mob_1" },
  fluc_cst_prometheans = { 4, "wh2_dlc11_cst_inf_zombie_deckhands_mob_0" },
  fluc_cst_syreens = { 6, "wh2_dlc11_cst_inf_depth_guard_0" },
  fluc_cst_terrorgheist = { 6, "wh2_dlc11_cst_inf_depth_guard_0" },
  fluc_cst_sartosa = { 6, "" },
  --Dark Elves
  fluc_def_artillery = { 4, "wh2_main_def_inf_black_ark_corsairs_1" },
  fluc_def_bleakswords = { 8, "" },
  fluc_def_black_guard = { 6, "wh2_main_def_inf_dreadspears_0" },
  fluc_def_chariots = { 4, "wh2_main_def_inf_bleakswords_0" },
  fluc_def_cold_one = { 4, "wh2_main_def_inf_dreadspears_0" },
  fluc_def_cold_one_chariot = { 4, "" },
  fluc_def_corsairs = { 8, "wh2_main_def_inf_bleakswords_0" },
  fluc_def_dark_riders = { 6, "wh2_main_def_inf_dreadspears_0" },
  fluc_def_darkshards = { 6, "wh2_main_def_inf_bleakswords_0" },
  fluc_def_doomfire = { 4, "wh2_main_def_inf_bleakswords_0" },
  fluc_def_dreadspears = { 10, "wh2_main_def_inf_bleakswords_0" },
  fluc_def_dragons = { 4, "wh2_dlc10_def_mon_feral_manticore_0" },
  fluc_def_executioners = { 6, "wh2_main_def_inf_bleakswords_0" },
  fluc_def_hydra = { 4, "wh2_main_def_inf_black_ark_corsairs_0" },
  fluc_def_harpies = { 6, "wh2_main_def_inf_bleakswords_0" },
  fluc_def_manticores = { 4, "wh2_main_def_inf_harpies" },
  fluc_def_medusa = { 4, "wh2_main_def_inf_bleakswords_0" },
  fluc_def_monsters = { 4, "" },
  fluc_def_scourgerunner = { 4, "" },
  fluc_def_shades = { 6, "wh2_main_def_inf_darkshards_0" },
  fluc_def_sisters = { 6, "wh2_main_def_inf_bleakswords_0" },
  fluc_def_witch_elves = { 6, "wh2_main_def_inf_bleakswords_0" },
  --Dwarfs
  fluc_dwf_artillery = { 4, "wh_main_dwf_inf_miners_1" },
  fluc_dwf_artillery_classic = { 4, "" },
  fluc_dwf_artillery_fire = { 4, "" },
  fluc_dwf_artillery_gun = { 4, "" },
  fluc_dwf_elo_attack = { 6, "wh_main_dwf_inf_miners_0_grey_supply" },
  fluc_dwf_elo_defence = { 6, "wh_main_dwf_inf_miners_0_grey_supply" },
  fluc_dwf_flying_machine = { 4, "" },
  fluc_dwf_golem = { 4, "wh_main_dwf_inf_dwarf_warrior_0" },
  fluc_dwf_hammerers = { 6, "wh_main_dwf_inf_dwarf_warrior_1" },
  fluc_dwf_huskarls = { 6, "wh_main_dwf_inf_dwarf_warrior_0" },
  fluc_dwf_ironbreakers = { 6, "wh_main_dwf_inf_dwarf_warrior_0" },
  fluc_dwf_irondrakes = { 4, "wh_main_dwf_inf_miners_1" },
  fluc_dwf_land_machine = { 4, "" },
  fluc_dwf_longbeards = { 8, "wh_main_dwf_inf_dwarf_warrior_0" },
  fluc_dwf_miners = { 10, "" },
  fluc_dwf_quarrellers = { 6, "wh_main_dwf_inf_miners_0" },
  fluc_dwf_rangers = { 6, "wh_main_dwf_inf_miners_0" },
  fluc_dwf_slayers = { 8, "wh_main_dwf_inf_dwarf_warrior_1" },
  fluc_dwf_thunderers = { 6, "wh_main_dwf_inf_miners_1" },
  fluc_dwf_war_machines = { 4, "wh_main_dwf_inf_dwarf_warrior_0" },
  fluc_dwf_warriors = { 10, "" },
  -- Empire
  fluc_emp_archers = { 6, "wh_main_emp_inf_spearmen_0" },
  fluc_emp_artillery = { 4, "wh2_dlc13_emp_veh_war_wagon_0" },
  fluc_emp_artillery_wagon = { 4, "" },
  fluc_emp_blazing_sun = { 4, "" },
  fluc_emp_crossbowmen = { 6, "" },
  fluc_emp_demigryph = { 4, "" },
  fluc_emp_flagellants = { 8, "" },
  fluc_emp_free_company = { 6, "wh_main_emp_inf_swordsmen" },
  fluc_emp_fooot_knights = { 6, "wh_main_emp_inf_swordsmen" },
  fluc_emp_foot_reiksguard = { 6, "wh_main_emp_inf_swordsmen" },
  fluc_emp_greatswords = { 6, "wh_main_emp_inf_swordsmen" },
  fluc_emp_halberdiers = { 8, "" },
  fluc_emp_handgunners = { 6, "wh_main_emp_inf_swordsmen" },
  fluc_emp_huntsmen = { 6, "" },
  fluc_emp_knight_white_wolf = { 4, "" },
  fluc_emp_knights_emp = { 4, "" },
  fluc_emp_knights_orders = { 4, "wh_main_emp_inf_spearmen_1" },
  fluc_emp_magic_machines = { 4, "wh_main_emp_inf_swordsmen" },
  fluc_emp_outriders = { 6, "wh_main_emp_inf_spearmen_0" },
  fluc_emp_reiksguard = { 4, "wh_main_emp_inf_swordsmen" },
  fluc_emp_rhya = { 4, "wh_main_emp_inf_swordsmen" },
  fluc_emp_swordsmen = { 10, "" },
  fluc_emp_spearmen = { 10, "" },
  fluc_emp_taal_cult = { 4, "wh_main_emp_inf_swordsmen" },
  fluc_emp_tank = { 4, "wh_main_emp_inf_greatswords" },
  fluc_emp_ulric_cult = { 6, "" },
  fluc_emp_wagon = { 4, "wh_main_emp_inf_spearmen_1" },
  --Greenskins
  fluc_grn_arachnarok = { 4, "wh_main_grn_mon_trolls" },
  fluc_grn_artillery = { 4, "wh_main_grn_inf_orc_boyz" },
  fluc_grn_big_uns = { 8, "wh_main_grn_inf_orc_boyz" },
  fluc_grn_big_uns_boar = { 4, "wh_main_grn_inf_orc_boyz" },
  fluc_grn_black_orcs = { 6, "wh_main_grn_inf_orc_boyz" },
  fluc_grn_boyz = { 10, "" }, --core units
  fluc_grn_chariots = { 4, "wh_main_grn_inf_orc_boyz" },
  fluc_grn_giants = { 4, "wh_main_grn_mon_trolls" },
  fluc_grn_goblin_riderz = { 6, "wh_main_grn_inf_goblin_spearmen" },
  fluc_grn_goblins = { 10, "" }, --core units
  fluc_grn_goblin_archers = { 6, "wh_main_grn_inf_goblin_spearmen" },
  fluc_grn_night_goblins = { 8, "" }, --core units
  fluc_grn_orc_archers = { 6, "wh_main_grn_inf_orc_boyz" },
  fluc_grn_other_monsters = { 4, "wh_dlc06_grn_inf_squig_herd_0" },
  fluc_grn_savage = { 8, "" },
  fluc_grn_savage_boar = { 4, "wh_main_grn_inf_savage_orcs" },
  fluc_grn_squig = { 6, "" },
  fluc_grn_trolls = { 6, "wh_main_grn_inf_orc_boyz" },
  fluc_grn_wagon = { 4, "" },
  fluc_grn_wyverns = { 4, "" },
  --Hight Elves
  fluc_hef_avelorn = { 4, "wh2_main_hef_inf_lothern_sea_guard_1" },
  fluc_hef_archers = { 6, "wh2_main_hef_inf_spearmen_0" },
  fluc_hef_chariots = { 4, "wh2_main_hef_inf_spearmen_0" },
  fluc_hef_dragons = { 4, "wh2_main_hef_mon_great_eagle" },
  fluc_hef_dragon_princes = { 4, "wh2_main_hef_cav_ellyrian_reavers_0" },
  fluc_hef_eagles = { 6, "" },
  fluc_hef_lion_chariots = { 4, "wh2_main_hef_inf_spearmen_0" },
  fluc_hef_lion_inf = { 8, "wh2_dlc15_hef_inf_rangers_0" },
  fluc_hef_lions = { 6, "wh2_dlc15_hef_inf_rangers_0" },
  fluc_hef_mistwalkers = { 8, "wh2_main_hef_inf_spearmen_0" },
  fluc_hef_phoenix_guard = { 6, "wh2_dlc15_hef_inf_silverin_guard_0" },
  fluc_hef_phoenixes = { 4, "wh2_main_hef_mon_great_eagle" },
  fluc_hef_reavers = { 6, "wh2_main_hef_inf_spearmen_0" },
  fluc_hef_sea_guard = { 8, "wh2_main_hef_inf_spearmen_0" },
  fluc_hef_silver_helms = { 4, "wh2_main_hef_inf_spearmen_0" },
  fluc_hef_stealth_archers = { 6, "wh2_main_hef_inf_lothern_sea_guard_0" },
  fluc_hef_spearmen = { 10, "" },
  fluc_hef_swordmasters = { 6, "wh2_dlc15_hef_inf_rangers_0" },
  fluc_hef_swordsmen = { 10, "wh2_main_hef_inf_spearmen_0" },
  fluc_hef_trees = { 6, "wh2_dlc15_hef_inf_rangers_0" },
  --Lizardmen
  fluc_lzd_bastiladons = { 4, "wh2_main_lzd_cav_cold_ones_feral_0" },
  fluc_lzd_carnosaurs = { 4, "wh2_main_lzd_inf_saurus_spearmen_1" },
  fluc_lzd_chameleons = { 6, "wh2_main_lzd_inf_skink_cohort_1" },
  fluc_lzd_coatl = { 4, "wh2_main_lzd_inf_saurus_warriors_0" },
  fluc_lzd_cold_one = { 4, "wh2_main_lzd_cav_cold_ones_feral_0" },
  fluc_lzd_feral_cold_one = { 6, "" },
  fluc_lzd_dread_saurian = { 4, "wh2_main_lzd_cav_cold_ones_feral_0" },
  fluc_lzd_kroxigors = { 6, "wh2_main_lzd_inf_saurus_warriors_0" },
  fluc_lzd_razordons = { 6, "wh2_main_lzd_inf_skink_cohort_1" },
  fluc_lzd_ripperdactyl = { 4, "wh2_main_lzd_inf_saurus_warriors_0" },
  fluc_lzd_salamanders = { 6, "wh2_main_lzd_inf_skink_cohort_1" },
  fluc_lzd_saurus = { 8, "" },
  fluc_lzd_skinks = { 10, "" },
  fluc_lzd_stegadons = { 4, "wh2_main_lzd_cav_cold_ones_feral_0" },
  fluc_lzd_temple_guards = { 6, "wh2_main_lzd_inf_saurus_spearmen_1" },
  fluc_lzd_teranodons = { 6, "wh2_main_lzd_inf_skink_cohort_1" },
  fluc_lzd_troglodons = { 4, "wh2_main_lzd_inf_skink_cohort_1" },
  --Norsca
  fluc_nor_berserkers = { 8, "wh_dlc08_nor_inf_marauder_spearman_0" },
  fluc_nor_dinos = { 4, "wh_main_nor_mon_chaos_warhounds_0" },
  fluc_nor_chariots = { 4, "wh_dlc08_nor_inf_marauder_spearman_0" },
  fluc_nor_fimirs = { 6, "wh_dlc08_nor_inf_marauder_spearman_0" },
  fluc_nor_flying_beasts = { 4, "wh_main_nor_mon_chaos_warhounds_0" },
  fluc_nor_giants = { 4, "wh_main_nor_mon_chaos_trolls" },
  fluc_nor_horsemen = { 6, "wh_main_nor_inf_chaos_marauders_0" },
  fluc_nor_hounds = { 6, "wh_main_nor_inf_chaos_marauders_0" },
  fluc_nor_mammoths = { 4, "wh_dlc08_nor_mon_warwolves_0" },
  fluc_nor_marauders = { 10, "" },
  fluc_nor_marauder_hunters = { 6, "wh_main_nor_inf_chaos_marauders_0" },
  fluc_nor_marauder_champions = { 6, "wh_main_nor_inf_chaos_marauders_0" },
  fluc_nor_skinwolves = { 6, "wh_main_nor_mon_chaos_warhounds_0" },
  fluc_nor_trolls = { 6, "wh_main_nor_inf_chaos_marauders_0" },
  --Skaven
  fluc_skv_abomination = { 4, "wh2_main_skv_inf_stormvermin_0" },
  fluc_skv_artillery = { 6, "wh2_main_skv_inf_night_runners_0" },
  fluc_skv_brood_horror = { 4, "wh2_dlc16_skv_mon_wolf_rats_0" },
  fluc_skv_catapults = { 4, "" },
  fluc_skv_clanrats = { 10, "" },
  fluc_skv_doomwheel_flayer = { 4, "wh2_main_skv_inf_stormvermin_1" },
  fluc_skv_globadiers = { 4, "wh2_main_skv_inf_night_runners_0" },
  fluc_skv_jezzails = { 4, "wh2_main_skv_inf_gutter_runner_slingers_0" },
  fluc_skv_lightning = { 4, "" },
  fluc_skv_melee_runners = { 6, "wh2_main_skv_inf_clanrats_0" },
  fluc_skv_missile_runners = { 6, "wh2_main_skv_inf_night_runners_1" },
  fluc_skv_monsters = { 4, "wh2_dlc16_skv_mon_wolf_rats_0" },
  fluc_skv_mortars = { 4, "" },
  fluc_skv_neck_cutters = { 4, "wh2_main_skv_inf_clanrats_1" },
  fluc_skv_plague_monks = { 6, "wh2_main_skv_inf_clanrats_1" },
  fluc_skv_ratlings = { 4, "wh2_main_skv_inf_night_runners_0" },
  fluc_skv_ratogre_mutants = { 4, "wh2_dlc16_skv_mon_wolf_rats_0" },
  fluc_skv_ratogres = { 6, "wh2_dlc16_skv_mon_wolf_rats_0" },
  fluc_skv_slaves = { 10, "" },
  fluc_skv_stormfiend = { 4, "wh2_main_skv_mon_rat_ogres" },
  fluc_skv_stormvermin = { 8, "wh2_main_skv_inf_clanrats_0" },
  fluc_skv_triads = { 8, "wh2_main_skv_inf_clanrat_spearmen_1" },
  fluc_skv_warp_grinder = { 4, "wh2_main_skv_inf_clanrats_1" },
  fluc_skv_warpfire_thrower = { 4, "wh2_main_skv_inf_clanrats_1" },
  fluc_skv_weapon_teams = { 8, "" },
  fluc_skv_wolf_rats = { 6, "wh2_main_skv_inf_clanrats_0" },
  --Tomb Kings
  fluc_tmb_artillery = { 4, "" },
  fluc_tmb_archers = { 6, "" },
  fluc_tmb_chariots = { 6, "" },
  fluc_tmb_carrions = { 6, "" },
  fluc_tmb_giants = { 4, "" },
  fluc_tmb_horsemen = { 6, "" },
  fluc_tmb_hierotitans = { 4, "" },
  fluc_tmb_necropolis_knights = { 4, "" },
  fluc_tmb_scorpions = { 4, "" },
  fluc_tmb_skeleton_spearmen = { 10, "" },
  fluc_tmb_skeleton_swordsmen = { 10, "" },
  fluc_tmb_sphinxes = { 4, "" },
  fluc_tmb_stalkers = { 4, "" },
  fluc_tmb_tomb_guard = { 6, "" },
  fluc_tmb_ushabti = { 6, "" },
  fluc_tmb_vampires = { 8, "" },
  fluc_tmb_warriors = { 8, "" },

  --Vampire counts
  fluc_vmp_black_knights = { 4, "wh_main_vmp_inf_skeleton_warriors_0" },
  fluc_vmp_blood_knights = { 4, "wh_main_vmp_cav_black_knights_0" },
  fluc_vmp_crypt_horrors = { 6, "wh_main_vmp_inf_crypt_ghouls" },
  fluc_vmp_wolves = { 6, "wh_main_vmp_inf_zombie" },
  fluc_vmp_bats = { 6, "wh_main_vmp_inf_zombie" },
  fluc_vmp_ghost_cav = { 4, "wh_main_vmp_cav_black_knights_0" },
  fluc_vmp_ghosts = { 4, "wh_main_vmp_inf_crypt_ghouls" },
  fluc_vmp_ghouls = { 10, "wh_main_vmp_inf_zombie" },
  fluc_vmp_grave_guard = { 6, "wh_main_vmp_inf_skeleton_warriors_0" },
  fluc_vmp_lahmian = { 6, "wh_main_vmp_inf_skeleton_warriors_0" },
  fluc_vmp_machines = { 4, "wh_main_vmp_inf_zombie" },
  fluc_vmp_mortals = { 10, "" },
  fluc_vmp_skeletons = { 10, "" },
  fluc_vmp_terrorgheist = { 4, "wh_main_vmp_mon_fell_bats" },
  fluc_vmp_undead = { 10, "wh_main_vmp_inf_skeleton_warriors_0" },
  fluc_vmp_vampiress = { 4, "wh_main_vmp_inf_skeleton_warriors_0" },
  fluc_vmp_vargheists = { 4, "wh_main_vmp_mon_fell_bats" },
  fluc_vmp_varghulf = { 4, "wh_main_vmp_mon_dire_wolves" },
  fluc_vmp_zombies = { 10, "" },
  --Wood elves
  fluc_wef_archers = { 8, "wh_dlc05_wef_inf_eternal_guard_0" }, --for ai
  fluc_wef_deepwood_scouts = { 6, "wh_dlc05_wef_inf_glade_guard_0" },
  fluc_wef_dragons = { 4, "wh_dlc05_wef_mon_great_eagle_0" },
  fluc_wef_dryads = { 10, "" },
  fluc_wef_eternal_guard = { 10, "" },
  fluc_wef_feral = { 6, "wh2_dlc16_wef_mon_wolves_0" },
  fluc_wef_glade_guard = { 6, "wh_dlc05_wef_inf_eternal_guard_0" },
  fluc_wef_hawks = { 4, "wh_dlc05_wef_inf_eternal_guard_1" },
  fluc_wef_light_cav = { 6, "wh_dlc05_wef_inf_glade_guard_0" },
  fluc_wef_rangers = { 6, "wh_dlc05_wef_inf_eternal_guard_1" },
  fluc_wef_sisters_thorn = { 4, "wh_dlc05_wef_inf_eternal_guard_1" },
  fluc_wef_stag_cav = { 4, "wh_dlc05_wef_inf_eternal_guard_1" },
  fluc_wef_treekin = { 6, "wh_dlc05_wef_inf_dryads_0" },
  fluc_wef_treemen = { 4, "wh_dlc05_wef_inf_dryads_0" },
  fluc_wef_wardancers = { 8, "wh_dlc05_wef_inf_wardancers_0" },
  fluc_wef_waywatchers = { 6, "wh_dlc05_wef_inf_wardancers_0" },
  fluc_wef_zoats = { 4, "wh_dlc05_wef_inf_wildwood_rangers_0" },
  --Kislev
  fluc_ksl_kossars = { 10, "" },
  fluc_ksl_armored_kossars = { 8, "wh3_main_ksl_inf_kossars_0" },
  fluc_ksl_horse_raiders = { 6, "wh3_main_ksl_inf_kossars_0" },
  fluc_ksl_winged_lancers = { 4, "wh3_main_ksl_cav_horse_raiders_0" },
  fluc_ksl_leopards = { 4, "wh3_main_ksl_cav_horse_raiders_0" },
  fluc_ksl_streltsi = { 6, "wh3_main_ksl_inf_kossars_0" },
  fluc_ksl_tzar_guard = { 6, "wh3_main_ksl_inf_kossars_0" },
  fluc_ksl_war_sled = { 4, "wh3_main_ksl_cav_horse_raiders_0" },
  fluc_ksl_artillery = { 4, "wh3_main_pro_ksl_inf_streltsi_0" },
  fluc_ksl_elemental = { 4, "wh3_main_ksl_mon_snow_leopard_0" },
  fluc_ksl_ice_guard = { 6, "wh3_main_ksl_inf_kossars_0" },
  fluc_ksl_bear_riders = { 4, "wh3_main_ksl_cav_horse_raiders_0" },
  --Ogres
  fluc_ogr_ogres = { 10, "" },
  fluc_ogr_gnoblars = { 10, "" },
  fluc_ogr_gorgers = { 6, "wh3_main_ogr_mon_sabretusk_pack_0" },
  fluc_ogr_sabretusk = { 6, "wh3_main_ogr_inf_gnoblars_0" },
  fluc_ogr_ironguts = { 8, "wh3_main_ogr_inf_ogres_0" },
  fluc_ogr_mournfang = { 4, "wh3_main_ogr_inf_ogres_0" },
  fluc_ogr_maneaters = { 6, "wh3_main_ogr_inf_ogres_0" },
  fluc_ogr_giant = { 4, "wh3_main_ogr_mon_gorgers_0" },
  fluc_ogr_leadbelchers = { 4, "wh3_main_ogr_inf_ogres_0" },
  fluc_ogr_crushers = { 4, "wh3_main_ogr_inf_ogres_0" },
  fluc_ogr_stonehorn = { 4, "wh3_main_ogr_mon_sabretusk_pack_0" },
  fluc_ogr_artillery = { 4, "wh3_main_ogr_inf_ogres_0" },
  --Cathay
  fluc_cth_artillery = { 4, "wh3_main_cth_inf_iron_hail_gunners_0" },
  fluc_cth_peasants = { 10, "" },
  fluc_cth_jade_warriors = { 8, "wh3_main_cth_inf_peasant_spearmen_1" },
  fluc_cth_archers = { 6, "wh3_main_cth_inf_peasant_spearmen_1" },
  fluc_cth_horsemen = { 6, "wh3_main_cth_inf_peasant_spearmen_1" },
  fluc_cth_crossbowmen = { 6, "wh3_main_cth_inf_peasant_archers_0" },
  fluc_cth_jade_lancers = { 4, "wh3_main_cth_cav_peasant_horsemen_0" },
  fluc_cth_war_machines = { 4, "wh3_main_cth_inf_jade_warriors_0" },
  fluc_cth_dragon_guard = { 6, "wh3_main_cth_inf_peasant_spearmen_1" },
  fluc_cth_hail_gunners = { 6, "wh3_main_cth_inf_peasant_archers_0" },
  fluc_cth_crain_gunners = { 4, "wh3_main_cth_inf_peasant_archers_0" },
  fluc_cth_longma = { 4, "wh3_main_cth_cav_jade_lancers_0" },
  fluc_cth_terracotta = { 4, "wh3_main_cth_inf_jade_warriors_0" },
  --Khorne
  fluc_kho_furies = { 6, "wh3_dlc20_chs_cav_marauder_horsemen_mkho_throwing_axes" },
  fluc_kho_horsemen = { 6, "wh3_dlc20_chs_inf_chaos_marauders_mkho" },
  fluc_kho_hounds = { 6, "wh3_dlc20_chs_inf_chaos_marauders_mkho" },
  fluc_kho_forsaken = { 8, "wh3_dlc20_chs_inf_chaos_marauders_mkho" },
  fluc_kho_warriors = { 6, "wh3_dlc20_chs_inf_chaos_marauders_mkho_dualweapons" },
  fluc_kho_chosen = { 4, "wh3_main_kho_inf_chaos_warriors_0" },
  fluc_kho_war_machines = { 6, "wh3_dlc20_chs_cav_marauder_horsemen_mkho_throwing_axes" },
  fluc_kho_bloodletters = { 8, "wh3_dlc20_chs_inf_forsaken_mkho" },
  fluc_kho_bloodthirster = { 4, "wh3_main_kho_inf_bloodletters_1" },
  fluc_kho_knights = { 4, "wh3_dlc20_chs_cav_marauder_horsemen_mkho_throwing_axes" },
  fluc_kho_crushers = { 4, "wh3_dlc20_chs_cav_chaos_knights_mkho" },
  fluc_kho_khornataurs = { 4, "wh3_main_kho_inf_chaos_warriors_1" },
  fluc_kho_soul_grinder = { 4, "wh3_main_kho_mon_spawn_of_khorne_0" },
  fluc_kho_spawn = { 6, "wh3_dlc20_chs_inf_forsaken_mkho" },
  --Slaanesh
  fluc_sla_furies = { 6, "wh3_dlc20_chs_cav_marauder_horsemen_msla_javelins" },
  fluc_sla_horsemen = { 6, "wh3_dlc20_chs_inf_chaos_marauders_msla" },
  fluc_sla_forsaken = { 8, "wh3_dlc20_chs_inf_chaos_marauders_msla" },
  fluc_sla_warriors = { 6, "wh3_dlc20_chs_inf_chaos_marauders_msla_hellscourges" },
  fluc_sla_chosen = { 4, "wh3_dlc20_chs_inf_chaos_warriors_msla_hellscourges" },
  fluc_sla_war_machines = { 6, "wh3_dlc20_chs_cav_marauder_horsemen_msla_javelins" },
  fluc_sla_daemonette = { 8, "wh3_dlc20_chs_inf_forsaken_msla" },
  fluc_sla_keeper = { 4, "wh3_main_sla_inf_daemonette_1" },
  fluc_sla_knights = { 4, "wh3_dlc20_chs_cav_marauder_horsemen_msla_javelins" },
  fluc_sla_fiends = { 4, "wh3_main_sla_inf_marauders_0" },
  fluc_sla_seekers = { 4, "wh3_main_sla_cav_hellstriders_0" },
  fluc_sla_soul_grinder = { 4, "wh3_main_sla_mon_spawn_of_slaanesh_0" },
  fluc_sla_spawn = { 6, "wh3_dlc20_chs_inf_forsaken_msla" },
  --Nurgle
  fluc_nur_nurglings = { 10, "" },
  fluc_nur_furies = { 6, "wh3_dlc20_chs_cav_marauder_horsemen_mnur_throwing_axes" },
  fluc_nur_horsemen = { 6, "wh3_dlc20_chs_inf_chaos_marauders_mnur" },
  fluc_nur_toads = { 6, "wh3_main_nur_inf_nurglings_0" },
  fluc_nur_forsaken = { 8, "wh3_dlc20_chs_inf_chaos_marauders_mnur" },
  fluc_nur_warriors = { 6, "wh3_dlc20_chs_inf_chaos_warriors_mnur" },
  fluc_nur_chosen = { 4, "wh3_dlc20_chs_inf_chaos_warriors_mnur" },
  fluc_nur_war_machines = { 6, "wh3_dlc20_chs_cav_marauder_horsemen_mnur_throwing_axes" },
  fluc_nur_plaguebearers = { 8, "wh3_main_nur_inf_nurglings_0" },
  fluc_nur_unclean_one = { 4, "wh3_main_nur_inf_plaguebearers_0" },
  fluc_nur_knights = { 4, "wh3_dlc20_chs_cav_marauder_horsemen_mnur_throwing_axes" },
  fluc_nur_flies = { 4, "wh3_main_nur_inf_nurglings_0" },
  fluc_nur_beasts = { 4, "wh3_main_nur_inf_nurglings_0" },
  fluc_nur_soul_grinder = { 4, "wh3_main_nur_mon_spawn_of_nurgle_0" },
  fluc_nur_spawn = { 6, "wh3_main_nur_inf_forsaken_0" },
  --Tzeench
  fluc_tze_blue_horrors = { 10, "" },
  fluc_tze_furies = { 6, "wh3_dlc20_chs_cav_marauder_horsemen_mtze_javelins" },
  fluc_tze_horsemen = { 6, "wh3_dlc20_chs_inf_chaos_marauders_mtze" },
  fluc_tze_screamers = { 6, "wh3_main_tze_inf_blue_horrors_0" },
  fluc_tze_forsaken = { 8, "wh3_dlc20_chs_inf_chaos_marauders_mtze" },
  fluc_tze_warriors = { 6, "wh3_dlc20_chs_inf_chaos_marauders_mtze" },
  fluc_tze_chosen = { 4, "wh3_dlc20_chs_inf_chaos_warriors_mtze" },
  fluc_tze_war_machines = { 6, "wh3_dlc20_chs_cav_marauder_horsemen_mtze_javelins" },
  fluc_tze_pink_horrors = { 8, "wh3_main_tze_inf_blue_horrors_0" },
  fluc_tze_doom_knights = { 4, "wh3_main_tze_cav_chaos_knights_0" },
  fluc_tze_lord_of_change = { 4, "wh3_main_tze_inf_pink_horrors_0" },
  fluc_tze_knights = { 4, "wh3_dlc20_chs_cav_marauder_horsemen_mtze_javelins" },
  fluc_tze_flamers = { 4, "wh3_main_tze_inf_blue_horrors_0" },
  fluc_tze_soul_grinder = { 4, "wh3_main_tze_mon_spawn_of_tzeentch_0" },
  fluc_tze_spawn = { 6, "wh3_main_tze_inf_forsaken_0" },
  --Chaos Warriors
  fluc_chs_marauder = { 10, "" },
  fluc_chs_furies = { 6, "wh_main_chs_cav_marauder_horsemen_0" },
  fluc_chs_giants = { 4, "wh_main_chs_mon_trolls" },
  fluc_chs_champions = { 4, "wh_main_chs_inf_chaos_warriors_0" },
  fluc_chs_horsemen = { 6, "wh_main_chs_inf_chaos_marauders_0" },
  fluc_chs_hounds = { 6, "wh_main_chs_inf_chaos_marauders_0" },
  fluc_chs_trolls = { 6, "wh_main_chs_inf_chaos_marauders_1" },
  fluc_chs_forsaken = { 8, "wh_main_chs_inf_chaos_marauders_0" },
  fluc_chs_war_machines = { 4, "wh_main_chs_inf_chaos_marauders_0" },
  fluc_chs_dragon_ogres = { 6, "wh_main_chs_mon_trolls" },
  fluc_chs_shaggoths = { 4, "wh_dlc01_chs_mon_dragon_ogre" },
  fluc_chs_knights = { 4, "wh_main_chs_cav_marauder_horsemen_0" },
  fluc_chs_spawn = { 4, "wh_dlc01_chs_inf_forsaken_0" },
  fluc_chs_warriors = { 6, "wh_main_chs_inf_chaos_marauders_0" },
  fluc_chs_chosen = { 4, "wh_main_chs_inf_chaos_warriors_0" },
  fluc_chs_daemons = { 8, "" }, --tooltip only
  fluc_chs_greater_daemons = { 4, "" }, --tooltip only
  --Chaos dwarfs
  fluc_chd_labourers = { 10, "" },
  fluc_chd_hobgoblins = { 8, "" },
  fluc_chd_hobgoblin_archers = { 6, "wh3_dlc23_chd_inf_hobgoblin_cutthroats" },
  fluc_chd_hobgoblin_raiders = { 6, "wh3_dlc23_chd_inf_hobgoblin_cutthroats" },
  fluc_chd_warriors = { 8, "" },
  fluc_chd_infernal_guard = { 6, "wh3_dlc23_chd_inf_chaos_dwarf_warriors" },
  fluc_chd_blunderbusses = { 6, "fluc_chd_hobgoblin_archers" },
  fluc_chd_fireglaves = { 4, "fluc_chd_hobgoblin_archers" },
  fluc_chd_ironsworn = { 4, "wh3_dlc23_chd_inf_chaos_dwarf_warriors" },
  fluc_chd_bull_centaurs = { 4, "wh3_dlc23_chd_cav_hobgoblin_wolf_raiders_spears" },
  fluc_chd_mortires = { 4, "wh3_dlc23_chd_veh_iron_daemon" },
  fluc_chd_cannons = { 4, "wh3_dlc23_chd_veh_iron_daemon" },
  fluc_chd_hellcannon = { 4, "wh3_dlc23_chd_veh_iron_daemon" },
  fluc_chd_irondaemons = { 4, "wh3_dlc23_chd_inf_chaos_dwarf_warriors" },
  fluc_chd_taurus = { 4, "wh3_dlc23_chd_inf_chaos_dwarf_warriors_great_weapons" },
  fluc_chd_fireborn = { 6, "wh3_dlc23_chd_inf_chaos_dwarf_warriors_great_weapons" },
  fluc_chd_destroyer = { 4, "fluc_chd_destroyer" },
  
}
