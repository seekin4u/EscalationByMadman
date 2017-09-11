#define WHITELISTFILE "data/whitelist.txt"

var/list/whitelists = list()

/client/proc/manage_whitelists()
	set category = "Admin"
	set name = "Manage whitelist"
	if(!check_rights(R_SERVER))	return

	var/option = input("Options", "Options") in list("Check", "Reload", "Add key", "Remove key", "Add group", "Remove group", "Sync groups", "Debug", "Cancel")

	switch(option)
		if("Check")
			src << "Check white lists. BEGIN."
			for(var/group in whitelists)
				var/datum/whitelist/WL = whitelists[group]
				src << "Group: [WL.name]"
				for(var/key in WL.members)
					src << "   - [key]"
			src << "Check white lists. END."

		if("Reload")
			load_whitelist()

		if("Add key")
			var/group = input("Select WL group", "Whitelist group") as null|anything in whitelists
			if(!group)
				return

			var/datum/whitelist/W = whitelists[group]

			var/key = ckey(input("Type in ckey for adding", "CKEY") as text)
			W.members += key
			if(key in W.members)
				src << "<span class='notice'>Successfully Add \"[key]\" in \"[W.name]\" WL group!</span>"
			else
				src << "<span class='warning'>Something wrong.</span>"

		if("Remove key")
			var/group = input("Select WL group", "Whitelist group") as null|anything in whitelists
			if(!group)
				return
			var/datum/whitelist/W = whitelists[group]
			var/key = input("Select Key for removing", "Key") as null|anything in W.members
			if(key)
				W.members.Remove(key)
			if(!key in W.members)
				src << "<span class='notice'>Successfully Remove \"[key]\" in \"[W.name]\" WL group!</span>"
			else
				src << "<span class='warning'>Something wrong.</span>"

		if("Add group")
			var/group_name = input("New group name", "Group name") as null|text
			if(!group_name)
				return

			if(group_name in whitelists)
				src << "<span class='warning'>There is already exist group with name [group_name]!</span>"
				return
			whitelists[group_name] = new/datum/whitelist(group_name)

		if("Remove group")
			var/group_name = input("Which group you wanna remove?", "Group name") in whitelists
			qdel(whitelists[group_name])
			whitelists.Remove(group_name)

		if("Sync groups")
			for(var/datum/job/J in job_master.occupations)
				if(!J.whitelist_group in whitelists)
					whitelists[J.whitelist_group] = new/datum/whitelist(J.whitelist_group)

		if("Debug")
			var/group = input("Select group for debug") as null|anything in whitelists
			if(group)
				debug_variables(whitelists[group])

/datum/whitelist
	var/name = null
	var/list/members = list()

/datum/whitelist/New(var/new_name)
	name = new_name

/proc/load_whitelist()
	for(var/item in whitelists)
		qdel(whitelists[item])
		whitelists.Remove(item)

	var/list/lines = file2list(WHITELISTFILE)
	var/datum/whitelist/WL = null
	for(var/line in lines)
		if(length(line) <= 3)
			continue
		if(copytext(line,1,2) != "-")
			var/group = ckey(line)
			WL = new(group)
			whitelists[group] = WL
		else
			if(!WL)
				world.log << "WHILTELIST: key without group! key: [line]."
				continue
			WL.members += ckey(copytext(line,2))

/hook/startup/proc/loadWhitelist()
	if(config.usewhitelist)
		load_whitelist()
	return 1

/proc/check_whitelist(ckey, whitelist_group)
	if(!whitelists)
		return 0
	if(!whitelist_group)
		return 1

	var/datum/whitelist/G = whitelists[whitelist_group]
	if(!G)
		world << "There is no WL with group [whitelist_group]."
		return 0

	return ckey in G.members

/var/list/alien_whitelist = list()

/hook/startup/proc/loadAlienWhitelist()
	if(config.usealienwhitelist)
		if(config.usealienwhitelistSQL)
			if(!load_alienwhitelistSQL())
				world.log << "Could not load alienwhitelist via SQL"
		else
			load_alienwhitelist()
	return 1

/proc/load_alienwhitelist()
	var/text = file2text("config/alienwhitelist.txt")
	if (!text)
		log_misc("Failed to load config/alienwhitelist.txt")
		return 0
	else
		alien_whitelist = splittext(text, "\n")
		return 1

/proc/load_alienwhitelistSQL()
	var/DBQuery/query = dbcon_old.NewQuery("SELECT * FROM whitelist")
	if(!query.Execute())
		world.log << dbcon_old.ErrorMsg()
		return 0
	else
		while(query.NextRow())
			var/list/row = query.GetRowData()
			if(alien_whitelist[row["ckey"]])
				var/list/A = alien_whitelist[row["ckey"]]
				A.Add(row["race"])
			else
				alien_whitelist[row["ckey"]] = list(row["race"])
	return 1

/proc/is_species_whitelisted(mob/M, var/species_name)
	var/datum/species/S = all_species[species_name]
	return is_alien_whitelisted(M, S)

//todo: admin aliens
/proc/is_alien_whitelisted(mob/M, var/species)
	if(!M || !species)
		return 0
	if(!config.usealienwhitelist)
		return 1
	if(check_rights(R_ADMIN, 0, M))
		return 1

	if(istype(species,/datum/language))
		var/datum/language/L = species
		if(!(L.flags & (WHITELISTED|RESTRICTED)))
			return 1
		return whitelist_lookup(L.name, M.ckey)

	if(istype(species,/datum/species))
		var/datum/species/S = species
		if(!(S.spawn_flags & (IS_WHITELISTED|IS_RESTRICTED)))
			return 1
		return whitelist_lookup(S.get_bodytype(), M.ckey)

	return 0

/proc/whitelist_lookup(var/item, var/ckey)
	if(!alien_whitelist)
		return 0

	if(config.usealienwhitelistSQL)
		//SQL Whitelist
		if(!(ckey in alien_whitelist))
			return 0;
		var/list/whitelisted = alien_whitelist[ckey]
		if(lowertext(item) in whitelisted)
			return 1
	else
		//Config File Whitelist
		for(var/s in alien_whitelist)
			if(findtext(s,"[ckey] - [item]"))
				return 1
			if(findtext(s,"[ckey] - All"))
				return 1
	return 0

#undef WHITELISTFILE
