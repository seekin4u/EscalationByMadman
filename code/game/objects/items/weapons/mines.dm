///M16 Anti-personnel mine

/obj/item/weapon/mine/m16apm
	name = "M16 APM"
	desc = "A frag mine. Press the button to set it up and move the fuck away."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "m16apm"

/obj/item/weapon/mine/attack_self(mob/user as mob)
	new /obj/effect/mine/m16apm(user.loc)
	user.visible_message("<span class='warning'>[user] arms the mine! Be careful not to step on it!</span>")
	qdel(src)
	user.regenerate_icons()

/obj/effect/mine/proc/explode2m16(obj)
	/* oldcode, pre-fragification -scr
	explosion(loc, 0, 0, 2, 2)
	spawn(1)
		qdel(src)*/
	//vars stolen for fragification
	var/fragment_type = /obj/item/projectile/bullet/pellet/fragment
	var/num_fragments = 240  //total number of fragments produced by the grenade
	//The radius of the circle used to launch projectiles. Lower values mean less projectiles are used but if set too low gaps may appear in the spread pattern
	var/spread_range = 8 //leave as is, for some reason setting this higher makes the spread pattern have gaps close to the epicenter

	//blatant copypaste from frags, but those are a whole different type so vOv
	set waitfor = 0
	..()

	var/turf/O = get_turf(src)
	if(!O) return

	var/list/target_turfs = getcircle(O, spread_range)
	var/fragments_per_projectile = round(num_fragments/target_turfs.len)

	for(var/turf/T in target_turfs)
		sleep(0)
		var/obj/item/projectile/bullet/pellet/fragment/P = new fragment_type(O)

		P.pellets = fragments_per_projectile
		P.shot_from = src.name

		P.launch(T)

		//Make sure to hit any mobs in the source turf
		for(var/mob/living/M in O)
			//lying on a frag grenade while the grenade is on the ground causes you to absorb most of the shrapnel.
			//you will most likely be dead, but others nearby will be spared the fragments that hit you instead.
			if(M.lying && isturf(src.loc))
				P.attack_mob(M, 0, 0)
			else
				P.attack_mob(M, 0, 100) //otherwise, allow a decent amount of fragments to pass
	explosion(loc, 0, 2, 4, 5)
	qdel(src)

/obj/effect/mine/m16apm
	name = "M16 APM"
	triggerproc = "explode2m16"
	icon_state = "m16apm-armed"

/obj/effect/mine/m16apm/attack_hand(mob/user as mob)
	if (do_after(usr, 16))
		if(prob(25))
			user.visible_message("<span class='warning'>[user] disarms the mine!</span>")
			icon_state = "m16apm"
			new /obj/item/weapon/mine/m16apm(src.loc)
			qdel(src)
		else
			usr << "Whoops."
			explode2m16()
			qdel(src)
	else
		return


/obj/effect/mine/m16apm/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/material/knife/))
		user.visible_message("<span class='warning'>[user] begins to disarm the mine!</span>")
		if (do_after(usr, 25))
			if(prob(95))
				user.visible_message("<span class='warning'>[user] disarms the mine!</span>")
				icon_state = "m16apm"
				new /obj/item/weapon/mine/m16apm(src.loc)
				qdel(src)
			else
				explode2m16()
				qdel(src)
		else
			explode2m16()
			qdel(src)
	else
		explode2m16()
		qdel(src)


/obj/effect/mine/m16apm/New()
	icon_state = "m16apm-armed"

/obj/effect/mine/m16apm/attack_hand(mob/user as mob)
	user.visible_message("<span class='warning'>[user] disarms the mine!</span>")
	icon_state = "m16apm"
	new /obj/item/weapon/mine/m16apm(src.loc)
	qdel(src)

/// OZM-72 jumping mine

/obj/item/weapon/mine/ozm72
	name = "OZM-72"
	desc = "That's a fragmentation mine used by Soviet Army. Also known as 'Witch'."
	icon = 'icons/obj/weapons.dmi'
	icon_state = "ozm72"

/obj/item/weapon/mine/ozm72/attack_self(mob/user as mob)
	new /obj/effect/mine/ozm72(user.loc)
	user.visible_message("<span class='warning'>[user] arms the mine! Be careful not to step on it!</span>")
	qdel(src)
	user.regenerate_icons()

/obj/effect/mine/proc/explode2ozm(obj)
	/* oldcode, pre-fragification -scr
	explosion(loc, 0, 0, 2, 2)
	spawn(1)
		qdel(src)*/
	//vars stolen for fragification
	var/fragment_type = /obj/item/projectile/bullet/pellet/fragment
	var/num_fragments = 280  //total number of fragments produced by the grenade
	//The radius of the circle used to launch projectiles. Lower values mean less projectiles are used but if set too low gaps may appear in the spread pattern
	var/spread_range = 6 //leave as is, for some reason setting this higher makes the spread pattern have gaps close to the epicenter

	//blatant copypaste from frags, but those are a whole different type so vOv
	set waitfor = 0
	..()

	var/turf/O = get_turf(src)
	if(!O) return

	var/list/target_turfs = getcircle(O, spread_range)
	var/fragments_per_projectile = round(num_fragments/target_turfs.len)

	for(var/turf/T in target_turfs)
		sleep(0)
		var/obj/item/projectile/bullet/pellet/fragment/P = new fragment_type(O)

		P.pellets = fragments_per_projectile
		P.shot_from = src.name

		P.launch(T)

		//Make sure to hit any mobs in the source turf
		for(var/mob/living/M in O)
			//lying on a frag grenade while the grenade is on the ground causes you to absorb most of the shrapnel.
			//you will most likely be dead, but others nearby will be spared the fragments that hit you instead.
			if(M.lying && isturf(src.loc))
				P.attack_mob(M, 0, 0)
			else
				P.attack_mob(M, 0, 100) //otherwise, allow a decent amount of fragments to pass
	explosion(loc, 0, 2, 4, 5)

	qdel(src)

/obj/effect/mine/ozm72
	name = "OZM-72"
	triggerproc = "explode2ozm"
	icon_state = "ozm72-armed"

/obj/effect/mine/ozm72/New()
	icon_state = "ozm72-armed"

/obj/effect/mine/ozm72/attack_hand(mob/user as mob)
	if (do_after(usr, 16))
		if(prob(25))
			user.visible_message("<span class='warning'>[user] disarms the mine!</span>")
			icon_state = "ozm72"
			new /obj/item/weapon/mine/ozm72(src.loc)
			qdel(src)
		else
			usr << "Whoops."
			explode2ozm()
			qdel(src)
	else
		usr << "Whoops."
		explode2ozm()
		qdel(src)


/obj/effect/mine/ozm72/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/material/knife/))
		user.visible_message("<span class='warning'>[user] begins to disarm the mine!</span>")
		if (do_after(usr, 25))
			if(prob(95))
				user.visible_message("<span class='warning'>[user] disarms the mine!</span>")
				icon_state = "ozm72"
				new /obj/item/weapon/mine/ozm72(src.loc)
				qdel(src)
			else
				explode2ozm()
				qdel(src)
		else
			explode2ozm()
			qdel(src)
	else
		explode2ozm()
		qdel(src)

