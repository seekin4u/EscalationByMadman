//////////////////////////Pistols//////////////////////////

//Beretta M9

/obj/item/weapon/gun/projectile/berettam9
	name = "Beretta M9"
	desc = "That's the Italian-made pistol. Uses 9x19 ammo."
	icon_state = "berettam9"
	item_state = "gun"
	w_class = 2
	caliber = "9x19"
	fire_delay = 1
	jam_chance = 0.05
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a9x19
	allowed_magazines = /obj/item/ammo_magazine/a9x19
	fire_sound = 'sound/weapons/gunshot/m9.wav'
	unload_sound = 'sound/weapons/gunporn/pistol_magout.wav'
	reload_sound = 'sound/weapons/gunporn/pistol_magin.wav'
	cocked_sound = 'sound/weapons/gunporn/pistol_sliderelease.wav'

/obj/item/weapon/gun/projectile/berettam9/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "berettam9"
	else
		icon_state = "berettam9-empty"

//Makarov Pistol

/obj/item/weapon/gun/projectile/makarov
	name = "Makarov PM"
	desc = "That's Pistolet Makarova. Uses 9x18 ammo."
	icon_state = "makarov"
	item_state = "gun"
	w_class = 2
	jam_chance = 0.1
	caliber = "9x18"
	fire_delay = 1
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a9x18
	allowed_magazines = /obj/item/ammo_magazine/a9x18
	fire_sound = 'sound/weapons/gunshot/pm.ogg'
	unload_sound = 'sound/weapons/gunporn/pistol_magout.wav'
	reload_sound = 'sound/weapons/gunporn/pistol_magin.wav'
	cocked_sound = 'sound/weapons/gunporn/pistol_sliderelease.wav'


/obj/item/weapon/gun/projectile/makarov/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "makarov"
	else
		icon_state = "makarov-empty"

/obj/item/weapon/gun/projectile/waltherp38
	name = "Walther P1"
	desc = "That's the German-made pistol. Uses 9x19 Parabellum ammo."
	icon_state = "waltherp1"
	item_state = "gun"
	w_class = 2
	caliber = "9x19"
	fire_delay = 1
	jam_chance = 0.05
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a9x19s
	allowed_magazines = /obj/item/ammo_magazine/a9x19s
	fire_sound = 'sound/weapons/gunshot/aps.ogg'
	unload_sound = 'sound/weapons/gunporn/pistol_magout.wav'
	reload_sound = 'sound/weapons/gunporn/pistol_magin.wav'
	cocked_sound = 'sound/weapons/gunporn/pistol_sliderelease.wav'

/obj/item/weapon/gun/projectile/waltherp38/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "waltherp1"
	else
		icon_state = "waltherp1-empty"

//////////////////////////SMG's and carbines//////////////////////////

//AKS-74

/obj/item/weapon/gun/projectile/automatic/aks74
	name = "AKS-74"
	desc = "That's the standard-issue weapon of the Soviet paratroopers."
	icon_state = "aks74"
	item_state = "aks74"
	w_class = 4
	load_method = MAGAZINE
	caliber = "545x39"
	slot_flags = SLOT_BACK | SLOT_BELT
	ammo_type = /obj/item/ammo_casing/a545x39
	allowed_magazines = /obj/item/ammo_magazine/c545x39m
	requires_two_hands = 4
	accuracy = 1
	fire_delay = 2
	wielded_item_state = "aks74-wielded"
	fire_sound = 'sound/weapons/gunshot/ak74.ogg'
	unload_sound = 'sound/weapons/gunporn/ak74_magout.wav'
	reload_sound = 'sound/weapons/gunporn/ak74_magin.wav'
	cocked_sound = 'sound/weapons/gunporn/ak74_cock.wav'
	var/obj/item/weapon/material/knife/bayonet/bayonet6h4/knife = 0

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, requires_two_hands=2, burst_accuracy=null, dispersion=null),
		list(mode_name="short bursts", burst=3, fire_delay=null, move_delay=1,    requires_two_hands=3, burst_accuracy=list(1,0,-1),       dispersion=list(0.3, 0.6, 0.6)),
		list(mode_name="long bursts",   burst=5, fire_delay=null, move_delay=2,    requires_two_hands=4, burst_accuracy=list(1,0,0,-1,-2), dispersion=list(0.3, 0.6, 0.6, 1.2, 1.5)),
		)

/obj/item/weapon/gun/projectile/automatic/aks74/update_icon()
	..()
	update_held_icon()
	if(knife)
		var/image/I = image('icons/obj/gun.dmi',src,"6h4bayonet")
		I.pixel_x += 5
		I.pixel_y += 5
		overlays += I
	else
		overlays.Cut()

	if(istype(ammo_magazine, /obj/item/ammo_magazine/c545x39m/black))
		icon_state = "aks74b"
		wielded_item_state = "aks74-wielded"
		item_state = "aks74"
	else if(ammo_magazine)
		icon_state = "aks74"
		item_state = "aks74"
		wielded_item_state = "aks74-wielded"
	else
		icon_state = "aks74-empty"
		item_state = "aks74-empty"
		wielded_item_state = "aks74-wielded_empty"

/obj/item/weapon/gun/projectile/automatic/aks74/verb/removebnt(mob/user)
	set category = "Object"
	set name = "Remove bayonet"
	set popup_menu = 1

	if(knife)
		knife.loc = usr
		usr.put_in_hands(knife)
		knife = 0
		src.attack_verb = initial(attack_verb)
		src.sharp = initial(sharp)
		src.force = initial(force)
		user << "<span class='notice'>You remove bayonet from \the [src]!</span>"
		update_icon()

/obj/item/weapon/gun/projectile/automatic/vz58/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/material/knife/bayonet/bayonet6h4))
		knife = W
		user.drop_item()
		W.loc = src
		src.attack_verb = W.attack_verb
		src.sharp = W.sharp
		src.force = W.force
		user << "<span class='notice'>You add [knife.name] to \the [src]!</span>"
		update_icon()
	..()


/obj/item/weapon/gun/projectile/automatic/aks74/verb/ironsights()
	set category = "Object"
	set name = "Use iron sights"
	set popup_menu = 1

	toggle_scope(usr, 1.05)



/obj/item/weapon/gun/projectile/automatic/aks74u
	name = "AKS-74U"
	desc = "That's the standard-issue weapon of the Soviet military service staff."
	icon_state = "aks74u"
	item_state = "ak"
	w_class = 3
	load_method = MAGAZINE
	caliber = "545x39"
	slot_flags = SLOT_BACK | SLOT_BELT
	ammo_type = /obj/item/ammo_casing/a545x39
	allowed_magazines = /obj/item/ammo_magazine/c545x39m
	requires_two_hands = 2
	accuracy = 1
	fire_delay = 2
	burst_delay = 1.6
	wielded_item_state = "aks74u-wielded"
	fire_sound = 'sound/weapons/gunshot/aks74u.ogg'
	unload_sound = 'sound/weapons/gunporn/ak74_magout.wav'
	reload_sound = 'sound/weapons/gunporn/ak74_magin.wav'
	cocked_sound = 'sound/weapons/gunporn/ak74_cock.wav'

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, requires_two_hands=2, burst_accuracy=null, dispersion=null),
		list(mode_name="short bursts", burst=3, fire_delay=null, move_delay=1,    requires_two_hands=3, burst_accuracy=list(1,0,-1),       dispersion=list(0.3, 0.6, 0.6)),
		list(mode_name="long bursts",   burst=5, fire_delay=null, move_delay=2,    requires_two_hands=4, burst_accuracy=list(1,0,0,-1,-2), dispersion=list(0.3, 0.6, 0.6, 1.2, 1.5)),
		)

/obj/item/weapon/gun/projectile/automatic/aks74u/update_icon()
	..()
	if(istype(ammo_magazine, /obj/item/ammo_magazine/c545x39m/black))
		icon_state = "aks74ub"
		item_state = "aks74u"
		wielded_item_state = "aks74u-wielded"
	else if(ammo_magazine)
		icon_state = "aks74u"
		item_state = "aks74u"
		wielded_item_state = "aks74u-wielded"
	else
		icon_state = "aks74u-empty"
		item_state = "aks74u-empty"
		wielded_item_state = "aks74u-wielded_empty"

/obj/item/weapon/gun/projectile/automatic/aks74u/verb/ironsights()
	set category = "Object"
	set name = "Use iron sights"
	set popup_menu = 1

	toggle_scope(usr, 1.05)

//Colt Model 733

/obj/item/weapon/gun/projectile/automatic/coltmodel733
	name = "CAR-15"
	desc = "That's the short version of M16A1 used by US military."
	icon_state = "coltmodel733-m"
	item_state = "m16"
	w_class = 4
	jam_chance = 0.25
	load_method = MAGAZINE
	caliber = "556x45"
	slot_flags = SLOT_BACK | SLOT_BELT
	ammo_type = /obj/item/ammo_casing/a556x45
	allowed_magazines = list(/obj/item/ammo_magazine/c556x45m, /obj/item/ammo_magazine/c556x45s)
	requires_two_hands = 2
	accuracy = 1
	fire_delay = 2
	burst_delay = 1.6
	wielded_item_state = "m16-wielded"
	fire_sound = 'sound/weapons/gunshot/car15.ogg'
	unload_sound = 'sound/weapons/gunporn/m16_magout.wav'
	reload_sound = 'sound/weapons/gunporn/m16_magin.wav'
	cocked_sound = 'sound/weapons/gunporn/m16_chargeback.wav'

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, requires_two_hands=2, burst_accuracy=null, dispersion=null),
		list(mode_name="short bursts", burst=3, fire_delay=null, move_delay=1,    requires_two_hands=3, burst_accuracy=list(1,0,-1),       dispersion=list(0.3, 0.6, 0.6)),
		list(mode_name="long bursts",   burst=5, fire_delay=null, move_delay=2,    requires_two_hands=4, burst_accuracy=list(1,0,0,-1,-2), dispersion=list(0.3, 0.6, 0.6, 1.2, 1.5)),
		)

/obj/item/weapon/gun/projectile/automatic/coltmodel733/update_icon(var/ignore_inhands)
	..()
	if(istype(ammo_magazine,/obj/item/ammo_magazine/c556x45m))
		item_state = "m16"
		icon_state = "coltmodel733-m"
		wielded_item_state = "m16-wielded"
	else
		item_state = (ammo_magazine)? "m16" : "m16-empty"
		icon_state = (ammo_magazine)? "coltmodel733-s" : "coltmodel733-empty"
		wielded_item_state = (ammo_magazine)? "m16-wielded" : "m16-wielded_empty"
	if(!ignore_inhands) update_held_icon()

/obj/item/weapon/gun/projectile/automatic/coltmodel733/verb/ironsights()
	set category = "Object"
	set name = "Use iron sights"
	set popup_menu = 1

	toggle_scope(usr, 1.05)

//////////////////////////Rifles//////////////////////////

//M14

/obj/item/weapon/gun/projectile/automatic/m14
	name = "M14"
	desc = "That's the M14, an outdated service rifle used by USMC."
	icon_state = "m14"
	item_state = "m14"
	slot_flags = SLOT_BACK
	w_class = 5
	force = 10
	jam_chance = 0.33
	max_shells = 20
	caliber = "762x51"
	ammo_type = /obj/item/ammo_casing/a762x51
	load_method = MAGAZINE
	allowed_magazines = /obj/item/ammo_magazine/c762x51s
	requires_two_hands = 6
	accuracy = 3
	fire_delay = 2
	burst_delay = 1.6
	fire_sound = 'sound/weapons/gunshot/m14.wav'
	wielded_item_state = "m14-wielded"
	unload_sound = 'sound/weapons/gunporn/m14_magout.wav'
	reload_sound = 'sound/weapons/gunporn/m14_magin.wav'
	cocked_sound = 'sound/weapons/gunporn/m14_charge.wav'

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, requires_two_hands=3, burst_accuracy=null, dispersion=null),
		list(mode_name="short bursts",	burst=4, move_delay=8, requires_two_hands=8, burst_accuracy = list(0,-1,-3,-5,-7),          dispersion = list(1.0, 1.3, 1.6, 2.0, 2.2)),
		list(mode_name="long bursts",	burst=6, move_delay=10, requires_two_hands=9, burst_accuracy = list(0,-1,-3,-5,-7), dispersion = list(1.0, 1.3, 1.6, 2.0, 2.4)),
		)

/obj/item/weapon/gun/projectile/automatic/m14/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "m14"
		wielded_item_state = "m14-wielded"
		update_held_icon()
	else
		icon_state = "m14-empty"
		wielded_item_state = "m14-wielded_empty"
		update_held_icon()

/obj/item/weapon/gun/projectile/automatic/m14/verb/ironsights()
	set category = "Object"
	set name = "Use iron sights"
	set popup_menu = 1

	toggle_scope(usr, 1.05)


//////////////////////////Sniper Rifles//////////////////////////

//M21

/obj/item/weapon/gun/projectile/automatic/m14/scoped
	name = "M21"
	desc = "That's the M21, an marksman rifle used by USMC."
	icon_state = "m14scoped"
	item_state = "m14"
	jam_chance = 0.1
	fire_delay = 3
	accuracy = 3
	scoped_accuracy = 5
	requires_two_hands = 8
	wielded_item_state = "sniper_wielded"

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, requires_two_hands=3, burst_accuracy=null, dispersion=null),
		)

/obj/item/weapon/gun/projectile/automatic/m14/scoped/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "m14scoped"
	else
		icon_state = "m14scoped-empty"

/obj/item/weapon/gun/projectile/automatic/m14/scoped/attack_self(mob/user as mob)
	toggle_scope(usr, 2.2)


//SVD

/obj/item/weapon/gun/projectile/automatic/svd
	name = "SVD"
	desc = "That's the SVD, a standard-issue sniper rifle used by SA."
	icon_state = "svd"
	item_state = "m14"
	slot_flags = SLOT_BACK
	w_class = 5
	jam_chance = 0.1
	force = 10
	max_shells = 10
	caliber = "762x54"
	ammo_type = /obj/item/ammo_casing/a762x54
	load_method = MAGAZINE
	allowed_magazines = /obj/item/ammo_magazine/c762x54s
	requires_two_hands = 8
	accuracy = 4
	scoped_accuracy = 8
	fire_delay = 1
	fire_sound = 'sound/weapons/gunshot/svd.wav'
	wielded_item_state = "sniper_wielded"
	unload_sound = 'sound/weapons/gunporn/svd_magout.wav'
	reload_sound = 'sound/weapons/gunporn/svd_magin.wav'
	cocked_sound = 'sound/weapons/gunporn/svd_boltback.wav'

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, requires_two_hands=5, burst_accuracy=7, dispersion=null),
		)

/obj/item/weapon/gun/projectile/automatic/svd/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "svd"
	else
		icon_state = "svd-empty"

/obj/item/weapon/gun/projectile/automatic/svd/attack_self(mob/user as mob)
	toggle_scope(usr, 2.4)




//////////////////////////Assault Rifles//////////////////////////

//M16A1

/obj/item/weapon/gun/projectile/automatic/m16a1
	name = "M16A1"
	desc = "That's the standard-issue weapon of the USMC"
	icon_state = "m16a1-m"
	item_state = "m16"
	w_class = 5
	jam_chance = 0.6
	load_method = MAGAZINE
	caliber = "556x45"
	slot_flags = SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a556x45
	allowed_magazines = list(/obj/item/ammo_magazine/c556x45m, /obj/item/ammo_magazine/c556x45s)
	requires_two_hands = 6
	accuracy = 3
	burst_delay = 2
	fire_delay = 3
	wielded_item_state = "m16-wielded"
	fire_sound = 'sound/weapons/gunshot/m16.wav'
	unload_sound = 'sound/weapons/gunporn/m16_magout.wav'
	reload_sound = 'sound/weapons/gunporn/m16_magin.wav'
	cocked_sound = 'sound/weapons/gunporn/m16_chargeback.wav'
	var/obj/item/weapon/material/knife/bayonet/bayonetm9/knife = 0


	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, requires_two_hands=4, burst_accuracy=null, dispersion=null),
		list(mode_name="short bursts", burst=3, fire_delay=null, move_delay=1,    requires_two_hands=3, burst_accuracy=list(1,1,-1),       dispersion=list(0.3, 0.3, 0.6)),
		list(mode_name="long bursts",   burst=5, fire_delay=null, move_delay=2,    requires_two_hands=4, burst_accuracy=list(1,1,0,-1,-1), dispersion=list(0.3, 0.3, 0.6, 1.2, 1.5)),
		)

/obj/item/weapon/gun/projectile/automatic/m16a1/verb/removebnt(mob/user)
	set category = "Object"
	set name = "Remove bayonet"
	set popup_menu = 1

	if(knife)
		knife.loc = usr
		usr.put_in_hands(knife)
		knife = 0
		src.attack_verb = initial(attack_verb)
		src.sharp = initial(sharp)
		src.force = initial(force)
		user << "<span class='notice'>You remove bayonet from \the [src]!</span>"
		update_icon()

/obj/item/weapon/gun/projectile/automatic/m16a1/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/material/knife/bayonet/bayonetm9))
		knife = W
		user.drop_item()
		W.loc = src
		src.attack_verb = W.attack_verb
		src.sharp = W.sharp
		src.force = W.force
		user << "<span class='notice'>You add [knife.name] to \the [src]!</span>"
		update_icon()
	..()

/obj/item/weapon/gun/projectile/automatic/m16a1/update_icon(var/ignore_inhands)
	..()
	update_held_icon()
	if(knife)
		var/image/I = image('icons/obj/gun.dmi',src,"m9bayonet")
		I.pixel_x += 5
		I.pixel_y += 5
		overlays += I
	else
		overlays.Cut()
	if(istype(ammo_magazine,/obj/item/ammo_magazine/c556x45m))
		item_state = "m16"
		icon_state = "m16a1-m"
		wielded_item_state = "m16-wielded"
	else
		item_state = (ammo_magazine)? "m16" : "m16-empty"
		icon_state = (ammo_magazine)? "m16a1-s" : "m16a1-empty"
		wielded_item_state = (ammo_magazine)? "m16-wielded" : "m16-wielded_empty"
	if(!ignore_inhands) update_held_icon()

/obj/item/weapon/gun/projectile/automatic/m16a1/verb/ironsights()
	set category = "Object"
	set name = "Use iron sights"
	set popup_menu = 1

	toggle_scope(usr, 1.05)


//AK-74

/obj/item/weapon/gun/projectile/automatic/ak74
	name = "AK74"
	desc = "That's the standard-issue weapon of the Soviet infantry."
	icon_state = "ak74"
	item_state = "ak74"
	w_class = 5
	jam_chance = 0.15
	load_method = MAGAZINE
	caliber = "545x39"
	slot_flags = SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a545x39
	allowed_magazines = /obj/item/ammo_magazine/c545x39m
	requires_two_hands = 6
	accuracy = 2
	fire_delay = 3
	burst_delay = 2
	screen_shake = 1.5
	wielded_item_state = "ak74-wielded"
	fire_sound = 'sound/weapons/gunshot/ak74.ogg'
	unload_sound = 'sound/weapons/gunporn/ak74_magout.wav'
	reload_sound = 'sound/weapons/gunporn/ak74_magin.wav'
	cocked_sound = 'sound/weapons/gunporn/ak74_cock.wav'
	var/obj/item/weapon/material/knife/bayonet/bayonet6h4/knife = 0

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, requires_two_hands=4, burst_accuracy=null, dispersion=null),
		list(mode_name="short bursts", burst=3, fire_delay=null, move_delay=3,    requires_two_hands=5, burst_accuracy=list(1,1,0),       dispersion=list(0.0, 0.3, 0.6)),
		list(mode_name="long bursts",   burst=5, fire_delay=null, move_delay=4,    requires_two_hands=6, burst_accuracy=list(1,1,0,-1,-2), dispersion=list(0.3, 0.3, 0.6, 1.2, 1.5)),
		)

/obj/item/weapon/gun/projectile/automatic/ak74/update_icon()
	..()
	update_held_icon()
	if(knife)
		var/image/I = image('icons/obj/gun.dmi',src,"6h4bayonet")
		I.pixel_x += 5
		I.pixel_y += 5
		overlays += I
	else
		overlays.Cut()

	if(istype(ammo_magazine, /obj/item/ammo_magazine/c545x39m/black))
		icon_state = "ak74b"
		wielded_item_state = "ak74-wielded"
		item_state = "ak74"
	else if(ammo_magazine)
		wielded_item_state = "ak74-wielded"
		icon_state = "ak74"
		item_state = "ak74"
	else
		icon_state = "ak74-empty"
		item_state = "ak74-empty"
		wielded_item_state = "ak74-wielded_empty"

/obj/item/weapon/gun/projectile/automatic/ak74/verb/removebnt(mob/user)
	set category = "Object"
	set name = "Remove bayonet"
	set popup_menu = 1

	if(knife)
		knife.loc = usr
		usr.put_in_hands(knife)
		knife = 0
		src.attack_verb = initial(attack_verb)
		src.sharp = initial(sharp)
		src.force = initial(force)
		user << "<span class='notice'>You remove bayonet from \the [src]!</span>"
		update_icon()

/obj/item/weapon/gun/projectile/automatic/ak74/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/material/knife/bayonet/bayonet6h4))
		knife = W
		user.drop_item()
		W.loc = src
		src.attack_verb = W.attack_verb
		src.sharp = W.sharp
		src.force = W.force
		user << "<span class='notice'>You add [knife.name] to \the [src]!</span>"
		update_icon()
	..()

/obj/item/weapon/gun/projectile/automatic/ak74/verb/ironsights()
	set category = "Object"
	set name = "Use iron sights"
	set popup_menu = 1

	toggle_scope(usr, 1.05)

//M16A2

/obj/item/weapon/gun/projectile/automatic/m16a2
	name = "M16A2"
	desc = "That's the standard-issue weapon of the USMC"
	icon_state = "m16a2-m"
	item_state = "m16"
	w_class = 5
	jam_chance = 0.3
	load_method = MAGAZINE
	caliber = "556x45"
	slot_flags = SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a556x45
	allowed_magazines = list(/obj/item/ammo_magazine/c556x45m, /obj/item/ammo_magazine/c556x45s)
	requires_two_hands = 5
	accuracy = 2
	fire_delay = 3
	burst_delay = 2.8
	screen_shake = 1
	wielded_item_state = "m16-wielded"
	fire_sound = 'sound/weapons/gunshot/m16.wav'
	unload_sound = 'sound/weapons/gunporn/m16_magout.wav'
	reload_sound = 'sound/weapons/gunporn/m16_magin.wav'
	cocked_sound = 'sound/weapons/gunporn/m16_chargeback.wav'
	var/obj/item/weapon/material/knife/bayonet/bayonetm9/knife = 0

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, requires_two_hands=4, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=3,    requires_two_hands=5, burst_accuracy=list(3,2,1),       dispersion=list(0.0, 0.0, 0.3)),
		)


	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, requires_two_hands=4, burst_accuracy=null, dispersion=null),
		list(mode_name="short bursts", burst=3, fire_delay=null, move_delay=1,    requires_two_hands=3, burst_accuracy=list(1,1,-1),       dispersion=list(0.3, 0.3, 0.6)),
		list(mode_name="long bursts",   burst=5, fire_delay=null, move_delay=2,    requires_two_hands=4, burst_accuracy=list(1,1,0,-1,-1), dispersion=list(0.3, 0.3, 0.6, 1.2, 1.5)),
		)

/obj/item/weapon/gun/projectile/automatic/m16a2/verb/removebnt(mob/user)
	set category = "Object"
	set name = "Remove bayonet"
	set popup_menu = 1

	if(knife)
		knife.loc = usr
		usr.put_in_hands(knife)
		knife = 0
		src.attack_verb = initial(attack_verb)
		src.sharp = initial(sharp)
		src.force = initial(force)
		user << "<span class='notice'>You remove bayonet from \the [src]!</span>"
		update_icon()

/obj/item/weapon/gun/projectile/automatic/m16a2/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/material/knife/bayonet/bayonetm9))
		knife = W
		user.drop_item()
		W.loc = src
		src.attack_verb = W.attack_verb
		src.sharp = W.sharp
		src.force = W.force
		user << "<span class='notice'>You add [knife.name] to \the [src]!</span>"
		update_icon()
	..()

/obj/item/weapon/gun/projectile/automatic/m16a2/update_icon(var/ignore_inhands)
	..()
	update_held_icon()
	if(knife)
		var/image/I = image('icons/obj/gun.dmi',src,"m9bayonet")
		I.pixel_x += 5
		I.pixel_y += 5
		overlays += I

	if(istype(ammo_magazine,/obj/item/ammo_magazine/c556x45m))
		item_state = "m16"
		icon_state = "m16a2-m"
		wielded_item_state = "m16-wielded"
	else
		item_state = (ammo_magazine)? "m16" : "m16-empty"
		icon_state = (ammo_magazine)? "m16a1-s" : "m16a2-empty"
		wielded_item_state = (ammo_magazine)? "m16-wielded" : "m16-wielded_empty"
	if(!ignore_inhands) update_held_icon()

/obj/item/weapon/gun/projectile/automatic/m16a2/verb/ironsights()
	set category = "Object"
	set name = "Use iron sights"
	set popup_menu = 1

	toggle_scope(usr, 1.05)

//G3

/obj/item/weapon/gun/projectile/automatic/g3a2
	name = "G3A3"
	desc = "That's the standard-issue weapon of the Bundeswehr."
	icon_state = "g3a2"
	item_state = "g3a2"
	w_class = 5
	jam_chance = 0.2
	caliber = "762x51"
	slot_flags = SLOT_BACK
	screen_shake = 2
	ammo_type = /obj/item/ammo_casing/a762x51
	load_method = MAGAZINE
	allowed_magazines = /obj/item/ammo_magazine/c762x51s
	requires_two_hands = 6
	accuracy = 3
	fire_delay = 2
	burst_delay = 1.6
	fire_sound = 'sound/weapons/gunshot/g3.ogg'
	wielded_item_state = "g3a2-wielded"
	unload_sound = 'sound/weapons/gunporn/m14_magout.wav'
	reload_sound = 'sound/weapons/gunporn/m14_magin.wav'
	cocked_sound = 'sound/weapons/gunporn/m14_charge.wav'
	var/obj/item/weapon/material/knife/bayonet/bayonetbundeswehr/knife = 0
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, requires_two_hands=4, burst_accuracy=null, dispersion=null),
		list(mode_name="short bursts", burst=3, fire_delay=null, move_delay=3,    requires_two_hands=5, burst_accuracy=list(2,1.5,0),       dispersion=list(0.0, 0.3, 0.3)),
		list(mode_name="long bursts",   burst=5, fire_delay=null, move_delay=4,    requires_two_hands=6, burst_accuracy=list(2,1.5,1.5,0,-1), dispersion=list(0.0, 0.3, 0.3, 0.6, 1.2)),
		)

/obj/item/weapon/gun/projectile/automatic/g3a2/update_icon()
	..()
	update_held_icon()
	if(knife)
		var/image/I = image('icons/obj/gun.dmi',src,"g3bayonet")
		I.pixel_x += 5
		I.pixel_y += 5
		overlays += I
	else
		overlays.Cut()
	if(ammo_magazine)
		icon_state = "g3a2"
		icon_state = "g3a2"
		wielded_item_state = "g3a2-wielded"
	else
		icon_state = "g3a2-empty"
		wielded_item_state = "g3a2-wielded-empty"
		icon_state = "g3a2-empty"

/obj/item/weapon/gun/projectile/automatic/g3a2/verb/removebnt(mob/user)
	set category = "Object"
	set name = "Remove bayonet"
	set popup_menu = 1

	if(knife)
		knife.loc = usr
		usr.put_in_hands(knife)
		knife = 0
		src.attack_verb = initial(attack_verb)
		src.sharp = initial(sharp)
		src.force = initial(force)
		user << "<span class='notice'>You remove bayonet from \the [src]!</span>"
		update_icon()

/obj/item/weapon/gun/projectile/automatic/g3a2/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/material/knife/bayonet/bayonetbundeswehr))
		knife = W
		user.drop_item()
		W.loc = src
		src.attack_verb = W.attack_verb
		src.sharp = W.sharp
		src.force = W.force
		user << "<span class='notice'>You add [knife.name] to \the [src]!</span>"
		update_icon()
	..()

/obj/item/weapon/gun/projectile/automatic/g3a2/verb/ironsights()
	set category = "Object"
	set name = "Use iron sights"
	set popup_menu = 1

	toggle_scope(usr, 1.05)

/obj/item/weapon/gun/projectile/automatic/g3a2/scoped
	name = "G3A3 ZF"
	desc = "That's the standard-issue weapon of the Bundeswehr."
	icon_state = "g3a2marksman"
	item_state = "g3a2_scoped"
	wielded_item_state = "g3a2_scoped-wielded"
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, requires_two_hands=4, burst_accuracy=null, dispersion=null),
		)


/obj/item/weapon/gun/projectile/automatic/g3a2/scoped/update_icon()
	..()
	update_held_icon()
	if(ammo_magazine)
		icon_state = "g3a2marksman"
		wielded_item_state = "g3a2_scoped-wielded"
		item_state = "g3a2_scoped"

	else
		icon_state = "g3a2marksman_empty"
		wielded_item_state = "g3a2_scoped-wielded-empty"
		item_state = "g3a2_scoped-empty"

/obj/item/weapon/gun/projectile/automatic/g3a2/scoped/attack_self(mob/user as mob)
	toggle_scope(usr, 2.2)


//////////////////////////Squad Assault Weapons//////////////////////////


/obj/item/weapon/gun/projectile/automatic/rpk74
	name = "RPK74"
	desc = "That's the Ruchnoi Pulemet Kalashnikova, a standard-issue squad assault weapon of the Soviet Infantry."
	icon_state = "rpk74"
	item_state = "ak74"
	jam_chance = 0.1
	slot_flags = SLOT_BACK
	w_class = 5
	force = 10
	max_shells = 45
	caliber = "545x39"
	ammo_type = /obj/item/ammo_casing/a545x39
	load_method = MAGAZINE
	allowed_magazines = list(/obj/item/ammo_magazine/c545x39r)
	requires_two_hands = 8
	screen_shake = 1.3
	accuracy = 3
	bipod = 1
	burst_delay = 2
	fire_delay = 3
	wielded_item_state = "rpk74-wielded"
	fire_sound = 'sound/weapons/gunshot/rpk74.ogg'
	unload_sound = 'sound/weapons/gunporn/ak74_magout.wav'
	reload_sound = 'sound/weapons/gunporn/ak74_magin.wav'
	cocked_sound = 'sound/weapons/gunporn/ak74_cock.wav'


	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, requires_two_hands=2, burst_accuracy=null, dispersion=null),
		list(mode_name="short bursts",	burst=4, move_delay=8, requires_two_hands=8, burst_accuracy = list(1,1,1,0,-1),          dispersion = list(0.3, 0.3, 0.6, 0.6)),
		list(mode_name="long bursts",	burst=7, move_delay=10, requires_two_hands=9, burst_accuracy = list(1,1,0,0,0,-1,-2,-3), dispersion = list(0.3, 0.3, 0.6, 0.9, 0.9, 0.9, 0.9)),
		)

/obj/item/weapon/gun/projectile/automatic/rpk74/update_icon(var/ignore_inhands)
	..()
	if(istype(ammo_magazine,/obj/item/ammo_magazine/c545x39r))
		icon_state = "rpk74"
		wielded_item_state = "rpk74-wielded"
		item_state = "ak74"

	else
		icon_state = "rpk74-empty"
		wielded_item_state = "rpk74-wielded_empty"
		item_state = "ak74-empty"
	if(!ignore_inhands) update_held_icon()

/obj/item/weapon/gun/projectile/automatic/rpk74/verb/ironsights()
	set category = "Object"
	set name = "Use iron sights"
	set popup_menu = 1

	toggle_scope(usr, 1.05)

/obj/item/weapon/gun/projectile/automatic/pkm
	name = "PKM"
	desc = "That's the standard-issue HMG used by Soviet Army."
	icon_state = "pkm"
	item_state = "lmg"
	w_class = 5
	force = 15
	jam_chance = 0.2
	slot_flags = SLOT_BACK
	max_shells = 200
	caliber = "762x54"
	screen_shake = 2.3
	bipod = 1
	burst_delay = 3
	ammo_type = /obj/item/ammo_casing/a762x54
	load_method = MAGAZINE
	allowed_magazines = /obj/item/ammo_magazine/c762x54b
	requires_two_hands = 9
	wielded_item_state = "pkm-wielded"
	fire_sound = 'sound/weapons/gunshot/pkm.ogg'
	unload_sound = 'sound/weapons/gunporn/m249_boxremove.wav'
	reload_sound = 'sound/weapons/gunporn/m249_boxinsert.wav'
	cocked_sound = 'sound/weapons/gunporn/m249_charge.wav'

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, requires_two_hands=2, burst_accuracy=null, dispersion=null),
		list(mode_name="short bursts",	burst=4, move_delay=8, requires_two_hands=8, burst_accuracy = list(1,1,1,0,-1),          dispersion = list(0.3, 0.3, 0.6, 0.6)),
		list(mode_name="long bursts",	burst=7, move_delay=10, requires_two_hands=9, burst_accuracy = list(1,1,0,0,0,-1,-2,-3), dispersion = list(0.3, 0.3, 0.6, 0.9, 0.9, 0.9, 0.9)),
		)

	var/cover_open = 0


/obj/item/weapon/gun/projectile/automatic/pkm/special_check(mob/user)
	if(cover_open)
		user << "<span class='warning'>[src]'s cover is open! Close it before firing!</span>"
		return 0
	return ..()

/obj/item/weapon/gun/projectile/automatic/pkm/proc/toggle_cover(mob/user)
	cover_open = !cover_open
	user << "<span class='notice'>You [cover_open ? "open" : "close"] [src]'s cover.</span>"
	update_icon()

/obj/item/weapon/gun/projectile/automatic/pkm/attack_self(mob/user as mob)
	if(cover_open)
		toggle_cover(user) //close the cover
		playsound(user, 'sound/weapons/gunporn/m249_close.wav', 100, 1)
	else
		return ..() //once closed, behave like normal

/obj/item/weapon/gun/projectile/automatic/pkm/attack_hand(mob/user as mob)
	if(!cover_open && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
		playsound(user, 'sound/weapons/gunporn/m249_open.wav', 100, 1)
	else
		return ..() //once open, behave like normal

/obj/item/weapon/gun/projectile/automatic/pkm/load_ammo(var/obj/item/A, mob/user)
	if(!cover_open)
		user << "<span class='warning'>You need to open the cover to load that into [src].</span>"
		return
	..()

/obj/item/weapon/gun/projectile/automatic/pkm/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_open)
		user << "<span class='warning'>You need to open the cover to unload [src].</span>"
		return
	..()

/obj/item/weapon/gun/projectile/automatic/pkm/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "pkm"
		wielded_item_state = "pkm-wielded"
	else
		icon_state = "pkm-empty"
		wielded_item_state = "pkm-wielded_empty"


/obj/item/weapon/gun/projectile/automatic/pkm/verb/ironsights()
	set category = "Object"
	set name = "Use iron sights"
	set popup_menu = 1

	toggle_scope(usr, 1.05)

/obj/item/weapon/gun/projectile/automatic/m60e1
	name = "M60E1"
	desc = "That's the standard-issue LMG used by USMC. Also known as 'Pig'."
	icon_state = "m60e1"
	item_state = "lmg"
	w_class = 5
	force = 15
	jam_chance = 0.2
	bipod = 1
	slot_flags = SLOT_BACK
	max_shells = 100
	caliber = "762x51"
	burst_delay = 3
	screen_shake = 2.0
	ammo_type = /obj/item/ammo_casing/a762x51
	load_method = MAGAZINE
	allowed_magazines = /obj/item/ammo_magazine/c762x51b
	requires_two_hands = 12
	fire_sound = 'sound/weapons/gunshot/m60.wav'
	wielded_item_state = "lmg-wielded"
	unload_sound = 'sound/weapons/gunporn/m249_boxremove.wav'
	reload_sound = 'sound/weapons/gunporn/m249_boxinsert.wav'
	cocked_sound = 'sound/weapons/gunporn/m249_charge.wav'

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, requires_two_hands=2, burst_accuracy=null, dispersion=null),
		list(mode_name="short bursts",	burst=4, move_delay=8, requires_two_hands=8, burst_accuracy = list(1,1,1,0,-1),          dispersion = list(0.3, 0.3, 0.6, 0.6)),
		list(mode_name="long bursts",	burst=7, move_delay=10, requires_two_hands=9, burst_accuracy = list(1,1,0,0,0,-1,-2,-3), dispersion = list(0.3, 0.3, 0.6, 0.9, 0.9, 0.9, 0.9)),
		)


	var/cover_open = 0


/obj/item/weapon/gun/projectile/automatic/m60e1/special_check(mob/user)
	if(cover_open)
		user << "<span class='warning'>[src]'s cover is open! Close it before firing!</span>"
		return 0
	return ..()

/obj/item/weapon/gun/projectile/automatic/m60e1/proc/toggle_cover(mob/user)
	cover_open = !cover_open
	user << "<span class='notice'>You [cover_open ? "open" : "close"] [src]'s cover.</span>"
	update_icon()

/obj/item/weapon/gun/projectile/automatic/m60e1/attack_self(mob/user as mob)
	if(cover_open)
		toggle_cover(user) //close the cover
		playsound(user, 'sound/weapons/gunporn/m249_close.wav', 100, 1)
	else
		return ..() //once closed, behave like normal

/obj/item/weapon/gun/projectile/automatic/m60e1/attack_hand(mob/user as mob)
	if(!cover_open && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
		playsound(user, 'sound/weapons/gunporn/m249_open.wav', 100, 1)
	else
		return ..() //once open, behave like normal

/obj/item/weapon/gun/projectile/automatic/m60e1/load_ammo(var/obj/item/A, mob/user)
	if(!cover_open)
		user << "<span class='warning'>You need to open the cover to load that into [src].</span>"
		return
	..()

/obj/item/weapon/gun/projectile/automatic/m60e1/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_open)
		user << "<span class='warning'>You need to open the cover to unload [src].</span>"
		return
	..()

/obj/item/weapon/gun/projectile/automatic/m60e1/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "m60e1"
	else
		icon_state = "m60e1-empty"

/obj/item/weapon/gun/projectile/automatic/m60e1/verb/ironsights()
	set category = "Object"
	set name = "Use iron sights"
	set popup_menu = 1

	toggle_scope(usr, 1.05)

/obj/item/weapon/gun/projectile/automatic/vz59
	name = "Vz.59"
	desc = "That's the standard-issue HMG used by CSLA."
	icon_state = "vz59"
	item_state = "lmg"
	w_class = 5
	force = 15
	jam_chance = 0.2
	slot_flags = SLOT_BACK
	bipod = 1
	max_shells = 200
	caliber = "762x54"
	screen_shake = 2.3
	fire_sound = 'sound/weapons/gunshot/pkm.ogg'
	burst_delay = 3
	ammo_type = /obj/item/ammo_casing/a762x54
	load_method = MAGAZINE
	allowed_magazines = /obj/item/ammo_magazine/c762x54b
	requires_two_hands = 9
	wielded_item_state = "pkm-wielded"
	unload_sound = 'sound/weapons/gunporn/m249_boxremove.wav'
	reload_sound = 'sound/weapons/gunporn/m249_boxinsert.wav'
	cocked_sound = 'sound/weapons/gunporn/m249_charge.wav'

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, requires_two_hands=2, burst_accuracy=null, dispersion=null),
		list(mode_name="short bursts",	burst=4, move_delay=8, requires_two_hands=8, burst_accuracy = list(1,1,1,0,-1),          dispersion = list(0.3, 0.3, 0.6, 0.6)),
		list(mode_name="long bursts",	burst=7, move_delay=10, requires_two_hands=9, burst_accuracy = list(1,1,0,0,0,-1,-2,-3), dispersion = list(0.3, 0.3, 0.6, 0.9, 0.9, 0.9, 0.9)),
		)


	var/cover_open = 0


/obj/item/weapon/gun/projectile/automatic/vz59/special_check(mob/user)
	if(cover_open)
		user << "<span class='warning'>[src]'s cover is open! Close it before firing!</span>"
		return 0
	return ..()

/obj/item/weapon/gun/projectile/automatic/vz59/proc/toggle_cover(mob/user)
	cover_open = !cover_open
	user << "<span class='notice'>You [cover_open ? "open" : "close"] [src]'s cover.</span>"
	update_icon()

/obj/item/weapon/gun/projectile/automatic/vz59/attack_self(mob/user as mob)
	if(cover_open)
		toggle_cover(user) //close the cover
		playsound(user, 'sound/weapons/gunporn/m249_close.wav', 100, 1)
	else
		return ..() //once closed, behave like normal

/obj/item/weapon/gun/projectile/automatic/vz59/attack_hand(mob/user as mob)
	if(!cover_open && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
		playsound(user, 'sound/weapons/gunporn/m249_open.wav', 100, 1)
	else
		return ..() //once open, behave like normal

/obj/item/weapon/gun/projectile/automatic/vz59/load_ammo(var/obj/item/A, mob/user)
	if(!cover_open)
		user << "<span class='warning'>You need to open the cover to load that into [src].</span>"
		return
	..()

/obj/item/weapon/gun/projectile/automatic/vz59/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_open)
		user << "<span class='warning'>You need to open the cover to unload [src].</span>"
		return
	..()

/obj/item/weapon/gun/projectile/automatic/vz59/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "vz59"
		wielded_item_state = "pkm-wielded"
	else
		icon_state = "vz59-empty"
		wielded_item_state = "pkm-wielded_empty"


/obj/item/weapon/gun/projectile/automatic/vz59/verb/ironsights()
	set category = "Object"
	set name = "Use iron sights"
	set popup_menu = 1

	toggle_scope(usr, 1.05)

/obj/item/weapon/gun/projectile/automatic/mg3
	name = "MG3"
	desc = "That's the standard-issue LMG used by Bundeswehr."
	icon_state = "mg3"
	item_state = "lmg"
	w_class = 5
	force = 15
	jam_chance = 0.2
	bipod = 1
	slot_flags = SLOT_BACK
	max_shells = 100
	caliber = "762x51"
	burst_delay = 3
	screen_shake = 1.5
	fire_sound = 'sound/weapons/gunshot/mg3.ogg'
	ammo_type = /obj/item/ammo_casing/a762x51
	load_method = MAGAZINE
	allowed_magazines = /obj/item/ammo_magazine/c762x51b
	requires_two_hands = 12
	wielded_item_state = "lmg-wielded"
	unload_sound = 'sound/weapons/gunporn/m249_boxremove.wav'
	reload_sound = 'sound/weapons/gunporn/m249_boxinsert.wav'
	cocked_sound = 'sound/weapons/gunporn/m249_charge.wav'

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, requires_two_hands=2, burst_accuracy=null, dispersion=null),
		list(mode_name="short bursts",	burst=4, move_delay=8, requires_two_hands=8, burst_accuracy = list(1,1,1,0,-1),          dispersion = list(0.3, 0.3, 0.6, 0.6)),
		list(mode_name="long bursts",	burst=7, move_delay=10, requires_two_hands=9, burst_accuracy = list(1,1,0,0,0,-1,-2,-3), dispersion = list(0.3, 0.3, 0.6, 0.9, 0.9, 0.9, 0.9)),
		)

	var/cover_open = 0


/obj/item/weapon/gun/projectile/automatic/mg3/special_check(mob/user)
	if(cover_open)
		user << "<span class='warning'>[src]'s cover is open! Close it before firing!</span>"
		return 0
	return ..()

/obj/item/weapon/gun/projectile/automatic/mg3/proc/toggle_cover(mob/user)
	cover_open = !cover_open
	user << "<span class='notice'>You [cover_open ? "open" : "close"] [src]'s cover.</span>"
	update_icon()

/obj/item/weapon/gun/projectile/automatic/mg3/attack_self(mob/user as mob)
	if(cover_open)
		toggle_cover(user) //close the cover
		playsound(user, 'sound/weapons/gunporn/m249_close.wav', 100, 1)
	else
		return ..() //once closed, behave like normal

/obj/item/weapon/gun/projectile/automatic/mg3/attack_hand(mob/user as mob)
	if(!cover_open && user.get_inactive_hand() == src)
		toggle_cover(user) //open the cover
		playsound(user, 'sound/weapons/gunporn/m249_open.wav', 100, 1)
	else
		return ..() //once open, behave like normal

/obj/item/weapon/gun/projectile/automatic/mg3/load_ammo(var/obj/item/A, mob/user)
	if(!cover_open)
		user << "<span class='warning'>You need to open the cover to load that into [src].</span>"
		return
	..()

/obj/item/weapon/gun/projectile/automatic/mg3/unload_ammo(mob/user, var/allow_dump=1)
	if(!cover_open)
		user << "<span class='warning'>You need to open the cover to unload [src].</span>"
		return
	..()

/obj/item/weapon/gun/projectile/automatic/mg3/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "mg3"
	else
		icon_state = "mg3-empty"

/obj/item/weapon/gun/projectile/automatic/mg3/verb/ironsights()
	set category = "Object"
	set name = "Use iron sights"
	set popup_menu = 1

	toggle_scope(usr, 1.2)

//////////////////////////AR's with grenade launchers//////////////////////////

/obj/item/weapon/gun/projectile/automatic/m16a1gl
	name = "M16A1 w/ M203"
	desc = "That's the M16A1, a standard-issue weapon used by US army. Has a M203 grenade launcher attached to it"
	icon_state = "m16a2-gl-m"
	item_state = "m16"
	w_class = 5
	force = 10
	jam_chance = 0.5
	caliber = "556x45"
	ammo_type = /obj/item/ammo_casing/a556x45
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	allowed_magazines = list(/obj/item/ammo_magazine/c556x45m, /obj/item/ammo_magazine/c556x45s)
	requires_two_hands = 7
	burst_delay = 2
	screen_shake = 1
	fire_sound = 'sound/weapons/gunshot/m16.wav'
	unload_sound = 'sound/weapons/gunporn/m16_magout.wav'
	reload_sound = 'sound/weapons/gunporn/m16_magin.wav'
	cocked_sound = 'sound/weapons/gunporn/m16_chargeback.wav'
	wielded_item_state = "m16-wielded"
	firemodes = list(
		list(mode_name="semiauto",       burst=1,    fire_delay=0,    move_delay=null, use_launcher=null, requires_two_hands=5, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3,    fire_delay=null, move_delay=6,    use_launcher=null, requires_two_hands=6, burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="fire grenades",  burst=null, fire_delay=null, move_delay=null, use_launcher=1,    requires_two_hands=5, burst_accuracy=null, dispersion=null)
		)

	var/use_launcher = 0
	var/obj/item/weapon/gun/launcher/grenade/underslung/m203/launcher

/obj/item/weapon/gun/projectile/automatic/m16a1gl/New()
	..()
	launcher = new(src)

/obj/item/weapon/gun/projectile/automatic/m16a1gl/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))
		launcher.load(I, user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/m16a1gl/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		launcher.unload(user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/m16a1gl/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
	else
		..()

/obj/item/weapon/gun/projectile/automatic/m16a1gl/update_icon(var/ignore_inhands)
	..()
	if(istype(ammo_magazine,/obj/item/ammo_magazine/c556x45m))
		icon_state = "m16a2-gl-m"
	else
		icon_state = (ammo_magazine)? "m16a2-gl-s" : "m16a2-gl-empty"
	if(!ignore_inhands) update_held_icon()

/obj/item/weapon/gun/projectile/automatic/m16a1gl/examine(mob/user)
	..()
	if(launcher.chambered)
		user << "\The [launcher] has \a [launcher.chambered] loaded."
	else
		user << "\The [launcher] is empty."

/obj/item/weapon/gun/projectile/automatic/m16a1gl/verb/ironsights()
	set category = "Object"
	set name = "Use iron sights"
	set popup_menu = 1

	toggle_scope(usr, 1.05)

/obj/item/weapon/gun/projectile/automatic/ak74gl
	name = "AK-74 w/ GP-25"
	desc = "That's the AK-74, a standard-issue weapon used by Soviet army. Has a GP-25 'Kostyor' grenade launcher attached to it"
	icon_state = "ak74-gl"
	item_state = "ak"
	w_class = 5
	force = 10
	jam_chance = 0.2
	caliber = "545x39"
	ammo_type = /obj/item/ammo_casing/a545x39
	slot_flags = SLOT_BACK
	load_method = MAGAZINE
	allowed_magazines = /obj/item/ammo_magazine/c545x39m
	requires_two_hands = 7
	burst_delay = 1.5
	screen_shake = 2
	wielded_item_state = "ak-wielded"
	fire_sound = 'sound/weapons/gunshot/ak74.ogg'
	unload_sound = 'sound/weapons/gunporn/ak74_magout.wav'
	reload_sound = 'sound/weapons/gunporn/ak74_magin.wav'
	cocked_sound = 'sound/weapons/gunporn/ak74_cock.wav'
	firemodes = list(
		list(mode_name="semiauto",       burst=1,    fire_delay=0,    move_delay=null, use_launcher=null, requires_two_hands=5, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3,    fire_delay=null, move_delay=6,    use_launcher=null, requires_two_hands=6, burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="fire grenades",  burst=null, fire_delay=null, move_delay=null, use_launcher=1,    requires_two_hands=5, burst_accuracy=null, dispersion=null)
		)

	var/use_launcher = 0
	var/obj/item/weapon/gun/launcher/grenade/underslung/gp25/launcher
	var/obj/item/weapon/material/knife/bayonet/bayonet6h4/knife = 0

/obj/item/weapon/gun/projectile/automatic/ak74gl/New()
	..()
	launcher = new(src)

/obj/item/weapon/gun/projectile/automatic/ak74gl/attackby(obj/item/I, mob/user)
	if((istype(I, /obj/item/weapon/grenade)))
		launcher.load(I, user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/ak74gl/attack_hand(mob/user)
	if(user.get_inactive_hand() == src && use_launcher)
		launcher.unload(user)
	else
		..()

/obj/item/weapon/gun/projectile/automatic/ak74gl/Fire(atom/target, mob/living/user, params, pointblank=0, reflex=0)
	if(use_launcher)
		launcher.Fire(target, user, params, pointblank, reflex)
		if(!launcher.chambered)
			switch_firemodes() //switch back automatically
	else
		..()

/obj/item/weapon/gun/projectile/automatic/ak74gl/update_icon()
	..()
	update_held_icon()
	if(knife)
		var/image/I = image('icons/obj/gun.dmi',src,"6h4bayonet")
		I.pixel_x += 5
		I.pixel_y += 5
		overlays += I
	else
		overlays.Cut()

	if(istype(ammo_magazine, /obj/item/ammo_magazine/c545x39m/black))
		icon_state = "ak74-glb"
		wielded_item_state = "ak74-wielded"
	else if(ammo_magazine)
		wielded_item_state = "ak74-wielded"
		icon_state = "ak74-gl"
	else
		icon_state = "ak74-gl-empty"
		wielded_item_state = "ak74-wielded_empty"

/obj/item/weapon/gun/projectile/automatic/ak74gl/verb/removebnt(mob/user)
	set category = "Object"
	set name = "Remove bayonet"
	set popup_menu = 1

	if(knife)
		knife.loc = usr
		usr.put_in_hands(knife)
		knife = 0
		src.attack_verb = initial(attack_verb)
		src.sharp = initial(sharp)
		src.force = initial(force)
		user << "<span class='notice'>You remove bayonet from \the [src]!</span>"
		update_icon()

/obj/item/weapon/gun/projectile/automatic/ak74gl/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/material/knife/bayonet/bayonet6h4))
		knife = W
		user.drop_item()
		W.loc = src
		src.attack_verb = W.attack_verb
		src.sharp = W.sharp
		src.force = W.force
		user << "<span class='notice'>You add [knife.name] to \the [src]!</span>"
		update_icon()
	..()


/obj/item/weapon/gun/projectile/automatic/ak74gl/examine(mob/user)
	..()
	if(launcher.chambered)
		user << "\The [launcher] has \a [launcher.chambered] loaded."
	else
		user << "\The [launcher] is empty."

/obj/item/weapon/gun/projectile/automatic/ak74gl/verb/ironsights()
	set category = "Object"
	set name = "Use iron sights"
	set popup_menu = 1

	toggle_scope(usr, 1.05)

/obj/item/weapon/gun/projectile/oneuserocket/rpg18
	name = "RPG-18"
	desc = "Also known as 'Mukha'."
	icon_state = "rpg18"
	item_state = "rpg"

/obj/item/weapon/gun/projectile/oneuserocket/m72
	name = "M72 LAW"
	desc = "Destroying tanks since Vietnam."
	icon_state = "m72law"
	item_state = "rpg"

/obj/item/weapon/gun/projectile/oneuserocket
	name = "rocket launcher"
	desc = null
	w_class = 5
	throw_speed = 2
	throw_range = 10
	ammo_type = /obj/item/ammo_casing/oneuserocket
	force = 5.0
	flags = CONDUCT
	fire_sound = 'sound/weapons/gunshot/rocketfire1.wav'
	slot_flags = SLOT_BACK
	load_method = SINGLE_CASING
	caliber = "oneuserocket"
	requires_two_hands = 20
	max_shells = 1
	accuracy = -5
	screen_shake = 4

/obj/item/weapon/gun/projectile/oneuserocket/attackby(obj/item/I as obj, mob/user as mob)
	return

/obj/item/weapon/gun/projectile/oneuserocket/attack_self(mob/user)
	return


/obj/item/weapon/gun/projectile/oneuserocket/unload_ammo(mob/user)
	return

/obj/item/weapon/gun/projectile/oneuserocket/attack_hand(mob/user)
	if(loc != user)
		..()
		return	//let them pick it up
	else if(loc != slot_back)
		..()
	else
		return

/obj/item/weapon/gun/projectile/oneuserocket/verb/ironsights()
	set category = "Object"
	set name = "Use sights"
	set popup_menu = 1

	toggle_scope(usr, 1.1)

/obj/item/weapon/gun/projectile/rpg7
	name = "RPG-7V"
	desc = "Destroying those capitalistic APC's since Vietnam."
	icon_state = "rpg7"
	item_state = "rocket"
	w_class = 5
	caliber = "rocket"
	throw_speed = 2
	throw_range = 10
	ammo_type = /obj/item/ammo_casing/newrocket
	force = 10.0
	flags =  CONDUCT
	fire_sound = 'sound/weapons/gunshot/rpg7.ogg'
	slot_flags = SLOT_BACK
	requires_two_hands = 20
	max_shells = 1
	screen_shake = 5
	accuracy = -3
	load_method = SINGLE_CASING

/obj/item/weapon/gun/projectile/rpg7/update_icon()
	..()
	if(loaded.len)
		icon_state = "rpg7"
	else
		icon_state = "rpg7_empty"

/obj/item/weapon/gun/projectile/rpg7/verb/ironsights()
	set category = "Object"
	set name = "Use iron sights"
	set popup_menu = 1

	toggle_scope(usr, 1.1)

//shotguns

/obj/item/weapon/gun/projectile/shotgun/pump/ithaca
	name = "Ithaca 37"
	desc = "Ha-ha, classic!"
	icon_state = "ithaca37"
	wielded_item_state = "gun_wielded"
	item_state = "cshotgun"
	max_shells = 4
	ammo_type = /obj/item/ammo_casing/shotgun
	requires_two_hands = 5
	w_class = 5
	slot_flags = SLOT_BACK

/obj/item/weapon/gun/projectile/shotgun/pump/ithaca/stakeout
	name = "Ithaca Stakeout"
	desc = "Ha-ha, classic! But without the stock."
	icon_state = "ithacastakeout"
	wielded_item_state = "gun_wielded"
	item_state = "cshotgun"
	requires_two_hands = 2
	screen_shake = 1.5
	w_class = 4

/obj/item/weapon/gun/projectile/shotgun/pump/mossberg500
	name = "Mossberg 500"
	desc = "Bulky! Robust! Loud! A weapon of choice for the US marine, isn't it?"
	icon_state = "mossberg500"
	wielded_item_state = "gun_wielded"
	item_state = "cshotgun"
	max_shells = 7
	ammo_type = /obj/item/ammo_casing/shotgun
	requires_two_hands = 5
	w_class = 5
	screen_shake = 1.5
	slot_flags = SLOT_BACK

/obj/item/weapon/gun/projectile/mosinscoped
	name = "scoped Mosin rifle"
	desc = "That's the scoped M1891/30, a rifle used by Red Army during the WWII."
	icon_state = "scopedmosin"
	item_state = "cshotgun"
	w_class = 5
	jam_chance = 0
	max_shells = 5
	load_method = SPEEDLOADER
	caliber = "762x54"
	slot_flags = SLOT_BACK
	handle_casings = HOLD_CASINGS
	ammo_type = /obj/item/ammo_casing/a762x54/
	allowed_magazines = /obj/item/ammo_magazine/st762x54s
	requires_two_hands = 10
	accuracy = 5
	scoped_accuracy = 10
	fire_delay = 4
	screen_shake = 2
	wielded_item_state = "sniper_wielded"
	reload_sound = 'sound/weapons/gunporn/mosin_magin.wav'
	cocked_sound = 'sound/weapons/gunporn/mosin_cock.wav'
	fire_sound = 'sound/weapons/gunshot/mosin.ogg'
	var/bolt_open = 0

/obj/item/weapon/gun/projectile/mosinscoped/update_icon()
	..()
	if(bolt_open)
		icon_state = "scopedmosin-empty"
	else
		icon_state = "scopedmosin"

/obj/item/weapon/gun/projectile/mosinscoped/attack_self(mob/user as mob)
	bolt_open = !bolt_open
	if(bolt_open)
		if(chambered)
			user << "<span class='notice'>You work the bolt open, ejecting [chambered]!</span>"
			playsound(src.loc, 'sound/weapons/gunporn/mosin_boltback.wav', 50, 1)
			chambered.loc = get_turf(src)
			loaded -= chambered
			chambered = null
		else
			user << "<span class='notice'>You work the bolt open.</span>"
			playsound(src.loc, 'sound/weapons/gunporn/mosin_boltback.wav', 50, 1)
	else
		user << "<span class='notice'>You work the bolt closed.</span>"
		playsound(src.loc, 'sound/weapons/gunporn/mosin_boltforward.wav', 50, 1)
		bolt_open = 0
	add_fingerprint(user)
	update_icon()

/obj/item/weapon/gun/projectile/mosinscoped/special_check(mob/user)
	if(bolt_open)
		user << "<span class='warning'>You can't fire [src] while the bolt is open!</span>"
		return 0
	return ..()

/obj/item/weapon/gun/projectile/mosinscoped/load_ammo(var/obj/item/A, mob/user)
	if(!bolt_open)
		return
	..()

/obj/item/weapon/gun/projectile/mosinscoped/unload_ammo(mob/user, var/allow_dump=1)
	if(!bolt_open)
		return
	..()

/obj/item/weapon/gun/projectile/mosinscoped/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(usr, 2.5)

//APS

/obj/item/weapon/gun/projectile/automatic/aps //Hopefully someone will find a way to make these fire in bursts or something. --Superxpdude
	name = "Stechkin APS"
	desc = "That's the automatic pistol used by Soviet army.."
	icon_state = "aps"	//ugly
	w_class = 3
	load_method = MAGAZINE //yup. until someone sprites a magazine for it.
	max_shells = 20
	caliber = "9x18"
	slot_flags = SLOT_BELT
	magazine_type = /obj/item/ammo_magazine/a9x18b
	allowed_magazines = /obj/item/ammo_magazine/a9x18b
	multi_aim = 1
	burst_delay = 1.5
	fire_sound = 'sound/weapons/gunshot/aps.ogg'

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, requires_two_hands=0, burst_accuracy=null, dispersion=null),
		list(mode_name="3-round bursts", burst=3, fire_delay=null, move_delay=3,    requires_two_hands=1, burst_accuracy=list(0,-1,-1),       dispersion=list(0.0, 0.6, 1.0)),
		list(mode_name="short bursts",   burst=5, fire_delay=null, move_delay=3,    requires_two_hands=2, burst_accuracy=list(0,-1,-1,-1,-2), dispersion=list(0.6, 0.6, 1.0, 1.0, 1.2)),
		)

//VZ.58

/obj/item/weapon/gun/projectile/automatic/vz58
	name = "Vz.58"
	desc = "That's the Samopal vzor 58, a standard-issued AR used by Czechoslovakian infantry."
	icon_state = "vz58"
	item_state = "ak74"
	w_class = 5
	jam_chance = 0.25
	load_method = MAGAZINE
	caliber = "762x39"
	slot_flags = SLOT_BACK
	ammo_type = /obj/item/ammo_casing/a762x39
	allowed_magazines = /obj/item/ammo_magazine/c762x39m
	requires_two_hands = 6
	accuracy = 2
	fire_delay = 3
	burst_delay = 2
	screen_shake = 1.5
	wielded_item_state = "vz58-wielded"
	fire_sound = 'sound/weapons/gunshot/vz58.ogg'
	unload_sound = 'sound/weapons/gunporn/ak74_magout.wav'
	reload_sound = 'sound/weapons/gunporn/ak74_magin.wav'
	cocked_sound = 'sound/weapons/gunporn/ak74_cock.wav'
	var/obj/item/weapon/material/knife/bayonet/bayonet6h4/knife = 0

	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0,    move_delay=null, requires_two_hands=4, burst_accuracy=null, dispersion=null),
		list(mode_name="short bursts", burst=3, fire_delay=null, move_delay=3,    requires_two_hands=5, burst_accuracy=list(1,1,0),       dispersion=list(0.0, 0.3, 0.6)),
		list(mode_name="long bursts",   burst=5, fire_delay=null, move_delay=4,    requires_two_hands=6, burst_accuracy=list(1,1,0,-1,-2), dispersion=list(0.3, 0.3, 0.6, 1.2, 1.5)),
		)

/obj/item/weapon/gun/projectile/automatic/vz58/update_icon()
	..()
	if(knife)
		var/image/I = image('icons/obj/gun.dmi',src,"6h4bayonet")
		I.pixel_x += 5
		I.pixel_y += 5
		overlays += I
	else
		overlays.Cut()

	if(istype(ammo_magazine, /obj/item/ammo_magazine/c762x39m/red))
		icon_state = "vz58"
		wielded_item_state = "vz58-wielded"
		item_state = "ak74-empty"
	else if(ammo_magazine)
		wielded_item_state = "vz58-wielded"
		icon_state = "vz58b"
		item_state = "ak74"
	else
		icon_state = "vz58-empty"
		wielded_item_state = "vz58-wielded_empty"
		item_state = "ak74-empty"

/obj/item/weapon/gun/projectile/automatic/vz58/verb/removebnt(mob/user)
	set category = "Object"
	set name = "Remove bayonet"
	set popup_menu = 1


	if(knife)
		knife.loc = usr
		usr.put_in_hands(knife)
		knife = 0
		src.attack_verb = initial(attack_verb)
		src.sharp = initial(sharp)
		src.force = initial(force)
		user << "<span class='notice'>You remove bayonet from \the [src]!</span>"
		update_icon()

/obj/item/weapon/gun/projectile/automatic/vz58/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/material/knife/bayonet/bayonet6h4))
		knife = W
		user.drop_item()
		W.loc = src
		src.attack_verb = W.attack_verb
		src.sharp = W.sharp
		src.force = W.force
		user << "<span class='notice'>You add [knife.name] to \the [src]!</span>"
		update_icon()
	..()


/obj/item/weapon/gun/projectile/automatic/vz58/verb/ironsights()
	set category = "Object"
	set name = "Use iron sights"
	set popup_menu = 1

	toggle_scope(usr, 1.05)
