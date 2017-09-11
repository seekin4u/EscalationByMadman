/////////////////////////////
/*/datum/job/nato_cmpcommander
	title = "Commanding Officer"
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	head_position = 1
	selection_color = "#2d2d63"
	whitelist_only = 1
	whitelist_group = "natoofficier"
	rankprefix  = "Cpt."
	department_flag = NATO
	outfit_type = /decl/hierarchy/outfit/job/us_co
//	access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
//	minimal_access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
	spawn_location = "JoinLateUSMC"

/datum/job/nato_cmpcommander/update_character(var/mob/living/carbon/human/H)
	H.x = 70
	H.y = 141
	H.z = 2
	H.add_language("English")
	H.add_language("German")
	H.default_language = all_languages["English"]
	if(prob(60))
		H.add_language("Russian")
		H << "<b>So you know russian language.</b>"
*/
/////////////////////////////
/datum/job/nato_gsgt
	title = "Gunnery Sergeant"
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	head_position = 1
	selection_color = "#2d2d63"
	whitelist_only = 1
	whitelist_group = "natoofficier"
	rankprefix  = "Gsgt."
	department_flag = NATO
	outfit_type = /decl/hierarchy/outfit/job/us_gysgt
//	access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
//	minimal_access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
	spawn_location = "JoinLateUSMC"

/datum/job/nato_gsgt/update_character(var/mob/living/carbon/human/H)
	H.x = 95
	H.y = 163
	H.z = 2
	H.add_language("English")
	H.add_language("German")
	H.default_language = all_languages["English"]
	if(prob(15))
		H.add_language("Russian")
		H << "<b>So you know russian language.</b>"
/*
/datum/job/nato_propertynco
	title = "Property Officer"
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	head_position = 1
	selection_color = "#2d2d63"
	whitelist_only = 1
	whitelist_group = "natoofficier"
	rankprefix  = "Gsgt."
	department_flag = NATO
	outfit_type = /decl/hierarchy/outfit/job/us_propertynco
//	access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
//	minimal_access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
	spawn_location = "JoinLateUSMC"

/datum/job/nato_propertynco/update_character(var/mob/living/carbon/human/H)
	H.x = 70
	H.y = 141
	H.z = 2
	H.add_language("English")
	H.add_language("German")
	H.default_language = all_languages["English"]
	if(prob(15))
		H.add_language("Russian")
		H << "<b>So you know russian language.</b>"

*/

/////////////////////////////
/datum/job/nato_commander
	title = "Platoon Commander"
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	head_position = 1
	selection_color = "#2d2d63"
	whitelist_only = 1
	whitelist_group = "natoofficier"
	rankprefix  = "2nd Lt."
	department_flag = NATO
	outfit_type = /decl/hierarchy/outfit/job/us_plleader
//	access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
//	minimal_access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
	spawn_location = "JoinLateUSMC"

/datum/job/nato_commander/update_character(var/mob/living/carbon/human/H)
	H.x = 70
	H.y = 141
	H.z = 2
	H.add_language("English")
	H.add_language("German")
	H.default_language = all_languages["English"]
	if(prob(10))
		H.add_language("Russian")
		H << "<b>So you know russian language.</b>"

/datum/job/nato_comdeputy
	title = "Platoon Sergeant"
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	head_position = 1
	whitelist_only = 1
	selection_color = "#2d2d63"
	whitelist_group = "natosergeant"
	rankprefix  = "MSgt."
	outfit_type = /decl/hierarchy/outfit/job/us_depplleader
	spawn_location = "JoinLateUSMC"
	department_flag = NATO

/datum/job/nato_comdeputy/update_character(var/mob/living/carbon/human/H)
	H.x = 71
	H.y = 143
	H.z = 2
	H.add_language("English")
	H.add_language("German")
	H.default_language = all_languages["English"]
	if(prob(20))
		H.add_language("Russian")
		H << "<b>So you know russian language.</b>"

/datum/job/nato_messenger
	title = "Messenger"
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	head_position = 1
	whitelist_only = 1
	rankprefix  = "PFC"
	selection_color = "#2d2d63"
	whitelist_group = "natoenlisted"
	outfit_type = /decl/hierarchy/outfit/job/us_messenger
	spawn_location = "JoinLateUSMC"
	department_flag = NATO

/datum/job/nato_messenger/update_character(var/mob/living/carbon/human/H)
	H.x = 71
	H.y = 143
	H.z = 2
	H.add_language("English")
	H.default_language = all_languages["English"]
	if(prob(50))
		H.add_language("Russian")
		H << "<b>So you know russian language.</b>"

/datum/job/nato_gysgt
	title = "Gunnery Sergeant"
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	head_position = 1
	whitelist_only = 1
	rankprefix  = "PFC"
	selection_color = "#2d2d63"
	whitelist_group = "natosergeant"
	outfit_type = /obj/item/clothing/under/coldwar/usmc/gysgt
	spawn_location = "JoinLateUSMC"
	department_flag = NATO

/datum/job/nato_gysgt/update_character(var/mob/living/carbon/human/H)
	H.x = 71
	H.y = 143
	H.z = 2
	H.add_language("English")
	H.default_language = all_languages["English"]
	if(prob(50))
		H.add_language("Russian")
		H << "<b>So you know russian language.</b>"

/datum/job/nato_squadleader
	title = "Squad Leader"
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	head_position = 1
	whitelist_only = 1
	selection_color = "#4c4ca5"
	rankprefix  = "Sgt."
	whitelist_group = "natosergeant"
	outfit_type = /decl/hierarchy/outfit/job/us_sqleader
	spawn_location = "JoinLateUSMC"
	department_flag = NATO

/datum/job/nato_squadleader/update_character(var/mob/living/carbon/human/H)
	H.x = 71
	H.y = 143
	H.z = 2
	H.add_language("English")
	H.default_language = all_languages["English"]
	if(prob(50))
		H.add_language("Russian")
		H << "<b>So you know russian language.</b>"

/datum/job/nato_fireteamleader
	title = "Fireteam Leader"
	faction = "Station"
	total_positions = 6
	spawn_positions = 6
	head_position = 1
	whitelist_only = 1
	selection_color = "#4c4ca5"
	whitelist_group = "natoenlisted"
	rankprefix  = "Cpl."
	outfit_type = /decl/hierarchy/outfit/job/us_ftleader
//	access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
//	minimal_access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
	spawn_location = "JoinLateUSMC"
	department_flag = NATO

/datum/job/nato_fireteamleader/update_character(var/mob/living/carbon/human/H)
	H.x = 70
	H.y = 133
	H.z = 2
	H.add_language("English")
	H.default_language = all_languages["English"]
	if(prob(6))
		H.add_language("Russian")
		H << "<b>So you know russian language.</b>"

/datum/job/nato_fireteamlmg
	title = "Fireteam Designated Machinegunner"
	faction = "Station"
	total_positions = 6
	spawn_positions = 6
	head_position = 1
	whitelist_only = 1
	rankprefix  = "PFC"
	selection_color = "#4c4ca5"
	whitelist_group = "natoenlisted"
	outfit_type = /decl/hierarchy/outfit/job/us_ftlmg
//	access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
//	minimal_access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
	spawn_location = "JoinLateUSMC"
	department_flag = NATO

/datum/job/nato_fireteamlmg/update_character(var/mob/living/carbon/human/H)
	H.x = 70
	H.y = 133
	H.z = 2
	H.add_language("English")
	H.default_language = all_languages["English"]
	if(prob(3))
		H.add_language("Russian")
		H << "<b>So you know russian language.</b>"

/datum/job/nato_fireteamammo
	title = "Fireteam Designated Machinegunner Assistant"
	faction = "Station"
	total_positions = 6
	spawn_positions = 6
	head_position = 1
	whitelist_only = 1
	rankprefix  = "PFC"
	selection_color = "#4c4ca5"
	whitelist_group = "natoenlisted"
	outfit_type = /decl/hierarchy/outfit/job/us_ftlmgsup
//	access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
//	minimal_access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
	spawn_location = "JoinLateUSMC"
	department_flag = NATO

/datum/job/nato_fireteamammo/update_character(var/mob/living/carbon/human/H)
	H.add_language("English")
	H.default_language = all_languages["English"]
	H.x = 70
	H.y = 133
	H.z = 2
	if(prob(3))
		H.add_language("Russian")
		H << "<b>So you know russian language.</b>"

/datum/job/nato_fireteamscout
	title = "Fireteam Rifleman"
	faction = "Station"
	total_positions = 6
	spawn_positions = 6
	head_position = 1
	rankprefix  = "PFC"
	whitelist_only = 1
	whitelist_group = "natoenlisted"
	outfit_type = /decl/hierarchy/outfit/job/us_ftrifleman
	selection_color = "#4c4ca5"
//	access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
//	minimal_access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
	department_flag = NATO
	spawn_location = "JoinLateUSMC"

/datum/job/nato_fireteamscout/update_character(var/mob/living/carbon/human/H)
	H.add_language("English")
	H.default_language = all_languages["English"]
	H.x = 70
	H.y = 133
	H.z = 2
	if(prob(6))
		H.add_language("Russian")
		H << "<b>So you know russian language.</b>"

/datum/job/nato_combatmedic
	title = "Field Medic"
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	head_position = 1
	whitelist_only = 1
	rankprefix  = "Cpl."
	whitelist_group = "natoenlisted"
	selection_color = "#4c4ca5"
	outfit_type = /decl/hierarchy/outfit/job/us_commedic
//	access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
//	minimal_access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
	department_flag = NATO
	spawn_location = "JoinLateUSMC"


/datum/job/nato_combatmedic/update_character(var/mob/living/carbon/human/H)
	H.add_language("English")
	H.default_language = all_languages["English"]
	H.x = 93
	H.y = 110
	H.z = 2
	if(prob(10))
		H.add_language("Russian")
		H << "<b>So you know russian language.</b>"

/datum/job/nato_corpsman
	title = "Hospital Corpsman"
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	head_position = 1
	whitelist_only = 1
	rankprefix  = "SSgt."
	selection_color = "#4c4ca5"
	whitelist_group = "natosergeant"
	outfit_type = /decl/hierarchy/outfit/job/us_doc
//	access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
//	minimal_access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
	spawn_location = "JoinLateUSMC"
	department_flag = NATO


/datum/job/nato_corpsman/update_character(var/mob/living/carbon/human/H)
	H.add_language("English")
	H.add_language("German")
	H.default_language = all_languages["English"]
	H.x = 93
	H.y = 110
	H.z = 2
	if(prob(10))
		H.add_language("Russian")
		H << "<b>So you know russian language.</b>"

/datum/job/nato_marksman
	title = "Designated Marksman"
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	head_position = 1
	whitelist_only = 1
	rankprefix  = "Sgt."
	selection_color = "#4c4ca5"
	whitelist_group = "natosergeant"
	outfit_type = /decl/hierarchy/outfit/job/us_dm
//	access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
//	minimal_access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
	spawn_location = "JoinLateUSMC"
	department_flag = NATO

/datum/job/nato_marksman/update_character(var/mob/living/carbon/human/H)
	H.add_language("English")
	H.default_language = all_languages["English"]
	H.x = rand(73, 77)
	H.y = 149
	H.z = 2
	if(prob(10))
		H.add_language("Russian")
		H << "<b>So you know russian language.</b>"

/datum/job/nato_pilot
	title = "Helicopter Pilot"
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	head_position = 1
	whitelist_only = 1
	rankprefix  = "Sgt."
	selection_color = "#4c4ca5"
	whitelist_group = "natoenlisted"
	outfit_type = /decl/hierarchy/outfit/job/us_pilot
//	access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
//	minimal_access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
	spawn_location = "JoinLateUSMC"
	department_flag = NATO

/datum/job/nato_pilot/update_character(var/mob/living/carbon/human/H)
	H.add_language("English")
	H.default_language = all_languages["English"]
	H.x = 92
	H.y = 75
	H.z = 1
	if(prob(40))
		H.add_language("Russian")
		H << "<b>So you know russian language.</b>"

/datum/job/nato_sapper
	title = "Field Sapper"
	faction = "Station"
	total_positions = 3
	rankprefix  = "LCpl."
	spawn_positions = 3
	whitelist_only = 1
	selection_color = "#4c4ca5"
	whitelist_group = "natoenlisted"
	outfit_type = /decl/hierarchy/outfit/job/us_sapper
//	access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
//	minimal_access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
	spawn_location = "JoinLateUSMC"
	department_flag = NATO

/datum/job/nato_sapper/update_character(var/mob/living/carbon/human/H)
	H.add_language("English")
	H.default_language = all_languages["English"]
	H.x = 75
	H.y = 175
	H.z = 2
	if(prob(10))
		H.add_language("Russian")
		H << "<b>So you know russian language.</b>"

/datum/job/press
	title = "War Correspondent"
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	whitelist_only = 1
	selection_color = "#026865"
	whitelist_group = "press"
	outfit_type = /decl/hierarchy/outfit/job/press
//	access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
//	minimal_access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
	spawn_location = "JoinLateUSMC"
	department_flag = NATO

/datum/job/press/update_character(var/mob/living/carbon/human/H)
	H.add_language("German")
	H.add_language("English")
	H.add_language("Russian")
	H.default_language = all_languages["German"]
	H.x = 130
	H.y = 3
	H.z = 2

/datum/job/bundes_pvt
	title = "Schutze"
	faction = "Station"
	total_positions = 15
	rankprefix = "Soldat"
	spawn_positions = 15
	whitelist_only = 1
	selection_color = "#7F00FF"
	whitelist_group = "bundeswehr"
	outfit_type = /decl/hierarchy/outfit/job/bundeswehr_pvt
//	access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
//	minimal_access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
	spawn_location = "JoinLateUSMC"
	department_flag = NATO

/datum/job/bundes_pvt/update_character(var/mob/living/carbon/human/H)
	H.add_language("German")
	H.default_language = all_languages["German"]
	H.x = 76
	H.y = 112
	H.z = 2
	if(prob(10))
		H.add_language("English")
		H << "<b>So you know english language.</b>"

/datum/job/bundes_mg
	title = "Maschinengewehrschutze"
	faction = "Station"
	total_positions = 1
	rankprefix = "Gefreiter"
	spawn_positions = 6
	whitelist_only = 6
	selection_color = "#7F00FF"
	whitelist_group = "bundeswehr"
	outfit_type = /decl/hierarchy/outfit/job/bundeswehr_mg
//	access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
//	minimal_access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
	spawn_location = "JoinLateUSMC"
	department_flag = NATO

/datum/job/bundes_mg/update_character(var/mob/living/carbon/human/H)
	H.add_language("German")
	H.default_language = all_languages["German"]
	H.x = 76
	H.y = 112
	H.z = 2
	if(prob(6))
		H.add_language("English")
		H << "<b>So you know english language.</b>"

/datum/job/bundes_sl
	title = "Gruppenfuhrer"
	faction = "Station"
	total_positions = 1
	rankprefix = "Unteroffizier"
	spawn_positions = 3
	whitelist_only = 3
	selection_color = "#7F00FF"
	whitelist_group = "bundeswehr"
	outfit_type = /decl/hierarchy/outfit/job/bundeswehr_sl
//	access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
//	minimal_access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
	spawn_location = "JoinLateUSMC"
	department_flag = NATO

/datum/job/bundes_sl/update_character(var/mob/living/carbon/human/H)
	H.add_language("German")
	H.default_language = all_languages["German"]
	H.x = 76
	H.y = 112
	H.z = 2
	if(prob(95))
		H.add_language("English")
		H << "<b>So you know english language.</b>"

/datum/job/bundes_sldep
	title = "Stellvertretenderfuhrer"
	faction = "Station"
	total_positions = 3
	rankprefix = "Stabsgefreiter"
	spawn_positions = 3
	whitelist_only = 1
	selection_color = "#7F00FF"
	whitelist_group = "bundeswehr"
	outfit_type = /decl/hierarchy/outfit/job/bundeswehr_sldep
//	access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
//	minimal_access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
	spawn_location = "JoinLateUSMC"
	department_flag = NATO

/datum/job/bundes_sldep/update_character(var/mob/living/carbon/human/H)
	H.add_language("German")
	H.default_language = all_languages["German"]
	H.x = 76
	H.y = 112
	H.z = 2
	if(prob(6))
		H.add_language("English")
		H << "<b>So you know english language.</b>"

/datum/job/bundes_zugfuhrer
	title = "Zugfuhrer"
	faction = "Station"
	total_positions = 1
	rankprefix = "Leutnant"
	spawn_positions = 1
	whitelist_only = 1
	selection_color = "#7F00FF"
	whitelist_group = "bundeswehr"
	outfit_type = /decl/hierarchy/outfit/job/bundeswehr_pltld
//	access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
//	minimal_access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
	spawn_location = "JoinLateUSMC"
	department_flag = NATO

/datum/job/bundes_zugfuhrer/update_character(var/mob/living/carbon/human/H)
	H.add_language("German")
	H.default_language = all_languages["German"]
	H.x = 76
	H.y = 112
	H.z = 2
	if(prob(95))
		H.add_language("English")
		H << "<b>So you know english language.</b>"

/datum/job/bundes_zugfuhrerdeputy
	title = "Zugfuhrer stellvertreter"
	faction = "Station"
	total_positions = 1
	rankprefix = "Stabsunteroffizier"
	spawn_positions = 1
	whitelist_only = 1
	selection_color = "#7F00FF"
	whitelist_group = "bundeswehr"
	outfit_type = /decl/hierarchy/outfit/job/bundeswehr_pldep
//	access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
//	minimal_access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
	spawn_location = "JoinLateUSMC"
	department_flag = NATO

/datum/job/bundes_zugfuhrerdeputy/update_character(var/mob/living/carbon/human/H)
	H.add_language("German")
	H.default_language = all_languages["German"]
	H.x = 76
	H.y = 112
	H.z = 2
	if(prob(95))
		H.add_language("English")
		H << "<b>So you know english language.</b>"

/datum/job/bundes_medic
	title = "Sanitater"
	faction = "Station"
	total_positions = 1
	rankprefix = "Gefreiter"
	spawn_positions = 1
	whitelist_only = 1
	selection_color = "#7F00FF"
	whitelist_group = "bundeswehr"
	outfit_type = /decl/hierarchy/outfit/job/bundeswehr_medic
//	access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
//	minimal_access = list(access_nato_soldier, access_nato_medic, access_nato_surgerist, access_nato_engineer, access_nato_heavy_weapon, access_nato_cook, access_nato_squad_leader, access_nato_commander)
	spawn_location = "JoinLateUSMC"
	department_flag = NATO

/datum/job/bundes_medic/update_character(var/mob/living/carbon/human/H)
	H.add_language("German")
	H.default_language = all_languages["German"]
	H.x = 76
	H.y = 112
	H.z = 2
	if(prob(10))
		H.add_language("English")
		H << "<b>So you know english language.</b>"