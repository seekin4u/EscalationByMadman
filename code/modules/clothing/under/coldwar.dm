/obj/item/clothing/under/coldwar
	has_sensor = 0
	armor = list(melee = 10, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	siemens_coefficient = 0.9
	var/insrank = null

/obj/item/clothing/under/coldwar/afganka
	name = "'Afghanka' (autumn variant)"
	desc = "That's the standard-issue uniform of the USSR Army."
	icon_state = "afganka_autumn"
	item_state = "bl_suit"
	worn_state = "afganka_autumn_var1"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO
	cold_protection = UPPER_TORSO|LOWER_TORSO
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/coldwar/afganka/var2
	worn_state = "afganka_autumn_var2"

/obj/item/clothing/under/coldwar/afganka/var3
	worn_state = "afganka_autumn_var3"

/obj/item/clothing/under/coldwar/afganka/winter
	name = "'Afghanka' (winter variant)"
	desc = "That's the winter variant of the standard-issue uniform of the USSR Army."
	icon_state = "afganka_winter"
	item_state = "bl_suit"
	worn_state = "afganka_winter_var1"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
/obj/item/clothing/under/coldwar/afganka/winter/var2
	worn_state = "afganka_winter_var2"

/obj/item/clothing/under/coldwar/afganka/winter/var3
	worn_state = "afganka_winter_var3"

/obj/item/clothing/under/coldwar/afganka/winter/var3/pvt
	insrank = "Ryadovoi"
	starting_accessories = list(/obj/item/clothing/accessory/insignia/soviet/pvt, /obj/item/clothing/accessory/badge/dogtag/militaryid)

/obj/item/clothing/under/coldwar/afganka/winter/var3/gefr
	starting_accessories = list(/obj/item/clothing/accessory/insignia/soviet/gefr, /obj/item/clothing/accessory/badge/dogtag/militaryid)
	insrank = "Efreitor"

/obj/item/clothing/under/coldwar/afganka/winter/var2/jsgt
	starting_accessories = list(/obj/item/clothing/accessory/insignia/soviet/jsgt, /obj/item/clothing/accessory/badge/dogtag/militaryid)
	insrank = "Mladshiy Sergant"

/obj/item/clothing/under/coldwar/afganka/winter/var2/sgt
	starting_accessories = list(/obj/item/clothing/accessory/insignia/soviet/sgt, /obj/item/clothing/accessory/badge/dogtag/militaryid)
	insrank = "Sergant"

/obj/item/clothing/under/coldwar/afganka/winter/var3/ssgt
	starting_accessories = list(/obj/item/clothing/accessory/insignia/soviet/ssgt, /obj/item/clothing/accessory/badge/dogtag/militaryid)
	insrank = "Starshiy Sergant"

/obj/item/clothing/under/coldwar/afganka/winter/var3/star
	starting_accessories = list(/obj/item/clothing/accessory/insignia/soviet/star, /obj/item/clothing/accessory/badge/dogtag/militaryid)
	insrank = "Starshina"

/obj/item/clothing/under/coldwar/afganka/winter/var2/medic
	starting_accessories = list(/obj/item/clothing/accessory/insignia/soviet/gefr, /obj/item/clothing/accessory/armband/med, /obj/item/clothing/accessory/badge/dogtag/militaryid)
	insrank = "Efreitor"

/obj/item/clothing/under/coldwar/afganka/winter/prap
	starting_accessories = list(/obj/item/clothing/accessory/insignia/soviet/prap, /obj/item/clothing/accessory/badge/dogtag/militaryid)
	insrank = "Praporshik"

/obj/item/clothing/under/coldwar/afganka/winter/stpr
	starting_accessories = list(/obj/item/clothing/accessory/insignia/soviet/stpr, /obj/item/clothing/accessory/badge/dogtag/militaryid)
	insrank = "Starshiy Praporshik"

/obj/item/clothing/under/coldwar/afganka/winter/mllt
	starting_accessories = list(/obj/item/clothing/accessory/insignia/soviet/mllt, /obj/item/clothing/accessory/badge/dogtag/militaryid)
	insrank = "Mladshiy Leitenant"

/obj/item/clothing/under/coldwar/afganka/winter/doc
	starting_accessories = list(/obj/item/clothing/accessory/insignia/soviet/lt, /obj/item/clothing/accessory/armband/medblue, /obj/item/clothing/accessory/badge/dogtag/militaryid/officer)
	insrank = "Leitenant"

/obj/item/clothing/under/coldwar/afganka/winter/lt
	starting_accessories = list(/obj/item/clothing/accessory/insignia/soviet/lt, /obj/item/clothing/accessory/badge/dogtag/militaryid/officer)
	insrank = "Leitenant"

/obj/item/clothing/under/coldwar/afganka/winter/stlt
	starting_accessories = list(/obj/item/clothing/accessory/insignia/soviet/stlt, /obj/item/clothing/accessory/badge/dogtag/militaryid/officer)
	insrank = "Starshiy Leitenant"

/obj/item/clothing/under/coldwar/afganka/winter/cpt
	starting_accessories = list(/obj/item/clothing/accessory/insignia/soviet/cpt, /obj/item/clothing/accessory/badge/dogtag/militaryid/officer)
	insrank = "Kapitan"

/obj/item/clothing/under/coldwar/usmc
	name = "USMC winter uniform"
	desc = "That's the standard-issue uniform of the USMC."
	icon_state = "usmc_green"
	item_state = "bl_suit"
	worn_state = "usmc_green"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/coldwar/usmc/winter
	icon_state = "usmc_winter"
	worn_state = "usmc_winter"

/obj/item/clothing/under/coldwar/usmc/wingren
	icon_state = "usmc_wingren"
	worn_state = "usmc_wingren"

/obj/item/clothing/under/coldwar/usmc/camo
	icon_state = "usmc_camo"
	worn_state = "usmc_camo"

/obj/item/clothing/under/coldwar/usmc/grenwin
	icon_state = "usmc_grenwin"
	worn_state = "usmc_grenwin"

/obj/item/clothing/under/coldwar/usmc/winter/pfc
	starting_accessories = list(/obj/item/clothing/accessory/insignia/usmc/pfc, /obj/item/clothing/accessory/badge/dogtag)
	insrank = "Private First Class"
/obj/item/clothing/under/coldwar/usmc/winter/lcpl
	starting_accessories = list(/obj/item/clothing/accessory/insignia/usmc/lcpl, /obj/item/clothing/accessory/badge/dogtag)
	insrank = "Lance Corporal"
/obj/item/clothing/under/coldwar/usmc/winter/cpl
	starting_accessories = list(/obj/item/clothing/accessory/insignia/usmc/cpl, /obj/item/clothing/accessory/badge/dogtag)
	insrank = "Corporal"
/obj/item/clothing/under/coldwar/usmc/sgt
	starting_accessories = list(/obj/item/clothing/accessory/insignia/usmc/sgt, /obj/item/clothing/accessory/badge/dogtag)
	insrank = "Sergeant"
/obj/item/clothing/under/coldwar/usmc/winter/sgt
	starting_accessories = list(/obj/item/clothing/accessory/insignia/usmc/sgt, /obj/item/clothing/accessory/badge/dogtag)
	insrank = "Sergeant"
/obj/item/clothing/under/coldwar/usmc/ssgt
	starting_accessories = list(/obj/item/clothing/accessory/insignia/usmc/ssgt, /obj/item/clothing/accessory/badge/dogtag)
/obj/item/clothing/under/coldwar/usmc/msgt
	starting_accessories = list(/obj/item/clothing/accessory/insignia/usmc/msgt, /obj/item/clothing/accessory/badge/dogtag)
	insrank = "Master Sergeant"
/obj/item/clothing/under/coldwar/usmc/gysgt
	starting_accessories = list(/obj/item/clothing/accessory/insignia/usmc/gysgt, /obj/item/clothing/accessory/badge/dogtag)
	insrank = "Gunnery Sergeant"
/obj/item/clothing/under/coldwar/usmc/frstsgt
	starting_accessories = list(/obj/item/clothing/accessory/insignia/usmc/frstsgt, /obj/item/clothing/accessory/badge/dogtag)
	insrank = "First Sergeant"
/obj/item/clothing/under/coldwar/usmc/scndlt
	starting_accessories = list(/obj/item/clothing/accessory/insignia/usmc/scndlt, /obj/item/clothing/accessory/badge/dogtag)
	insrank = "Second Lieutenant"
/obj/item/clothing/under/coldwar/usmc/doc
	starting_accessories = list(/obj/item/clothing/accessory/insignia/usmc/ssgt, /obj/item/clothing/accessory/armband/medblue, /obj/item/clothing/accessory/badge/dogtag)
	insrank = "Staff Sergeant"
/obj/item/clothing/under/coldwar/usmc/medic
	starting_accessories = list(/obj/item/clothing/accessory/insignia/usmc/cpl, /obj/item/clothing/accessory/armband/med, /obj/item/clothing/accessory/badge/dogtag)
	insrank = "Corporal"
/obj/item/clothing/under/coldwar/usmcpilot
	name = "USMC pilot uniform"
	desc = "That's the standard-issue uniform of the USMC."
	icon_state = "usmcpilot"
	item_state = "bl_suit"
	worn_state = "usmcpilot"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	starting_accessories = list(/obj/item/clothing/accessory/insignia/usmc/cpl, /obj/item/clothing/accessory/badge/dogtag)
	insrank = "Corporal"

/obj/item/clothing/under/coldwar/press
	name = "civilian clothes"
	desc = "That's the warm pants with a jacket."
	icon_state = "pressunder"
	item_state = "bl_suit"
	worn_state = "pressunder"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/coldwar/bundeswehr
	name = "Bundeswehr uniform"
	desc = "That's the winter variant of the standard-issue uniform of the Bundeswehr."
	icon_state = "bundeswehr"
	item_state = "bl_suit"
	worn_state = "bundeswehr"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/coldwar/bundeswehr/soldat
	starting_accessories = list(/obj/item/clothing/accessory/insignia/bundeswehr/soldat, /obj/item/clothing/accessory/badge/dogtag)
	insrank = "Soldat"

/obj/item/clothing/under/coldwar/bundeswehr/gefreiter
	starting_accessories = list(/obj/item/clothing/accessory/insignia/bundeswehr/gefreiter, /obj/item/clothing/accessory/badge/dogtag)
	insrank = "Gefreiter"

/obj/item/clothing/under/coldwar/bundeswehr/stabsgefreiter
	starting_accessories = list(/obj/item/clothing/accessory/insignia/bundeswehr/stabsgefr, /obj/item/clothing/accessory/badge/dogtag)
	insrank = "Stabsgefreiter"

/obj/item/clothing/under/coldwar/bundeswehr/unteroffizier
	starting_accessories = list(/obj/item/clothing/accessory/insignia/bundeswehr/unter, /obj/item/clothing/accessory/badge/dogtag)
	insrank = "Unteroffizier"

/obj/item/clothing/under/coldwar/bundeswehr/stabsunteroffizier
	starting_accessories = list(/obj/item/clothing/accessory/insignia/bundeswehr/stabsunter, /obj/item/clothing/accessory/badge/dogtag)
	insrank = "Stabsunteroffizier"

/obj/item/clothing/under/coldwar/bundeswehr/leutnant
	starting_accessories = list(/obj/item/clothing/accessory/insignia/bundeswehr/leutnant, /obj/item/clothing/accessory/badge/dogtag)
	insrank = "Leutnant"

/obj/item/clothing/under/coldwar/bundeswehr/medic
	starting_accessories = list(/obj/item/clothing/accessory/insignia/bundeswehr/stabsgefr, /obj/item/clothing/accessory/armband/medblue, /obj/item/clothing/accessory/badge/dogtag)
	insrank = "Stabsgefreiter"

/obj/item/clothing/under/coldwar/czechoslovak
	name = "Vz.57 CSLA uniform"
	desc = "That's the winter variant of the standard-issue uniform of the CSLA."
	icon_state = "czechuniform"
	item_state = "bl_suit"
	worn_state = "czechuniform"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	cold_protection = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE

/obj/item/clothing/under/coldwar/czechoslovak/vojin
	starting_accessories = list(/obj/item/clothing/accessory/insignia/csla/vojin, /obj/item/clothing/accessory/badge/dogtag/militaryid/)
	insrank = "Vojin"

/obj/item/clothing/under/coldwar/czechoslovak/desatnik
	starting_accessories = list(/obj/item/clothing/accessory/insignia/csla/desatnik, /obj/item/clothing/accessory/badge/dogtag/militaryid/)
	insrank = "Desatnik"

/obj/item/clothing/under/coldwar/czechoslovak/medic
	starting_accessories = list(/obj/item/clothing/accessory/insignia/csla/desatnik, /obj/item/clothing/accessory/armband/medblue, /obj/item/clothing/accessory/badge/dogtag/militaryid/)
	insrank = "Desatnik"

/obj/item/clothing/under/coldwar/czechoslovak/svobodnik
	starting_accessories = list(/obj/item/clothing/accessory/insignia/csla/svobodnik, /obj/item/clothing/accessory/badge/dogtag/militaryid/)
	insrank = "Svobodnik"

/obj/item/clothing/under/coldwar/czechoslovak/cetar
	starting_accessories = list(/obj/item/clothing/accessory/insignia/csla/cetar, /obj/item/clothing/accessory/badge/dogtag/militaryid/)
	insrank = "Cetar"

/obj/item/clothing/under/coldwar/czechoslovak/rotny
	starting_accessories = list(/obj/item/clothing/accessory/insignia/csla/rotny, /obj/item/clothing/accessory/badge/dogtag/militaryid/officer)
	insrank = "Rotny"

/obj/item/clothing/under/coldwar/czechoslovak/rotmistr
	starting_accessories = list(/obj/item/clothing/accessory/insignia/csla/rotmistr, /obj/item/clothing/accessory/badge/dogtag/militaryid/officer)
	insrank = "Rotmistr"

/obj/item/clothing/under/coldwar/czechoslovak/porucik
	starting_accessories = list(/obj/item/clothing/accessory/insignia/csla/porucik, /obj/item/clothing/accessory/badge/dogtag/militaryid/officer)
	insrank = "Porucik"

