/datum/map/kaliningrad
	name = "Kaliningrad"
	full_name = "1983: Kaliningrad"
	path = "kaliningrad"

	station_levels = list(1,2)
	contact_levels = list(1,2)
	player_levels = list(1,2)
//	admin_levels = list(3)

/datum/shuttle/multi_shuttle/hue
	name = "Hue"
	warmup_time = 20
	origin = /area/shuttle/uh1
	interim = /area/shuttle/uh1/transit
	start_location = "FOB"
	destinations = list(
		"Alpha LZ" = /area/shuttle/uh1/lz1,
		"Bravo LZ" = /area/shuttle/uh1/lz2,
		"Charlie LZ" = /area/shuttle/uh1/lz3,
		)