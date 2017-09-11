////////////////////////////////////////////////////////////////////////////////
/// HYPOSPRAY
////////////////////////////////////////////////////////////////////////////////

/obj/item/weapon/reagent_containers/hypospray
	name = "hypospray"
	desc = "The DeForest Medical Corporation hypospray is a sterile, air-needle autoinjector for rapid administration of drugs to patients."
	icon = 'icons/obj/syringe.dmi'
	item_state = "hypo"
	icon_state = "hypo"
	amount_per_transfer_from_this = 5
	unacidable = 1
	volume = 30
	possible_transfer_amounts = null
	flags = OPENCONTAINER
	slot_flags = SLOT_BELT

///obj/item/weapon/reagent_containers/hypospray/New() //comment this to make hypos start off empty
//	..()
//	reagents.add_reagent("tricordrazine", 30)
//	return

/obj/item/weapon/reagent_containers/hypospray/do_surgery(mob/living/carbon/M, mob/living/user)
	if(user.a_intent != I_HELP) //in case it is ever used as a surgery tool
		return ..()
	attack(M, user)
	return 1

/obj/item/weapon/reagent_containers/hypospray/attack(mob/living/M as mob, mob/user as mob)
	if(!reagents.total_volume)
		user << "<span class='warning'>[src] is empty.</span>"
		return
	if (!istype(M))
		return

	var/mob/living/carbon/human/H = M
	if(istype(H))
		var/obj/item/organ/external/affected = H.get_organ(user.zone_sel.selecting)
		if(!affected)
			user << "<span class='danger'>\The [H] is missing that limb!</span>"
			return
		else if(affected.robotic >= ORGAN_ROBOT)
			user << "<span class='danger'>You cannot inject a robotic limb.</span>"
			return

	user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
	user.do_attack_animation(M)
	user << "<span class='notice'>You inject [M] with [src].</span>"
	M << "<span class='notice'>You feel a tiny prick!</span>"

	if(M.reagents)
		var/contained = reagentlist()
		var/trans = reagents.trans_to_mob(M, amount_per_transfer_from_this, CHEM_BLOOD)
		admin_inject_log(user, M, src, contained, trans)
		user << "<span class='notice'>[trans] units injected. [reagents.total_volume] units remaining in \the [src].</span>"

	return

/obj/item/weapon/reagent_containers/hypospray/autoinjector
	name = "autoinjector"
	desc = "A rapid and safe way to administer small amounts of drugs by untrained or trained personnel."
	icon_state = "autoinjector"
	item_state = "autoinjector"
	amount_per_transfer_from_this = 5
	volume = 5

/obj/item/weapon/reagent_containers/hypospray/autoinjector/New()
	..()
//	reagents.add_reagent("inaprovaline", 5)
	update_icon()
	return

/obj/item/weapon/reagent_containers/hypospray/autoinjector/attack(mob/M as mob, mob/user as mob)
	..()
	if(reagents.total_volume <= 0) //Prevents autoinjectors to be refilled.
		flags &= ~OPENCONTAINER
	update_icon()
	return

/obj/item/weapon/reagent_containers/hypospray/autoinjector/update_icon()
	if(reagents.total_volume > 0)
		icon_state = "[initial(icon_state)]1"
	else
		icon_state = "[initial(icon_state)]0"

/obj/item/weapon/reagent_containers/hypospray/autoinjector/examine(mob/user)
	..(user)
	if(reagents && reagents.reagent_list.len)
		user << "<span class='notice'>It is currently loaded.</span>"
	else
		user << "<span class='notice'>It is spent.</span>"

/obj/item/weapon/reagent_containers/hypospray/autoinjector/survival
	name = "combat autoinjector"
	icon = 'icons/obj/medical.dmi'
	icon_state = "injector2"
	amount_per_transfer_from_this = 10
	volume = 10

/obj/item/weapon/reagent_containers/hypospray/autoinjector/survival/inaprovaline
	name = "inaprovaline injector"

	New()
		..()
		reagents.add_reagent("inaprovaline", 10)

/obj/item/weapon/reagent_containers/hypospray/autoinjector/survival/bicaridine
	name = "bicaridine injector"

	New()
		..()
		reagents.add_reagent("bicaridine", 10)

/obj/item/weapon/reagent_containers/hypospray/autoinjector/survival/promedolum
	name = "promedolum injector"

	New()
		..()
		reagents.add_reagent("oxycodone", 5)
		reagents.add_reagent("methylphenidate", 5)

/obj/item/weapon/reagent_containers/hypospray/autoinjector/survival/peridaxon
	name = "peridaxon injector"

	New()
		..()
		reagents.add_reagent("peridaxon", 10)

/obj/item/weapon/reagent_containers/ampule
	name = "ampule"
	desc = "An ampule."
	icon = 'icons/obj/syringe.dmi'
	icon_state = "ampule"
	item_state = null
	amount_per_transfer_from_this = 5
	w_class = 1
	slot_flags = SLOT_EARS
	volume = 5
	flags = OPENCONTAINER

/obj/item/weapon/reagent_containers/ampule/update_icon()
	if(reagents.total_volume > 0)
		icon_state = "[initial(icon_state)]"
	else
		icon_state = "[initial(icon_state)]_empty"
		flags &= ~OPENCONTAINER
		desc += " It is spent now."

/obj/item/weapon/reagent_containers/ampule/attack_self(var/mob/user)
	return

/obj/item/weapon/reagent_containers/ampule/afterattack
	update_icon

/obj/item/weapon/reagent_containers/ampule/morphine
	name = "Morphine ampule"

	New()
		..()
		reagents.add_reagent("morphine", 5)

//////////////////////////////
////Combat Injector Define////
//////////////////////////////
/obj/item/weapon/reagent_containers/hypospray/autoinjector/combat
	name = "combat autoinjector"
	icon = 'icons/obj/medical.dmi'
	icon_state = "injector_red"
	volume = 5

	var/cap_color = "red"
	var/obj/item/weapon/injector_cap/cap = null

/obj/item/weapon/reagent_containers/hypospray/autoinjector/combat/New()
	..()
	cap = new /obj/item/weapon/injector_cap (src, cap_color)
	update_icon()

/obj/item/weapon/reagent_containers/hypospray/autoinjector/combat/attack(mob/M as mob, mob/user as mob)
	if(cap)
		user << "<span class='warning'>Remove cap first!</span>"
	else
		..()

/obj/item/weapon/reagent_containers/hypospray/autoinjector/combat/attack_hand(mob/user as mob)
	if(cap && user.get_inactive_hand() == src)
		user << "<span class='notice'>You removed the cap.</span>"
		user.put_in_active_hand(cap)
		cap = null
		update_icon()
	else
		..()

/obj/item/weapon/reagent_containers/hypospray/autoinjector/combat/attack_self(mob/user as mob)
	if(cap)
		if(prob(50))
			user << "<span class='warning'>You tried to remove the cap by one hand but failed!</span>"
		else
			user << "<span class='notice'>You removed the cap.</spam>"
			cap.loc = user.loc
			cap = null
			update_icon()
	else
		..()

/obj/item/weapon/reagent_containers/hypospray/autoinjector/combat/update_icon()
	if(reagents.total_volume >= 0)
		if(cap)
			icon_state = "injector_[cap_color]"
		else
			icon_state = "injector_full"
	else
		icon_state = "injector_empty"

/obj/item/weapon/injector_cap
	name = "injector cap"
	icon = 'icons/obj/medical.dmi'
	icon_state = "cap_red"

/obj/item/weapon/injector_cap/New(var/loc, var/color)
	..()
	icon_state = "[color]_cap"

/obj/item/weapon/reagent_containers/hypospray/autoinjector/combat/inaprovaline
	name = "inaprovaline injector"
	cap_color = "red"

	New()
		..()
		reagents.add_reagent("inaprovaline", 5)

/obj/item/weapon/reagent_containers/hypospray/autoinjector/combat/bicaridine
	name = "bicaridine injector"
	cap_color = "blue"

	New()
		..()
		reagents.add_reagent("bicaridine", 5)

/obj/item/weapon/reagent_containers/hypospray/autoinjector/combat/peridaxon
	name = "peridaxon injector"
	cap_color = "green"

	New()
		..()
		reagents.add_reagent("peridaxon", 5)

/obj/item/weapon/reagent_containers/hypospray/autoinjector/combat/promedolum
	name = "promedolum autoinjector"
	cap_color = "green"

	New()
		..()
		reagents.add_reagent("morphine", 2)
		reagents.add_reagent("methylphenidate", 1)
		reagents.add_reagent("tramadol", 2)

/obj/item/weapon/reagent_containers/hypospray/autoinjector/combat/epinephrine
	name = "epinephrine autoinjector"
	cap_color = "blue"

	New()
		..()
		reagents.add_reagent("epinephrine", 5)

/obj/item/weapon/reagent_containers/syrette
	name = "syrette"
	desc = "That's the one-use syringe used for quick injection of medications."
	icon_state = "syrette"
	item_state = "autoinjector"
	amount_per_transfer_from_this = 5
	volume = 5
	icon = 'icons/obj/syringe.dmi'

/obj/item/weapon/reagent_containers/syrette/New()
	..()
	update_icon()
	return

/obj/item/weapon/reagent_containers/syrette/attack(mob/M as mob, mob/user as mob)
	..()
	if(reagents.total_volume <= 0) //Prevents autoinjectors to be refilled.
		flags &= ~OPENCONTAINER
	update_icon()
	return

/obj/item/weapon/reagent_containers/syrette/update_icon()
	if(reagents.total_volume > 0)
		icon_state = "[initial(icon_state)]"
	else
		icon_state = "[initial(icon_state)]_empty"

/obj/item/weapon/reagent_containers/syrette/examine(mob/user)
	..(user)
	if(reagents && reagents.reagent_list.len)
		user << "<span class='notice'>It is currently loaded.</span>"
	else
		user << "<span class='notice'>It is spent.</span>"

/obj/item/weapon/reagent_containers/syrette/attack(mob/living/M as mob, mob/user as mob)
	if(!reagents.total_volume)
		user << "<span class='warning'>[src] is empty.</span>"
		return
	if (!istype(M))
		return

	var/mob/living/carbon/human/H = M
	if(istype(H))
		var/obj/item/organ/external/affected = H.get_organ(user.zone_sel.selecting)
		if(!affected)
			user << "<span class='danger'>\The [H] is missing that limb!</span>"
			return
		else if(affected.robotic >= ORGAN_ROBOT)
			user << "<span class='danger'>You cannot inject a robotic limb.</span>"
			return

		user.setClickCooldown(DEFAULT_QUICK_COOLDOWN)
		user.do_attack_animation(M)
		user << "<span class='notice'>You inject [M] with [src].</span>"
		M << "<span class='notice'>You feel a tiny prick!</span>"

		if(M.reagents)
			var/contained = reagentlist()
			var/trans = reagents.trans_to_mob(M, amount_per_transfer_from_this, CHEM_BLOOD)
			admin_inject_log(user, M, src, contained, trans)
			user << "<span class='notice'>[trans] units injected. [reagents.total_volume] units remaining in \the [src].</span>"

		return

/obj/item/weapon/reagent_containers/syrette/promedolum
	name = "promedolum syrette"

	New()
		..()
		reagents.add_reagent("morphine", 2)
		reagents.add_reagent("methylphenidate", 1)
		reagents.add_reagent("tramadol", 2)


