/turf/snow
	name = "snow"
	icon = 'icons/turf/snow_new.dmi'
	icon_state = "snow"
	stepsound = "snow"
	interior = 0
	blend_with_neighbors = 5
	oxygen = MOLES_O2STANDARD * 1.20
	nitrogen = MOLES_N2STANDARD * 1.20
	temperature = T0C - 30

/turf/snow/New()
	..()
	icon_state = "snow[pick("0","1","2","3")]"

/turf/snow/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(!W || !user)
		return 0

	if ((istype(W, /obj/item/weapon/shovel)))
		var/turf/T = user.loc
		if (!( istype(T, /turf) ))
			return

		user << "\red You start digging."

		sleep(40)
		if ((user.loc == T && user.get_active_hand() == W))
			user << "\blue You removed some snow."
			src.update_icon(1,0)
			src.ChangeTurf(/turf/frozenground)
	else
		..(W,user)
	return

/turf/ice
	name = "thin ice"

	icon = 'icons/turf/snow_new.dmi'
	icon_state = "ice1"

	density = 1
	dynamic_lighting = 1
	blend_with_neighbors = 5

	oxygen = MOLES_O2STANDARD * 1.20
	nitrogen = MOLES_N2STANDARD * 1.20
	temperature = T0C - 30
	var/bridge = 0 //has there been a bridge built?

/turf/ice/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover, /mob/))
		return !density
	else
		return 1

/turf/ice/New()
	icon_state = "ice[rand(1,6)]"
	..()

/turf/ice/attackby(var/obj/item/I, mob/user as mob)
	if(istype(I, /obj/item/stack/material/wood))
		if(!bridge)

			var/obj/item/stack/material/wood/R = I

			if(R.amount >= 3)
				user << "<span class='notice'>You build a makeshift platform to cross the river safely.</span>"
				desc = "A thick ice. There's a makeshift platform over it."
				R.use(3)
				bridge = 1
				density = 0
				src.overlays += image('icons/turf/snow_new.dmi', "bridge", layer=2.1)
			else
				user << "<span class='notice'>You do not have enough wood to build a bridge.</span>"

	else if(istype(I, /obj/item/stack/material/r_wood))
		if(!bridge)
			var/obj/item/stack/material/r_wood/R = I

			if(R.amount >= 3)
				user << "<span class='notice'>You build a makeshift platform to cross the river safely.</span>"
				desc = "A thick ice. There's a makeshift platform over it."
				R.use(3)

				src.overlays += image('icons/turf/snow_new.dmi', "bridge2", layer=2.1)
				bridge = 2
				density = 0
			else
				user << "<span class='notice'>You do not have enough wood to build a bridge.</span>"

	else if(istype(I, /obj/item/weapon/crowbar))
		if(bridge)
			user << "<span class='notice'>You begin to disassemble the bridge.</span>"
			spawn(rand(15,30))
				if(get_dist(user,src) < 2)
					playsound(src, 'sound/items/Deconstruct.ogg', 50, 1)

					user << "<span class='notice'>You disassemble the bridge.</span>"

					src.overlays = null

					if(bridge == 1)
						var/obj/item/stack/material/wood/S =  new /obj/item/stack/material/wood(get_turf(src))
						S.amount = 3

					else if(bridge == 2)
						var/obj/item/stack/material/r_wood/S =  new /obj/item/stack/material/r_wood/(get_turf(src))
						S.amount = 3

					bridge = 0
					density = 0

/turf/frozenground
	name = "frozen ground"
	dynamic_lighting = 1
	icon = 'icons/turf/snow_new.dmi'
	icon_state = "wground1"
	blend_with_neighbors = 4
	var/dug = 0       //0 = has not yet been dug, 1 = has already been dug
	var/pit = 0

	oxygen = MOLES_O2STANDARD * 1.20
	nitrogen = MOLES_N2STANDARD * 1.20
	temperature = T0C - 30

/turf/frozenground/New()
	icon_state = "wground[rand(1,3)]"
	..()


/turf/frozenground/ex_act(severity)
	switch(severity)
		if(3.0)
			return
		if(2.0)
			if (prob(70))
				gets_dug()
		if(1.0)
			gets_dug()
	return


/turf/frozenground/proc/gets_dug(obj/item/C, mob/user)
	new/obj/item/weapon/ore/glass(src)
	dug = 1
	var/obj/structure/pit/P = locate(/obj/structure/pit) in src
	if(P)
		P.attackby(C, user)
	if(!(locate(/obj/structure/pit) in src))
		new /obj/structure/pit(src)

/turf/snow/plating
	name = "snowy plating"
	icon_state = "plating"
	blend_with_neighbors = 4

/turf/snowtransit
	name = "snow"
	icon = 'icons/turf/snow_new.dmi'
	icon_state = "transit"
	blend_with_neighbors = 0
	oxygen = MOLES_O2STANDARD * 1.20
	nitrogen = MOLES_N2STANDARD * 1.20
	temperature = T0C - 30
	blend_with_neighbors = -1

/turf/frozenground/attackby(obj/item/C as obj, mob/user as mob, var/obj/item/weapon/shovel/shovel)
	if (istype(C, /obj/item/stack/rods))
		var/obj/structure/lattice/L = locate(/obj/structure/lattice, src)
		if(L)
			return
		var/obj/item/stack/rods/R = C
		if (R.use(1))
			to_chat(user, "<span class='notice'>You lay down the support lattice.</span>")
			playsound(src, 'sound/weapons/Genhit.ogg', 50, 1)
			new /obj/structure/lattice(locate(src.x, src.y, src.z))
		return

	if(istype(C, /obj/item/weapon/shovel))
		if (dug)
			user << "\red This area has already been dug"
			return

		var/turf/T = user.loc
		if (!(istype(T)))
			return

		user << "\red You start digging."

		if(!do_after(user,40, src)) return

		user << "<span class='notice'>You dug a hole.</span>"
		gets_dug()

	if (istype(C, /obj/item/stack/rods))
		var/obj/structure/lattice/L = locate(/obj/structure/lattice, src)
		if(L)
			return
		var/obj/item/stack/rods/R = C
		if (R.use(1))
			to_chat(user, "<span class='notice'>You lay down the support lattice.</span>")
			playsound(src, 'sound/weapons/Genhit.ogg', 50, 1)
			new /obj/structure/lattice(locate(src.x, src.y, src.z))
		return

	if(dug && istype(C,/obj/item/weapon/shovel))
		var/obj/structure/pit/P = locate(/obj/structure/pit) in src
		if(P)
			return
		if(shovel.working == 1)
			return

		else
			visible_message("<span class='notice'>\The [user] starts digging \the [src]</span>")
			shovel.working = 1
			if(do_after(user, 50))
				user << "<span class='notice'>You dig a deep pit.</span>"
				pit = 1
				shovel.working = 0
				if(!(locate(/obj/structure/pit) in src))
					new /obj/structure/pit(src)
			else
				user << "<span class='notice'>You stop shoveling.</span>"
				shovel.working = 0
	if (istype(C, /obj/item/stack/tile))
		var/obj/structure/lattice/L = locate(/obj/structure/lattice, src)
		if(L)
			var/obj/item/stack/tile/floor/S = C
			if (S.get_amount() < 1)
				return
			qdel(L)
			playsound(src, 'sound/weapons/Genhit.ogg', 50, 1)
			S.use(1)
			ChangeTurf(/turf/simulated/floor/airless)
			return
		else
			to_chat(user, "<span class='warning'>The plating is going to need some support.</span>")
	return


/obj/structure/pit
	name = "pit"
	desc = "Watch your step, partner."
	icon = 'icons/obj/pit.dmi'
	icon_state = "pit1"
	blend_mode = BLEND_MULTIPLY
	density = 0
	anchored = 1
	var/open = 1

/obj/structure/pit/attackby(obj/item/W, mob/user)
	if( istype(W,/obj/item/weapon/shovel) )
		visible_message("<span class='notice'>\The [user] starts [open ? "filling" : "digging open"] \the [src]</span>")
		if( do_after(user, 50) )
			visible_message("<span class='notice'>\The [user] [open ? "fills" : "digs open"] \the [src]!</span>")
			if(open)
				close(user)
			else
				open()
		else
			user << "<span class='notice'>You stop shoveling.</span>"
		return
	if (!open && istype(W,/obj/item/stack/material/wood))
		if(locate(/obj/structure/gravemarker) in src.loc)
			user << "<span class='notice'>There's already a grave marker here.</span>"
		else
			visible_message("<span class='notice'>\The [user] starts making a grave marker on top of \the [src]</span>")
			if( do_after(user, 50) )
				visible_message("<span class='notice'>\The [user] finishes the grave marker</span>")
				var/obj/item/stack/material/wood/plank = W
				plank.use(1)
				new/obj/structure/gravemarker(src.loc)
			else
				user << "<span class='notice'>You stop making a grave marker.</span>"
		return
	..()

/obj/structure/pit/update_icon()
	icon_state = "pit[open]"
//	if(istype(loc,/turf/simulated/floor/water))
//		icon_state="pit[open]mud"
//		blend_mode = BLEND_OVERLAY

/obj/structure/pit/proc/open()
	name = "pit"
	desc = "Watch your step, partner."
	open = 1
	for(var/atom/movable/A in src)
		A.forceMove(src.loc)
	update_icon()

/obj/structure/pit/proc/close(var/user)
	name = "mound"
	desc = "Some things are better left buried."
	open = 0
	for(var/atom/movable/A in src.loc)
		if(!A.anchored && A != user)
			A.forceMove(src)
	update_icon()

/obj/structure/pit/return_air()
	return open

/obj/structure/pit/proc/digout(mob/escapee)
	var/breakout_time = 1 //2 minutes by default

	if(open)
		return

	if(escapee.stat || escapee.restrained())
		return

	escapee.setClickCooldown(100)
	escapee << "<span class='warning'>You start digging your way out of \the [src] (this will take about [breakout_time] minute\s)</span>"
	visible_message("<span class='danger'>Something is scratching its way out of \the [src]!</span>")

	for(var/i in 1 to (6*breakout_time * 2)) //minutes * 6 * 5seconds * 2
		playsound(src.loc, 'sound/weapons/bite.ogg', 100, 1)

		if(!do_after(escapee, 50))
			escapee << "<span class='warning'>You have stopped digging.</span>"
			return
		if(!escapee || escapee.stat || escapee.loc != src)
			return
		if(open)
			return

		if(i == 6*breakout_time)
			escapee << "<span class='warning'>Halfway there...</span>"

	escapee << "<span class='warning'>You successfuly dig yourself out!</span>"
	visible_message("<span class='danger'>\the [escapee] emerges from \the [src]!</span>")
	playsound(src.loc, 'sound/effects/squelch1.ogg', 100, 1)
	open()

/obj/structure/pit/closed
	name = "mound"
	desc = "Some things are better left buried."
	open = 0

/obj/structure/pit/closed/initialize()
	..()
	close()

//invisible until unearthed first
/obj/structure/pit/closed/hidden
	invisibility = INVISIBILITY_OBSERVER

/obj/structure/pit/closed/hidden/open()
	..()
	invisibility = INVISIBILITY_LEVEL_ONE

//spoooky
/obj/structure/pit/closed/grave
	name = "grave"
	icon_state = "pit0"

/obj/structure/pit/closed/grave/initialize()
	var/obj/structure/closet/coffin/C = new(src.loc)
	var/obj/item/remains/human/bones = new(C)
	bones.layer = MOB_LAYER

	/*
	var/loot
	var/list/suits = list()
	loot = pick(suits)
	new loot(C)

	var/list/uniforms = list()
	loot = pick(uniforms)
	new loot(C)

	if(prob(30))
		var/list/misc = list()
		loot = pick(misc)
		new loot(C)
	*/

	var/obj/structure/gravemarker/random/R = new(src.loc)
	R.generate()
	..()

/obj/structure/gravemarker
	name = "grave marker"
	desc = "You're not the first."
	icon = 'icons/obj/pit.dmi'
	icon_state = "wood"
	pixel_x = 15
	pixel_y = 8
	anchored = 1
	var/message = "Unknown."

/obj/structure/gravemarker/cross
	icon_state = "cross"

/obj/structure/gravemarker/examine()
	..()
	usr << message

/obj/structure/gravemarker/random/initialize()
	generate()
	..()

/obj/structure/gravemarker/random/proc/generate()
	icon_state = pick("wood","cross")

	var/datum/species/S = all_species["Human"]
	var/nam = S.get_random_name(pick(MALE,FEMALE))
	var/cur_year = text2num(time2text(world.timeofday, "YYYY"))+544
	var/born = cur_year - rand(5,150)
	var/died = max(cur_year - rand(0,70),born)

	message = "Here lies [nam], [born] - [died]."

/obj/structure/gravemarker/attackby(obj/item/W, mob/user)
	if(istype(W,/obj/item/weapon/material/hatchet))
		visible_message("<span class = 'warning'>\The [user] starts hacking away at \the [src] with \the [W].</span>")
		if(!do_after(user, 30))
			visible_message("<span class = 'warning'>\The [user] hacks \the [src] apart.</span>")
			new /obj/item/weapon/material/knife(src)
			qdel(src)
	if(istype(W,/obj/item/weapon/pen))
		var/msg = sanitize(input(user, "What should it say?", "Grave marker", message) as text|null)
		if(msg)
			message = msg

