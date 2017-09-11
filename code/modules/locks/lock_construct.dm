/obj/item/weapon/material/lock_construct
	name = "lock"
	desc = "a crude but useful lock and bolt."
	icon = 'icons/obj/storage.dmi'
	icon_state = "largebinemag"
	w_class = 1
	var/lock_data

/obj/item/weapon/material/lock_construct/New()
	..()
	force = 0
	throwforce = 0
	lock_data = generateRandomString(round(material.integrity/50))

/obj/item/weapon/material/lock_construct/attackby(var/obj/item/I, var/mob/user)
	if(istype(I,/obj/item/weapon/key))
		var/obj/item/weapon/key/K = I
		if(!K.key_data)
			user << "<span class='notice'>You fashion \the [I] to unlock \the [src]</span>"
			K.key_data = lock_data
		else
			user << "<span class='warning'>\The [I] already unlocks something...</span>"
		return
	if(istype(I,/obj/item/weapon/material/lock_construct))
		var/obj/item/weapon/material/lock_construct/L = I
		src.lock_data = L.lock_data
		user << "<span class='notice'>You copy the lock from \the [L] to \the [src], making them identical.</span>"
		return
	..()

/obj/item/weapon/material/lock_construct/proc/create_lock(var/atom/target, var/mob/user)
	. = new /datum/lock(target,lock_data)
	user.drop_item(src)
	user.visible_message("\The [user] attaches \the [src] to \the [target]")
	qdel(src)

/obj/item/weapon/material/lock_construct/soviet/sgt
	lock_data = "sovsgt"

/obj/item/weapon/material/lock_construct/soviet/lt
	lock_data = "sovlt"

/obj/item/weapon/material/lock_construct/soviet/snp
	lock_data = "sovsnp"

/obj/item/weapon/material/lock_construct/soviet/gr
	lock_data = "sovgr"

/obj/item/weapon/material/lock_construct/soviet/med
	lock_data = "sovmed"

/obj/item/weapon/material/lock_construct/soviet/rad
	lock_data = "sovrad"

/obj/item/weapon/material/lock_construct/soviet/cpl
	lock_data = "sovcpk"

/obj/item/weapon/material/lock_construct/usmc/sgt
	lock_data = "ussgt"

/obj/item/weapon/material/lock_construct/usmc/lt
	lock_data = "uslt"

/obj/item/weapon/material/lock_construct/usmc/snp
	lock_data = "ussnp"

/obj/item/weapon/material/lock_construct/usmc/gr
	lock_data = "usgr"

/obj/item/weapon/material/lock_construct/usmc/med
	lock_data = "usmed"

/obj/item/weapon/material/lock_construct/usmc/rad
	lock_data = "usrad"

/obj/item/weapon/material/lock_construct/usmc/cpl
	lock_data= "uscpl"