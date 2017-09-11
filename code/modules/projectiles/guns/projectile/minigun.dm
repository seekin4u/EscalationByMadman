/////////////////////////////
////Stationary Machinegun////
/////////////////////////////
/obj/item/weapon/gun/projectile/minigun
	name = "minigun"
	desc = "6-barreled highspeed machinegun."
	icon_state = "minigun"
	item_state = ""
	randpixel = 0
	layer = FLY_LAYER
	anchored = 1
	density = 1
	w_class = 6
	load_method = SINGLE_CASING
	handle_casings = EJECT_CASINGS
	max_shells = 6000
	caliber = "4mm"
	slot_flags = 0
	ammo_type = /obj/item/ammo_casing/a4mm

	firemodes = list(
		list(name="3000 rpm", burst=10, burst_delay=0.1, fire_delay=1, dispersion=list(1.0), accuracy=list(0)),
		list(name="6000 rpm", burst=20, burst_delay=0.05, fire_delay=1, dispersion=list(1.5), accuracy=list(0))
		)

	var/user_old_x = 0
	var/user_old_y = 0

/obj/item/weapon/gun/projectile/minigun/attack_hand(mob/user)
	if(user.using_object == src)
		if(firemodes.len > 1)
			switch_firemodes(user)
	else
		var/grip_dir = reverse_direction(dir)
		var/turf/T = get_step(src.loc, grip_dir)
		if(user.loc == T)
			if(user.get_active_hand() == null && user.get_inactive_hand() == null)
				user.use_object(src)
			else
				user << "\red Your hands are busy by holding things."
		else
			user << "\red You're too far from the handles."

/obj/item/weapon/gun/projectile/minigun/usedby(mob/user, atom/A, params)
	if(A == src)
		switch_firemodes(user)

	if(check_direction(user, A))
		afterattack(A, user, 0, params)
	else
		rotate_to(user, A)
		update_layer()

/obj/item/weapon/gun/projectile/minigun/proc/check_direction(mob/user, atom/A)
	if(get_turf(A) == src.loc)
		return 0

	var/shot_dir = get_cardinal_dir(src, A)
	if(shot_dir != dir)
		return 0

	return 1

/obj/item/weapon/gun/projectile/minigun/proc/rotate_to(mob/user, atom/A)
	return 0

/obj/item/weapon/gun/projectile/minigun/proc/update_layer()
	if(dir == NORTH)
		layer = OBJ_LAYER
	else
		layer = FLY_LAYER

/obj/item/weapon/gun/projectile/minigun/started_using(mob/user as mob)
	..()
	var/diff_x = 0
	var/diff_y = 0
	if(dir == EAST)		diff_x = -16 + user.pixel_x
	if(dir == WEST)		diff_x = 16 + user.pixel_x
	if(dir == NORTH)	diff_y = -16 + user.pixel_y
	if(dir == SOUTH)	diff_y = 16 + user.pixel_y

	user_old_x = user.pixel_x
	user_old_y = user.pixel_y

	user.forceMove(src.loc)
	user.dir = src.dir
	animate(user, pixel_x=diff_x, pixel_y=diff_y, 4, 1)

/obj/item/weapon/gun/projectile/minigun/stopped_using(mob/user as mob)
	..()
	var/grip_dir = reverse_direction(dir)
	step(user, grip_dir)
	animate(user, pixel_x=user_old_x, pixel_y=user_old_y, 4, 1)

/obj/item/weapon/gun/projectile/minigun/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(air_group || (height==0)) return 1
	if(istype(mover, /obj/item/projectile))
		return 1
	return 0

/obj/item/weapon/gun/projectile/minigun/browningm2
	name = "Browning M2"
	desc = "That's the Browning M2, a standard-issue HMG used by USMC"
	icon_state = "m2browning"
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	caliber = "127x99mm"
	magazine_type = /obj/item/ammo_magazine/c127x99b
	max_shells = 0
	fire_sound = 'sound/weapons/gunshot/50calm2.wav'

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=3, burst_accuracy=null, dispersion=null),
		list(mode_name="short bursts", burst=3, fire_delay=4, burst_delay = 3,, burst_accuracy=list(1,0,-1),       dispersion=list(0.3, 0.6, 0.6)),
		list(mode_name="long bursts",   burst=5, fire_delay=4, burst_delay = 3, burst_accuracy=list(1,0,0,-1,-2), dispersion=list(0.3, 0.6, 0.6, 1.2, 1.5)),
		)

/obj/item/weapon/gun/projectile/minigun/browningm2/rotate_to(mob/user, atom/A)
	var/shot_dir = get_cardinal_dir(src, A)
	dir = shot_dir

	var/diff_x = 0
	var/diff_y = 0
	if(dir == EAST)		diff_x = -16 + user_old_x
	if(dir == WEST)		diff_x = 16 + user_old_x
	if(dir == NORTH)	diff_y = -16 + user_old_y
	if(dir == SOUTH)	diff_y = 16 + user_old_y

	user.forceMove(src.loc)
	user.dir = src.dir
	animate(user, pixel_x=diff_x, pixel_y=diff_y, 4, 1)


/obj/item/weapon/gun/projectile/minigun/browningm2/attack_hand(mob/user)
	if(user.using_object == src)
		switch_firemodes(user)
	else
		var/grip_dir = reverse_direction(dir)
		var/turf/T = get_step(src.loc, grip_dir)
		if(user.loc == T && anchored & 1)
			if(user.get_active_hand() == null && user.get_inactive_hand() == null)
				user.use_object(src)
			else
				user << "\red Your hands are busy by holding things."
		else
			user << "\red Not right now."

/obj/item/weapon/gun/projectile/minigun/browningm2/verb/verb_unload(mob/user)
	set src in oview(1)
	set category = "Object"
	set name = "Unload ammo"

	if(!user.using_object)
		user << "<span class='warning'>You're too far.</span>"
		return

	if(!ishuman(user)) return

	if(ammo_magazine)
		user << "<span class='warning'>You begin to unload [src].</span>"
		sleep(25)
		ammo_magazine.loc = get_turf(src.loc)
		user.visible_message(
			"[ammo_magazine] falls out!",
			"<span class='notice'>[ammo_magazine] falls out!</span>"
			)
		ammo_magazine.update_icon()
		ammo_magazine = null
		update_icon() //make sure to do this after unsetting ammo_magazine


/obj/item/weapon/gun/projectile/minigun/browningm2/update_icon()//Putting the welded stuff in updateicon() so it's easy to overwrite for special cases (Fridges, cabinets, and whatnot)
	overlays.Cut()
	if(!anchored)
		icon_state = "m2browning-folded"
	else
		icon_state = "m2browning"



/obj/item/weapon/gun/projectile/minigun/browningm2/verb/verb_toggleanchor(mob/user)
	set src in oview(1)
	set category = "Object"
	set name = "Toggle anchor"

	if(user.using_object)
		return

	if(!ishuman(user)) return

	else
		user << "<span class='warning'>You begin to [anchored ? "unanchor" : "anchor"] the [src].</span>"
		sleep(25)
		anchored = !anchored
		update_icon(src)

/obj/item/weapon/gun/projectile/minigun/nsv127
	name = "NSV-12.7 'Utyos'"
	desc = "That's the standard-issue HMG used by Soviet Army"
	icon_state = "nsv127"
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	caliber = "127x108mm"
	magazine_type = /obj/item/ammo_magazine/c127x108b
	max_shells = 250
	safety = 0
	burst_delay = 3
	fire_delay = 3
	layer = FLY_LAYER + 0.1
	fire_sound = 'sound/weapons/gunshot/50calm2.wav'

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=3, burst_accuracy=null, dispersion=null),
		list(mode_name="short bursts", burst=3, fire_delay=4, burst_delay = 3,, burst_accuracy=list(1,0,-1),       dispersion=list(0.3, 0.6, 0.6)),
		list(mode_name="long bursts",   burst=5, fire_delay=4, burst_delay = 3, burst_accuracy=list(1,0,0,-1,-2), dispersion=list(0.3, 0.6, 0.6, 1.2, 1.5)),
		)

/obj/item/weapon/gun/projectile/minigun/nsv127/rotate_to(mob/user, atom/A)
	var/shot_dir = get_cardinal_dir(src, A)
	dir = shot_dir

	var/diff_x = 0
	var/diff_y = 0
	if(dir == EAST)		diff_x = -14 + user_old_x
	if(dir == WEST)		diff_x = 14 + user_old_x
	if(dir == NORTH)	diff_y = -8 + user_old_y
	if(dir == SOUTH)	diff_y = 4 + user_old_y

	user.forceMove(src.loc)
	user.dir = src.dir
	animate(user, pixel_x=diff_x, pixel_y=diff_y, 4, 1)

/obj/item/weapon/gun/projectile/minigun/nsv127/attack_hand(mob/user)
	if(user.using_object == src)
		switch_firemodes(user)
	else
		var/grip_dir = reverse_direction(dir)
		var/turf/T = get_step(src.loc, grip_dir)
		if(user.loc == T && anchored & 1)
			if(user.get_active_hand() == null && user.get_inactive_hand() == null)
				user.use_object(src)
			else
				user << "\red Your hands are busy by holding things."
		else
			user << "\red Not right now."

/obj/item/weapon/gun/projectile/minigun/nsv127/verb/verb_unload(mob/user)
	set src in oview(1)
	set category = "Object"
	set name = "Unload ammo"

	if(!user.using_object)
		user << "<span class='warning'>You're too far.</span>"
		return

	if(!ishuman(user)) return

	if(ammo_magazine)
		user << "<span class='warning'>You begin to unload [src].</span>"
		sleep(25)
		ammo_magazine.loc = get_turf(src.loc)
		user.visible_message(
			"[ammo_magazine] falls out!",
			"<span class='notice'>[ammo_magazine] falls out!</span>"
			)
		ammo_magazine.update_icon()
		ammo_magazine = null
		update_icon() //make sure to do this after unsetting ammo_magazine


/obj/item/weapon/gun/projectile/minigun/nsv127/update_icon()//Putting the welded stuff in updateicon() so it's easy to overwrite for special cases (Fridges, cabinets, and whatnot)
	overlays.Cut()
	if(!anchored)
		icon_state = "nsv127-folded"
	else
		icon_state = "nsv127"



/obj/item/weapon/gun/projectile/minigun/nsv127/verb/verb_toggleanchor(mob/user)
	set src in oview(1)
	set category = "Object"
	set name = "Toggle anchor"

	if(user.using_object)
		return

	if(!ishuman(user)) return

	else
		user << "<span class='warning'>You begin to [anchored ? "unanchor" : "anchor"] the [src].</span>"
		sleep(25)
		anchored = !anchored
		update_icon(src)




/obj/item/weapon/gun/projectile/minigun/mk19
	name = "MK19 AGL"
	desc = "That's automatical grenade launcher used by NATO"
	icon_state = "mk19"
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	caliber = "s40mm"
	magazine_type = /obj/item/ammo_magazine/s40mm
	allowed_magazines = /obj/item/ammo_magazine/s40mm
	layer = FLY_LAYER + 0.1
	max_shells = 50
	safety = 0
	fire_delay = 5
	fire_sound = 'sound/weapons/gunshot/mk19.wav'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=3, burst_delay = 4, burst_accuracy=null, dispersion=null),
		list(mode_name="short bursts", burst=3, fire_delay=4, burst_delay = 4, burst_accuracy=list(-1,-2,-3),       dispersion=list(0.6, 1.2, 1.8))
		)

/obj/item/weapon/gun/projectile/minigun/mk19/rotate_to(mob/user, atom/A)
	var/shot_dir = get_cardinal_dir(src, A)
	dir = shot_dir

	var/diff_x = 0
	var/diff_y = 0
	if(dir == EAST)		diff_x = -10 + user_old_x
	if(dir == WEST)		diff_x = 10 + user_old_x
	if(dir == NORTH)	diff_y = -12 + user_old_y
	if(dir == SOUTH)	diff_y = 4 + user_old_y

	user.forceMove(src.loc)
	user.dir = src.dir
	animate(user, pixel_x=diff_x, pixel_y=diff_y, 4, 1)

/obj/item/weapon/gun/projectile/minigun/mk19/attack_hand(mob/user)
	if(user.using_object == src)
		switch_firemodes(user)
	else
		var/grip_dir = reverse_direction(dir)
		var/turf/T = get_step(src.loc, grip_dir)
		if(user.loc == T && anchored & 1)
			if(user.get_active_hand() == null && user.get_inactive_hand() == null)
				user.use_object(src)
			else
				user << "\red Your hands are busy by holding things."
		else
			user << "\red Not right now."

/obj/item/weapon/gun/projectile/minigun/mk19/verb/verb_unload(mob/user)
	set src in oview(1)
	set category = "Object"
	set name = "Unload ammo"

	if(!user.using_object)
		user << "<span class='warning'>You're too far.</span>"
		return

	if(anchored & 0)
		return

	if(!ishuman(user)) return

	if(ammo_magazine)
		user << "<span class='warning'>You begin to unload [src].</span>"
		sleep(25)
		ammo_magazine.loc = get_turf(src.loc)
		user.visible_message(
			"[ammo_magazine] falls out!",
			"<span class='notice'>[ammo_magazine] falls out!</span>"
			)
		ammo_magazine.update_icon()
		ammo_magazine = null
		update_icon() //make sure to do this after unsetting ammo_magazine

/obj/item/weapon/gun/projectile/minigun/mk19/update_icon()//Putting the welded stuff in updateicon() so it's easy to overwrite for special cases (Fridges, cabinets, and whatnot)
	overlays.Cut()
	if(!anchored)
		icon_state = "mk19-folded"
	else
		icon_state = "mk19"

/obj/item/weapon/gun/projectile/minigun/mk19/verb/verb_toggleanchor(mob/user)
	set src in oview(1)
	set category = "Object"
	set name = "Toggle anchor"

	if(user.using_object)
		return

	if(!ishuman(user)) return

	else
		user << "<span class='warning'>You begin to [anchored ? "unanchor" : "anchor"] the [src].</span>"
		sleep(25)
		anchored = !anchored
		update_icon(src)



/obj/item/weapon/gun/projectile/minigun/ags17
	name = "AGS-17"
	desc = "That's automatical grenade launcher used by Warsaw Pact"
	icon_state = "ags17"
	load_method = MAGAZINE
	handle_casings = EJECT_CASINGS
	caliber = "s3029mm"
	magazine_type = /obj/item/ammo_magazine/s3029mm
	allowed_magazines = /obj/item/ammo_magazine/s3029mm
	layer = FLY_LAYER + 0.1
	max_shells = 48
	safety = 0
	fire_delay = 3
	fire_sound = 'sound/weapons/gunshot/mk19.wav'

	firemodes = list(
		list(mode_name="semiauto", burst=1, fire_delay=4, burst_delay = 4, burst_accuracy=null, dispersion=null),
		list(mode_name="short bursts", burst=3, fire_delay=4, burst_delay = 4, burst_accuracy=list(-1,-2,-3),       dispersion=list(0.6, 1.2, 1.8))
		)

/obj/item/weapon/gun/projectile/minigun/ags17/rotate_to(mob/user, atom/A)
	var/shot_dir = get_cardinal_dir(src, A)
	dir = shot_dir

	var/diff_x = 0
	var/diff_y = 0
	if(dir == EAST)		diff_x = -10 + user_old_x
	if(dir == WEST)		diff_x = 10 + user_old_x
	if(dir == NORTH)	diff_y = -12 + user_old_y
	if(dir == SOUTH)	diff_y = 4 + user_old_y

	user.forceMove(src.loc)
	user.dir = src.dir
	animate(user, pixel_x=diff_x, pixel_y=diff_y, 4, 1)

/obj/item/weapon/gun/projectile/minigun/ags17/attack_hand(mob/user)
	if(user.using_object == src)
		switch_firemodes(user)
	else
		var/grip_dir = reverse_direction(dir)
		var/turf/T = get_step(src.loc, grip_dir)
		if(user.loc == T && anchored & 1)
			if(user.get_active_hand() == null && user.get_inactive_hand() == null)
				user.use_object(src)
			else
				user << "\red Your hands are busy by holding things."
		else
			user << "\red Not right now."

/obj/item/weapon/gun/projectile/minigun/ags17/verb/verb_unload(mob/user)
	set src in oview(1)
	set category = "Object"
	set name = "Unload ammo"

	if(!user.using_object)
		user << "<span class='warning'>You're too far.</span>"
		return

	if(anchored & 0)
		return

	if(!ishuman(user)) return

	if(ammo_magazine)
		user << "<span class='warning'>You begin to unload [src].</span>"
		sleep(25)
		ammo_magazine.loc = get_turf(src.loc)
		user.visible_message(
			"[ammo_magazine] falls out!",
			"<span class='notice'>[ammo_magazine] falls out!</span>"
			)
		ammo_magazine.update_icon()
		ammo_magazine = null
		update_icon() //make sure to do this after unsetting ammo_magazine


/obj/item/weapon/gun/projectile/minigun/ags17/update_icon()//Putting the welded stuff in updateicon() so it's easy to overwrite for special cases (Fridges, cabinets, and whatnot)
	overlays.Cut()
	if(!anchored)
		icon_state = "ags17-folded"
	else
		icon_state = "ags17"

/obj/item/weapon/gun/projectile/minigun/ags17/verb/verb_toggleanchor(mob/user)
	set src in oview(1)
	set category = "Object"
	set name = "Toggle anchor"

	if(user.using_object)
		return

	if(!ishuman(user)) return

	else
		user << "<span class='warning'>You begin to [anchored ? "unanchor" : "anchor"] the [src].</span>"
		sleep(25)
		anchored = !anchored
		update_icon(src)