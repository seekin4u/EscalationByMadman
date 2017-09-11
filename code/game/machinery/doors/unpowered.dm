/obj/machinery/door/unpowered
	autoclose = 0
	var/locked = 0

/obj/machinery/door/unpowered/Bumped(atom/AM)
	if(src.locked)
		return
	..()
	return

/obj/machinery/door/unpowered/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/weapon/melee/energy/blade))	return
	if(src.locked)	return
	..()
	return

/obj/machinery/door/unpowered/emag_act()
	return -1

/obj/machinery/door/unpowered/shuttle
	icon = 'icons/turf/shuttle.dmi'
	name = "door"
	icon_state = "door1"
	opacity = 1
	density = 1

/obj/machinery/door/unpowered/metal
	icon = 'icons/obj/doors/doorsteel.dmi'
	name = "door"
	icon_state = "door1"
	opacity = 1
	density = 1

/obj/machinery/door/unpowered/truckdoor
	icon = 'icons/obj/doors/truckdoorleft.dmi'
	name = "truck door"
	icon_state = "door1"
	opacity = 0
	density = 1
	glass = 1

/obj/machinery/door/unpowered/truckdoor/right
	icon = 'icons/obj/doors/truckdoorright.dmi'
	name = "truck door"
	icon_state = "door1"
	opacity = 0
	density = 1
	glass = 1
