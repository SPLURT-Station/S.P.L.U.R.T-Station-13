/obj/item/implant/resleeving
	name = "resleeving implant"
	desc = "A mindstate backup implant that occasionally stores a copy of one's mind on a central server for backup purposes."
	uses = 1
	var/datum/mind/associated_mind

/obj/item/implant/resleeving/examine(mob/user)
	. = ..()
	if(associated_mind)
		. += "It currently holds <b>[associated_mind.name]</b>'s mind."
	else
		. += "It has no mind backup."

/obj/item/implant/resleeving/implant(mob/living/target, mob/user, silent, force)
	. = ..()
	if((uses > 0) && !associated_mind && target.mind)
		associated_mind = target.mind
		RegisterSignal(associated_mind, COMSIG_PARENT_QDELETING, .proc/associated_mind_deleted)
		uses--

/obj/item/implant/resleeving/Destroy()
	associated_mind = null
	return ..()

/obj/item/implant/resleeving/proc/associated_mind_deleted()
	SIGNAL_HANDLER

	UnregisterSignal(associated_mind, COMSIG_PARENT_QDELETING)
	associated_mind = null

/obj/item/implant/resleeving/proc/kill_associated_mind()
	if(associated_mind)
		associated_mind_deleted()
