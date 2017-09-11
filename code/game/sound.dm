//Sound environment defines. Reverb preset for sounds played in an area, see sound datum reference for more.
#define GENERIC 0
#define PADDED_CELL 1
#define ROOM 2
#define BATHROOM 3
#define LIVINGROOM 4
#define STONEROOM 5
#define AUDITORIUM 6
#define CONCERT_HALL 7
#define CAVE 8
#define ARENA 9
#define HANGAR 10
#define CARPETED_HALLWAY 11
#define HALLWAY 12
#define STONE_CORRIDOR 13
#define ALLEY 14
#define FOREST 15
#define CITY 16
#define MOUNTAINS 17
#define QUARRY 18
#define PLAIN 19
#define PARKING_LOT 20
#define SEWER_PIPE 21
#define UNDERWATER 22
#define DRUGGED 23
#define DIZZY 24
#define PSYCHOTIC 25

#define STANDARD_STATION STONEROOM
#define LARGE_ENCLOSED HANGAR
#define SMALL_ENCLOSED BATHROOM
#define TUNNEL_ENCLOSED CAVE
#define LARGE_SOFTFLOOR CARPETED_HALLWAY
#define MEDIUM_SOFTFLOOR LIVINGROOM
#define SMALL_SOFTFLOOR ROOM
#define ASTEROID CAVE
#define SPACE UNDERWATER

var/list/shatter_sound = list('sound/effects/Glassbr1.ogg','sound/effects/Glassbr2.ogg','sound/effects/Glassbr3.ogg')
var/list/explosion_sound = list('sound/effects/explosion1.wav','sound/effects/explosion2.wav','sound/effects/explosion3.wav','sound/effects/explosion4.wav','sound/effects/explosion5.wav','sound/effects/explosion6.wav')
var/list/spark_sound = list('sound/effects/sparks1.ogg','sound/effects/sparks2.ogg','sound/effects/sparks3.ogg','sound/effects/sparks4.ogg')
var/list/rustle_sound = list('sound/effects/rustle1.ogg','sound/effects/rustle2.ogg','sound/effects/rustle3.ogg','sound/effects/rustle4.ogg','sound/effects/rustle5.ogg')
var/list/punch_sound = list('sound/weapons/punch.wav')
var/list/clown_sound = list('sound/effects/clownstep1.ogg','sound/effects/clownstep2.ogg')
var/list/swing_hit_sound = list('sound/weapons/genhit1.wav', 'sound/weapons/genhit2.wav', 'sound/weapons/genhit3.wav', 'sound/weapons/genhit.wav',)
var/list/hiss_sound = list('sound/voice/hiss1.ogg','sound/voice/hiss2.ogg','sound/voice/hiss3.ogg','sound/voice/hiss4.ogg')
var/list/page_sound = list('sound/effects/pageturn1.ogg', 'sound/effects/pageturn2.ogg','sound/effects/pageturn3.ogg')
var/list/bullet_flyby_sound = list('sound/weapons/bullet-flyby1.wav','sound/weapons/bullet-flyby2.wav','sound/weapons/bullet-flyby3.wav','sound/weapons/bullet-flyby4.wav')
var/list/bullet_hit_body_sound = list('sound/weapons/bullet-hit.ogg')
var/list/bullet_hit_object_sound = list('sound/weapons/ric1.wav', 'sound/weapons/ric2.wav', 'sound/weapons/ric3.wav', 'sound/weapons/ric4.wav', 'sound/weapons/ric5.wav', 'sound/weapons/ric6.wav')
var/list/wood_step_sound = list('sound/effects/footsteps/wood1.wav', 'sound/effects/footsteps/wood2.wav', 'sound/effects/footsteps/wood3.wav', 'sound/effects/footsteps/wood4.wav','sound/effects/footsteps/wood5.wav', 'sound/effects/footsteps/wood6.wav')
var/list/snow_step_sound = list('sound/effects/footsteps/snow1.wav', 'sound/effects/footsteps/snow2.wav', 'sound/effects/footsteps/snow3.wav', 'sound/effects/footsteps/snow4.wav', 'sound/effects/footsteps/snow5.wav', 'sound/effects/footsteps/snow6.wav')
var/list/concrete_step_sound = list('sound/effects/footsteps/concrete1.wav', 'sound/effects/footsteps/concrete2.wav', 'sound/effects/footsteps/concrete3.wav', 'sound/effects/footsteps/concrete4.wav', 'sound/effects/footsteps/concrete5.wav', 'sound/effects/footsteps/concrete6.wav')
var/list/metal_step_sound = list('sound/effects/footsteps/metal1.wav', 'sound/effects/footsteps/metal2.wav', 'sound/effects/footsteps/metal3.wav', 'sound/effects/footsteps/metal4.wav')
var/list/bodysplat_sound = list('sound/effects/bodysplat.wav', 'sound/effects/bodysplat2.wav', 'sound/effects/bodysplat3.wav')
var/list/bonecrack_sound = list('sound/effects/bonebreak.wav', 'sound/effects/bonebreak2.wav')
var/list/punchmiss_sound = list('sound/effects/punchswing.wav', 'sound/effects/punchswing2.wav')
var/list/explosion_small_sound = list('sound/effects/Explosion_small1.ogg', 'sound/effects/Explosion_small2.ogg', 'sound/effects/Explosion_small3.ogg')

/proc/playsound(var/atom/source, soundin, vol as num, vary, extrarange as num, falloff, var/is_global)

	soundin = get_sfx(soundin) // same sound for everyone

	if(isarea(source))
		error("[source] is an area and is trying to make the sound: [soundin]")
		return

	var/frequency = get_rand_frequency() // Same frequency for everybody
	var/turf/turf_source = get_turf(source)

 	// Looping through the player list has the added bonus of working for mobs inside containers
	for (var/P in player_list)
		var/mob/M = P
		if(!M || !M.client)
			continue

		var/distance = get_dist(M, turf_source)
		if(distance <= (world.view + extrarange) * 3)
			var/turf/T = get_turf(M)

			if(T && T.z == turf_source.z)
				M.playsound_local(turf_source, soundin, vol, vary, frequency, falloff, is_global)

var/const/FALLOFF_SOUNDS = 0.5

/mob/proc/playsound_local(var/turf/turf_source, soundin, vol as num, vary, frequency, falloff, is_global)
	if(!src.client || ear_deaf > 0)	return
	var/sound/S = soundin
	if(!istype(S))
		soundin = get_sfx(soundin)
		S = sound(soundin)
		S.wait = 0 //No queue
		S.channel = 0 //Any channel
		S.volume = vol
		S.environment = -1
		if (vary)
			if(frequency)
				S.frequency = frequency
			else
				S.frequency = get_rand_frequency()

	//sound volume falloff with pressure
	var/pressure_factor = 1.0

	if(isturf(turf_source))
		// 3D sounds, the technology is here!
		var/turf/T = get_turf(src)

		//sound volume falloff with distance
		var/distance = get_dist(T, turf_source)

		S.volume -= max(distance - world.view, 0) * 2 //multiplicative falloff to add on top of natural audio falloff.

		var/datum/gas_mixture/hearer_env = T.return_air()
		var/datum/gas_mixture/source_env = turf_source.return_air()

		if (hearer_env && source_env)
			var/pressure = min(hearer_env.return_pressure(), source_env.return_pressure())

			if (pressure < ONE_ATMOSPHERE)
				pressure_factor = max((pressure - SOUND_MINIMUM_PRESSURE)/(ONE_ATMOSPHERE - SOUND_MINIMUM_PRESSURE), 0)
		else //in space
			pressure_factor = 0

		if (distance <= 1)
			pressure_factor = max(pressure_factor, 0.15)	//hearing through contact

		S.volume *= pressure_factor

		if (S.volume <= 0)
			return	//no volume means no sound

		var/dx = turf_source.x - T.x // Hearing from the right/left
		S.x = dx
		var/dz = turf_source.y - T.y // Hearing from infront/behind
		S.z = dz
		// The y value is for above your head, but there is no ceiling in 2d spessmens.
		S.y = 1
		S.falloff = (falloff ? falloff : FALLOFF_SOUNDS)

	if(!is_global)

		if(istype(src,/mob/living/))
			var/mob/living/M = src
			if (M.hallucination)
				S.environment = PSYCHOTIC
			else if (M.druggy)
				S.environment = DRUGGED
			else if (M.drowsyness)
				S.environment = DIZZY
			else if (M.confused)
				S.environment = DIZZY
			else if (M.sleeping)
				S.environment = UNDERWATER
			else if (pressure_factor < 0.5)
				S.environment = SPACE
			else
				var/area/A = get_area(src)
				S.environment = A.sound_env

		else if (pressure_factor < 0.5)
			S.environment = SPACE
		else
			var/area/A = get_area(src)
			S.environment = A.sound_env

	src << S

/client/proc/playtitlemusic()
	if(!ticker || !ticker.login_music)	return
	if(is_preference_enabled(/datum/client_preference/play_lobby_music))
		src << sound(ticker.login_music, repeat = 1, wait = 0, volume = 85, channel = 1) // MAD JAMS

/proc/get_rand_frequency()
	return rand(32000, 55000) //Frequency stuff only works with 45kbps oggs.

/proc/get_sfx(soundin)
	if(istext(soundin))
		switch(soundin)
			if ("shatter") soundin = pick(shatter_sound)
			if ("explosion") soundin = pick(explosion_sound)
			if ("sparks") soundin = pick(spark_sound)
			if ("explosion_small") soundin = pick(explosion_small_sound)
			if ("rustle") soundin = pick(rustle_sound)
			if ("flyby") soundin = pick(bullet_flyby_sound)
			if ("hit") soundin = pick(bullet_hit_body_sound)
			if ("hitobject") soundin = pick(bullet_hit_object_sound)
			if ("punch") soundin = pick(punch_sound)
			if ("clownstep") soundin = pick(clown_sound)
			if ("swing_hit") soundin = pick(swing_hit_sound)
			if ("hiss") soundin = pick(hiss_sound)
			if ("pageturn") soundin = pick(page_sound)
			if ("concrete") soundin = pick(concrete_step_sound)
			if ("snow") soundin = pick(snow_step_sound)
			if ("wood") soundin = pick(wood_step_sound)
			if ("metal") soundin = pick(metal_step_sound)
			if ("bodysplat") soundin = pick(bodysplat_sound)
			if ("bonebreak") soundin = pick(bonecrack_sound)
			if ("punchmiss") soundin = pick(punchmiss_sound)
			//if ("gunshot") soundin = pick(gun_sound)
	return soundin