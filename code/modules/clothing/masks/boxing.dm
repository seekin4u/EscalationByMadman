/obj/item/clothing/mask/balaclava
	name = "balaclava"
	desc = "LOADSAMONEY!"
	icon_state = "balaclava"
	item_state = "balaclava"
	flags_inv = HIDEFACE|BLOCKHAIR
	body_parts_covered = FACE|HEAD
	w_class = 2

/obj/item/clothing/mask/balaclava/tactical
	name = "green balaclava"
	desc = "Designed to both hide identities and keep your face comfy and warm."
	icon_state = "swatclava"
	item_state = "balaclava"
	flags_inv = HIDEFACE|BLOCKHAIR
	w_class = 2

/obj/item/clothing/mask/luchador
	name = "Luchador Mask"
	desc = "Worn by robust fighters, flying high to defeat their foes!"
	icon_state = "luchag"
	item_state = "luchag"
	flags_inv = HIDEFACE|BLOCKHAIR
	body_parts_covered = HEAD|FACE
	w_class = 2
	siemens_coefficient = 3.0

/obj/item/clothing/mask/luchador/tecnicos
	name = "Tecnicos Mask"
	desc = "Worn by robust fighters who uphold justice and fight honorably."
	icon_state = "luchador"
	item_state = "luchador"

/obj/item/clothing/mask/luchador/rudos
	name = "Rudos Mask"
	desc = "Worn by robust fighters who are willing to do anything to win."
	icon_state = "luchar"
	item_state = "luchar"

/obj/item/clothing/mask/balaclavanew
	name = "balaclava"
	desc = "That's the close-fitting garment covering the whole head and neck except for parts of the face. Can be pulled onto the nose to cover all the face"
	icon_state = "coif"
	item_state = "coif"
	flags_inv = BLOCKHAIR|AIRTIGHT
	cold_protection = FACE|HEAD
	body_parts_covered = HEAD
	min_cold_protection_temperature = ICE_PLANET_MIN_COLD_PROTECTION_TEMPERATURE
	w_class = 2
	var/onface = 0

/obj/item/clothing/mask/balaclavanew/dropped()
	src.icon_state = initial(icon_state)
	src.onface = 0
	..()

/obj/item/clothing/mask/balaclavanew/attack_self(mob/user)
	src.onface = !src.onface
	if(src.onface)
		icon_state = "[icon_state]_onface"
		flags_inv = BLOCKHAIR|HIDEFACE|AIRTIGHT
		body_parts_covered = FACE|HEAD
		user << "You pull the balaclava onto the face."
	else
		src.icon_state = initial(icon_state)
		user << "You flip the hat back in normal position."
		body_parts_covered = HEAD
		flags_inv = BLOCKHAIR|AIRTIGHT
	update_clothing_icon()	//so our mob-overlays update
