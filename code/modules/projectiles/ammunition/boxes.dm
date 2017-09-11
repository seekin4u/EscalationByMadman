/obj/item/ammo_magazine/a357
	//name = "ammo box (.357)"
	//desc = "A box of .357 ammo"
	//icon_state = "357"
	name = "speed loader (.357)"
	icon_state = "38"
	caliber = "357"
	ammo_type = /obj/item/ammo_casing/a357
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_magazine/c38
	name = "speed loader (.38)"
	icon_state = "38"
	caliber = "38"
	matter = list(DEFAULT_WALL_MATERIAL = 360)
	ammo_type = /obj/item/ammo_casing/c38
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_magazine/c38/rubber
	name = "speed loader (.38 rubber)"
	ammo_type = /obj/item/ammo_casing/c38/rubber

/obj/item/ammo_magazine/c45m
	name = "magazine (.45)"
	icon_state = "45"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/c45
	matter = list(DEFAULT_WALL_MATERIAL = 525) //metal costs are very roughly based around 1 .45 casing = 75 metal
	caliber = ".45"
	max_ammo = 7
	multiple_sprites = 1

/obj/item/ammo_magazine/c45m/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c45m/rubber
	name = "magazine (.45 rubber)"
	ammo_type = /obj/item/ammo_casing/c45/rubber

/obj/item/ammo_magazine/c45m/hp
	name = "magazine (.45 HP)"
	ammo_type = /obj/item/ammo_casing/c45/hp

/obj/item/ammo_magazine/c45m/ap
	name = "magazine (.45 AP)"
	ammo_type = /obj/item/ammo_casing/c45/ap

/obj/item/ammo_magazine/c45m/practice
	name = "magazine (.45 practice)"
	ammo_type = /obj/item/ammo_casing/c45/practice

/obj/item/ammo_magazine/c45m/flash
	name = "magazine (.45 flash)"
	ammo_type = /obj/item/ammo_casing/c45/flash

/obj/item/ammo_magazine/c45uzi
	name = "stick magazine (.45)"
	icon_state = "uzi45"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/c45
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	caliber = ".45"
	max_ammo = 16
	multiple_sprites = 1

/obj/item/ammo_magazine/c45uzi/empty
	initial_ammo = 0

/obj/item/ammo_magazine/mc9mm
	name = "magazine (9mm)"
	icon_state = "9x19p"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	matter = list(DEFAULT_WALL_MATERIAL = 600)
	caliber = "9mm"
	ammo_type = /obj/item/ammo_casing/c9mm
	max_ammo = 10
	multiple_sprites = 1

/obj/item/ammo_magazine/mc9mm/empty
	initial_ammo = 0

/obj/item/ammo_magazine/mc9mm/flash
	name = "magazine (9mm flash)"
	ammo_type = /obj/item/ammo_casing/c9mm/flash

/obj/item/ammo_magazine/box/c9mm
	name = "ammunition box (9mm)"
	icon_state = "9mm"
	origin_tech = list(TECH_COMBAT = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 1800)
	caliber = "9mm"
	ammo_type = /obj/item/ammo_casing/c9mm
	max_ammo = 30

/obj/item/ammo_magazine/box/c9mm/empty
	initial_ammo = 0

/obj/item/ammo_magazine/mc9mmt
	name = "top mounted magazine (9mm)"
	icon_state = "9mmt"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/c9mm
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	caliber = "9mm"
	max_ammo = 20
	multiple_sprites = 1

/obj/item/ammo_magazine/mc9mmt/empty
	initial_ammo = 0

/obj/item/ammo_magazine/mc9mmt/rubber
	name = "top mounted magazine (9mm rubber)"
	ammo_type = /obj/item/ammo_casing/c9mm/rubber

/obj/item/ammo_magazine/mc9mmt/practice
	name = "top mounted magazine (9mm practice)"
	ammo_type = /obj/item/ammo_casing/c9mm/practice

/obj/item/ammo_magazine/box/c45
	name = "ammunition box (.45)"
	icon_state = "9mm"
	origin_tech = list(TECH_COMBAT = 2)
	caliber = ".45"
	matter = list(DEFAULT_WALL_MATERIAL = 2250)
	ammo_type = /obj/item/ammo_casing/c45
	max_ammo = 30

/obj/item/ammo_magazine/box/c45/empty
	initial_ammo = 0

/obj/item/ammo_magazine/a10mm
	name = "magazine (10mm)"
	icon_state = "10mm"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = "10mm"
	matter = list(DEFAULT_WALL_MATERIAL = 1500)
	ammo_type = /obj/item/ammo_casing/a10mm
	max_ammo = 20
	multiple_sprites = 1

/obj/item/ammo_magazine/a10mm/empty
	initial_ammo = 0

/obj/item/ammo_magazine/a556
	name = "magazine (5.56mm)"
	icon_state = "5.56"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = "a556"
	matter = list(DEFAULT_WALL_MATERIAL = 1800)
	ammo_type = /obj/item/ammo_casing/a556
	max_ammo = 15 //if we lived in a world where normal mags had 30 rounds, this would be a 20 round mag
	multiple_sprites = 1

/obj/item/ammo_magazine/a556/empty
	initial_ammo = 0

/obj/item/ammo_magazine/a556/practice
	name = "magazine (5.56mm practice)"
	ammo_type = /obj/item/ammo_casing/a556/practice

/obj/item/ammo_magazine/a50
	name = "magazine (.50)"
	icon_state = "50ae"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = ".50"
	matter = list(DEFAULT_WALL_MATERIAL = 1260)
	ammo_type = /obj/item/ammo_casing/a50
	max_ammo = 7
	multiple_sprites = 1

/obj/item/ammo_magazine/a50/empty
	initial_ammo = 0

/obj/item/ammo_magazine/a75
	name = "ammo magazine (20mm)"
	icon_state = "75"
	mag_type = MAGAZINE
	caliber = "75"
	ammo_type = /obj/item/ammo_casing/a75
	multiple_sprites = 1
	max_ammo = 4

/obj/item/ammo_magazine/a75/empty
	initial_ammo = 0

/obj/item/ammo_magazine/box/a762
	name = "magazine box (7.62mm)"
	icon_state = "a762"
	origin_tech = list(TECH_COMBAT = 2)
	mag_type = MAGAZINE
	caliber = "a762"
	matter = list(DEFAULT_WALL_MATERIAL = 4500)
	ammo_type = /obj/item/ammo_casing/a762
	max_ammo = 50
	multiple_sprites = 1
	w_class = 4

/obj/item/ammo_magazine/box/a762/empty
	initial_ammo = 0

/obj/item/ammo_magazine/c762
	name = "magazine (7.62mm)"
	icon_state = "c762"
	mag_type = MAGAZINE
	caliber = "a762"
	matter = list(DEFAULT_WALL_MATERIAL = 1800)
	ammo_type = /obj/item/ammo_casing/a762
	max_ammo = 20
	multiple_sprites = 1

/obj/item/ammo_magazine/caps
	name = "speed loader (caps)"
	icon_state = "T38"
	caliber = "caps"
	color = "#FF0000"
	ammo_type = /obj/item/ammo_casing/cap
	matter = list(DEFAULT_WALL_MATERIAL = 600)
	max_ammo = 7
	multiple_sprites = 1

/obj/item/ammo_magazine/c762x51m
	name = "magazine (7.62x51mm)"
	icon_state = "7.62x51m"
	mag_type = MAGAZINE
	caliber = "762x51"
	ammo_type = /obj/item/ammo_casing/a762x51
	max_ammo = 30
	multiple_sprites = 1

/obj/item/ammo_magazine/c762x51m/ap
	name = "AP magazine (7.62x51mm)"
	ammo_type = /obj/item/ammo_casing/a762x51/ap

/obj/item/ammo_magazine/c762x51s
	name = "magazine (7.62x51mm)"
	icon_state = "7.62x51s"
	mag_type = MAGAZINE
	caliber = "762x51"
	ammo_type = /obj/item/ammo_casing/a762x51
	max_ammo = 20
	multiple_sprites = 1

/obj/item/ammo_magazine/c762x51s/ap
	name = "AP magazine (7.62x51mm)"
	ammo_type = /obj/item/ammo_casing/a762x51/ap

/obj/item/ammo_magazine/c762x51s/hp
	name = "HP magazine (7.62x51mm)"
	ammo_type = /obj/item/ammo_casing/a762x51/hp

/obj/item/ammo_magazine/c762x51b
	name = "ammo box (7.62x51mm)"
	icon_state = "7.62x51b"
	mag_type = MAGAZINE
	caliber = "762x51"
	ammo_type = /obj/item/ammo_casing/a762x51
	max_ammo = 100
	multiple_sprites = 1
	w_class = 4

/obj/item/ammo_magazine/c762x51b/ap
	name = "AP ammo box (7.62x51mm)"
	ammo_type = /obj/item/ammo_casing/a762x51/ap


/obj/item/ammo_magazine/c762x39b
	name = "magazine box (7.62x39mm)"
	icon_state = "7.62x39m"
	mag_type = MAGAZINE
	caliber = "762x39"
	ammo_type = /obj/item/ammo_casing/a762x39
	max_ammo = 200
	multiple_sprites = 1
	w_class = 4

/obj/item/ammo_magazine/c762x39b/ap
	name = "AP magazine (7.62x39mm)"
	ammo_type = /obj/item/ammo_casing/a762x39/ap

/obj/item/ammo_magazine/c762x39b
	name = "magazine box (7.62x39mm)"
	icon_state = "7.62x39m"
	mag_type = MAGAZINE
	caliber = "762x39"
	ammo_type = /obj/item/ammo_casing/a762x39
	max_ammo = 200
	multiple_sprites = 1
	w_class = 4

/obj/item/ammo_magazine/c762x39b/ap
	name = "AP magazine (7.62x39mm)"
	ammo_type = /obj/item/ammo_casing/a762x39/ap


/obj/item/ammo_magazine/c762x39m
	name = "magazine (7.62x39mm)"
	icon_state = "7.62x39m"
	mag_type = MAGAZINE
	caliber = "762x39"
	ammo_type = /obj/item/ammo_casing/a762x39
	max_ammo = 30
	multiple_sprites = 1

/obj/item/ammo_magazine/c762x39m/ap
	name = "AP magazine (7.62x39mm)"
	ammo_type = /obj/item/ammo_casing/a762x39/ap

/obj/item/ammo_magazine/c762x39m/red
	icon_state = "7.62x39mr"

/obj/item/ammo_magazine/c762x39m/red/ap
	name = "AP magazine (7.62x39mm)"
	ammo_type = /obj/item/ammo_casing/a762x39/ap


/*/obj/item/ammo_magazine/c762x39r
	name = "magazine (7.62x39mm)"
	icon_state = "7.62x39r"
	mag_type = MAGAZINE
	caliber = "762x39"
	ammo_type = /obj/item/ammo_casing/a762x39
	max_ammo = 45
	multiple_sprites = 1

/obj/item/ammo_magazine/c762x39r/ap
	name = "AP magazine (7.62x39mm)"
	ammo_type = /obj/item/ammo_casing/a762x39/ap

/obj/item/ammo_magazine/c762x39br
	name = "drum magazine (7.62x39mm)"
	icon_state = "7.62x39br"
	mag_type = MAGAZINE
	caliber = "762x39"
	ammo_type = /obj/item/ammo_casing/a762x39
	max_ammo = 75
	multiple_sprites = 1

/obj/item/ammo_magazine/c762x39br/ap
	name = "drum AP magazine (7.62x39mm)"
	ammo_type = /obj/item/ammo_casing/a762x39/ap

*/
/obj/item/ammo_magazine/c762x54s
	name = "magazine (7.62x54mm)"
	icon_state = "7.62x54s"
	mag_type = MAGAZINE
	caliber = "762x54"
	ammo_type = /obj/item/ammo_casing/a762x54
	max_ammo = 10
	multiple_sprites = 1

/obj/item/ammo_magazine/c762x54s/ap
	name = "AP magazine (7.62x54mm)"
	ammo_type = /obj/item/ammo_casing/a762x54/ap

/obj/item/ammo_magazine/c762x54s/hp
	name = "HP magazine (7.62x54mm)"
	ammo_type = /obj/item/ammo_casing/a762x54/hp

/obj/item/ammo_magazine/c762x54b
	name = "ammo box (7.62x54mm)"
	icon_state = "7.62x54b"
	mag_type = MAGAZINE
	caliber = "762x54"
	ammo_type = /obj/item/ammo_casing/a762x54
	max_ammo = 200
	multiple_sprites = 1
	w_class = 4

/obj/item/ammo_magazine/c762x54b/ap
	name = "ammo box (7.62x54mm)"
	ammo_type = /obj/item/ammo_casing/a762x54/ap


/obj/item/ammo_magazine/c556x45m
	name = "magazine (5.56x45mm)"
	icon_state = "5.56x45m"
	mag_type = MAGAZINE
	caliber = "556x45"
	ammo_type = /obj/item/ammo_casing/a556x45
	max_ammo = 30
	multiple_sprites = 1

/obj/item/ammo_magazine/c556x45m/ap
	name = "AP magazine (5.56x45mm)"
	ammo_type = /obj/item/ammo_casing/a556x45/ap

/obj/item/ammo_magazine/c545x39m
	name = "magazine (5.45x39mm)"
	icon_state = "5.45x39mr"
	mag_type = MAGAZINE
	caliber = "545x39"
	ammo_type = /obj/item/ammo_casing/a545x39
	max_ammo = 30
	multiple_sprites = 1

/obj/item/ammo_magazine/c545x39m/ap
	name = "AP magazine (5.45x39mm)"
	ammo_type = /obj/item/ammo_casing/a545x39/ap

/obj/item/ammo_magazine/c545x39m/black
	name = "magazine (5.45x39mm)"
	icon_state = "5.45x39mb"

/obj/item/ammo_magazine/c545x39m/black/ap
	name = "AP magazine (5.45x39mm)"
	ammo_type = /obj/item/ammo_casing/a545x39/ap

/obj/item/ammo_magazine/c545x39r
	name = "magazine (5.45x39mm)"
	icon_state = "7.62x39r"
	mag_type = MAGAZINE
	caliber = "545x39"
	ammo_type = /obj/item/ammo_casing/a545x39
	max_ammo = 45
	multiple_sprites = 1

/obj/item/ammo_magazine/c545x39r/ap
	name = "AP magazine (5.45x39mm)"
	ammo_type = /obj/item/ammo_casing/a545x39/ap

/obj/item/ammo_magazine/a9x19
	name = "magazine (9x19mm)"
	icon_state = "9x19a"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a9x19
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	caliber = "9x19"
	max_ammo = 15
	multiple_sprites = 1

/obj/item/ammo_magazine/a9x19/ap
	name = "AP magazine (9x19mm)"
	ammo_type = /obj/item/ammo_casing/a9x19/ap

/obj/item/ammo_magazine/a9x19s
	name = "magazine (9x19mm)"
	icon_state = "9x19p"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a9x19
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	caliber = "9x19"
	max_ammo = 8
	multiple_sprites = 1

/obj/item/ammo_magazine/a9x19s/ap
	name = "AP magazine (9x19mm)"
	ammo_type = /obj/item/ammo_casing/a9x19/ap

/obj/item/ammo_magazine/a9x18
	name = "magazine (9x18mm)"
	icon_state = "9x18a"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a9x18
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	caliber = "9x18"
	max_ammo = 8
	multiple_sprites = 1

/obj/item/ammo_magazine/a9x18/ap
	name = "AP magazine (9x18mm)"
	ammo_type = /obj/item/ammo_casing/a9x18/ap

/obj/item/ammo_magazine/a9x18b
	name = "extended magazine (9x18mm)"
	icon_state = "9x18b"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/a9x18
	matter = list(DEFAULT_WALL_MATERIAL = 1200)
	caliber = "9x18"
	max_ammo = 20
	multiple_sprites = 1

/obj/item/ammo_magazine/a9x18b/ap
	name = "extended AP magazine (9x18mm)"
	ammo_type = /obj/item/ammo_casing/a9x18/ap


/obj/item/ammo_magazine/c127x99b
	name = "magazine box (12.7x99mm)"
	icon_state = "127x99"
	mag_type = MAGAZINE
	caliber = "127x99mm"
	ammo_type = /obj/item/ammo_casing/a127x99mm
	max_ammo = 200
	multiple_sprites = 1
	w_class = 4

/obj/item/ammo_magazine/c127x108b
	name = "ammo belt (12.7x108mm)"
	icon_state = "utesbelt"
	mag_type = MAGAZINE
	caliber = "127x108mm"
	ammo_type = /obj/item/ammo_casing/a127x108mm
	max_ammo = 250
	multiple_sprites = 1
	w_class = 5
	slot_flags = SLOT_BACK

/obj/item/ammo_magazine/c556x45s
	name = "magazine (5.56x45mm)"
	icon_state = "5.56x45s"
	mag_type = MAGAZINE
	caliber = "556x45"
	ammo_type = /obj/item/ammo_casing/a556x45
	max_ammo = 20
	multiple_sprites = 1

/obj/item/ammo_magazine/c556x45s/ap
	name = "AP magazine (5.56x45mm)"
	ammo_type = /obj/item/ammo_casing/a556x45/ap


//Large ammo boxes

/obj/item/ammo_magazine/crate/
	desc = "That's a bulky ammo box."
	name = "ammo box"

/obj/item/ammo_magazine/crate/attack_self(mob/user as mob)
	user << "<span class='notice'>Unloading that all ammo would be pretty dumb act.</span>"
	return

/obj/item/ammo_magazine/crate/attack_hand(mob/user as mob)
	var/obj/item/ammo_casing/A = get_round()
	if(A)
		user.put_in_hands(A)
		user << "<span class='notice'>You remove a round from \the [src]!</span>"
		update_icon()


/obj/item/ammo_magazine/crate/box556x45
	icon_state = "ammoboxnato"
	caliber = "556x45"
	ammo_type = /obj/item/ammo_casing/a556x45
	max_ammo = 200
	w_class = 4
	slot_flags = null
	multiple_sprites = 1

/obj/item/ammo_magazine/crate/box762x51
	name = "ammo box (7.62x51mm)"
	icon_state = "ammoboxnato"
	caliber = "762x51"
	ammo_type = /obj/item/ammo_casing/a762x51
	max_ammo = 200
	w_class = 4
	slot_flags = null
	multiple_sprites = 1

/obj/item/ammo_magazine/crate/box9x19
	name = "ammo box (9x19mm)"
	icon_state = "ammoboxnato"
	caliber = "9x19"
	ammo_type = /obj/item/ammo_casing/a9x19
	max_ammo = 200
	w_class = 4
	slot_flags = null
	multiple_sprites = 1

/obj/item/ammo_magazine/crate/box762x39
	name = "ammo box (7.62x39mm)"
	icon_state = "ammoboxsa"
	caliber = "762x39"
	ammo_type = /obj/item/ammo_casing/a762x39
	max_ammo = 400
	w_class = 5
	slot_flags = null
	multiple_sprites = 1

/obj/item/ammo_magazine/crate/box545x39
	name = "ammo box (5.45x39mm)"
	icon_state = "ammoboxsa"
	caliber = "762x39"
	ammo_type = /obj/item/ammo_casing/a545x39
	max_ammo = 400
	w_class = 5
	slot_flags = null
	multiple_sprites = 1

/obj/item/ammo_magazine/crate/box9x19
	name = "ammo box (9x18mm)"
	icon_state = "ammoboxsa"
	caliber = "9x18"
	ammo_type = /obj/item/ammo_casing/a9x18
	max_ammo = 400
	w_class = 5
	slot_flags = null
	multiple_sprites = 1

/obj/item/ammo_magazine/st762x54s
	name = "ammo clip (7.62x54R)"
	icon_state = "stripper"
	caliber = "762x54"
	ammo_type = /obj/item/ammo_casing/a762x54/hp
	max_ammo = 5
	multiple_sprites = 1

/obj/item/ammo_magazine/s40mm
	name = "40x53mm HE ammo box"
	icon_state = "40mmbox"
	caliber = "s40mm"
	w_class = 5
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/s40mmgrenade
	max_ammo = 24
	multiple_sprites = 1

/obj/item/ammo_magazine/s40mm/hedp
	name = "40x53mm HEDP ammo box"
	icon_state = "40mmbox"
	caliber = "s40mm"
	w_class = 5
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/s40mmgrenade/hedp
	max_ammo = 24
	multiple_sprites = 1

/obj/item/ammo_magazine/s3029mm
	name = "30x29mm HE ammo box"
	icon_state = "30x29"
	caliber = "s3029mm"
	w_class = 5
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/s3029mm
	max_ammo = 48
	multiple_sprites = 1

/obj/item/ammo_magazine/s3029mm/shrapnel
	name = "30x29mm shrapnel ammo box"
	icon_state = "30x29"
	caliber = "s3029mm"
	w_class = 5
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/s3029mm/shrapnel
	max_ammo = 48
	multiple_sprites = 1