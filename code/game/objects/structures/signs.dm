/obj/structure/sign
	icon = 'icons/obj/decals.dmi'
	anchored = 1
	opacity = 0
	density = 0
	layer = 3.5
	w_class = 3

/obj/structure/sign/ex_act(severity)
	switch(severity)
		if(1.0)
			qdel(src)
			return
		if(2.0)
			qdel(src)
			return
		if(3.0)
			qdel(src)
			return
		else
	return

/obj/structure/sign/attackby(obj/item/tool as obj, mob/user as mob)	//deconstruction
	if(istype(tool, /obj/item/weapon/screwdriver) && !istype(src, /obj/structure/sign/double))
		user << "You unfasten the sign with your [tool]."
		var/obj/item/sign/S = new(src.loc)
		S.name = name
		S.desc = desc
		S.icon_state = icon_state
		//var/icon/I = icon('icons/obj/decals.dmi', icon_state)
		//S.icon = I.Scale(24, 24)
		S.sign_state = icon_state
		qdel(src)
	else ..()

/obj/item/sign
	name = "sign"
	desc = ""
	icon = 'icons/obj/decals.dmi'
	w_class = 3		//big
	var/sign_state = ""

/*
/obj/item/sign/attackby(obj/item/tool as obj, mob/user as mob)	//construction
	if(istype(tool, /obj/item/weapon/screwdriver) && isturf(user.loc))
		var/direction = input("In which direction?", "Select direction.") in list("North", "East", "South", "West", "Cancel")
		if(direction == "Cancel") return
		var/obj/structure/sign/S = new(user.loc)
		switch(direction)
			if("North")
				S.pixel_y = 32
			if("East")
				S.pixel_x = 32
			if("South")
				S.pixel_y = -32
			if("West")
				S.pixel_x = -32
			else return
		S.name = name
		S.desc = desc
		S.icon_state = sign_state
		user << "You fasten \the [S] with your [tool]."
		qdel(src)
	else ..()
*/

/obj/structure/sign/double/map
	name = "station map"
	desc = "A framed picture of the station."

/obj/structure/sign/double/map/left
	icon_state = "map-left"

/obj/structure/sign/double/map/right
	icon_state = "map-right"

/obj/structure/sign/securearea
	name = "\improper SECURE AREA"
	desc = "A warning sign which reads 'SECURE AREA'."
	icon_state = "securearea"

/obj/structure/sign/biohazard
	name = "\improper BIOHAZARD"
	desc = "A warning sign which reads 'BIOHAZARD'."
	icon_state = "bio"

/obj/structure/sign/electricshock
	name = "\improper HIGH VOLTAGE"
	desc = "A warning sign which reads 'HIGH VOLTAGE'."
	icon_state = "shock"

/obj/structure/sign/examroom
	name = "\improper EXAM"
	desc = "A guidance sign which reads 'EXAM ROOM'."
	icon_state = "examroom"

/obj/structure/sign/vacuum
	name = "\improper HARD VACUUM AHEAD"
	desc = "A warning sign which reads 'HARD VACUUM AHEAD'."
	icon_state = "space"

/obj/structure/sign/deathsposal
	name = "\improper DISPOSAL LEADS TO SPACE"
	desc = "A warning sign which reads 'DISPOSAL LEADS TO SPACE'."
	icon_state = "deathsposal"

/obj/structure/sign/pods
	name = "\improper ESCAPE PODS"
	desc = "A warning sign which reads 'ESCAPE PODS'."
	icon_state = "pods"

/obj/structure/sign/fire
	name = "\improper DANGER: FIRE"
	desc = "A warning sign which reads 'DANGER: FIRE'."
	icon_state = "fire"

/obj/structure/sign/nosmoking_1
	name = "\improper NO SMOKING"
	desc = "A warning sign which reads 'NO SMOKING'."
	icon_state = "nosmoking"

/obj/structure/sign/nosmoking_2
	name = "\improper NO SMOKING"
	desc = "A warning sign which reads 'NO SMOKING'."
	icon_state = "nosmoking2"

/obj/structure/sign/redcross
	name = "medbay"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "redcross"

/obj/structure/sign/greencross
	name = "medbay"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "greencross"

/obj/structure/sign/bluecross_1
	name = "infirmary"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "bluecross"

/obj/structure/sign/bluecross_2
	name = "infirmary"
	desc = "The Intergalactic symbol of Medical institutions. You'll probably get help here."
	icon_state = "bluecross2"

/obj/structure/sign/goldenplaque
	name = "The Most Robust Men Award for Robustness"
	desc = "To be Robust is not an action or a way of life, but a mental state. Only those with the force of Will strong enough to act during a crisis, saving friend from foe, are truly Robust. Stay Robust my friends."
	icon_state = "goldenplaque"

/obj/structure/sign/goldenplaque/security
	name = "motivational plaque"
	desc = "A plaque engraved with a generic motivational quote and picture. ' Greater love hath no man than this, that a man lay down his life for his friends. John 15:13 "

/obj/structure/sign/goldenplaque/medical
	name = "medical certificate"
	desc = "A picture next to a long winded description of medical certifications and degrees."

/obj/structure/sign/kiddieplaque
	name = "\improper AI developers plaque"
	desc = "An extremely long list of names and job titles and a picture of the design team responsible for building this AI Core."
	icon_state = "kiddieplaque"

/obj/structure/sign/atmosplaque
	name = "\improper engineering memorial plaque"
	desc = "This plaque memorializes those engineers and technicians who made the ultimate sacrifice to save their vessel and its crew."
	icon_state = "atmosplaque"

/obj/structure/sign/dedicationplaque
	name = "\improper SEV Torch dedication plaque"
	desc = "S.E.V. Torch - Mako Class - Sol Expeditionary Corps Registry 95519 - Shiva Fleet Yards, Mars - First Vessel To Bear The Name - Launched 2560 - Sol Central Government - 'Never was anything great achieved without danger.'"
	icon_state = "lightplaque"

/obj/structure/sign/floorplaque
	name = "\improper commemorative plaque"
	desc = "A list of dead explorers who gave their lives in search of the next great discovery. Hope you don't join them."
	icon_state = "floorplaque"

/obj/structure/sign/double/solgovflag
	name = "Sol Central Government Flag"
	desc = "The flag of the Sol Central Government, a symbol of many things to many people."

/obj/structure/sign/double/solgovflag/left
	icon_state = "solgovflag-left"

/obj/structure/sign/double/solgovflag/right
	icon_state = "solgovflag-right"

/obj/structure/sign/double/maltesefalcon	//The sign is 64x32, so it needs two tiles. ;3
	name = "The Maltese Falcon"
	desc = "The Maltese Falcon, Space Bar and Grill."

/obj/structure/sign/double/maltesefalcon/left
	icon_state = "maltesefalcon-left"

/obj/structure/sign/double/maltesefalcon/right
	icon_state = "maltesefalcon-right"

/obj/structure/sign/science
	name = "\improper SCIENCE!"
	desc = "A warning sign which reads 'SCIENCE!'."
	icon_state = "science1"

/obj/structure/sign/science_1
	name = "\improper RESEARCH WING"
	desc = "A sign labelling the research wing."
	icon_state = "science1"

/obj/structure/sign/science_2
	name = "\improper RESEARCH"
	desc = "A sign labelling an area where research is performed."
	icon_state = "science2"

/obj/structure/sign/xenobio_1
	name = "\improper XENOBIOLOGY"
	desc = "A sign labelling an area as a place where xenobiological entites are researched."
	icon_state = "xenobio"

/obj/structure/sign/xenobio_2
	name = "\improper XENOBIOLOGY"
	desc = "A sign labelling an area as a place where xenobiological entites are researched."
	icon_state = "xenobio2"

/obj/structure/sign/xenobio_3
	name = "\improper XENOBIOLOGY"
	desc = "A sign labelling an area as a place where xenobiological entites are researched."
	icon_state = "xenobio3"

/obj/structure/sign/xenobio_4
	name = "\improper XENOBIOLOGY"
	desc = "A sign labelling an area as a place where xenobiological entites are researched."
	icon_state = "xenobio4"

/obj/structure/sign/chemistry
	name = "\improper CHEMISTRY"
	desc = "A sign labelling an area containing chemical equipment."
	icon_state = "chemistry1"

/obj/structure/sign/xenoflora
	name = "\improper XENOFLORA"
	desc = "A sign labelling an area as a place where xenobiological plants are researched."
	icon_state = "hydro4"

/obj/structure/sign/botany
	name = "\improper BOTANY"
	desc = "A warning sign which reads 'BOTANY!'."
	icon_state = "hydro3"

/obj/structure/sign/hydro
	name = "\improper HYDROPONICS"
	desc = "A sign labelling an area as a place where plants are grown."
	icon_state = "hydro1"

/obj/structure/sign/hydrostorage
	name = "\improper HYDROPONICS STORAGE"
	desc = "A sign labelling an area as a place where plant growing supplies are kept."
	icon_state = "hydro3"

/obj/structure/sign/directions
	name = "direction sign"
	desc = "A direction sign, claiming to know the way."
	icon_state = "direction"

/obj/structure/sign/directions/science
	name = "\improper Research Division"
	desc = "A direction sign, pointing out which way the Research Division is."
	icon_state = "direction_sci"

/obj/structure/sign/directions/engineering
	name = "\improper Engineering Bay"
	desc = "A direction sign, pointing out which way the Engineering Bay is."
	icon_state = "direction_eng"

/obj/structure/sign/directions/security
	name = "\improper Security Wing"
	desc = "A direction sign, pointing out which way the Security Wing is."
	icon_state = "direction_sec"

/obj/structure/sign/directions/medical
	name = "\improper Medical Bay"
	desc = "A direction sign, pointing out which way the Medical Bay is."
	icon_state = "direction_med"

/obj/structure/sign/directions/evac
	name = "\improper Evacuation Wing"
	desc = "A direction sign, pointing out which way the Evacuation Wing is."
	icon_state = "direction_evac"

/obj/structure/sign/directions/bridge
	name = "\improper Bridge"
	desc = "A direction sign, pointing out which way the Bridge is."
	icon_state = "direction_bridge"

/obj/structure/sign/directions/supply
	name = "\improper Supply Office"
	desc = "A direction sign, pointing out which way the Supply Office is."
	icon_state = "direction_supply"

/obj/structure/sign/directions/infirmary
	name = "\improper Infirmary"
	desc = "A direction sign, pointing out which way the Infirmary is."
	icon_state = "direction_infirm"

/obj/structure/sign/stop
	name = "\improper STOP sign"
	desc = "A warning sign which reads 'STOP'."
	icon_state = "stop"

/obj/structure/sign/donotenter
	name = "\improper warning sign"
	desc = "A warning sign which means do not entering this area."
	icon_state = "donotenter"

/obj/structure/sign/zebracrossing
	name = "\improper zebra crossing sign"
	desc = "That's a zebra crossing sign."
	icon_state = "zebracrossing"

/obj/structure/sign/parking
	name = "\improper parking sign"
	desc = "That's a parking sign."
	icon_state = "parking"

/obj/structure/sign/andropovportrait
	name = "\improper Andropov's portrait"
	icon = 'icons/obj/decorations.dmi'
	icon_state = "andropov_portrait"

/obj/structure/sign/andropovportrait
	name = "\improper Andropov's portrait"
	icon = 'icons/obj/decorations.dmi'
	icon_state = "andropov_portrait"

/obj/structure/sign/stalinportrait
	name = "\improper Stalin's portrait"
	icon = 'icons/obj/decorations.dmi'
	icon_state = "stalin_portrait"

/obj/structure/sign/leninportrait
	name = "\improper Lenin's portrait"
	icon = 'icons/obj/decorations.dmi'
	icon_state = "lenin_portrait"

/obj/structure/sign/clock
	name = "clock"
	icon = 'icons/obj/decorations.dmi'
	icon_state = "clocks"
	desc = "That's one looks like it doesn't work."

/obj/structure/sign/rubin714
	name = "TV"
	icon = 'icons/obj/decorations.dmi'
	icon_state = "rubin714"
	desc = "That's a Rubin-714, a Soviet-made TV. By the way, it doesn't seem to be working."

/obj/structure/sign/rubin102
	name = "TV"
	icon = 'icons/obj/decorations.dmi'
	icon_state = "rubin102"
	desc = "That's a Rubin-102, a Soviet-made TV. By the way, it doesn't seem to be working."

/obj/structure/sign/rassvet307
	name = "TV"
	icon = 'icons/obj/decorations.dmi'
	icon_state = "rassvet307"
	desc = "That's a Rassvet-307, a Soviet-made TV. By the way, it doesn't seem to be working."

/obj/structure/sign/nes
	name = "NES"
	icon = 'icons/obj/decorations.dmi'
	icon_state = "nes"
	desc = "That's the Nintendo Entertainment System."
	anchored = 0

/obj/structure/sign/vhs
	name = "VHS player"
	icon = 'icons/obj/decorations.dmi'
	icon_state = "vhsplayer"
	desc = "Does not have any cassette in it."
	anchored = 0

/obj/structure/sign/soviet_flag
	name = "Soviet flag"
	icon = 'icons/obj/decorations.dmi'
	icon_state = "soviet_flag"
	desc = "That's the Soviet Union flag."

/obj/structure/sign/usmc_flag
	name = "USA flag"
	icon = 'icons/obj/decorations.dmi'
	icon_state = "usa_flag"
	desc = "That's the United States of America flag."

/obj/structure/sign/trash
	name = "trash bags"
	icon = 'icons/obj/decorations.dmi'
	icon_state = "trash"
	desc = "Nasty."
	anchored = 0

/obj/structure/sign/carpetleft
	name = "carpet"
	icon = 'icons/obj/decorations.dmi'
	icon_state = "carpet1"
	desc = "That's a carpet"

/obj/structure/sign/carpetright
	name = "carpet"
	icon = 'icons/obj/decorations.dmi'
	icon_state = "carpet2"
	desc = "That's a carpet"

/obj/structure/sign/alpha1
	name = "ALPHA-1"
	icon_state = "alpha1"

/obj/structure/sign/alpha2
	name = "ALPHA-2"
	icon_state = "alpha2"

/obj/structure/sign/bravo2
	name = "BRAVO-2"
	icon_state = "bravo2"

/obj/structure/sign/bravo1
	name = "BRAVO-1"
	icon_state = "bravo1"

/obj/structure/sign/charlie1
	name = "CHARLIE-1"
	icon_state = "charlie1"

/obj/structure/sign/charlie2
	name = "CHARLIE-2"
	icon_state = "charlie2"

/obj/structure/sign/hospital
	name = "HOSPITAL"
	icon_state = "hospital"

/obj/structure/sign/command
	name = "COMMAND"
	icon_state = "command"

/obj/structure/sign/raduzhnoe
	name = "Raduzhnoe village"
	icon = 'icons/obj/decals48.dmi'
	icon_state = "raduzhnoe"

/obj/structure/sign/stogovka
	name = "Stogovka river"
	icon = 'icons/obj/decals48.dmi'
	icon_state = "stogovka"

/obj/structure/sign/cafe
	name = "cafe sign"
	icon_state = "cafesign"

/obj/structure/sign/gasoline
	name = "gasoline sign"
	icon_state = "gasolinesign"

/obj/structure/sign/human
	name = "'human on the road' sign"
	icon_state = "humansign"

/obj/structure/sign/way
	name = "direction sign"
	icon_state = "waysign"



