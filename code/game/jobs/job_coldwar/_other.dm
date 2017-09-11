/datum/job/civilian
	title = "Civilian"
	flag = BARTENDER
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 5
	spawn_positions = 5
	selection_color = "#dddddd"
	access = list()
	minimal_access = list()

/datum/job/civilian/equip(var/mob/living/carbon/human/H)
	if(!H)	return 0

	var/shoes = pick(
		/obj/item/clothing/shoes/brown,
		/obj/item/clothing/shoes/blue,
		/obj/item/clothing/shoes/green,
		/obj/item/clothing/shoes/yellow,
		/obj/item/clothing/shoes/purple,
		/obj/item/clothing/shoes/red,
		/obj/item/clothing/shoes/white,
		/obj/item/clothing/shoes/leather,
		/obj/item/clothing/shoes/rainbow,
		/obj/item/clothing/shoes/orange,
		)
	H.equip_to_slot_or_del(new shoes(H), slot_shoes)
	var/under = pick(
		/obj/item/clothing/under/color/black,
		/obj/item/clothing/under/color/blackf,
		/obj/item/clothing/under/color/blue,
		/obj/item/clothing/under/color/green,
		/obj/item/clothing/under/color/grey,
		/obj/item/clothing/under/color/orange,
		/obj/item/clothing/under/color/pink,
		/obj/item/clothing/under/color/red,
		/obj/item/clothing/under/color/white,
		/obj/item/clothing/under/color/yellow,
		/obj/item/clothing/under/psyche,
		/obj/item/clothing/under/lightblue,
		/obj/item/clothing/under/aqua,
		/obj/item/clothing/under/purple,
		/obj/item/clothing/under/lightpurple,
		/obj/item/clothing/under/lightgreen,
		/obj/item/clothing/under/lightbrown,
		/obj/item/clothing/under/brown,
		/obj/item/clothing/under/yellowgreen,
		/obj/item/clothing/under/darkblue,
		/obj/item/clothing/under/lightred,
		/obj/item/clothing/under/darkred,
		////////////////////////////////
		/obj/item/clothing/under/johnny,
		/obj/item/clothing/under/owl,
		/obj/item/clothing/under/suit_jacket,
		/obj/item/clothing/under/suit_jacket/really_black,
		/obj/item/clothing/under/suit_jacket/female,
		/obj/item/clothing/under/suit_jacket/red,
		/obj/item/clothing/under/blackskirt,
		/obj/item/clothing/under/schoolgirl,
		/obj/item/clothing/under/pirate,
		/obj/item/clothing/under/soviet,
		/obj/item/clothing/under/redcoat,
		/obj/item/clothing/under/kilt,
		/obj/item/clothing/under/sexymime,
		//////////////////////////////////
		/obj/item/clothing/under/dress,
		/obj/item/clothing/under/dress/dress_fire,
		/obj/item/clothing/under/dress/dress_green,
		/obj/item/clothing/under/dress/dress_orange,
		/obj/item/clothing/under/dress/dress_pink,
		/obj/item/clothing/under/dress/dress_yellow,
		/obj/item/clothing/under/dress/dress_saloon,
		)
	H.equip_to_slot_or_del(new under(H), slot_w_uniform)
	if(prob(25))
		var/backpack = pick(
			/obj/item/weapon/storage/backpack,
			/obj/item/weapon/storage/backpack/satchel/withwallet,
			/obj/item/weapon/storage/backpack/satchel_norm,
			)
		H.equip_to_slot_or_del(new backpack(H), slot_back)
	if(prob(75))
		var/suit = pick(
			/obj/item/clothing/suit/armor/vest,
			/obj/item/clothing/suit/storage/toggle/brown_jacket,
			/obj/item/clothing/suit/storage/toggle/internalaffairs,
			/obj/item/clothing/suit/storage/toggle/labcoat,
			/obj/item/clothing/suit/storage/toggle/labcoat/red,
			/obj/item/clothing/suit/storage/toggle/labcoat/blue,
			/obj/item/clothing/suit/storage/toggle/labcoat/purple,
			/obj/item/clothing/suit/storage/toggle/labcoat/orange,
			/obj/item/clothing/suit/storage/toggle/labcoat/green,
			/obj/item/clothing/suit/pirate,
			//obj/item/clothing/suit/johnny_coat,
			/obj/item/clothing/suit/justice,
			/obj/item/clothing/suit/chickensuit,
			/obj/item/clothing/suit/monkeysuit,
			//////////////////////////////////
			//obj/item/clothing/suit/leathercoat,
			//obj/item/clothing/suit/browncoat,
			//obj/item/clothing/suit/neocoat,
			)
		H.equip_to_slot_or_del(new suit(H), slot_wear_suit)
	if(prob(40))
		var/head = pick(
			/obj/item/clothing/head/helmet,
			/obj/item/clothing/head/chefhat,
			/obj/item/clothing/head/beret,
			/obj/item/clothing/head/soft/red,
			/obj/item/clothing/head/soft/blue,
			/obj/item/clothing/head/soft/green,
			/obj/item/clothing/head/soft/yellow,
			/obj/item/clothing/head/soft/grey,
			/obj/item/clothing/head/soft/orange,
			/obj/item/clothing/head/soft/mime,
			/obj/item/clothing/head/soft/purple,
			/obj/item/clothing/head/soft/rainbow,
			)
		H.equip_to_slot_or_del(new head(H), slot_head)
	if(prob(15))
		var/gun = pick(
			/obj/item/weapon/gun/projectile/revolver,
			/obj/item/weapon/gun/projectile/revolver/deckard.
			/obj/item/weapon/gun/projectile/colt,
			/obj/item/weapon/gun/projectile/deagle,
			)
		H.equip_to_slot_or_del(new gun(H), slot_belt)

	var/worth = pick(10, 10, 10, 20, 20, 20, 50, 50, 100)
	var/cash_type = text2path("/obj/item/weapon/spacecash/c[worth]")
	H.equip_to_slot_or_del(new cash_type (H), slot_l_store)
	return 1

/datum/job/civilian/update_character(var/mob/living/carbon/human/H)
	H.add_language("Local")
	H.default_language = all_languages["Local"]

	if(prob(30))
		H.add_language("Russian")
		H << "<b>Yay! You know russian language!</b>"
	if(prob(30))
		H.add_language("English")
		H << "<b>Yay! You know english language!</b>"

/datum/job/press
	title = "Press"
	flag = LAWYER
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	selection_color = "#bbbbbb"
	access = list()
	minimal_access = list()

/datum/job/press/equip(var/mob/living/carbon/human/H)
	if(!H)	return

	H.equip_to_slot_or_del(new /obj/item/clothing/under/press_uniform(H), slot_w_uniform)
	H.equip_to_slot_or_del(new /obj/item/clothing/suit/storage/vest/heavy/press(H), slot_wear_suit)
	H.equip_to_slot_or_del(new /obj/item/clothing/shoes/jackboots(H), slot_shoes)

	var/obj/item/weapon/storage/backpack/satchel/BP = new(H)
	new /obj/item/weapon/reagent_containers/food/drinks/cans/waterbottle(BP)
	new /obj/item/device/camera(BP)
	new /obj/item/device/camera_film(BP)
	new /obj/item/device/camera_film(BP)
	new /obj/item/weapon/folder/blue(BP)

	var/obj/item/weapon/storage/wallet/wallet = new(BP)
	new /obj/item/weapon/spacecash/c1000(wallet)
	new /obj/item/weapon/spacecash/c500(wallet)
	new /obj/item/weapon/spacecash/c50(wallet)


	H.equip_to_slot_or_del(BP, slot_back)

	H.equip_to_slot_or_del(new /obj/item/stack/medical/bruise_pack(H), slot_r_store)

	var/obj/item/weapon/storage/fancy/cigarettes/dromedaryco/cigs = new(H)
	cigs.storage_slots++
	new /obj/item/weapon/flame/lighter(cigs)
	H.equip_to_slot_or_del(cigs, slot_l_store)

/datum/job/press/update_character(var/mob/living/carbon/human/H)
	H.add_language("Local")
	H.add_language("Russian")
	H.add_language("English")
	H << "<b>Yay! You know local language!</b>"
	H << "<b>Yay! You know russian language!</b>"
	H << "<b>Yay! You know english language!</b>"
	if(prob(50))
		H.default_language = all_languages["Russian"]
	else
		H.default_language = all_languages["English"]

