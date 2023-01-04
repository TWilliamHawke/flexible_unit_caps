--lord name from lords_aliases.lua
--unit group name from localisation table
--skills key from db/character_skills_tables
---@alias lord_skill_data {[1]: number, [2]:string, [3]:string| nil}

---@type table<string, table<string, lord_skill_data >>
Flexible_unit_caps.lord_skills_discount = {
  --empire
  Hunter = {
    fluc_emp_huntsmen = { -1, "wh2_dlc13_skill_emp_hunts_marshal_unique_1" },
    fluc_emp_archers = { -1, "wh2_dlc13_skill_emp_hunts_marshal_unique_1" },
    fluc_emp_greatswords = { -1, "wh2_dlc13_skill_emp_hunts_marshal_unique_0" },
    fluc_emp_halberdiers = { -1, "wh2_dlc13_skill_emp_hunts_marshal_unique_0" },
  },
  Gelt = {
    fluc_emp_outriders = { -1, "wh_dlc08_skill_emp_lord_unique_balthasar_unique_2" },
    fluc_emp_handgunners = { -1, "wh_dlc08_skill_emp_lord_unique_balthasar_unique_2" },
    fluc_emp_magic_machines = { -1, "wh_dlc08_skill_emp_lord_unique_balthasar_unique_3" },
    fluc_emp_tank = { -1, "wh_dlc08_skill_emp_lord_unique_balthasar_unique_3" },
  },
  Ulric = {
    fluc_emp_ulric_cult = { -2, "ulric_cult_of_ulric_stats" },
  },
  Elspeth = {
    fluc_emp_artillery = { -2, "mixu_emp_elspeth_von_draken_special_guns_of_nuln" },
    fluc_emp_artillery_wagon = { -2, "mixu_emp_elspeth_von_draken_special_guns_of_nuln" },
  },
  Helborg = {
    fluc_emp_reiksguard = { -1, "skill_emp_lord_unique_campaign_kurt_helborg_grand_order" },
    fluc_emp_greatswords = { -1, "skill_emp_lord_unique_campaign_kurt_helborg_for_emperor" },
    fluc_emp_halberdiers = { -1, "skill_emp_lord_unique_campaign_kurt_helborg_reiksguard_supply" },
    fluc_emp_handgunners = { -1, "skill_emp_lord_unique_campaign_kurt_helborg_reiksguard_supply" },
  },
  Whitedwarf = {
    fluc_dwf_irondrakes = { -2, "wh2_dlc17_dwf_grombrindal_unique_rouse_the_engineers" },
    fluc_dwf_artillery_classic = { -1, "wh2_dlc17_dwf_grombrindal_unique_rouse_the_engineers" },
    fluc_dwf_artillery_gun = { -1, "wh2_dlc17_dwf_grombrindal_unique_rouse_the_engineers" },
    fluc_dwf_flying_machine = { -2, "wh2_dlc17_dwf_grombrindal_unique_rouse_the_engineers" },
    fluc_dwf_land_machine = { -2, "wh2_dlc17_dwf_grombrindal_unique_rouse_the_engineers" },
  },
  Belegar = {
    fluc_dwf_rangers = { -2, "wh2_dlc17_dwf_belegar_unique_tunnel_warfare" },
  },
  Thorgrim = {
    fluc_dwf_artillery_classic = { -2, "wh_dlc08_skill_dwf_lord_thorgrim_unique_2" },
    fluc_dwf_artillery_gun = { -2, "wh_dlc08_skill_dwf_lord_thorgrim_unique_2" },
    fluc_dwf_artillery_fire = { -2, "wh_dlc08_skill_dwf_lord_thorgrim_unique_2" },
  },
  Byrnoth = {
    fluc_dwf_artillery_fire = { -2, "parte_skill_dwf_byrrnoth_grundadrakk_unique_zul_barag" },
    fluc_dwf_artillery_gun = { -2, "parte_skill_dwf_byrrnoth_grundadrakk_unique_zul_barag" },
    fluc_dwf_artillery_classic = { -2, "parte_skill_dwf_byrrnoth_grundadrakk_unique_zul_barag" },
    fluc_dwf_longbeards = { -1, "parte_skill_dwf_byrrnoth_grundadrakk_unique_glory_of_the_ancestors" },
    fluc_dwf_hammerers = { -1, "parte_skill_dwf_byrrnoth_grundadrakk_unique_glory_of_the_ancestors" },
  },
  GreyBeard = {
    fluc_dwf_artillery_gun = { -2, "elo_greybeard_automatization" },
    fluc_dwf_artillery_fire = { -2, "elo_greybeard_automatization" },
    fluc_dwf_artillery_classic = { -2, "elo_greybeard_automatization" },
  },
  Goblin = {
    fluc_grn_goblins = { -1, "wh_dlc06_skill_grn_lord_battle_ard_ladz" },
    fluc_grn_goblin_riderz = { -1, "wh_dlc06_skill_grn_lord_battle_ard_ladz" },
    fluc_grn_night_goblins = { -1, "wh_dlc06_skill_grn_lord_battle_ard_ladz" },
    fluc_grn_squig = { -1, "wh_dlc06_skill_grn_lord_battle_riderz" },
  },
  Azhag = {
    fluc_grn_big_uns_boar = { -2, "wh_dlc08_skill_grn_azhag_unique_0" },
    fluc_grn_big_uns = { -2, "wh_dlc08_skill_grn_azhag_unique_0" },
    fluc_grn_savage = { -2, "wh_dlc08_skill_grn_azhag_unique_0" },
    fluc_grn_savage_boar = { -2, "wh_dlc08_skill_grn_azhag_unique_0" },
  },
  Wurzag = {
    fluc_grn_trolls = { -2, "wh2_dlc15_skill_unique_grn_wurrzag_colossal_warpaint" },
    fluc_grn_giants = { -2, "wh2_dlc15_skill_unique_grn_wurrzag_colossal_warpaint" },
    fluc_def_hydra = { -2, "wh2_dlc15_skill_unique_grn_wurrzag_colossal_warpaint" },
    fluc_grn_arachnarok = { -2, "wh2_dlc15_skill_unique_grn_wurrzag_colossal_warpaint" },
  },
  Forest = {
    fluc_grn_arachnarok = { -2, "ws_skill_tinitt_foureyes_ancient_behemoths" },
  },
  ws_sporctacus = {
    fluc_def_hydra = { -2, "ws_skill_sporctacus_solid_snekz" },
  },
  Isabella = {
    fluc_vmp_vargheists = { -2, "wh2_dlc11_skill_vmp_isabella_unique_5" },
    fluc_vmp_varghulf = { -2, "wh2_dlc11_skill_vmp_isabella_unique_5" },
    fluc_vmp_terrorgheist = { -2, "wh2_dlc11_skill_vmp_isabella_unique_5" },
  },
  Kemler = {
    fluc_vmp_ghosts = { -2, "wh2_dlc17_skill_vmp_heinrich_kemmler_unique_wightblades" },
    fluc_vmp_ghost_cav = { -2, "wh2_dlc17_skill_vmp_heinrich_kemmler_unique_wightblades" },
  },
  Carstain = {
    fluc_vmp_vargheists = { -2, "wh2_dlc11_skill_vmp_bloodline_von_carstein_unique_brooding_horrors" },
  },
  Blood_Dragon = {
    fluc_vmp_black_knights = { -2, "wh2_dlc11_skill_vmp_bloodline_blood_dragon_unique_doomrider" },
    fluc_vmp_grave_guard = { -2, "wh2_dlc11_skill_vmp_bloodline_blood_dragon_unique_grave_sentinels" },
    fluc_vmp_blood_knights = { -2, "wh2_dlc11_skill_vmp_bloodline_blood_dragon_unique_the_ordo_draconis" },
  },
  Strigoi = {
    fluc_vmp_ghouls = { -2, "wh2_dlc11_skill_vmp_bloodline_strigoi_unique_grave_eaters" },
    fluc_vmp_crypt_horrors = { -2, "wh2_dlc11_skill_vmp_bloodline_strigoi_unique_monstrosities_of_morr" },
  },
  Ghorst = {
    fluc_vmp_machines = { -2, "wh_dlc04_skill_vmp_lord_unique_helman_ghorst_corpse_cart_boost" },
  },
  Imbalash = {
    fluc_vmp_blood_knights = { -3, "vmp_fbktm" },
    fluc_vmp_black_knights = { -3, "vmp_fbk50" },
    fluc_vmp_ghost_cav = { -3, "vmp_fbk50" },
    fluc_vmp_grave_guard = { -3, "wh2_dlc11_skill_vmp_bloodline_blood_dragon_unique_grave_sentinels" },
  },
  Vlad = {
    fluc_vmp_black_knights = { -1, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_blood_knights = { -1, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_crypt_horrors = { -1, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_ghosts = { -1, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_ghost_cav = { -1, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_ghouls = { -1, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_grave_guard = { -1, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_lahmian = { -1, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_terrorgheist = { -1, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_vargheists = { -1, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_varghulf = { -1, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_vampiress = { -1, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_ror = { -1, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_machines = { -1, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_forest = { -1, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    fluc_vmp_zombies = { -1, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
    none = { -1, "wh2_dlc17_skill_vmp_vlad_unique_monstrous_strength" },
  },
  Mixu_Knight = {
    fluc_vmp_black_knights = { -1, "mixu_vmp_bloodline_fallen_knight_special_2_brothers_in_death" },
    fluc_vmp_blood_knights = { -1, "mixu_vmp_bloodline_fallen_knight_special_2_brothers_in_death" },
    fluc_vmp_ghost_cav = { -1, "mixu_vmp_bloodline_fallen_knight_special_2_brothers_in_death" },
  },
  Treeman = {
    fluc_wef_trees = { -1, "wh_dlc05_skill_wef_ancient_treeman_unique_damage_resistance_treekin" },
  },
  Zoat = {
    fluc_wef_zoats = { -1, "roy_zoat_lord_army_defense_zoats" },
  },
  wef_daith = {
    fluc_wef_archers = { -2, "mixu_wef_daith_special_quality_arrows" },
    fluc_wef_waywatchers = { -2, "mixu_wef_daith_special_quality_arrows" },
  },
  Wulfrik = {
    fluc_nor_skinwolves = { -1, "wh_dlc08_skill_nor_wulfrik_battle_fervent_creatures" },
  },
  Throgg = {
    fluc_nor_fimirs = { -1, "wh_dlc08_skill_nor_throgg_unique_king_of_trolls" },
    fluc_nor_skinwolves = { -1, "wh_dlc08_skill_nor_throgg_unique_king_of_trolls" },
    fluc_all_drfluc_nor_flying_beastsagons = { -1, "wh_dlc08_skill_nor_throgg_battle_primordial_masters" },
  },
  Hef_lord = {
    fluc_hef_phoenixes = { -1, "wh2_main_skill_hef_dedication_asuryan" },
    fluc_hef_phoenix_guard = { -1, "wh2_main_skill_hef_dedication_asuryan" },
    fluc_hef_swordmasters = { -1, "wh2_main_skill_hef_dedication_hoeth" },
    fluc_hef_dragon_princes = { -1, "wh2_main_skill_hef_dedication_vaul" },
    fluc_hef_dragons = { -1, "wh2_main_skill_hef_dedication_addaioth" },
    fluc_hef_lions = { -1, "wh2_main_skill_hef_dedication_kurnous" },
    fluc_hef_lion_chariots = { -1, "wh2_main_skill_hef_dedication_hukon" },
    fluc_hef_chariots = { -1, "wh2_main_skill_hef_dedication_hukon" },
    fluc_hef_spearmen = { -1, "wh2_main_skill_hef_dedication_isha" },
    fluc_hef_archers = { -1, "wh2_main_skill_hef_dedication_isha" },
    fluc_hef_avelorn = { -1, "wh2_main_skill_hef_dedication_isha" },
    fluc_hef_sea_guard = { -1, "wh2_main_skill_hef_dedication_mathlann" },
  },
  Alarielle = {
    fluc_hef_trees = { -1, "wh2_dlc10_skill_hef_alarielle_fire_and_blood_4" },
  },
  Seaguard = {
    fluc_hef_sea_guard = { -2, "wh2_main_skill_hef_dedication_mathlann" },
    fluc_hef_lions = { -1, "AK_aislinn_unique_king" },
  },
  Morathi = {
    fluc_def_doomfire = { -2, "wh2_main_skill_def_morathi_unique_3_3" },
    fluc_def_dark_riders = { -2, "wh2_main_skill_def_morathi_unique_3_3" },
    fluc_def_shades = { -2, "wh2_main_skill_def_morathi_unique_3_3" },
    fluc_def_scourgerunner = { -2, "wh2_main_skill_def_morathi_unique_3_3" },
  },
  BeastMaster = {
    fluc_def_cold_one = { -1, "wh2_dlc14_skill_def_beastmaster_cold_ones" },
    fluc_def_cold_one_chariot = { -1, "wh2_dlc14_skill_def_beastmaster_cold_ones" },
    fluc_def_medusa = { -1, "wh2_dlc14_skill_def_beastmaster_medusas" },
    fluc_def_dragons = { -1, "wh2_dlc14_skill_def_beastmaster_black_dragon" },
    fluc_def_hydra = { -1, "wh2_dlc14_skill_def_beastmaster_war_hydra_kharibdyss" },
  },
  Rakarth = {
    fluc_def_artillery = { -2, "wh2_twa03_skill_def_rakarth_harpyclaw_bolts" },
    fluc_def_scourgerunner = { -2, "wh2_twa03_skill_def_rakarth_harpyclaw_bolts" },
    fluc_def_cold_one = { -2, "wh2_twa03_skill_def_rakarth_pack_hunters" },
    fluc_def_cold_one_chariot = { -2, "wh2_twa03_skill_def_rakarth_pack_hunters" },
  },
  Volilosh = {
    fluc_def_shades_melee = { -2, "volilosh_skill_rors1" },
  },
  Lzd_lord = {
    fluc_lzd_saurus = { -1, "wh2_main_skill_lzd_blessing_quetzl" },
    fluc_lzd_temple_guards = { -1, "wh2_main_skill_lzd_blessing_quetzl" },
    fluc_lzd_bastiladons = { -1, "wh2_main_skill_lzd_blessing_itzl" },
    fluc_lzd_carnosaurs = { -1, "wh2_main_skill_lzd_blessing_itzl" },
    fluc_lzd_cold_one = { -1, "wh2_main_skill_lzd_blessing_itzl" },
    fluc_lzd_dread_saurian = { -1, "wh2_main_skill_lzd_blessing_itzl" },
    fluc_lzd_coatl = { -1, "wh2_main_skill_lzd_blessing_itzl" },
    fluc_lzd_ripperdactyl = { -1, "wh2_main_skill_lzd_blessing_itzl" },
    fluc_lzd_razordons = { -1, "wh2_main_skill_lzd_blessing_itzl" },
    fluc_lzd_teranodons = { -1, "wh2_main_skill_lzd_blessing_itzl" },
    fluc_lzd_salamanders = { -1, "wh2_main_skill_lzd_blessing_itzl" },
    fluc_lzd_stegadons = { -1, "wh2_main_skill_lzd_blessing_itzl" },
    fluc_lzd_troglodons = { -1, "wh2_main_skill_lzd_blessing_itzl" },
  },
  Skink = {
    fluc_lzd_cold_one = { -1, "wh2_dlc12_skill_lzd_skink_chief_unique_3" },
    fluc_lzd_teranodons = { -1, "wh2_dlc12_skill_lzd_skink_chief_unique_3" },
  },
  Kroxi = {
    fluc_lzd_kroxigors = { -2, "wh2_dlc13_skill_lzd_ancient_kroxigor_unique_3",
      "wh2_dlc13_skill_lzd_ancient_kroxigor_unique_4" },
  },
  Tehen = {
    fluc_lzd_bastiladons = { -2, "wh2_dlc12_skill_lzd_tehenhauin_2", "wh2_dlc12_skill_lzd_tehenhauin_6" },
  },
  Oxyotl = {
    fluc_lzd_coatl = { -2, "wh2_dlc17_skill_lzd_oxyotl_unique_explorer_of_lost_worlds" },
    fluc_lzd_troglodons = { -2, "wh2_dlc17_skill_lzd_oxyotl_unique_explorer_of_lost_worlds" },
  },
  Tretch = {
    fluc_skv_stormvermin = { -2, "wh2_dlc09_skill_skv_lord_unique_tretch_craventail_tretchs_raiders" },
  },
  Ikit = {
    fluc_skv_doomwheel_flayer = { -2, "wh2_dlc12_skill_skv_ikit_unique_4" },
  },
  Warlock = {
    fluc_skv_jezzails = { -1, "wh2_dlc12_skill_skv_engineer_unique_3" },
    fluc_skv_ratlings = { -1, "wh2_dlc12_skill_skv_engineer_unique_3" },
    fluc_skv_warpfire_thrower = { -1, "wh2_dlc12_skill_skv_engineer_unique_3" },
    fluc_skv_stormfiend = { -1, "wh2_dlc12_skill_skv_engineer_unique_3" },
    fluc_skv_doomwheel_flayer = { -1, "wh2_dlc12_skill_skv_engineer_unique_2" },
  },
  Assassin = {
    fluc_skv_missile_runners = { -1, "wh2_dlc14_skill_skv_assassins_missile_damage" },
  },
  Ferric = {
    fluc_skv_stormvermin = { -2, "thom_ferrik_ironmask_unique_raiding_party" },
  },
  Vulkan = {
    fluc_arachnarat = { -2, "thom_vulkan_master_of_obsidian" },
  },
  Harkon = {
    fluc_cst_mobs_melee = { -2, "wh2_dlc11_skill_cst_luthor_unique_1" },
    fluc_cst_depth_guard = { -2, "wh2_dlc11_skill_cst_luthor_unique_1" },
    fluc_cst_mobs_missile = { -2, "wh2_dlc11_skill_cst_luthor_unique_3" },
    fluc_cst_prometheans_missile = { -2, "wh2_dlc11_skill_cst_luthor_unique_3" },
    fluc_cst_artillery = { -1, "wh2_dlc11_skill_cst_lord_crime_3" },
  },
  Pirate = {
    fluc_cst_artillery = { -1, "wh2_dlc11_skill_cst_lord_crime_3" },
  },
  Aranessa = {
    fluc_cst_prometheans_melee = { -2, "wh2_dlc11_skill_cst_aranessa_unique_2" },
    fluc_cst_prometheans_missile = { -2, "wh2_dlc11_skill_cst_aranessa_unique_2" },
    fluc_cst_leviathan = { -2, "wh2_dlc11_skill_cst_aranessa_unique_4" },
  },
  Noctil = {
    fluc_cst_droppers = { -2, "wh2_dlc11_skill_cst_noctilus_unique_4" },
    fluc_cst_depth_guard = { -2, "wh2_dlc11_skill_cst_noctilus_unique_4" },
    fluc_vmp_terrorgheist = { -2, "wh2_dlc11_skill_cst_noctilus_unique_4" },
  },
  Archaon = {
    fluc_chs_warriors = { -2, "wh_dlc08_skill_chs_lord_unique_archaon_1" },
    fluc_chs_chosen = { -2, "wh_dlc08_skill_chs_lord_unique_archaon_2" },
    fluc_chs_knights = { -2, "wh_dlc08_skill_chs_lord_unique_archaon_3" },
    fluc_kho_warriors = { -2, "wh_dlc08_skill_chs_lord_unique_archaon_1" },
    fluc_kho_chosen = { -2, "wh_dlc08_skill_chs_lord_unique_archaon_2" },
    fluc_kho_knights = { -2, "wh_dlc08_skill_chs_lord_unique_archaon_3" },
    fluc_nur_warriors = { -2, "wh_dlc08_skill_chs_lord_unique_archaon_1" },
    fluc_nur_chosen = { -2, "wh_dlc08_skill_chs_lord_unique_archaon_2" },
    fluc_nur_knights = { -2, "wh_dlc08_skill_chs_lord_unique_archaon_3" },
    fluc_tze_warriors = { -2, "wh_dlc08_skill_chs_lord_unique_archaon_1" },
    fluc_tze_chosen = { -2, "wh_dlc08_skill_chs_lord_unique_archaon_2" },
    fluc_tze_knights = { -2, "wh_dlc08_skill_chs_lord_unique_archaon_3" },
    fluc_sla_warriors = { -2, "wh_dlc08_skill_chs_lord_unique_archaon_1" },
    fluc_sla_chosen = { -2, "wh_dlc08_skill_chs_lord_unique_archaon_2" },
    fluc_sla_knights = { -2, "wh_dlc08_skill_chs_lord_unique_archaon_3" },
  },
  Vilitch = {
    fluc_tze_spawn = { -2, "wh3_dlc20_skill_chs_vilitch_unique_twist_of_fate" },
    fluc_tze_forsaken = { -2, "wh3_dlc20_skill_chs_vilitch_unique_twist_of_fate" },
  },
  Kairos = {
    fluc_tze_greater_daemons = { -2, "wh3_main_skill_tze_kairos_self_4" },
  },
  Katarin = {
    fluc_ksl_leopards = { -2, "wh3_main_skill_ksl_katarin_unique_snow_leopard_buffs" },
  },
  Boris = {
    fluc_ksl_tzar_guard = { -2, "wh3_main_skill_ksl_boris_unique_04" },
    fluc_ksl_elemental = { -2, "wh3_main_skill_ksl_boris_unique_elemental_bear_regen" },
  }

}
