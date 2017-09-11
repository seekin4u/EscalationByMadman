
/*
 * Ushanka
 */
/obj/item/clothing/head/ushankaofficer
	name = "officer ushanka"
	desc = "That's the standard-issue ushanka. Used by Soviet Army officers."
	icon_state = "sovietushanka-officerup"
	item_state = "sovietushanka-officerup"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	flags_inv = HIDEEARS
	cold_protection = HEAD


/obj/item/clothing/head/ushankaofficer/attack_self(mob/user as mob)
	if(src.icon_state == "sovietushanka-officerup")
		src.icon_state = "sovietushanka-officerdown"
		src.item_state = "sovietushanka-officerdown"
		user << "You lower the ear flaps on the ushanka."
		cold_protection = HEAD | FACE
	else
		src.icon_state = "sovietushanka-officerup"
		src.item_state = "sovietushanka-officerup"
		user << "You raise the ear flaps on the ushanka."
		cold_protection = HEAD

/obj/item/clothing/head/sovietushanka
	name = "ushanka"
	desc = "That's the cheap synthethical ushanka.. Used by Soviet Army."
	icon_state = "sovietushankaup"
	item_state = "sovietushankaup"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	flags_inv = HIDEEARS
	cold_protection = HEAD


/obj/item/clothing/head/sovietushanka/attack_self(mob/user as mob)
	if(src.icon_state == "sovietushankaup")
		src.icon_state = "sovietushankadown"
		src.item_state = "sovietushankadown"
		user << "You lower the ear flaps on the ushanka."
		cold_protection = HEAD | FACE
	else
		src.icon_state = "sovietushankaup"
		src.item_state = "sovietushankaup"
		user << "You raise the ear flaps on the ushanka."
		cold_protection = HEAD

/obj/item/clothing/head/helmet/ssh68
	name = "SSh-68 helmet"
	desc = "That's the helmet used by Warsaw Pact armies."
	icon_state = "ssh68helmet"
	armor = list(melee = 45, bullet = 20, laser = 0,energy = 0, bomb = 35, bio = 0, rad = 0)
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	flags_inv = HIDEEARS
	cold_protection = HEAD

/obj/item/clothing/head/helmet/vz58
	name = "Vz.57 helmet"
	desc = "That's the helmet used by Warsaw Pact armies."
	icon_state = "vz52helmet"
	armor = list(melee = 35, bullet = 10, laser = 0,energy = 0, bomb = 35, bio = 0, rad = 0)
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	flags_inv = HIDEEARS
	cold_protection = HEAD


/obj/item/clothing/head/helmet/ssh60
	name = "SSh-60 helmet"
	desc = "That's the helmet used by Warsaw Pact armies."
	icon_state = "ssh60helmet"
	armor = list(melee = 45, bullet = 18, laser = 0,energy = 0, bomb = 30, bio = 0, rad = 0)
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	flags_inv = HIDEEARS
	cold_protection = HEAD

/obj/item/clothing/head/helmet/ssh60/medic
	name = "SSh-60 helmet"
	icon_state = "ssh60helmet-medic"

/obj/item/clothing/head/helmet/m1
	name = "M1 helmet"
	desc = "That's the helmet used by NATO."
	icon_state = "m1helmet"
	armor = list(melee = 50, bullet = 15, laser = 0,energy = 0, bomb = 35, bio = 0, rad = 0)
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	flags_inv = HIDEEARS
	cold_protection = HEAD

/obj/item/clothing/head/helmet/m1/winter
	name = "M1 helmet"
	icon_state = "m1helmet-winter"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	flags_inv = HIDEEARS
	cold_protection = HEAD

/obj/item/clothing/head/helmet/m1/medic
	name = "M1 helmet"
	icon_state = "m1helmet-medic"

/obj/item/clothing/head/helmet/m1/bundes
	name = "M62 helmet"
	icon_state = "m1helmet-bundes"


/obj/item/clothing/head/helmet/pasgt
	name = "PASGT M81 helmet"
	desc = "That's the experimental helmet used by NATO."
	icon_state = "pasgtm81-olive"
	armor = list(melee = 40, bullet = 25, laser = 0,energy = 0, bomb = 30, bio = 0, rad = 0)
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	flags_inv = HIDEEARS
	cold_protection = HEAD

/obj/item/clothing/head/helmet/pasgt/winter
	icon_state = "pasgtm81-winter"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	flags_inv = HIDEEARS
	cold_protection = HEAD

/obj/item/clothing/head/helmet/pasgt/pilot
	icon_state = "pilothelm"
	desc = "That's the helmet used by USMC pilots."
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	flags_inv = HIDEEARS
	cold_protection = HEAD

/obj/item/clothing/head/beret/vdv
	name = "VDV beret"
	desc = "A beret used by Soviet airborne. Perfect with the moustache."
	icon_state = "vdvberet"

/obj/item/clothing/head/helmet/pasgt/press
	icon_state = "pasgtm81-press"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	flags_inv = HIDEEARS
	cold_protection = HEAD


/obj/item/clothing/head/ushankacsla
	name = "ushanka"
	desc = "That's the standard-issue ushanka. Used by CSLA."
	icon_state = "czechushanka_up"
	item_state = "czechushanka_up"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	flags_inv = HIDEEARS
	cold_protection = HEAD


/obj/item/clothing/head/ushankacsla/attack_self(mob/user as mob)
	if(src.icon_state == "czechushanka_up")
		src.icon_state = "czechushanka_down"
		src.item_state = "czechushanka_down"
		user << "You lower the ear flaps on the ushanka."
		cold_protection = HEAD | FACE
	else
		src.icon_state = "czechushanka_up"
		src.item_state = "czechushanka_up"
		user << "You raise the ear flaps on the ushanka."
		cold_protection = HEAD

/obj/item/clothing/head/usmcbeanie
	name = "beanie"
	desc = "That's the khaki-coloured beanie."
	icon_state = "beanie"
	item_state = "beanie"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	flags_inv = HIDEEARS
	cold_protection = HEAD

/obj/item/clothing/head/usmccap
	name = "field cap"
	desc = "That's the green-coloured cap used by USMC sergeants."
	icon_state = "greenutility"
	item_state = "greenutility"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	flags_inv = HIDEEARS
	cold_protection = HEAD

/obj/item/clothing/head/sovietcap
	name = "'Afganka' field cap"
	desc = "That's the green-coloured cap used by Soviet Army sergeants."
	icon_state = "tanutility"
	item_state = "tanutility"
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	flags_inv = HIDEEARS
	cold_protection = HEAD