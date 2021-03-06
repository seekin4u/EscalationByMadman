obj/item/device/cable_painter
	name = "cable painter"
	desc = "A device for repainting cables."
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "labeler0"
	item_state = "flight"
	var/color_selection
	var/list/modes
	w_class = 2.0

obj/item/device/cable_painter/New()
	..()
	color_selection = pick(possible_cable_coil_colours)

obj/item/device/cable_painter/examine(var/user)
	. = ..(user, 1)
	if(.)
		user << "The color is currently set to [lowertext(color_selection)]."

obj/item/device/cable_painter/attack_self(mob/user)
	var/new_color_selection = input("What color would you like to use?", "Choose a Color", color_selection) as null|anything in possible_cable_coil_colours
	if(new_color_selection && !user.incapacitated() && (src in user))
		color_selection = new_color_selection
		user << "<span class='notice'>You change the paint mode to [lowertext(color_selection)].</span>"

/obj/item/device/cable_painter/afterattack(var/atom/A, var/mob/user, var/proximity)
	if(!proximity)
		return ..()
	if(istype(A, /obj/structure/cable))
		var/picked_color = possible_cable_coil_colours[color_selection]
		if(!picked_color || A.color == picked_color)
			return
		A.color = picked_color
		user << "<span class='notice'>You set \the [A]'s color to [lowertext(color_selection)].</span>"
	else if(istype(A, /obj/item/stack/cable_coil))
		var/obj/item/stack/cable_coil/c = A
		c.set_cable_color(color_selection, user)
	else
		. = ..()
