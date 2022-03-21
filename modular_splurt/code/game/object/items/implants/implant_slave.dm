/obj/item/implant/slave
	name = "slave implant"
	desc = "Turns criminals into security's new pet."
	resistance_flags = INDESTRUCTIBLE
	activated = 0

/obj/item/implant/slave/get_data()
	var/dat = {"<b>Implant Specifications:</b><BR>
				<b>Name:</b> Alternative Criminal Reassignment Implant<BR>
				<b>Life:</b> Ten years.<BR>
				<b>Important Notes:</b> Incompatible with mindshield-class implants. Implant should be reserved for criminal punishment only. Recreational use is heavily frowned upon.<BR>
				<HR>
				<b>Implant Details:</b><BR>
				<b>Function:</b> Overrides the host's mental functions with an innate desire to serve security personnel, obeying nearly any command.<BR>
				<b>Special Features:</b> Will cure, but not block most other forms of brainwashing.<BR>
				<b>Integrity:</b> Implant will last so long as the implant remains within the host."}
	return dat


/obj/item/implant/slave/implant(mob/living/target, mob/user, silent = FALSE)
	if(..())
		if(!target.mind)
			return FALSE //Can't be a pet without having a mind!

		if(target.mind.has_antag_datum(/datum/antagonist/brainwashed))
			target.mind.remove_antag_datum(/datum/antagonist/brainwashed)

		if(target.mind.has_antag_datum(/datum/antagonist/rev/head) || target.mind.unconvertable || target.mind.assigned_role == "Security Officer" || target.mind.assigned_role == "Detective" || target.mind.assigned_role == "Warden" || target.mind.assigned_role == "Head of Security" || HAS_TRAIT(target, TRAIT_MINDSHIELD))
			if(!silent)
				if(target.mind.assigned_role == "Security Officer" || target.mind.assigned_role == "Detective" || target.mind.assigned_role == "Warden" || target.mind.assigned_role == "Head of Security")
					target.visible_message("<span class='warning'>[target] seems to resist the implant! You can't enslave a member of security!</span>", "<span class='warning'>You feel something interfering with your mental conditioning, but you resist it!</span>")
				else
					target.visible_message("<span class='warning'>[target] seems to resist the implant!</span>", "<span class='warning'>You feel something interfering with your mental conditioning, but you resist it!</span>")
			var/obj/item/implanter/I = loc
			removed(target, 1)
			qdel(src)
			if(istype(I))
				I.imp = null
				I.update_icon()
			return FALSE

		var/datum/antagonist/gang/gang = target.mind.has_antag_datum(/datum/antagonist/gang)
		var/datum/antagonist/rev/rev = target.mind.has_antag_datum(/datum/antagonist/rev)
		if(rev)
			rev.remove_revolutionary(FALSE, user)
		if(gang)
			target.mind.remove_antag_datum(/datum/antagonist/gang)
		if(!silent)
			if(target.mind in SSticker.mode.cult)
				to_chat(target, "<span class='warning'>You feel something interfering with your mental conditioning, but you resist it!</span>")
			else
				to_chat(target, "<span class='notice'>You feel a sense of peace and security. You are now enslaved!</span>")
		var/slave_objective = "[((target.client?.prefs.cit_toggles & HYPNO)?"Security has enslaved you into being their pet! Obey their commands, but remember: a good pet is not violent.":"You've been neutralized by security! Follow their orders, but remember: neutralization also means nonviolence.")]"
		brainwash(target, slave_objective)
		target.sec_hud_set_implants()
		return TRUE
	return FALSE

/obj/item/implant/slave/removed(mob/target, silent = FALSE, special = 0)
	if(..())
		if(isliving(target))
			var/mob/living/L = target
			target.mind.remove_antag_datum(/datum/antagonist/brainwashed)
			L.sec_hud_set_implants()
		if(target.stat != DEAD && !silent)
			to_chat(target, "<span class='boldnotice'>Your mind suddenly feels free from burden. You are no longer enslaved!</span>")
		return 1
	return 0

/obj/item/implanter/slave
	name = "implanter (slave)"
	imp_type = /obj/item/implant/slave

/obj/item/implantcase/slave
	name = "implant case - 'Slave'"
	desc = "A glass case containing a slave implant."
	imp_type = /obj/item/implant/slave
