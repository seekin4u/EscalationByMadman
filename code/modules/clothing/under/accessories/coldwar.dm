/obj/item/clothing/accessory/badge/dogtag
	name = "dog tag"
	desc = "That's the special token used for identification soldiers of USMC."
	icon_state = "tags"
	slot_flags = SLOT_BELT | SLOT_ID
	badge_string = "Enlisted"

	var/owner_name = null
	var/blood_type = null

/obj/item/clothing/accessory/badge/dogtag/New()
	..()
	spawn(30)
	if(istype(loc, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = loc
		owner_name = H.real_name
		blood_type = H.dna.b_type
		desc += "\nName: [owner_name]"
		desc += "\nBlood Type: [blood_type]"

/obj/item/clothing/accessory/badge/dogtag/officer
	badge_string = "Officer"

/obj/item/clothing/accessory/badge/dogtag/militaryid
	name = "military identification token"
	desc = "That's the special token used for identification soldiers of Soviet army. Has a number on it."
	icon_state = "sovtoken"
	slot_flags = SLOT_BELT | SLOT_ID
	badge_string = "Soldat"
	var/number = null

/obj/item/clothing/accessory/badge/dogtag/militaryid/officer
	badge_string = "Ofitser"

/obj/item/clothing/accessory/badge/dogtag/militaryid/New()
	..()
	number = rand(11111,99999)
	desc += "\n[number]"

/obj/item/clothing/accessory/insignia
	name = "Insignia"
	desc = "That's an insignia"

/obj/item/clothing/accessory/insignia/soviet/pvt
	name = "'Ryadovoi' insignia"
	icon_state = "sa_pvt_insignia"

/obj/item/clothing/accessory/insignia/soviet/gefr
	name = "'Efreitor' insignia"
	icon_state = "sa_efr_insignia"

/obj/item/clothing/accessory/insignia/soviet/jsgt
	name = "'Mladshiy sergant' insignia"
	icon_state = "sa_jsgt_insignia"

/obj/item/clothing/accessory/insignia/soviet/sgt
	name = "'Sergant' insignia"
	icon_state = "sa_sgt_insignia"

/obj/item/clothing/accessory/insignia/soviet/ssgt
	name = "'Starshiy Sergant' insignia"
	icon_state = "sa_ssgt_insignia"

/obj/item/clothing/accessory/insignia/soviet/star
	name = "'Starshina' insignia"
	icon_state = "sa_star_insignia"

/obj/item/clothing/accessory/insignia/soviet/prap
	name = "'Praporshik' insignia"
	icon_state = "sa_pr_insignia"

/obj/item/clothing/accessory/insignia/soviet/stpr
	name = "'Starshiy Praporshik' insignia"
	icon_state = "sa_stpr_insignia"

/obj/item/clothing/accessory/insignia/soviet/mllt
	name = "'Mladshiy Leitenant' insignia"
	icon_state = "sa_mllt_insignia"

/obj/item/clothing/accessory/insignia/soviet/lt
	name = "'Leitenant' insignia"
	icon_state = "sa_lt_insignia"

/obj/item/clothing/accessory/insignia/soviet/stlt
	name = "'Starshiy Leitenant' insignia"
	icon_state = "sa_stlt_insignia"

/obj/item/clothing/accessory/insignia/soviet/cpt
	name = "'Kapitan' insignia"
	icon_state = "sa_cpt_insignia"


/obj/item/clothing/accessory/insignia/usmc/pfc
	name = "Private First Class insignia"
	icon_state = "usmc_pfc_insignia"

/obj/item/clothing/accessory/insignia/usmc/lcpl
	name = "Lance Corporal insignia"
	icon_state = "usmc_lcpl_insignia"


/obj/item/clothing/accessory/insignia/usmc/cpl
	name = "Corporal insignia"
	icon_state = "usmc_cpl_insignia"

/obj/item/clothing/accessory/insignia/usmc/sgt
	name = "Sergeant insignia"
	icon_state = "usmc_sgt_insignia"

/obj/item/clothing/accessory/insignia/usmc/ssgt
	name = "Staff Sergeant insignia"
	icon_state = "usmc_ssgt_insignia"

/obj/item/clothing/accessory/insignia/usmc/msgt
	name = "Master Sergeant insignia"
	icon_state = "usmc_msgt_insignia"

/obj/item/clothing/accessory/insignia/usmc/gysgt
	name = "Gunnery Sergeant insignia"
	icon_state = "usmc_msgt_insignia"

/obj/item/clothing/accessory/insignia/usmc/frstsgt
	name = "First Sergeant insignia"
	icon_state = "usmc_1stsgt_insignia"


/obj/item/clothing/accessory/insignia/usmc/scndlt
	name = "Second Lieutenant insignia"
	icon_state = "usmc_2ndlt_insignia"

/obj/item/clothing/accessory/insignia/usmc/frstlt
	name = "First Lieutenant insignia"
	icon_state = "usmc_1stlt_insignia"

/obj/item/clothing/accessory/insignia/bundeswehr/soldat
	name = "Soldat insignia"
	icon_state = "bundes_soldat"

/obj/item/clothing/accessory/insignia/bundeswehr/stabsgefr
	name = "Stabsgefreiter insignia"
	icon_state = "bundes_stabsgefr"

/obj/item/clothing/accessory/insignia/bundeswehr/stabsunter
	name = "Stabsunteroffizier insignia"
	icon_state = "bundes_stabsunteroffizier"

/obj/item/clothing/accessory/insignia/usmc/frstlt
	name = "First Lieutenant insignia"
	icon_state = "usmc_1stlt_insignia"

/obj/item/clothing/accessory/insignia/csla/vojin
	name = "Vojin insignia"
	icon_state = "csla_vojin"

/obj/item/clothing/accessory/insignia/csla/svobodnik
	name = "Svobodnik insignia"
	icon_state = "csla_svobodnik"

/obj/item/clothing/accessory/insignia/csla/desatnik
	name = "Desatnik insignia"
	icon_state = "csla_desatnik"

/obj/item/clothing/accessory/insignia/csla/cetar
	name = "Cetar insignia"
	icon_state = "csla_cetar"

/obj/item/clothing/accessory/insignia/csla/rotmistr
	name = "Rotmistr insignia"
	icon_state = "csla_rotmistr"

/obj/item/clothing/accessory/insignia/csla/rotny
	name = "Rotny insignia"
	icon_state = "csla_rotny"

/obj/item/clothing/accessory/insignia/csla/porucik
	name = "Porucik insignia"
	icon_state = "csla_porucik"


/obj/item/clothing/accessory/insignia/bundeswehr/gefreiter
	name = "Gefreiter insignia"
	icon_state = "bundes_gefreiter"

/obj/item/clothing/accessory/insignia/bundeswehr/stabsunter
	name = "Stabsunteroffizier insignia"
	icon_state = "bundes_stabsunteroffizier"

/obj/item/clothing/accessory/insignia/bundeswehr/unter
	name = "Unteroffizier insignia"
	icon_state = "bundes_unteroffizier"

/obj/item/clothing/accessory/insignia/bundeswehr/leutnant
	name = "Leutnant insignia"
	icon_state = "bundes_leutnant"

/obj/item/clothing/accessory/squadpatch
	name = "Squad patch"
	desc = null
	icon_state = "squadpatch"
	var/squad = null
