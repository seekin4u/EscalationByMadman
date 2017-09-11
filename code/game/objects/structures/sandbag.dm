/obj/structure/sandbag
	name = "sandbag"
	icon = 'icons/obj/sandbags.dmi'
	icon_state = "sandbag"
	anchored = 1
	climbable = 1
	density = 1
	flags = CAN_MOUNT

/obj/structure/sandbag/New()
	flags |= ON_BORDER
	set_dir(dir)
	..()

/obj/structure/sandbag/set_dir(direction)
	dir = direction
	if(dir == NORTH)
		layer = OBJ_LAYER
	else
		layer = FLY_LAYER

/obj/structure/sandbag/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover, /obj/item/projectile))
		return check_cover(mover, target)
	if (get_dir(loc, target) == dir)
		return !density
	else
		return 1

/obj/structure/sandbag/proc/check_cover(obj/item/projectile/P, turf/from)
	var/turf/cover
	cover = get_turf(src)
	if(!cover)
		return 1
	if (get_dist(P.starting, loc) <= 1) //Tables won't help you if people are THIS close
		return 1

	var/chance = 80
	if(ismob(P.original) && get_turf(P.original) == cover)
		var/mob/M = P.original
		if (M.lying)
			chance += 20				//Lying down lets you catch less bullets
		if(get_dir(loc, from) == dir)	//Flipped tables catch mroe bullets
			chance += 40
		else
			return 1					//But only from one side

	if(prob(chance))
		return 0 //blocked
	return 1


/obj/structure/sandbag/ex_act(severity)
	switch(severity)
		if(1.0) qdel(src)
		if(2.0)
			if (prob(50))
				qdel(src)
			else
				return


/obj/structure/sandbag/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/shovel/))
		if(anchored)
			playsound(src.loc, 'sound/effects/rustle1.ogg', 100, 1)
			user << "<span class='notice'>Now displacing the sandbags...</span>"
			if(do_after(user, 40,src))
				if(!src) return
				user << "<span class='notice'>You displaced the sandbags!</span>"
				qdel(src)
				new /obj/item/weapon/sandbag(src.loc)

/obj/item/weapon/sandbag
	name = "sandbags"
	icon_state = "sandbag_empty"
	w_class = 1
	var/sand_amount = 0

/obj/item/weapon/sandbag/attack_self(mob/user as mob)
	if(sand_amount < 1)
		user << "\red You need more sand to make wall."
		return
	else
		user << "\red You begin to place the sandbags."
		if(do_after(user, 40, src))
			var/obj/structure/sandbag/R = new (user.loc)
			R.set_dir(user.dir)
			user.drop_item()
			qdel(src)
		else
			return

/obj/item/weapon/sandbag/attackby(obj/O as obj, mob/user as mob)
	if(istype(O, /obj/item/weapon/ore/glass))
		if(sand_amount >= 1)
			user << "\red [name] is full!"
			return
		user.drop_item()
		qdel(O)
		sand_amount++
		w_class++
		update_icon()
		user << "You need [4 - sand_amount] more units."

/obj/item/weapon/sandbag/update_icon()
	if(sand_amount >= 1)
		icon_state = "sandbag"
	else
		icon_state = "sandbag_empty"

//obj/item/weapon/ore/glass

/obj/structure/foxhole
	name = "foxhole"
	icon = 'icons/obj/sandbags.dmi'
	icon_state = "foxhole"
	anchored = 1
	climbable = 1
	density = 1
	flags = CAN_MOUNT

/obj/structure/foxhole/New()
	flags |= ON_BORDER
	update_icon()
	..()

/obj/structure/foxhole/update_icon()
	..()
	overlays += image('icons/obj/sandbags.dmi', src, "foxhole-over", FLY_LAYER)

/obj/structure/foxhole/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover, /obj/item/))
		return check_cover(mover, target)
	else
		return 0

/obj/structure/foxhole/proc/check_cover(obj/item/projectile/P, turf/from)
	var/turf/cover
	cover = get_turf(src)
	if(!cover)
		return 1
	if (get_dist(P.starting, loc) <= 1) //Tables won't help you if people are THIS close
		return 1

	var/chance = 20
	if(ismob(P.original) && get_turf(P.original) == cover)
		var/mob/M = P.original
		if (M.lying)
			chance += 60				//Lying down lets you catch less bullets
		if(get_dir(loc, from) == dir)	//Flipped tables catch mroe bullets
			chance += 40
		else
			return 1					//But only from one side

	if(prob(chance))
		return 0 //blocked
	return 1


/obj/structure/foxhole/ex_act(severity)
	switch(severity)
		if(1.0) qdel(src)
		if(2.0)
			if (prob(50))
				qdel(src)
			else
				return

/obj/structure/foxhole/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/shovel/))
		if(anchored)
			playsound('sound/effects/rustle1.ogg', 100, 1)
			user << "<span class='notice'>Now displacing the foxhole...</span>"
			if(do_after(user, 40,src))
				if(!src) return
				user << "<span class='notice'>You displaced the foxhole!</span>"
				qdel(src)


/obj/structure/m_barricade
	name = "metal barricade"
	desc = "A solid barricade made of steel. Use a welding tool and/or steel to repair it if damaged."
	icon = 'icons/obj/structures.dmi'
	icon_state = "barricade"
	density = 1
	anchored = 1.0
	layer = 2.9
	throwpass = 1	//You can throw objects over this, despite its density.
	climbable = 1
	flags = ON_BORDER | CAN_MOUNT
	var/health = 500 //Pretty tough. Changes sprites at 300 and 150.
	unacidable = 0 //Who the fuck though unacidable barricades with 500 health was a good idea?


/obj/structure/m_barricade/update_icon()
	if(health < 300 && health > 150)
		icon_state = "barricade_dmg1"
	else if(health <= 150)
		icon_state = "barricade_dmg2"
	else
		icon_state = initial(icon_state)

/obj/structure/m_barricade/proc/update_health()
	if(health < 0)
		src.visible_message("\red [src] collapses!")
		var/obj/item/stack/material/steel/P = new (src.loc)
		P.amount = pick(3,4)
		density = 0
		del(src)
		return

	if(health > 500) health = 500
	update_icon()
	return

/obj/structure/m_barricade/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover) && mover.checkpass(PASSTABLE))
		return 1
	if(locate(/obj/structure/table) in get_turf(mover)) //Tables let you climb on barricades.
		return 1
	if (get_dir(loc, target) == dir)
		return 0
	else
		return 1

/obj/structure/m_barricade/CheckExit(atom/movable/O as mob|obj, target as turf)
	if(istype(O) && O.checkpass(PASSTABLE))
		return 1
	if(locate(/obj/structure/table) in get_turf(O)) //Tables let you climb on barricades.
		return 1
	if (get_dir(loc, target) == dir)
		return 0
	else
		return 1

/obj/structure/m_barricade/attackby(obj/item/W as obj, mob/user as mob)
	if (!W) return

	if(istype(W, /obj/item/weapon/weldingtool))
		var/obj/item/weapon/weldingtool/WT = W
		if(health < 150)
			user << "It's too damaged for that. Better just to build a new one."
			return

		if(health >= 500)
			user << "It's already in perfect condition."
			return

		if(WT.remove_fuel(0, user))
			user.visible_message("\blue [user] begins repairing damage to the [src].","\blue You begin repairing the damage to the [src].")
			if(do_after(user,50))
				user.visible_message("\blue [user] repairs the damaged [src].","\blue Your repair the [src]'s damage.")
				health += 150
				if(health > 500) health = 500
				update_health()
				playsound(src.loc, 'sound/items/Welder2.ogg', 75, 1)
				return
		return

	return

/obj/structure/m_barricade/ex_act(severity)
	switch(severity)
		if(1.0)
			health -= rand(150,500)
		if(2.0)
			health -= rand(150,350)
		if(3.0)
			health -= rand(50,100)

	update_health()




/obj/structure/concreteblock
	name = "concrete block"
	icon = 'icons/obj/sandbags.dmi'
	icon_state = "block"
	anchored = 1
	climbable = 1
	density = 1
	flags = CAN_MOUNT

/obj/structure/concreteblock/New()
	flags |= ON_BORDER
	set_dir(dir)
	..()

/obj/structure/concreteblock/set_dir(direction)
	dir = direction
	if(dir == NORTH)
		layer = OBJ_LAYER
	else
		layer = FLY_LAYER

/obj/structure/concreteblock/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	if(istype(mover, /obj/item/projectile))
		return check_cover(mover, target)
	if (get_dir(loc, target) == dir)
		return !density
	else
		return 1

/obj/structure/concreteblock/proc/check_cover(obj/item/projectile/P, turf/from)
	var/turf/cover
	cover = get_turf(src)
	if(!cover)
		return 1
	if (get_dist(P.starting, loc) <= 1) //Tables won't help you if people are THIS close
		return 1

	var/chance = 80
	if(ismob(P.original) && get_turf(P.original) == cover)
		var/mob/M = P.original
		if (M.lying)
			chance += 35				//Lying down lets you catch less bullets
		if(get_dir(loc, from) == dir)	//Flipped tables catch mroe bullets
			chance += 40
		else
			return 1					//But only from one side

	if(prob(chance))
		return 0 //blocked
	return 1


/obj/structure/concreteblock/ex_act(severity)
	switch(severity)
		if(1.0) qdel(src)
		if(2.0)
			if (prob(25))
				visible_message("\red <b>[src] is blown apart!.</b>")
				qdel(src)
				var/obj/item/stack/material/concrete/W = new /obj/item/stack/material/concrete(src.loc)
				W.pixel_y = src.pixel_y
				W.amount = rand(3,6) //going to mess with this value for a while, we'll see


/obj/structure/brustwehr
	name = "brustwehr"
	desc = "It could be worse..."
	icon = 'icons/obj/sandbags.dmi'
	icon_state = "brustwehr_0"
	var/health = 200 //Actual health depends on snow layer
	climbable = 1
	density = 1
	anchored = 1
	layer = 2.9
	flags = CAN_MOUNT

	//Item Attack
	attackby(obj/item/W as obj, mob/user as mob)
		//Removing the barricades
		if(istype(W, /obj/item/weapon/shovel/))
			var/obj/item/weapon/shovel/S = W
			if(S.working)
				user  << "\red You are already shoveling!"
				return
			user.visible_message("[user.name] starts clearing out [src].","You start removing \the [src].")
			S.working = 1
			if(!do_after(user,100))
				user.visible_message("\red \The [user] decides not to clear out [src] anymore.")
				S.working = 0
				return
			user.visible_message("\blue \The [user] clears out [src].")
			S.working = 0
			health_check(1)
			return

		//Attacking
		else
			switch(W.damtype)
				if("fire")
					src.health -= W.force * 0.6
				if("brute")
					src.health -= W.force * 0.3
				else
			health_check()
			..()

	//Constructed
	New()
		update_nearby_icons()

	//Check Health
	proc/health_check(var/die)
		if(health < 1 || die)
			update_nearby_icons()
			visible_message("\red <B>[src] falls apart!</B>")
			del(src)

	//Explosion Act
	ex_act(severity)
		switch(severity)
			if(1.0)
				visible_message("\red <B>[src] is blown apart!</B>")
				src.update_nearby_icons()
				del(src)
				return
			if(2.0)
				src.health -= rand(30,60)
				if (src.health <= 0)
					visible_message("\red <B>[src] is blown apart!</B>")
					src.update_nearby_icons()
					del(src)
				return
			if(3.0)
				src.health -= rand(10,30)
				if (src.health <= 0)
					visible_message("\red <B>[src] is blown apart!</B>")
					src.update_nearby_icons()
					del(src)
				return

	//Bullet Passable
	CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
		if(air_group || (height==0)) return 1
		if(istype(mover,/obj/item/projectile))
			return (check_cover(mover,target))
		if(istype(mover) && mover.checkpass(PASSTABLE))
			return 1
		if(locate(/obj/structure/brustwehr) in get_turf(mover))
			return 1


	//checks if projectile 'P' from turf 'from' can hit whatever is behind the barricade. Returns 1 if it can, 0 if bullet stops.
	proc/check_cover(obj/item/projectile/P, turf/from)
		var/turf/cover = get_step(loc, get_dir(from, loc))
		if (get_dist(P.starting, loc) <= 1) //Barricades won't help you if people are THIS close
			return 1
		if (get_turf(P.original) == cover)
			var/chance = 70
			if (ismob(P.original))
				var/mob/M = P.original
				if (M.lying)
					chance += 20				//Lying down lets you catch less bullets
			if(prob(chance))
				health -= P.damage/4
				visible_message("<span class='warning'>[P] hits [src]!</span>")
				health_check()
				return 0
		return 1

	//Update Sides
	proc/update_nearby_icons()
		update_icon()
		for(var/direction in cardinal)
			for(var/obj/structure/brustwehr/B in get_step(src,direction))
				B.update_icon()

	//Update Icons
	update_icon()
		spawn(2)
			if(!src)
				return
			var/junction = 0 //will be used to determine from which side the barricade is connected to other barricades
			for(var/obj/structure/brustwehr/B in orange(src,1))
				if(abs(x-B.x)-abs(y-B.y) ) 		//doesn't count barricades, placed diagonally to src
					junction |= get_dir(src,B)

			icon_state = "brustwehr_[junction]"
			return
