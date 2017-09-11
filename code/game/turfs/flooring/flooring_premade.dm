// simulated/floor is currently plating by default, but there really should be an explicit plating type.
/turf/simulated/floor/plating
	name = "plating"
	icon = 'icons/turf/flooring/plating.dmi'
	icon_state = "plating"
	stepsound = "metal"

/turf/simulated/floor/carpet
	name = "carpet"
	icon = 'icons/turf/flooring/carpet.dmi'
	icon_state = "carpet"
	initial_flooring = /decl/flooring/carpet

/turf/simulated/floor/bluegrid
	name = "mainframe floor"
	icon = 'icons/turf/flooring/circuit.dmi'
	icon_state = "bcircuit"
	initial_flooring = /decl/flooring/reinforced/circuit

/turf/simulated/floor/greengrid
	name = "mainframe floor"
	icon = 'icons/turf/flooring/circuit.dmi'
	icon_state = "gcircuit"
	initial_flooring = /decl/flooring/reinforced/circuit/green

/turf/simulated/floor/wood
	name = "wooden floor"
	icon = 'icons/turf/flooring/wood.dmi'
	icon_state = "wood"
	initial_flooring = /decl/flooring/wood
	stepsound = "wood"

/turf/simulated/floor/grass
	name = "grass patch"
	icon = 'icons/turf/flooring/grass.dmi'
	icon_state = "grass0"
	initial_flooring = /decl/flooring/grass

/turf/simulated/floor/diona
	name = "biomass"
	icon = 'icons/turf/floors.dmi'
	initial_flooring = /decl/flooring/diona

/turf/simulated/floor/carpet/blue
	name = "blue carpet"
	icon_state = "bcarpet"
	initial_flooring = /decl/flooring/carpet/blue

/turf/simulated/floor/tiled
	name = "floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "steel"
	initial_flooring = /decl/flooring/tiling

/turf/simulated/floor/reinforced
	name = "reinforced floor"
	icon = 'icons/turf/flooring/tiles.dmi'
	icon_state = "reinforced"
	initial_flooring = /decl/flooring/reinforced

/turf/simulated/floor/reinforced/airless
	oxygen = 0
	nitrogen = 0

/turf/simulated/floor/reinforced/airmix
	oxygen = MOLES_O2ATMOS
	nitrogen = MOLES_N2ATMOS

/turf/simulated/floor/reinforced/nitrogen
	oxygen = 0
	nitrogen = ATMOSTANK_NITROGEN

/turf/simulated/floor/reinforced/oxygen
	oxygen = ATMOSTANK_OXYGEN
	nitrogen = 0

/turf/simulated/floor/reinforced/phoron
	oxygen = 0
	nitrogen = 0
	phoron = ATMOSTANK_PHORON

/turf/simulated/floor/reinforced/carbon_dioxide
	oxygen = 0
	nitrogen = 0
	carbon_dioxide = ATMOSTANK_CO2

/turf/simulated/floor/reinforced/n20
	oxygen = 0
	nitrogen = 0

/turf/simulated/floor/reinforced/n20/New()
	..()
	sleep(-1)
	if(!air) make_air()
	air.adjust_gas("sleeping_agent", ATMOSTANK_NITROUSOXIDE)

/turf/simulated/floor/cult
	name = "engraved floor"
	icon = 'icons/turf/flooring/cult.dmi'
	icon_state = "cult"
	initial_flooring = /decl/flooring/reinforced/cult

/turf/simulated/floor/cult/cultify()
	return

/turf/simulated/floor/tiled/dark
	name = "dark floor"
	icon_state = "dark"
	initial_flooring = /decl/flooring/tiling/dark

/turf/simulated/floor/tiled/steel
	name = "steel floor"
	icon_state = "steel"
	initial_flooring = /decl/flooring/tiling/steel

/turf/simulated/floor/tiled/steel/airless
	oxygen = 0
	nitrogen = 0

/turf/simulated/floor/tiled/white
	name = "white floor"
	icon_state = "white"
	initial_flooring = /decl/flooring/tiling/white

/turf/simulated/floor/tiled/freezer
	name = "tiles"
	icon_state = "freezer"
	initial_flooring = /decl/flooring/tiling/freezer

/turf/simulated/floor/lino
	name = "lino"
	icon = 'icons/turf/flooring/linoleum.dmi'
	icon_state = "lino"
	initial_flooring = /decl/flooring/linoleum

/turf/simulated/floor/blue
	name = "blue floor"
	icon = 'icons/turf/newfloor.dmi'
	icon_state = "tileblue"
	initial_flooring = /decl/flooring/tiling/newfloor/blue

/turf/simulated/floor/grimb
	name = "grime floor"
	icon = 'icons/turf/newfloor.dmi'
	icon_state = "floorgrime_bw1"
	initial_flooring = /decl/flooring/tiling/newfloor/grimeb

/turf/simulated/floor/grimw
	name = "grime floor"
	icon = 'icons/turf/newfloor.dmi'
	icon_state = "floorgrime_gw1"
	initial_flooring = /decl/flooring/tiling/newfloor/grimew

/turf/simulated/floor/hospital
	name = "hospital floor"
	icon = 'icons/turf/newfloor.dmi'
	icon_state = "medbay"
	initial_flooring = /decl/flooring/tiling/newfloor/hospital

/turf/simulated/floor/hospitalalt
	name = "hospital floor"
	icon = 'icons/turf/newfloor.dmi'
	icon_state = "hospital"
	initial_flooring = /decl/flooring/tiling/newfloor/hospitalalt

/turf/simulated/floor/neutralalt
	name = "grey floor"
	icon = 'icons/turf/newfloor.dmi'
	icon_state = "neutralfull"
	initial_flooring = /decl/flooring/tiling/newfloor/neutralalt

/turf/simulated/floor/rustychess
	name = "rusty floor"
	icon = 'icons/turf/newfloor.dmi'
	icon_state = "whiteyellowrusty"
	initial_flooring = /decl/flooring/tiling/newfloor/rustychess

/turf/simulated/floor/greendark
	name = "dark green floor"
	icon = 'icons/turf/newfloor.dmi'
	icon_state = "greenfull"
	initial_flooring = /decl/flooring/tiling/newfloor/greendark

/turf/simulated/floor/rustyredchess
	name = "rusty floor"
	icon = 'icons/turf/newfloor.dmi'
	icon_state = "whiteredchess"
	initial_flooring = /decl/flooring/tiling/newfloor/rustyredchess

/turf/simulated/floor/darkwhite
	name = "white floor"
	icon = 'icons/turf/newfloor.dmi'
	icon_state = "white"
	initial_flooring = /decl/flooring/tiling/newfloor/darkwhite

/turf/simulated/floor/darkwhiterusty
	name = "rusty white floor"
	icon = 'icons/turf/newfloor.dmi'
	icon_state = "whitedirty"
	initial_flooring = /decl/flooring/tiling/newfloor/darkwhiterusty


/turf/simulated/floor/brick
	name = "brick floor"
	icon = 'icons/turf/newfloor.dmi'
	icon_state = "bricktile"
	initial_flooring = /decl/flooring/tiling/newfloor/brick

/turf/simulated/floor/lightwhite
	name = "white floor"
	icon = 'icons/turf/newfloor.dmi'
	icon_state = "plate1"
	initial_flooring = /decl/flooring/tiling/newfloor/lightwhite

/turf/simulated/floor/lightblue
	name = "blue floor"
	icon = 'icons/turf/newfloor.dmi'
	icon_state = "plate2"
	initial_flooring = /decl/flooring/tiling/newfloor/lightblue

/turf/simulated/floor/darkred
	name = "dark red floor"
	icon = 'icons/turf/newfloor.dmi'
	icon_state = "robar"
	initial_flooring = /decl/flooring/tiling/newfloor/darkred

/turf/simulated/floor/fancy
	name = "fancy floor"
	icon = 'icons/turf/newfloor.dmi'
	icon_state = "fftile"
	initial_flooring = /decl/flooring/tiling/newfloor/fancy

/turf/simulated/floor/dirty
	name = "dirty floor"
	icon = 'icons/turf/newfloor.dmi'
	icon_state = "floorgrime_gb1"
	initial_flooring = /decl/flooring/tiling/newfloor/dirty

/turf/simulated/floor/dirtyneutral
	name = "dirty floor"
	icon = 'icons/turf/newfloor.dmi'
	icon_state = "neutraldirty"
	initial_flooring = /decl/flooring/tiling/newfloor/dirtyneutral

/turf/simulated/floor/dirtydark
	name = "dirty floor"
	icon = 'icons/turf/newfloor.dmi'
	icon_state = "darkdirty"
	initial_flooring = /decl/flooring/tiling/newfloor/dirtydark

/turf/simulated/floor/greenish
	name = "floor"
	icon = 'icons/turf/newfloor.dmi'
	icon_state = "greenish"
	initial_flooring = /decl/flooring/tiling/newfloor/greenish


//ATMOS PREMADES
/turf/simulated/floor/reinforced/airless
	name = "vacuum floor"
	oxygen = 0
	nitrogen = 0
	temperature = TCMB

/turf/simulated/floor/airless
	name = "airless plating"
	oxygen = 0
	nitrogen = 0
	temperature = TCMB

/turf/simulated/floor/tiled/airless
	name = "airless floor"
	oxygen = 0
	nitrogen = 0
	temperature = TCMB

/turf/simulated/floor/bluegrid/airless
	name = "airless floor"
	oxygen = 0
	nitrogen = 0
	temperature = TCMB

/turf/simulated/floor/greengrid/airless
	name = "airless floor"
	oxygen = 0
	nitrogen = 0
	temperature = TCMB

/turf/simulated/floor/greengrid/nitrogen
	oxygen = 0

/turf/simulated/floor/tiled/white/airless
	name = "airless floor"
	oxygen = 0
	nitrogen = 0
	temperature = TCMB

// Placeholders
/turf/simulated/floor/airless/lava
/turf/simulated/floor/light
/turf/simulated/floor/snow
/turf/simulated/floor/beach/coastline
/turf/simulated/floor/plating/snow
/turf/simulated/floor/airless/ceiling

/turf/simulated/floor/beach
	name = "beach"
	icon = 'icons/misc/beach.dmi'

/turf/simulated/floor/beach/sand
	name = "sand"
	icon_state = "sand"

/turf/simulated/floor/beach/sand/desert
	icon_state = "desert"

/turf/simulated/floor/beach/coastline
	name = "coastline"
	icon = 'icons/misc/beach2.dmi'
	icon_state = "sandwater"

/turf/simulated/floor/beach/water
	name = "water"
	icon_state = "water"

/turf/simulated/floor/beach/water/update_dirt()
	return	// Water doesn't become dirty

/turf/simulated/floor/beach/water/ocean
	icon_state = "seadeep"

/turf/simulated/floor/beach/water/New()
	..()
	overlays += image("icon"='icons/misc/beach.dmi',"icon_state"="water5","layer"=MOB_LAYER+0.1)


