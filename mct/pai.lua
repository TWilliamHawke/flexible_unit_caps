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

local evil_cultures = {
  wh2_dlc11_cst_vampire_coast = true,
  wh2_main_def_dark_elves = true,
  wh2_main_skv_skaven = true,
  wh3_dlc23_chd_chaos_dwarfs = true,
  wh3_main_dae_daemons = true,
  wh3_main_kho_khorne = true,
  wh3_main_nur_nurgle = true,
  wh3_main_sla_slaanesh = true,
  wh3_main_tze_tzeentch = true,
  wh_dlc03_bst_beastmen = true,
  wh_dlc08_nor_norsca = true,
  wh_main_chs_chaos = true,
  wh_main_grn_greenskins = true,
  wh_main_vmp_vampire_counts = true,
}

local evil_ai_factions = {
  wh2_dlc16_wef_drycha = true,
  wh3_main_ogr_thunderguts = true,
}

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
  ["wh3_dlc23_chd_astragoth"] = true,
  ["wh3_dlc23_chd_legion_of_azgorh"] = true,
  ["wh3_dlc23_chd_zhatan"] = true,
}

local chaos_major = {
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
  ["wh3_dlc23_chd_astragoth"] = true,
  ["wh3_dlc23_chd_legion_of_azgorh"] = true,
  ["wh3_dlc23_chd_zhatan"] = true,
}

local mapZones = {
  khuresh = {
    factions = {
      "cr_hef_gate_guards",
      "cr_skv_clan_rikek",
      "cr_kho_servants_of_the_blood_nagas",
      "cr_grn_snakebiter_tribe",
      "cr_grn_speaking_trees",
      "cr_lzd_scions_of_xholankhas",
      "cr_brt_leofrics_fellowshi",
    },
    neighbors = {
      "nippon",
      "cathay",
      "ind",
    },
    all_neighbors = {
      "nippon",
      "cathay",
      "ind",
    }
  },
  nippon = {
    factions = {
      "cr_hef_tor_elithis",
      "cr_tze_cult_of_tsien_tsin",
      "cr_skv_eshin_clan_nest",
      "cr_cth_the_chosen",
      "cr_chs_po_hai",
      "cr_cth_okumoto_clan",
    },
    neighbors = {
      "cathay",
      "khuresh",
    },
    all_neighbors = {
      "cathay",
      "khuresh",
      "steppes",
    }
  },
  cathay = {
    factions = {
      "wh3_main_cth_the_northern_provinces",
      "wh3_main_cth_rebel_lords_of_nan_yang",
      "wh3_main_cth_dissenter_lords_of_jinshen",
      "wh3_main_skv_clan_krizzor",
      "wh3_main_cth_the_western_provinces",
      "wh3_main_cth_the_jade_custodians",
      "wh3_main_cth_burning_wind_nomads",
      "wh3_dlc21_wef_spirits_of_shanlin",
      "wh3_dlc21_nor_wyrmkins",
      "wh3_main_cth_eastern_river_lords",
      "wh3_dlc21_vmp_jiangshi_rebels",
      "wh3_dlc21_cst_dead_flag_fleet",
      "wh3_main_grn_dimned_sun",
      "wh2_main_skv_clan_eshin",
      "wh3_main_cth_celestial_loyalists",
      "wh2_dlc11_def_the_blessed_dread",
      "wh3_main_cth_imperial_wardens",
      "wh2_dlc13_lzd_spirits_of_the_jungle",
    },
    neighbors = {
      "nippon",
      "ind",
      "khuresh",
    },
    all_neighbors = {
      "nippon",
      "ind",
      "khuresh",
      "steppes",
      "ogres"
    }
  },
  steppes = {
    factions = {
      "wh3_dlc20_chs_vilitch",
      "wh3_dlc20_chs_kholek",
      "wh3_dlc20_nor_yusak",
      "wh3_main_chs_khazag",
      "wh3_dlc23_chd_zhatan",
      "wh3_main_ogr_fleshgreeders",
      "wh3_dlc20_nor_dolgan",
    },
    neighbors = {
      "cathay",
    },
    all_neighbors = {
      "cathay",
      "archaon_zone",
      "ogres"
    }
  },
  ind = {
    factions = {
      "cr_ogr_deathtoll",
      "cr_dwf_firebeards_excavators",
      "cr_def_corsairs_of_spite",
      "cr_emp_guests_of_the_raja",
      "cr_chs_the_scourgeborn",
      "wh2_main_hef_tor_elasor",

    },
    neighbors = {
      "cathay",
      "khuresh",
      "south_darklands"
    },
    all_neighbors = {
      "cathay",
      "khuresh",
      "ogres",
      "south_darklands"
    }
  },
  ogres = {
    factions = {
      "wh3_main_nur_poxmakers_of_nurgle",
      "wh3_main_lzd_tepoks_spawn",
      "wh3_main_vmp_caravan_of_blue_roses",
      "wh3_main_skv_clan_treecherik",
      "wh3_main_ogr_lazarghs",
      "wh3_main_ogr_crossed_clubs",
      "wh3_main_ogr_goldtooth",
      "wh3_main_ogr_sons_of_the_mountain",
      "wh3_main_dwf_karak_azorn",
      "wh3_main_ogr_blood_guzzlers",
      "wh3_main_ogr_mountaineaters",
      "wh3_main_ogr_fulg",
      "wh_main_grn_greenskins",
      "wh3_main_grn_tusked_sunz",
      "wh3_main_ogr_sabreskin",
    },
    neighbors = {
      "cathay",
      "ind",
      "south_darklands",
    },
    all_neighbors = {
      "cathay",
      "ind",
      "south_darklands",
      "archaon_zone",
      "steppes",
      "dark_lands",
    }
  },
  south_darklands = {
    factions = {
      "wh3_main_ogr_thunderguts",
      "wh2_dlc15_hef_imrik",
      "wh2_dlc15_dwf_clan_helhein",
      "wh3_main_grn_dark_land_orcs",
      "wh3_dlc23_chd_legion_of_azgorh",
      "wh3_main_grn_moon_howlerz",
      "wh2_dlc09_skv_clan_rictus",
    },
    neighbors = {
      "dwarfland",
      "east_southlands",
      "ind"
    },
    all_neighbors = {
      "dwarfland",
      "east_southlands",
      "ogres",
      "ind",
      "dark_lands"
    },
  },
  dwarfland = {
    factions = {
      "wh_main_dwf_karak_azul",
      "wh_main_grn_necksnappers",
      "wh_main_dwf_karak_azul",
      "wh_main_grn_red_fangs",
      "wh2_main_skv_clan_mors",
      "wh3_main_skv_clan_verms",
      "wh_main_grn_bloody_spearz",
      "wh_main_dwf_dwarfs",
      "wh_main_grn_crooked_moon",
    },
    neighbors = {
      "southern_realms",
      "world_edge",
      "east_southlands"
    },
    all_neighbors = {
      "southern_realms",
      "world_edge",
      "east_southlands",
      "badlands"
    },
  },
  badlands = {
    factions = {
      "wh_main_dwf_barak_varr",
      "wh2_dlc16_grn_creeping_death",
      "wh_main_grn_scabby_eye",
      "wh_main_grn_teef_snatchaz",
      "wh_main_grn_orcs_of_the_bloody_hand",
      "wh_main_grn_teef_snatchaz",
      "wh_main_grn_top_knotz",
      "wh3_main_ie_vmp_sires_of_mourkain",
      "wh3_main_kho_exiles_of_khorne",
      "wh2_dlc17_bst_malagor",
    },
    neighbors = {
      "dwarfland",
      "west_southlands",
      "southern_realms",
    },
    all_neighbors = {
      "dwarfland",
      "west_southlands",
      "southern_realms",
    },
  },
  west_southlands = {
    factions = {
      "wh2_main_lzd_zlatan",
      "wh2_dlc12_grn_leaf_cutterz_tribe",
      "wh2_main_lzd_tlaqua",
      "wh2_main_wef_bowmen_of_oreon",
      "wh2_dlc09_tmb_dune_kingdoms",
      "wh3_main_emp_cult_of_sigmar",
      "wh_main_vmp_vampire_counts",
      "wh2_main_vmp_necrarch_brotherhood",
      "wh2_dlc09_tmb_numas",
      "wh2_dlc09_tmb_khemri",
      "wh2_dlc17_dwf_thorek_ironbrow",
      "wh2_main_grn_arachnos",
    },
    neighbors = {
      "east_southlands",
      "southern_wastes",
      "southern_realms"
    },
    all_neighbors = {
      "east_southlands",
      "southern_wastes",
      "southern_realms",
      "badlands",
      "arabia"
    },
  },
  east_southlands = {
    factions = {
      "wh3_main_skv_clan_morbidus",
      "wh2_main_skv_clan_mordkin",
      "wh2_main_lzd_last_defenders",
      "wh2_main_vmp_the_silver_host",
      "wh2_dlc09_tmb_lybaras",
    },
    neighbors = {
      "southern_wastes",
      "dwarfland",
      "west_southlands",
      "south_darklands"
    },
    all_neighbors = {
      "southern_wastes",
      "dwarfland",
      "west_southlands",
      "south_darklands",
      "badlands",
    },
  },
  southern_wastes = {
    factions = {
      "wh3_main_sla_rapturous_excess",
      "wh3_main_tze_sarthoraels_watchers",
      "wh2_main_hef_order_of_loremasters",
      "wh3_main_nur_bubonic_swarm",
      "wh3_main_tze_oracles_of_tzeentch",
      "wh3_main_tze_flaming_scribes",
      "wh3_main_kho_brazen_throne",
      "wh2_dlc17_lzd_oxyotl",
      "wh2_main_hef_citadel_of_dusk",
    },
    neighbors = {
      "lustria",
      "east_southlands",
      "west_southlands"
    },
    all_neighbors = {
      "lustria",
      "east_southlands",
      "west_southlands"
    },
  },
  lustria = {
    factions = {
      "wh2_dlc12_lzd_cult_of_sotek",
      "wh2_main_lzd_southern_sentinels",
      "wh2_main_skv_clan_pestilens",
      "wh2_main_lzd_itza",
      "wh3_dlc20_nur_pallid_nurslings",
      "wh2_main_dwf_spine_of_sotek_dwarfs",
      "wh3_main_tmb_deserters_of_khatep",
      "wh2_main_lzd_sentinels_of_xeti",
      "wh2_twa03_def_rakarth",
      "wh2_dlc16_lzd_wardens_of_the_living_pools",
      "wh3_dlc20_kho_blood_keepers",
      "wh3_dlc20_tze_apostles_of_change",
      "wh2_main_lzd_tlaxtlan",
      "wh_main_brt_bordeleaux",
      "wh2_main_lzd_xlanhuapec",
      "wh2_dlc11_cst_vampire_coast",
      "wh2_dlc11_cst_vampire_coast_rebels",
      "wh2_main_skv_clan_spittel",
    },
    neighbors = {
      "southern_wastes",
      "central_america"
    },
    all_neighbors = {
      "southern_wastes",
      "central_america",
      "arabia"
    },
  },
  central_america = {
    factions = {
      "wh2_main_def_blood_hall_coven",
      "wh2_dlc12_skv_clan_mange",
      "wh2_dlc13_emp_the_huntmarshals_expedition",
      "wh2_main_grn_blue_vipers",
      "wh2_main_emp_new_world_colonies",
      "wh3_dlc20_sla_keepers_of_bliss",
      "wh2_main_lzd_hexoatl",
      "wh2_main_nor_skeggi",
      "wh3_dlc20_sla_keepers_of_bliss",
    },
    neighbors = {
      "naggarond",
      "lustria",
      "ulthuan"
    },
    all_neighbors = {
      "naggarond",
      "lustria",
      "ulthuan"
    },
  },
  naggarond = {
    factions = {
      "wh2_dlc17_bst_taurox",
      "wh2_main_def_ssildra_tor",
      "wh2_dlc16_skv_clan_gritus",
      "wh2_main_def_bleak_holds",
      "wh2_main_def_cult_of_pleasure",
      "wh2_main_def_drackla_coven",
      "wh2_dlc16_wef_sisters_of_twilight",
      "wh2_dlc09_tmb_exiles_of_nehek",
      "wh2_dlc16_grn_naggaroth_orcs",
      "wh2_main_def_clar_karond",
      "wh2_main_def_the_forgebound",
      "wh3_main_dwf_the_ancestral_throng",
      "wh2_main_skv_clan_septik",
      "wh2_main_def_naggarond",
      "wh2_main_def_the_forgebound",
      "wh2_dlc11_cst_the_drowned",
      "wh2_main_def_karond_kar",
      "wh2_main_hef_nagarythe",
    },
    neighbors = {
      "central_america",
      "ulthuan",
    },
    all_neighbors = {
      "central_america",
      "ulthuan",
      "north_naggarond",
      "norsca"
    },
  },
  north_naggarond = {
    factions = {
      --valkia
      --sigvald
      "wh3_dlc20_chs_valkia",
      "wh3_dlc20_chs_sigvald",
      "wh2_main_nor_mung",
      "wh2_main_def_ghrond",
      "wh3_main_grn_da_cage_breakaz",
      "wh2_main_def_har_ganeth",
      "wh2_main_def_deadwood_sentinels",
      "wh2_main_nor_aghol",
    },
    neighbors = {
      "naggarond"
    },
    all_neighbors = {
      "naggarond",
      "norsca",
      "mid_wastes"
    },
  },
  mid_wastes = {
    factions = {
      "wh3_main_dae_daemon_prince",
      "wh3_main_ksl_ursun_revivalists",
      "wh2_main_def_hag_graef",
      "wh3_main_sla_subtle_torture",
      "wh3_main_kho_crimson_skull",
      "wh3_main_tze_broken_wheel",
      "wh3_main_nur_septic_claw",
      "wh3_main_tze_all_seeing_eye",
      "wh3_main_kho_bloody_sword",
    },
    neighbors = {

    },
    all_neighbors = {
      "archaon_zone",
      "norsca",
      "north_naggarond"
    },
  },
  archaon_zone = {
    factions = {
      "wh_main_chs_chaos",
      "wh3_dlc20_nor_kul",
      "wh3_main_sla_exquisite_pain",
      "wh2_dlc15_skv_clan_ferrik",
      "wh3_main_nur_maggoth_kin",
      "wh_dlc08_nor_goromadny_tribe",
    },
    neighbors = {
      "kislev"
    },
    all_neighbors = {
      "kislev",
      "norsca",
      "mid_wastes",
      "steppes",
      "dark_lands"
    },
  },
  dark_lands = {
    factions = {
      "wh3_dlc23_chd_minor_faction",
      "wh3_main_grn_drippin_fangs",
      "wh3_main_vmp_lahmian_sisterhood",
      "wh3_main_grn_slaves_of_zharr",
      "wh3_dlc23_chd_astragoth",
    },
    neighbors = {
      "kislev",
      "dwarfland",
      "world_edge",
      "south_darklands"
    },
    all_neighbors = {
      "kislev",
      "dwarfland",
      "world_edge",
      "south_darklands",
      "archaon_zone",
      "ogres"
    },
  },
  world_edge = {
    factions = {
      "wh_main_grn_red_eye",
      "wh_main_dwf_zhufbar",
      "wh_main_dwf_karak_kadrin",
      "wh3_main_ogr_rock_skulls",
      "wh2_dlc15_grn_bonerattlaz",
    },
    neighbors = {
      "empire",
      "kislev",
      "dwarfland"
    },
    all_neighbors = {
      "empire",
      "kislev",
      "dwarfland",
      "archaon_zone",
      "dark_lands"
    },
  },
  southern_realms = {
    factions = {
      --morgul
      "wh_dlc05_bst_morghur_herd",
      "wh_main_teb_border_princes",
      "wh3_main_ogr_disciples_of_the_maw",
      "wh_main_teb_tilea",
      "wh2_dlc11_cst_pirates_of_sartosa",
      "wh_main_dwf_karak_izor",
      "wh_main_grn_broken_nose",
      "wh2_main_skv_clan_skryre",
      "wh_main_teb_estalia",
    },
    neighbors = {
      "empire",
      "bretonnia",
      "dwarfland"
    },
    all_neighbors = {
      "empire",
      "bretonnia",
      "dwarfland",
      "badlands",
      "arabia"
    },
  },
  arabia = {
    factions = {
      "wh2_dlc09_tmb_rakaph_dynasty",
      "wh3_main_ogre_the_famished",
      "wh2_dlc09_tmb_followers_of_nagash",
      "wh2_main_dwf_greybeards_prospectors",
      "wh2_main_brt_knights_of_the_flame",
      "wh2_dlc14_brt_chevaliers_de_lyonesse",
      "wh2_main_brt_thegans_crusaders",
      "wh2_main_vmp_strygos_empire",
    },
    neighbors = {
      "southern_realms",
      "west_southlands"
    },
    all_neighbors = {
      "southern_realms",
      "west_southlands",
      "badlands"
    },
  },
  empire = {
    factions = {
      "wh_main_vmp_schwartzhafen",
      "wh_main_emp_stirland",
      "wh_main_emp_averland",
      "wh_main_grn_black_venom",
      "wh_main_dwf_karak_hirn",
      "wh2_dlc13_emp_golden_order",
      "wh_main_emp_wissenland",
      "wh_main_emp_empire",
      "wh_main_emp_talabecland",
      "wh_main_emp_ostermark",
      "wh2_dlc15_skv_clan_kreepus",
      "wh2_dlc16_wef_drycha",
      "wh_main_emp_talabecland",
      "wh_main_emp_middenland",
      "wh_main_emp_hochland",
      "wh3_dlc20_chs_festus",
      "wh_main_emp_nordland",
      "wh3_main_wef_laurelorn",
      "wh_dlc03_grn_black_pit",
      "wh_main_emp_marienburg",
      "wh_main_grn_skullsmasherz",
      "wh_dlc03_bst_beastmen",
      "wh_main_emp_ostland",
    },
    neighbors = {
      "southern_realms",
      "bretonnia",
      "kislev",
      "world_edge",
    },
    all_neighbors = {
      "southern_realms",
      "bretonnia",
      "kislev",
      "world_edge",
      "norsca",
    },
  },
  bretonnia = {
    factions = {
      "wh_main_brt_carcassonne",
      "wh2_dlc14_grn_red_cloud",
      "wh_main_brt_parravon",
      "wh2_dlc15_grn_broken_axe",
      "wh3_main_brt_aquitaine",
      "wh_main_brt_bastonne",
      "wh_main_vmp_mousillon",
      "wh_main_brt_lyonesse",
      "wh_main_brt_artois",
      "wh_main_vmp_mousillon",
      "wh_main_brt_bretonnia",
      "wh2_dlc11_vmp_the_barrow_legion",
      "wh_main_dwf_karak_ziflin",
    },
    neighbors = {
      "ulthuan",
      "empire",
      "southern_realms"
    },
    all_neighbors = {
      "ulthuan",
      "empire",
      "southern_realms",
      "norsca",
    },
  },
  ulthuan = {
    factions = {
      "wh2_main_def_scourge_of_khaine",
      "wh2_main_hef_ellyrion",
      "wh2_main_hef_tiranoc",
      "wh2_main_hef_tiranoc",
      "wh2_main_hef_caledor",
      "wh2_dlc11_cst_noctilus",
      "wh2_main_def_cult_of_excess",
      "wh2_main_hef_eataine",
      "wh2_dlc15_grn_skull_crag",
      "wh2_main_hef_saphery",
      "wh2_main_hef_avelorn",
      "wh2_main_hef_yvresse",
      "wh2_main_hef_cothique",
      "wh2_main_hef_chrace",
      "wh3_main_sla_seducers_of_slaanesh",
    },
    neighbors = {
      "bretonnia",
      "naggarond",
      "central_america"
    },
    all_neighbors = {
      "bretonnia",
      "naggarond",
      "central_america",
      "north_naggarond"
    },
  },
  norsca = {
    factions = {
      --belakor
      "wh3_main_chs_shadow_legion",
      "wh_dlc08_nor_vanaheimlings",
      "wh3_dlc20_tze_the_sightless",
      "wh_main_nor_skaeling",
      "wh_main_nor_bjornling",
      "wh_dlc08_nor_norsca",
      "wh_dlc08_nor_naglfarlings",
      "wh_main_nor_varg",
      "wh_main_nor_sarl",
      "wh_main_nor_aesling",
      "wh_dlc08_nor_wintertooth",
    },
    neighbors = {
      "empire",
      "kislev",
      "naggarond"
    },
    all_neighbors = {
      "empire",
      "kislev",
      "naggarond",
      "archaon_zone",
      "mid_wastes",
      "north_naggarond",
    },
  },
  kislev = {
    factions = {
      "wh3_dlc20_chs_azazel",
      "wh3_main_ksl_brotherhood_of_the_bear",
      "wh3_main_ksl_ungol_kindred",
      "wh3_main_ksl_the_great_orthodoxy",
      "wh3_main_ksl_druzhina_enclave",
      "wh2_main_skv_clan_moulder",
      "wh_main_dwf_kraka_drak",
      "wh3_main_ksl_ropsmenn_clan",
      "wh3_main_ksl_the_ice_court",
      "wh_main_nor_baersonling",
    },
    neighbors = {
      "empire"
    },
    all_neighbors = {
      "empire",
      "archaon_zone",
      "mid_wastes",
      "norsca"
    },
  },
  wood_elf = {
    factions = {
      "wh_dlc05_wef_torgovann",
      "wh_dlc05_wef_wydrioth",
      "wh_dlc05_wef_wood_elves",
      "wh_dlc05_wef_argwylon",
    },
    neighbors = {
      "empire",
      "bretonnia",
      "southern_realms"
    },
    all_neighbors = {
      "empire",
      "bretonnia",
      "southern_realms"
    },
  },

}


-- research buff doesn't apply for tomb kings
-- so it doesn't include here
local PAI_EFFECTS_DB = {
  { "upkeep",       "wh_main_effect_force_all_campaign_upkeep",          "faction_to_force_own" },
  { "growth",       "wh_main_effect_province_growth_building",           "faction_to_province_own" },
  { "unit_exp",     "wh3_dlc20_effect_xp_gain_all_units",                "faction_to_force_own" },
  { "lord_exp",     "wh3_main_effect_character_campaign_experience_mod", "faction_to_character_own" },
  { "horde_growth", "wh_main_effect_hordebuilding_growth_core",          "faction_to_force_own" },
}

local PAI_EFFECTS_MCM = {
  { "upkeep",       "b_" },
  { "growth",       "c_" },
  { "unit_exp",     "d_" },
  { "research",     "e_" },
  { "lord_exp",     "f_" },
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

local function get_tier()
  local this_turn = cm:model():turn_number();
  local maxtier, timeout = get_pai_params();

  local tier = math.floor(this_turn / timeout);
  tier = math.min(tier, maxtier);

  local should_apply = this_turn % timeout == 0

  return tier, should_apply
end

local function update_effect(faction, tier)
  cm:remove_effect_bundle(pai_effect_name, faction:name());


  local effect_bundle = cm:create_new_custom_effect_bundle(pai_effect_name);

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
  -- PAILOG("APPLY TIER" .. tier .. " BONUS TO FACTION " .. tostring(faction:name()));
end

---comment
---@param faction FACTION_SCRIPT_INTERFACE
local function set_random_potential(faction)
  local factions = cm:get_campaign_name() == "wh3_main_chaos" and chaos_major or major_factions
  local is_major = not not factions[faction:name()]

  local potential = is_major and 0 or 100;
  local treshols = is_major and 40 or 60;
  local negative_random = is_major and -80 or -50
  local random_factor = cm:random_number() <= treshols and negative_random or 0

  if potential + random_factor > 0 then
    PAILOG("good luck for " .. faction:name())
  elseif potential + random_factor < -60 then
    PAILOG("bad luck for " .. faction:name())
  end
  ---@diagnostic disable-next-line: undefined-field
  cm:faction_set_potential_modifier(faction, potential + random_factor)
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
    local tier, should_apply = get_tier()
    local no_effect = not faction:has_effect_bundle(pai_effect_name);

    if no_effect then
      set_random_potential(faction)
    end

    if no_effect or should_apply then
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

local function get_region_by_faction(faction)
  for region, data in pairs(mapZones) do
    for i = 1, #data.factions do
      if data.factions[i] == faction then
        return region
      end
    end
  end
end

local function random_sort(t)
  local new_t = {};
  local max_table_size = #t;
  local current_size = max_table_size;
  local n = 0;

  for _ = 1, max_table_size do
    -- pick an entry from t, add it to new_t, then remove it from t
    n = (cm:random_number() % current_size) + 1;
    current_size = current_size - 1

    table.insert(new_t, t[n]);
    table.remove(t, n);
  end

  return new_t;
end

local function apply_effect_for_factions(region_name, buff_evil)
  local arr = mapZones[region_name] and mapZones[region_name].factions;

  if not arr then return end

  local tier = get_tier()

  for i = 1, #arr do
    local faction_name = arr[i]
    local faction = cm:get_faction(faction_name)

    if faction then
      update_effect(faction, tier);
      local culture = faction:culture();
      local faction_is_evil = evil_ai_factions[faction_name]
          or evil_cultures[culture] or false;
      local buff_this = buff_evil == faction_is_evil;
      local factions = cm:get_campaign_name() == "wh3_main_chaos" and chaos_major or major_factions
      local is_major = not not factions[faction:name()];

      if is_major and not buff_this then
        ---@diagnostic disable-next-line: undefined-field
        cm:faction_set_potential_modifier(faction, -100);
        PAILOG("bad luck for " .. faction_name)
      elseif not is_major and buff_this then
        ---@diagnostic disable-next-line: undefined-field
        cm:faction_set_potential_modifier(faction, 100);
        PAILOG("good luck for " .. faction_name)
      end
    end
  end
end

local function apply_effect_for_regions(arr, player_is_evil)
  if #arr > 1 then
    arr = random_sort(arr);
  end

  if #arr > 0 then
    PAILOG("bad luck for " .. arr[1])
    apply_effect_for_factions(arr[1], not player_is_evil)
  end
  if #arr > 1 then
    PAILOG("good luck for " .. arr[2])
    apply_effect_for_factions(arr[2], player_is_evil)
  end
  if #arr > 2 then
    PAILOG("bad luck for " .. arr[3])
    apply_effect_for_factions(arr[3], not player_is_evil)
  end
end

function apply_random_potential()
  if cm:turn_number() ~= 1 then return end
  local player_faction = cm:get_local_faction():name();
  local player_culture = cm:get_local_faction():culture()
  local player_is_evil = evil_cultures[player_culture] or false;
  local player_region = get_region_by_faction(player_faction);

  if not player_region then
    PAILOG("region not found")
    return
  else
    PAILOG("player region is " .. player_region)
  end

  local first_neighbors = mapZones[player_region].neighbors;
  local all_neighbors = mapZones[player_region].all_neighbors;
  local factions_in_zone = mapZones[player_region].factions;
  local tier = get_tier()

  for i = 1, #factions_in_zone do
    local faction_name = factions_in_zone[i];
    local faction = cm:get_faction(faction_name);

    if faction and faction_name ~= player_faction then
      update_effect(faction, tier)
    end
  end

  if #first_neighbors == 0 then return end

  local raw_second_neighbors = {};
  local second_neighbors = {}

  for i = 1, #all_neighbors do
    local neighbors = mapZones[all_neighbors[i]].neighbors;

    for k = 1, #neighbors do
      raw_second_neighbors[neighbors[k]] = true;
    end
  end

  raw_second_neighbors[player_region] = nil;

  for i = 1, #all_neighbors do
    raw_second_neighbors[all_neighbors[i]] = nil
  end

  for region in pairs(raw_second_neighbors) do
    table.insert(second_neighbors, region);
  end

  apply_effect_for_regions(first_neighbors, player_is_evil)
  apply_effect_for_regions(second_neighbors, player_is_evil)
end

cm:add_first_tick_callback(function()
  local ok, err = pcall(function()
    apply_random_potential();
  end)

  if not ok then
    PAILOG(tostring(err))
  end
end)
