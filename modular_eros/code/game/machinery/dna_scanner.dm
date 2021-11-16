/obj/machinery/dna_scannernew/proc/insert_mind(datum/mind/inserted_mind, obj/item/implant/resleeving/inserted_implant, mob/user)
	var/mob/living/carbon/carbon_occupant = occupant
	if(!istype(carbon_occupant))
		return

	if(carbon_occupant.mind)
		to_chat(carbon_occupant, "<span class='userdanger'>You feel your mind being overwritten...</span>")
		log_combat(user, carbon_occupant, "replaced mind of", addition = "replaced with [inserted_mind.key]")
		carbon_occupant.ghostize(FALSE)
	inserted_mind.transfer_to(carbon_occupant, TRUE)
	to_chat(carbon_occupant, "<span class='userdanger'>Holy shit, i live again!</span>")
	inserted_implant.kill_associated_mind()
