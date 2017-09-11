/decl/hierarchy/outfit/job
	name = "Standard Gear"
	hierarchy_type = /decl/hierarchy/outfit/job

/*	uniform = /obj/item/clothing/under/color/grey
	l_ear = null
	back = null
	shoes = /obj/item/clothing/shoes/black

	id_slot = null
	id_type = null
	pda_slot = null
	pda_type = null

	var/backpack = null
	var/satchel_one  = null
	var/satchel_two  = null

/decl/hierarchy/outfit/job/pre_equip(mob/living/carbon/human/H)
	..()
	switch(H.backbag)
		if(2) back = backpack
		if(3) back = satchel_one
		if(4) back = satchel_two
		else back = null

/decl/hierarchy/outfit/job/equip_id(mob/living/carbon/human/H)
	var/obj/item/weapon/card/id/C = ..()
	if(H.mind)
		if(H.mind.initial_account)
			C.associated_account_number = H.mind.initial_account.account_number
	return C

*/