/client/check_ip_intel()
	. = ..()
	if(!(ip_intel != initial(ip_intel) && ip_intel >= CONFIG_GET(number/ipintel_rating_bad)))
		uses_vpn = FALSE
		return .

	uses_vpn = TRUE //Puts the vpn flag on the player playtimes

	//Kicks them automatically if 100% sure and they're not whitelisted
	if(!CONFIG_GET(flag/kick_vpn) || ip_intel < 1)
		return .
	var/list/whitelist = CONFIG_GET(multi_keyed_flag/vpn_bypass)
	if(whitelist.Find(ckey(ckey)))
		log_admin("[key_name(src)] was allowed to join although they're using a vpn")
		return .

	to_chat(src, span_danger("You have been kicked from the server because your IP has been flagged as a VPN. \
	Please turn it off in order to connect or contact staff in case this is an error."))
	var/logg = "[key_name(src)] kicked for failing the vpn check."
	log_admin(logg)
	message_admins(span_adminnotice(logg))
	qdel(src)

/client/proc/toggle_quirk(mob/living/carbon/human/H)
	if (!istype(H))
		to_chat(usr, "This can only be used on /mob/living/carbon/human.")
		return

	var/list/options = list("Clear"="Clear")
	for(var/x in subtypesof(/datum/quirk))
		var/datum/quirk/T = x
		var/qname = initial(T.name)
		options[H.has_quirk(T) ? "[qname] (Remove)" : "[qname] (Add)"] = T

	var/result = tgui_input_list(usr, "Choose quirk to add/remove", "Mob Quirks", options) // input(usr, "Choose quirk to add/remove","Quirk Mod") as null|anything in options

	if(QDELETED(H))
		to_chat(usr, "Mob doesn't exist anymore")
		return

	if(result)
		if(result == "Clear")
			for(var/datum/quirk/q in H.roundstart_quirks)
				H.remove_quirk(q.type)
		else
			var/T = options[result]
			if(H.has_quirk(T))
				H.remove_quirk(T)
			else
				H.add_quirk(T,TRUE)

/client/proc/toggle_spell(mob/M)
	var/list/options = list("Clear"="Clear")
	for(var/x in GLOB.spells)
		var/obj/effect/proc_holder/spell/spell = x
		var/spell_name = initial(spell.name)
		options[M.has_spell(spell) ? "[spell_name] (Remove)" : "[spell_name] (Add)"] = spell

	var/spell_to_modify = tgui_input_list(usr, "Choose spell to add/remove", "Mob Spells", options) // input(usr, "Choose quirk to add/remove","Quirk Mod") as null|anything in options

	if(QDELETED(M))
		to_chat(usr, "Mob doesn't exist anymore")
		return

	if(spell_to_modify)
		if(spell_to_modify == "Clear")
			if (!M.mind)
				return
			for(var/obj/effect/proc_holder/spell/S in M.mind.spell_list)
				M.mind.RemoveSpell(S.type)
		else
			var/T = options[spell_to_modify]
			if(M.has_spell(T))
				M.mind.RemoveSpell(T)
			else
				if (M.mind)
					M.mind.AddSpell(new T)
				else
					M.AddSpell(new T)
					message_admins("<span class='danger'>Spells given to mindless mobs will not be transferred in mindswap or cloning!</span>")

/client/proc/teach_martial_art(mob/living/carbon/C)
	if (!istype(C))
		to_chat(usr, "This can only be used on /mob/living/carbon.")
		return

	var/list/artpaths = subtypesof(/datum/martial_art)
	var/list/artnames = list()
	for(var/i in artpaths)
		var/datum/martial_art/M = i
		artnames[initial(M.name)] = M
	var/result = tgui_input_list(usr, "Choose the martial art to teach", "JUDO CHOP", artnames) // input(usr, "Choose the martial art to teach","JUDO CHOP") as null|anything in artnames

	if(QDELETED(C))
		to_chat(usr, "Mob doesn't exist anymore")
		return
	if(result)
		var/chosenart = artnames[result]
		var/datum/martial_art/MA = new chosenart
		MA.teach(C)
		log_admin("[key_name(usr)] has taught [MA] to [key_name(C)].")
		message_admins("<span class='notice'>[key_name_admin(usr)] has taught [MA] to [key_name_admin(C)].</span>")

/client/proc/set_species(mob/living/carbon/human/H)
	if (istype(H))
		var/result = tgui_input_list(usr, "Choose a new species","Species", GLOB.species_list)
		if(QDELETED(H))
			to_chat(usr, "Mob doesn't exist anymore")
			return
		if(result)
			admin_ticket_log("[key_name_admin(usr)] has modified the bodyparts of [H] to [result]")
			H.set_species(GLOB.species_list[result])
