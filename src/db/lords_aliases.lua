--uses in lord_skill_discount.lua instead of lord id
--keys from db/agent_subtypes_tables
---@type table<string, string>
Flexible_unit_caps.lord_aliases = {
  --vcounts
  ["wh_pro02_vmp_isabella_von_carstein"] = "Isabella",
  ["wh2_dlc11_vmp_bloodline_von_carstein"] = "Carstain",
  ["wh2_dlc11_vmp_bloodline_blood_dragon"] = "Blood_Dragon",
  ["wh_dlc05_vmp_red_duke"] = "Blood_Dragon",
  ["wh_main_vmp_heinrich_kemmler"] = "Kemler",
  ["wh2_dlc11_vmp_bloodline_strigoi"] = "Strigoi",
  ["wh_dlc04_vmp_helman_ghorst"] = "Ghorst",
  ["vmp_bloodline_fallen_knight"] = "Mixu_Knight",
  ["vmp_abh"] = "Imbalash",
  ["wh_dlc04_vmp_vlad_con_carstein"] = "Vlad",
  --elves
  ["wh2_main_hef_tyrion"] = "Hef_lord",
  ["wh2_dlc15_hef_archmage_beasts"] = "Hef_lord",
  ["wh2_dlc15_hef_archmage_death"] = "Hef_lord",
  ["wh2_dlc15_hef_archmage_fire"] = "Hef_lord",
  ["wh2_dlc15_hef_archmage_heavens"] = "Hef_lord",
  ["wh2_dlc15_hef_archmage_high"] = "Hef_lord",
  ["wh2_dlc15_hef_archmage_life"] = "Hef_lord",
  ["wh2_dlc15_hef_archmage_light"] = "Hef_lord",
  ["wh2_dlc15_hef_archmage_metal"] = "Hef_lord",
  ["wh2_dlc15_hef_archmage_shadows"] = "Hef_lord",
  ["wh2_main_hef_prince_caledor"] = "Hef_lord",
  ["AK_hef_seahelm"] = "Hef_lord",
  ["wh2_main_hef_prince"] = "Hef_lord",
  ["wh2_main_hef_princess"] = "Hef_lord",
  ["wh2_dlc10_hef_alarielle"] = "Alarielle",
  ["wh2_main_def_morathi"] = "Morathi",
  ["wh2_twa03_def_rakarth"] = "Rakarth",
  ["wh2_dlc14_def_high_beastmaster"] = "BeastMaster",
  ["AK_aislinn"] = "Seaguard",
  ["volilosh"] = "Volilosh",
  --lizards
  ["wh2_main_lzd_saurus_old_blood"] = "Lzd_lord",
  ["wh2_main_lzd_kroq_gar"] = "Lzd_lord",
  ["wh2_dlc13_lzd_gor_rok"] = "Lzd_lord",
  ["wh2_dlc12_lzd_tiktaqto"] = "Lzd_lord",
  ["wh2_dlc12_lzd_red_crested_skink_chief"] = "Skink",
  ["wh2_dlc12_lzd_red_crested_skink_chief_legendary"] = "Skink",
  ["wh2_dlc13_lzd_red_crested_skink_chief_horde"] = "Skink",
  ["wh2_dlc13_lzd_kroxigor_ancient"] = "Kroxi",
  ["wh2_dlc13_lzd_kroxigor_ancient_horde"] = "Kroxi",
  ["wh2_dlc12_lzd_tehenhauin"] = "Tehen",
  ["wh2_dlc17_lzd_oxyotl"] = "Oxyotl",
  --skv
  ["wh2_dlc09_skv_tretch_craventail"] = "Tretch",
  ["wh2_dlc12_skv_ikit_claw"] = "Ikit",
  ["wh2_dlc12_skv_warlock_master"] = "Warlock",
  ["thom_iron_mask"] = "Ferric",
  ["Thom_vulkan_moltskin_searflesh"] = "Vulkan",

  --vcoast
  ["wh2_dlc14_skv_master_assassin"] = "Assassin",
  ["wh2_dlc11_cst_admiral_fem"] = "Pirate",
  ["wh2_dlc11_cst_admiral_fem_death"] = "Pirate",
  ["wh2_dlc11_cst_admiral_fem_deep"] = "Pirate",
  ["wh2_dlc11_cst_admiral_tech_04"] = "Pirate",
  ["wh2_dlc11_cst_harkon"] = "Harkon",
  ["wh2_dlc11_cst_admiral"] = "Pirate",
  ["wh2_dlc11_cst_admiral_death"] = "Pirate",
  ["wh2_dlc11_cst_admiral_deep"] = "Pirate",
  ["wh2_dlc11_cst_admiral_tech_01"] = "Pirate",
  ["wh2_dlc11_cst_admiral_tech_02"] = "Pirate",
  ["wh2_dlc11_cst_admiral_tech_03"] = "Pirate",
  ["wh2_dlc11_cst_noctilus"] = "Noctil",
  ["wh2_dlc11_cst_aranessa"] = "Aranessa",
  --Greenskin
  ["wh_main_grn_goblin_great_shaman"] = "Goblin",
  ["wh2_dlc15_grn_goblin_great_shaman_raknik"] = "Goblin",
  ["wh_dlc06_grn_night_goblin_warboss"] = "Goblin",
  ["wh_dlc06_grn_skarsnik"] = "Goblin",
  ["wh_dlc06_grn_wurrzag_da_great_prophet"] = "Wurzag",
  ["wh_main_grn_azhag_the_slaughterer"] = "Azhag",
  ["ws_grn_tinitt_foureyes"] = "Forest",
  ["ws_grn_grak_beastbasha"] = "BeastBasha",
  --Empire
  ["wh_dlc08_nor_wulfrik"] = "Wulfrik",
  ["wh_dlc04_emp_volkmar"] = "Volkmar",
  ["mixu_elspeth_von_draken"] = "Elspeth",
  ["wh_dlc08_nor_throgg"] = "Throgg",
  ["wh2_dlc13_emp_cha_huntsmarshal_0"] = "Hunter",
  ["wh_main_emp_balthasar_gelt"] = "Gelt",
  ["emp_cha_helborg"] = "Helborg",
  --Dwarves
  ["wh_main_dwf_cha_greybeard"] = "GreyBeard",
  ["wh_dlc06_dwf_belegar"] = "Belegar",
  ["wh_main_dwf_thorgrim_grudgebearer"] = "Thorgrim",
  ["wh_pro01_dwf_grombrindal"] = "Whitedwarf",
  ["wh2_dlc17_dwf_thorek"] = "Thorek",
  ["dwf_byrrnoth_grundadrakk"] = "Byrnoth",
  --Wood elves
  ["wh2_dlc16_wef_malicious_ancient_treeman_beasts"] = "Treeman",
  ["wh2_dlc16_wef_malicious_ancient_treeman_life"] = "Treeman",
  ["wh2_dlc16_wef_malicious_ancient_treeman_shadows"] = "Treeman",
  ["dlc05_wef_ancient_treeman"] = "Treeman",
  ["roy_zoat_lord"] = "Zoat",
  ["wef_daith"] = "wef_daith",
  --TEB
  --["teb_tilea"] = "Tileaman",
  --["teb_borgio_the_besieger"] = "Besieger",
  --Kislev
  ["wh3_main_ksl_boris"] = "Boris",
  ["wh3_main_ksl_katarin"] = "Katarin",

  --Lost factions
  ["aky_chief_fimir_great_weapons"] = "Fimir",
  ["elo_chief_ugma"] = "Trololo",
  ["ulric_grandmaster"] = "Ulric",
  --chaos
  ["wh_main_chs_archaon"] = "Archaon",
  ["wh3_dlc20_tze_vilitch"] = "Vilitch",
  ["wh3_main_tze_kairos"] = "Kairos",
}

--   wh3_dlc20_kho_valkia
-- wh3_dlc20_nur_festus
-- wh3_dlc20_sla_azazel
-- wh3_dlc20_tze_vilitch
-- wh3_main_dae_daemon_prince
-- wh3_main_kho_skarbrand
-- wh3_main_sla_nkari
-- wh3_main_tze_kairos
--TODO remove aliases for mist lords