// Function for updating back sprites
/mob/living/carbon/human/update_inv_back()
	. = ..()
	
	// Check for hidden backpack trait
	if(HAS_TRAIT(src, TRAIT_HIDE_BACKPACK))		
		// Define back overlays
		var/mutable_appearance/back_overlay = overlays_standing[BACK_LAYER]
		
		// Check for existing overlay
		if(back_overlay)
			// Remove overlays
			remove_overlay(BACK_LAYER)
