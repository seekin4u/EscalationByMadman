///////////////////////////////
/datum/job/warpac_co
	title = "Komandir Roti"
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	head_position = 1
	whitelist_only = 1
	selection_color = "#530909"
	outfit_type = /decl/hierarchy/outfit/job/sa_co
	whitelist_group = "saofficier"
//	access = list(access_ru_soldier, access_ru_medic, access_ru_surgerist, access_ru_engineer, access_ru_heavy_weapon, access_ru_squad_leader, access_ru_cook, access_ru_commander)
//	minimal_access = list(access_ru_soldier, access_ru_medic, access_ru_surgerist, access_ru_engineer, access_ru_heavy_weapon, access_ru_squad_leader, access_ru_cook, access_ru_commander)
	spawn_location = "JoinLateSA"
	department_flag = WARPAC

/datum/job/warpac_co/update_character(var/mob/living/carbon/human/H)
	H.add_language("Russian")
	H.add_language("Czech")
	H.default_language = all_languages["Russian"]
	H.x = 217
	H.y = 22
	H.z = 1
	if(prob(90))
		H.add_language("English")
		H << "<b>Yay! You know english language!</b>"

///////////////////////////////
/datum/job/warpac_xo
	title = "Zamestitel Komandira Roti"
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	head_position = 1
	whitelist_only = 1
	selection_color = "#530909"
	outfit_type = /decl/hierarchy/outfit/job/sa_xo
	whitelist_group = "saofficier"
//	access = list(access_ru_soldier, access_ru_medic, access_ru_surgerist, access_ru_engineer, access_ru_heavy_weapon, access_ru_squad_leader, access_ru_cook, access_ru_commander)
//	minimal_access = list(access_ru_soldier, access_ru_medic, access_ru_surgerist, access_ru_engineer, access_ru_heavy_weapon, access_ru_squad_leader, access_ru_cook, access_ru_commander)
	spawn_location = "JoinLateSA"
	department_flag = WARPAC

/datum/job/warpac_xo/update_character(var/mob/living/carbon/human/H)
	H.add_language("Russian")
	H.add_language("Czech")
	H.default_language = all_languages["Russian"]
	H.x = 217
	H.y = 22
	H.z = 1
	if(prob(90))
		H.add_language("English")
		H << "<b>Yay! You know english language!</b>"


///////////////////////////////
/datum/job/warpac_commander
	title = "Komandir Vzvoda"
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	head_position = 1
	whitelist_only = 1
	selection_color = "#530909"
	outfit_type = /decl/hierarchy/outfit/job/sa_pltcom
	whitelist_group = "saofficier"
//	access = list(access_ru_soldier, access_ru_medic, access_ru_surgerist, access_ru_engineer, access_ru_heavy_weapon, access_ru_squad_leader, access_ru_cook, access_ru_commander)
//	minimal_access = list(access_ru_soldier, access_ru_medic, access_ru_surgerist, access_ru_engineer, access_ru_heavy_weapon, access_ru_squad_leader, access_ru_cook, access_ru_commander)
	spawn_location = "JoinLateSA"
	department_flag = WARPAC

/datum/job/warpac_commander/update_character(var/mob/living/carbon/human/H)
	H.add_language("Russian")
	H.default_language = all_languages["Russian"]
	H.x = 217
	H.y = 22
	H.z = 1
	if(prob(90))
		H.add_language("English")
		H << "<b>Yay! You know english language!</b>"


/datum/job/warpac_comdeputy
	title = "Zamestitel comandira vzvoda"
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	head_position = 1
	whitelist_only = 1
	selection_color = "#530909"
	whitelist_group = "sasergeant"
	outfit_type = /decl/hierarchy/outfit/job/sa_pltcomdep
//	access = list(access_ru_soldier, access_ru_medic, access_ru_surgerist, access_ru_engineer, access_ru_heavy_weapon, access_ru_squad_leader, access_ru_cook, access_ru_commander)
//	minimal_access = list(access_ru_soldier, access_ru_medic, access_ru_surgerist, access_ru_engineer, access_ru_heavy_weapon, access_ru_squad_leader, access_ru_cook, access_ru_commander)
	spawn_location = "JoinLateSA"
	department_flag = WARPAC


/datum/job/warpac_comdeputy/update_character(var/mob/living/carbon/human/H)
	H.add_language("Russian")
	H.default_language = all_languages["Russian"]
	H.x = 215
	H.y = 26
	H.z = 1
	if(prob(80))
		H.add_language("English")
		H << "<b>Yay! You know english language!</b>"

///////////////////////////////
/datum/job/warpac_squadleader
	title = "Komandir Otdeleniya"
	faction = "Station"
	total_positions = 4
	spawn_positions = 4
	head_position = 1
	whitelist_only = 1
	selection_color = "#770e0e"
	whitelist_group = "sasergeant"
	outfit_type = /decl/hierarchy/outfit/job/sa_com
//	access = list(access_ru_soldier, access_ru_medic, access_ru_surgerist, access_ru_engineer, access_ru_heavy_weapon, access_ru_squad_leader, access_ru_cook)
//	minimal_access = list(access_ru_soldier, access_ru_medic, access_ru_surgerist, access_ru_engineer, access_ru_heavy_weapon, access_ru_squad_leader, access_ru_cook)
	spawn_location = "JoinLateSA"
	department_flag = WARPAC

/datum/job/warpac_squadleader/update_character(var/mob/living/carbon/human/H)
	H.add_language("Russian")
	H.default_language = all_languages["Russian"]
	H.x = 216
	H.y = 22
	H.z = 1
	if(prob(25))
		H.add_language("English")
		H << "<b>Yay! You know english language!</b>"

////////////////////////
/datum/job/warpac_medic
	title = "Strelok-Sanitar"
	faction = "Station"
	total_positions = 4
	spawn_positions = 4
	whitelist_only = 1
	selection_color = "#770e0e"
	whitelist_group = "saenlisted"
	outfit_type = /decl/hierarchy/outfit/job/sa_medic
	spawn_location = "JoinLateSA"
	department_flag = WARPAC

/datum/job/warpac_medic/update_character(var/mob/living/carbon/human/H)
	H.add_language("Russian")
	H.default_language = all_languages["Russian"]
	H.x = 219
	H.y = 74
	H.z = 1

	if(prob(25))
		H.add_language("English")
		H << "<b>Yay! You know english language!</b>"


/datum/job/warpac_surgeon
	title = "Polevoi Doktor"
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	whitelist_only = 1
	selection_color = "#770e0e"
	whitelist_group = "saofficier"
	outfit_type = /decl/hierarchy/outfit/job/sa_doc
	spawn_location = "JoinLateSA"
	department_flag = WARPAC

/datum/job/warpac_surgeon/update_character(var/mob/living/carbon/human/H)
	H.add_language("Russian")
	H.add_language("Czech")
	H.default_language = all_languages["Russian"]
	H.x = 219
	H.y = 74
	H.z = 1
	if(prob(90))
		H.add_language("English")
		H << "<b>Yay! You know english language!</b>"

///////////////////////////////
/datum/job/warpac_lmg
	title = "Pulemetchik"
	faction = "Station"
	total_positions = 4
	whitelist_only = 1
	spawn_positions = 4
	selection_color = "#770e0e"
	whitelist_group = "saenlisted"
	outfit_type = /decl/hierarchy/outfit/job/sa_lmg
	spawn_location = "JoinLateSA"
	department_flag = WARPAC

/datum/job/warpac_lmg/update_character(var/mob/living/carbon/human/H)
	H.add_language("Russian")
	H.default_language = all_languages["Russian"]
	H.x = 235
	H.y = 62
	H.z = 1
	if(prob(7))
		H.add_language("English")
		H << "<b>Yay! You know english language!</b>"
//////////////////////////

/datum/job/warpac_private
	title = "Strelok"
	faction = "Station"
	total_positions = 12
	spawn_positions = 12
	whitelist_only = 1
	selection_color = "#770e0e"
	whitelist_group = "saenlisted"
	outfit_type = /decl/hierarchy/outfit/job/sa_rifleman
//	access = list(access_ru_soldier)
//	minimal_access = list(access_ru_soldier)
	spawn_location = "JoinLateSA"
	department_flag = WARPAC

/datum/job/warpac_private/update_character(var/mob/living/carbon/human/H)
	H.add_language("Russian")
	H.default_language = all_languages["Russian"]
	H.x = 238
	H.y = 36
	H.z = 1
	if(prob(7))
		H.add_language("English")
		H << "<b>Yay! You know english language!</b>"

/datum/job/warpac_corporal
	title = "Starshiy Strelok"
	faction = "Station"
	total_positions = 4
	spawn_positions = 4
	whitelist_only = 1
	selection_color = "#770e0e"
	whitelist_group = "saenlisted"
	outfit_type = /decl/hierarchy/outfit/job/sa_comdeputy
//	access = list(access_ru_soldier)
//	minimal_access = list(access_ru_soldier)
	spawn_location = "JoinLateSA"
	department_flag = WARPAC

/datum/job/warpac_corporal/update_character(var/mob/living/carbon/human/H)
	H.add_language("Russian")
	H.default_language = all_languages["Russian"]
	H.x = 235
	H.y = 36
	H.z = 1
	if(prob(7))
		H.add_language("English")
		H << "<b>Yay! You know english language!</b>"

/datum/job/warpac_radio
	title = "Starshiy Radiotelefonist"
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	whitelist_only = 1
	selection_color = "#770e0e"
	whitelist_group = "saenlisted"
//	access = list(access_ru_soldier)
//	minimal_access = list(access_ru_soldier)
	spawn_location = "JoinLateSA"
	outfit_type = /decl/hierarchy/outfit/job/sa_radio
	department_flag = WARPAC

/datum/job/warpac_radio/update_character(var/mob/living/carbon/human/H)
	H.add_language("Russian")
	H.default_language = all_languages["Russian"]
	H.x = 233
	H.y = 60
	H.z = 1
	if(prob(15))
		H.add_language("English")
		H << "<b>Yay! You know english language!</b>"


/datum/job/warpac_rpg
	title = "Granatometchik"
	faction = "Station"
	total_positions = 4
	spawn_positions = 4
	whitelist_only = 1
	selection_color = "#770e0e"
	whitelist_group = "saenlisted"
//	access = list(access_ru_soldier)
//	minimal_access = list(access_ru_soldier)
	spawn_location = "JoinLateSA"
	outfit_type = /decl/hierarchy/outfit/job/sa_rpg
	department_flag = WARPAC

/datum/job/warpac_rpg/update_character(var/mob/living/carbon/human/H)
	H.add_language("Russian")
	H.default_language = all_languages["Russian"]
	H.x = 235
	H.y = 60
	H.z = 1
	if(prob(5))
		H.add_language("English")
		H << "<b>Yay! You know english language!</b>"

/datum/job/warpac_rpgsup
	title = "Pomoshnik Granatometchika"
	faction = "Station"
	total_positions = 4
	spawn_positions = 4
	whitelist_only = 1
	selection_color = "#770e0e"
	whitelist_group = "saenlisted"
//	access = list(access_ru_soldier)
//	minimal_access = list(access_ru_soldier)
	spawn_location = "JoinLateSA"
	outfit_type = /decl/hierarchy/outfit/job/sa_rpgassist
	department_flag = WARPAC

/datum/job/warpac_rpgsup/update_character(var/mob/living/carbon/human/H)
	H.add_language("Russian")
	H.x = 238
	H.y = 34
	H.z = 1
	H.default_language = all_languages["Russian"]
	if(prob(5))
		H.add_language("English")
		H << "<b>Yay! You know english language!</b>"

/datum/job/warpac_prap
	title = "Kaptyor"
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	whitelist_only = 1
	whitelist_group = "sasergeant"
	selection_color = "#770e0e"
//	access = list(access_ru_soldier)
//	minimal_access = list(access_ru_soldier)
	spawn_location = "JoinLateSA"
	outfit_type = /decl/hierarchy/outfit/job/sa_prap
	department_flag = WARPAC

/datum/job/warpac_prap/update_character(var/mob/living/carbon/human/H)
	H.add_language("Russian")
	H.default_language = all_languages["Russian"]
	H.x = 213
	H.y = 31
	H.z = 1
	if(prob(15))
		H.add_language("English")
		H << "<b>Yay! You know english language!</b>"

/datum/job/warpac_saper
	title = "Sapyor"
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	whitelist_only = 1
	whitelist_group = "saenlisted"
	selection_color = "#770e0e"
//	access = list(access_ru_soldier)
//	minimal_access = list(access_ru_soldier)
	spawn_location = "JoinLateSA"
	outfit_type = /decl/hierarchy/outfit/job/sa_saper
	department_flag = WARPAC

/datum/job/warpac_saper/update_character(var/mob/living/carbon/human/H)
	H.x = 226
	H.y = 64
	H.z = 1
	H.add_language("Russian")
	H.default_language = all_languages["Russian"]
	if(prob(10))
		H.add_language("English")
		H << "<b>Yay! You know english language!</b>"

/datum/job/warpac_sniper
	title = "Pekhotniy Snaiper"
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	whitelist_only = 1
	whitelist_group = "sasergeant"
	selection_color = "#770e0e"
//	access = list(access_ru_soldier)
//	minimal_access = list(access_ru_soldier)
	spawn_location = "JoinLateSA"
	outfit_type = /decl/hierarchy/outfit/job/sa_sniper
	department_flag = WARPAC

/datum/job/warpac_sniper/update_character(var/mob/living/carbon/human/H)
	H.add_language("Russian")
	H.x = 225
	H.y = 58
	H.z = 1
	H.default_language = all_languages["Russian"]
	if(prob(10))
		H.add_language("English")
		H << "<b>Yay! You know english language!</b>"

/datum/job/warpac_zampolit
	title = "Zampolit"
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	head_position = 1
	whitelist_only = 1
	selection_color = "#530909"
	outfit_type = /decl/hierarchy/outfit/job/sa_zampolit
	whitelist_group = "saofficier"
//	access = list(access_ru_soldier, access_ru_medic, access_ru_surgerist, access_ru_engineer, access_ru_heavy_weapon, access_ru_squad_leader, access_ru_cook, access_ru_commander)
//	minimal_access = list(access_ru_soldier, access_ru_medic, access_ru_surgerist, access_ru_engineer, access_ru_heavy_weapon, access_ru_squad_leader, access_ru_cook, access_ru_commander)
	spawn_location = "JoinLateSA"
	department_flag = WARPAC

/datum/job/warpac_zampolit/update_character(var/mob/living/carbon/human/H)
	H.add_language("Russian")
	H.default_language = all_languages["Russian"]
	H.x = 214
	H.y = 22
	H.z = 1

/datum/job/csla_strelec
	title = "Strelec"
	faction = "Station"
	total_positions = 8
	spawn_positions = 8
	whitelist_only = 1
	selection_color = "#FF7F50"
	whitelist_group = "csla"
	outfit_type = /decl/hierarchy/outfit/job/csla_rifleman
//	access = list(access_ru_soldier)
//	minimal_access = list(access_ru_soldier)
	spawn_location = "JoinLateSA"
	department_flag = WARPAC

/datum/job/csla_strelec/update_character(var/mob/living/carbon/human/H)
	H.add_language("Czech")
	H.default_language = all_languages["Czech"]
	H.x = 220
	H.y = 84
	H.z = 1
	if(prob(4))
		H.add_language("German")
		H << "<b>Yay! You know german language!</b>"

/datum/job/csla_seniorstrelec
	title = "Senior strelec"
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	whitelist_only = 1
	selection_color = "#FF7F50"
	whitelist_group = "csla"
	outfit_type = /decl/hierarchy/outfit/job/csla_comdeputy
//	access = list(access_ru_soldier)
//	minimal_access = list(access_ru_soldier)
	spawn_location = "JoinLateSA"
	department_flag = WARPAC

/datum/job/csla_seniorstrelec/update_character(var/mob/living/carbon/human/H)
	H.add_language("Czech")
	H.default_language = all_languages["Czech"]
	H.x = 221
	H.y = 84
	H.z = 1
	if(prob(7))
		H.add_language("German")
		H << "<b>Yay! You know german language!</b>"

/datum/job/csla_sanitar
	title = "Sanitar"
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	whitelist_only = 1
	selection_color = "#FF7F50"
	whitelist_group = "csla"
	outfit_type = /decl/hierarchy/outfit/job/csla_medic
//	access = list(access_ru_soldier)
//	minimal_access = list(access_ru_soldier)
	spawn_location = "JoinLateSA"
	department_flag = WARPAC

/datum/job/csla_sanitar/update_character(var/mob/living/carbon/human/H)
	H.add_language("Czech")
	H.default_language = all_languages["Czech"]
	H.x = 219
	H.y = 84
	H.z = 1
	if(prob(7))
		H.add_language("German")
		H << "<b>Yay! You know german language!</b>"

/datum/job/csla_grenadier
	title = "Vhrac"
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	whitelist_only = 1
	selection_color = "#FF7F50"
	whitelist_group = "csla"
	outfit_type = /decl/hierarchy/outfit/job/csla_grenadier
//	access = list(access_ru_soldier)
//	minimal_access = list(access_ru_soldier)
	spawn_location = "JoinLateSA"
	department_flag = WARPAC

/datum/job/csla_grenadier/update_character(var/mob/living/carbon/human/H)
	H.add_language("Czech")
	H.default_language = all_languages["Czech"]
	H.x = 220
	H.y = 82
	H.z = 1
	if(prob(7))
		H.add_language("German")
		H << "<b>Yay! You know german language!</b>"

/datum/job/csla_mg
	title = "Delostrelec"
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	whitelist_only = 1
	selection_color = "#FF7F50"
	whitelist_group = "csla"
	outfit_type = /decl/hierarchy/outfit/job/csla_mg
//	access = list(access_ru_soldier)
//	minimal_access = list(access_ru_soldier)
	spawn_location = "JoinLateSA"
	department_flag = WARPAC

/datum/job/csla_mg/update_character(var/mob/living/carbon/human/H)
	H.add_language("Czech")
	H.default_language = all_languages["Czech"]
	H.x = 220
	H.y = 81
	H.z = 1
	if(prob(7))
		H.add_language("German")
		H << "<b>Yay! You know german language!</b>"

/datum/job/csla_sniper
	title = "Nadstrelec"
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	whitelist_only = 1
	selection_color = "#FF7F50"
	whitelist_group = "csla"
	outfit_type = /decl/hierarchy/outfit/job/csla_marksman
//	access = list(access_ru_soldier)
//	minimal_access = list(access_ru_soldier)
	spawn_location = "JoinLateSA"
	department_flag = WARPAC

/datum/job/csla_sniper/update_character(var/mob/living/carbon/human/H)
	H.add_language("Czech")
	H.default_language = all_languages["Czech"]
	H.x = 222
	H.y = 84
	H.z = 1
	if(prob(7))
		H.add_language("German")
		H << "<b>Yay! You know german language!</b>"


/datum/job/csla_sl
	title = "Cetar"
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	whitelist_only = 1
	selection_color = "#FF7F50"
	whitelist_group = "csla"
	outfit_type = /decl/hierarchy/outfit/job/csla_sl
//	access = list(access_ru_soldier)
//	minimal_access = list(access_ru_soldier)
	spawn_location = "JoinLateSA"
	department_flag = WARPAC

/datum/job/csla_sl/update_character(var/mob/living/carbon/human/H)
	H.add_language("Czech")
	H.add_language("Russian")
	H.default_language = all_languages["Czech"]
	H.x = 220
	H.y = 84
	H.z = 1
	if(prob(7))
		H.add_language("German")
		H << "<b>Yay! You know german language!</b>"

/datum/job/csla_platlead
	title = "Porucik"
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	whitelist_only = 1
	selection_color = "#FF7F50"
	whitelist_group = "csla"
	outfit_type = /decl/hierarchy/outfit/job/csla_platld
//	access = list(access_ru_soldier)
//	minimal_access = list(access_ru_soldier)
	spawn_location = "JoinLateSA"
	department_flag = WARPAC

/datum/job/csla_platdep/update_character(var/mob/living/carbon/human/H)
	H.add_language("Czech")
	H.add_language("Russian")
	H.default_language = all_languages["Czech"]
	H.x = 220
	H.y = 84
	H.z = 1
	if(prob(7))
		H.add_language("German")
		H << "<b>Yay! You know german language!</b>"

/datum/job/csla_platdep
	title = "Rotmistr"
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	whitelist_only = 1
	selection_color = "#FF7F50"
	whitelist_group = "csla"
	outfit_type = /decl/hierarchy/outfit/job/csla_platdep
//	access = list(access_ru_soldier)
//	minimal_access = list(access_ru_soldier)
	spawn_location = "JoinLateSA"
	department_flag = WARPAC

/datum/job/csla_platdep/update_character(var/mob/living/carbon/human/H)
	H.add_language("Czech")
	H.add_language("Russian")
	H.default_language = all_languages["Czech"]
	H.x = 220
	H.y = 84
	H.z = 1
	if(prob(7))
		H.add_language("German")
		H << "<b>Yay! You know german language!</b>"
