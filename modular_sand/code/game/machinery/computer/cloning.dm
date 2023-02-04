// Proc for scanning a mob in a cloning machine
/obj/machinery/computer/cloning/can_scan(datum/dna/dna, mob/living/mob_occupant, experimental = FALSE, datum/bank_account/account)
	// Check for DNC Order quirk
	if(HAS_TRAIT(mob_occupant, TRAIT_DNC_ORDER))
		// Set scan failure reason
		scantemp = "Subject has an active DNC order on file. Further operations terminated."

		// Play error sound
		playsound(src, 'sound/machines/terminal_prompt_deny.ogg', 50, 0)

		// Return without scanning
		return

	// Return normally
	. = ..()
