/turf/unsimulated/floor
	name = "floor"
	icon = 'icons/turf/floors.dmi'
	icon_state = "Floor3"
	stepsound = "concrete"
	blend_with_neighbors = 3

/turf/unsimulated/floor/bluespace //non-doomsday version of bluespace for transit and wizden
	name = "\improper bluespace"
	icon = 'icons/turf/space.dmi'
	icon_state = "bluespace"
	desc = "Looks like infinity."

/turf/unsimulated/mask
	name = "mask"
	icon = 'icons/turf/walls.dmi'
	icon_state = "rockvault"

/turf/unsimulated/floor/rescue_base
	icon_state = "asteroidfloor"

/turf/unsimulated/floor/carpet
	name = "carpet"
	icon = 'icons/turf/newfloor.dmi'
	icon_state = "carpet1"

/turf/unsimulated/floor/wooden
	name = "wooden floor"
	icon = 'icons/turf/newfloor.dmi'
	icon_state = "wood2"

/turf/unsimulated/floor/stone
	name = "brick pavement"
	icon = 'icons/turf/newfloor.dmi'
	icon_state = "stone3"

/turf/unsimulated/floor/road
	name = "road"
	icon = 'icons/turf/newfloor.dmi'
	icon_state = "roaddottedstripes"
	temperature = T0C - 30
	oxygen = MOLES_O2STANDARD * 1.15
	nitrogen = MOLES_N2STANDARD * 1.15


/turf/unsimulated/floor/road/shuttle
	icon_state = "concreteroad"
