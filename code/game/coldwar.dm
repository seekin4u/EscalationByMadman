var/roundstart_time = 0

/hook/roundstart/proc/game_start()
	roundstart_time = world.time
	return 1

var/wlg_total = 0
var/wlg_rejected = 0
var/wlg_selected_none = 0
var/wlg_selected_grass = 0
var/wlg_selected_bush = 0
var/wlg_selected_pine = 0
var/wlg_selected_deadtree = 0
var/wlg_selected_rock = 0
var/wlg_selected_cuttree = 0

/hook/startup/proc/spawn_bushes()
	world << "<b>Generating wildlife.</b>"
	wlg_total = 0
	wlg_rejected = 0
	wlg_selected_none = 0
	wlg_selected_grass = 0
	wlg_selected_bush = 0
	wlg_selected_pine = 0
	wlg_selected_deadtree = 0
	wlg_selected_rock = 0
	wlg_selected_cuttree = 0
	spawn(100)
		for(var/turf/T in world)
//			if(T.z != 2)
//				continue
			if(!istype(T, /turf/snow))
				continue

			wlg_total++
			if(T.contents.len > 1)
				wlg_rejected++
				continue

			var/rn = rand(1, 100)
			switch(rn)
				if(1 to 80)
					wlg_selected_none++
					continue
				if(81 to 87)
					wlg_selected_grass++
					var/grass = pick(/obj/structure/flora/grass/green,
									/obj/structure/flora/grass/brown,
									/obj/structure/flora/grass/both,
									/obj/structure/flora/bush)
					new grass(T)
				if(87 to 89)
					wlg_selected_rock++
					var/rock = pick(/obj/structure/flora/smallrock,
									/obj/structure/flora/bigrock)
					new rock(T)
				if(90)
					wlg_selected_cuttree++
					var/cuttree = pick(/obj/structure/flora/cuttedtree,
									/obj/structure/flora/cuttedtree)
					new cuttree(T)
				if(91 to 94)
					wlg_selected_pine++
					var/pine = /obj/structure/flora/tree/pine
					new pine(T)
				if(95 to 98)
					wlg_selected_deadtree++
					var/deadtree = /obj/structure/flora/tree/dead
					new deadtree(T)
				else
					wlg_selected_bush++
					var/bushes = /obj/structure/flora/bush
					new bushes(T)
	return 1


/hook/shuttle_move/proc/announce_mission_start()
	var/ru_fireteams = 0
	var/en_fireteams = 0
	for(var/datum/fireteam/ft in job_master.all_fireteams)
		if(!ft.is_full())
			continue
		if(ft.side == "WARPAC")
			ru_fireteams++
		if(ft.side == "NATO")
			en_fireteams++
	world << "<font size=3>Fireteams report: [en_fireteams] USMC full fireteams, [ru_fireteams] Soviet Army full otdeleniy."
	for(var/datum/fireteam/ft in job_master.all_fireteams)
		var/text = "[get_side_name(ft.side)] - [ft.code]"
		if(ft.name)
			text += " called as \"[ft.name]\"."
		world << "<font size=2>-[text]</font>"
	return 1

/proc/get_side_name(var/side)
	if(side == "WARPAC")
		return "Soviet Army"
	if(side == "NATO")
		return "USMC"
	return null