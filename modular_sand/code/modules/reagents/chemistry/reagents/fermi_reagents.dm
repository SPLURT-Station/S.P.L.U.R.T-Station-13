// Plushmium object reaction
/datum/reagent/fermi/plushmium/reaction_obj(obj/O, reac_volume)
	// Check for Saliith plush
	if(istype(O, /obj/item/toy/plush/lizardplushie/saliith))
		// Check if a carbon user exists
		if((!usr) || (!iscarbon(usr)))
			// Return without any effects
			return

		// Warn in local chat
		O.loc.visible_message(span_warning("[src] is sprayed with a strange chemical, and reacts with overwhelming hostility! [usr] is sprayed with a concoction of horrible chemicals!"))

		// Define user mob
		var/mob/living/carbon/human/spray_user = usr

		// Add chemicals
		spray_user.reagents.add_reagent(/datum/reagent/toxin/mutagen, 20)
		spray_user.reagents.add_reagent(/datum/reagent/toxin/mindbreaker, 20)
		spray_user.reagents.add_reagent(/datum/reagent/toxin/mutetoxin, 20)
		//spray_user.reagents.add_reagent(/datum/reagent/toxin/histamine, 30)
		spray_user.reagents.add_reagent(/datum/reagent/toxin/bonehurtingjuice, 30)
		spray_user.reagents.add_reagent(/datum/reagent/toxin/brainhurtingjuice, 30)

		// Return without further effects
		return

	// Return normally
	. = ..()
