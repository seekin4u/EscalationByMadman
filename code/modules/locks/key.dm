/obj/item/weapon/key
	name = "key"
	desc = "Used to unlock things."
	icon = 'icons/obj/items.dmi'
	icon_state = "keys"
	w_class = 1
	var/key_data = ""

/obj/item/weapon/key/New()
	..()
	icon_state = "keys[rand(1, 6)]"


/obj/item/weapon/key/New(var/newloc,var/data)
	if(data)
		key_data = data
	..(newloc)

/obj/item/weapon/key/proc/get_data(var/mob/user)
	return key_data

/obj/item/weapon/key/soap
	name = "soap key"
	desc = "a fragile key made using a bar of soap."
	var/uses = 0

/obj/item/weapon/key/soap/get_data(var/mob/user)
	uses--
	if(uses == 1)
		user << "<span class='warning'>\The [src] is going to break soon!</span>"
	else if(uses <= 0)
		user.drop_item(src)
		user << "<span class='warning'>\The [src] crumbles in your hands.</span>"
		qdel(src)
	return ..()

/obj/item/weapon/key/ussniper
	key_data = "lockussniper"

/obj/item/weapon/key/ussarge
	key_data = "lockussarge"

/obj/item/weapon/key/uscommand
	key_data = "lockuscommand"

/obj/item/weapon/key/usmedic
	key_data = "lockusmedic"

/obj/item/weapon/key/ussapper
	key_data = "lockussapper"

/obj/item/weapon/key/bundeswehr
	key_data = "lockbundeswehr"

/obj/item/weapon/key/sovietmedic
	key_data = "locksovietmedic"

/obj/item/weapon/key/sovietsapper
	key_data = "locksovietsapper"

/obj/item/weapon/key/sovietcommand
	key_data = "locksovietcommand"

/obj/item/weapon/key/sovietradio
	key_data = "locksovietradio"

/obj/item/weapon/key/sovietprapor
	key_data = "locksovietprapor"