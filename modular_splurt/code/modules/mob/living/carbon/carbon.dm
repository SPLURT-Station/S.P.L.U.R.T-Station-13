/mob/living/carbon/is_muzzled()
	return ..() || istype(wear_mask, /obj/item/clothing/mask/gas/sechailer/slut)

/mob/living/carbon/verb/open_genital_manager()
	set category = "IC"
	set name = "Open genital manager"
	set desc = "Opens the genital management menu."

	if(!genital_manager)
		genital_manager = new()

	genital_manager.ui_interact(src)
