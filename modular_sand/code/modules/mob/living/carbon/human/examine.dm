#define PAIRLESS_PANTIES list(\
	/obj/item/clothing/underwear/briefs/jockstrap,\
	/obj/item/clothing/underwear/briefs/panties/thong,\
	/obj/item/clothing/underwear/briefs/panties/thong/babydoll,\
	/obj/item/clothing/underwear/briefs/mankini\
)

/mob/living/carbon/human/examine(mob/user)
	. = ..()
	if(!isliving(user))
		return

	var/mob/living/living = user
	var/obj/item/clothing/under/worn_uniform = w_uniform
	if((user != src) && !(living.mobility_flags & MOBILITY_STAND) && (mobility_flags & MOBILITY_STAND) && (src.loc == living.loc) && (istype(worn_uniform))) //SPLURT edit
		var/string = "Peeking under [src]'s [w_uniform], you can see "
		var/obj/item/clothing/underwear/worn_underwear = src.w_underwear
		if(worn_underwear)
			string += "a "
			if(!(worn_underwear.type in PAIRLESS_PANTIES)) //a pair of thong
				string += "pair of "
			if(worn_underwear.color)
				string += "<font color='[worn_underwear.color]'>[worn_underwear.name]</font>."
			else
				string += "[worn_underwear.name]."

			var/obj/item/organ/genital/penis/penis = getorganslot(ORGAN_SLOT_PENIS)
			var/obj/item/organ/genital/vagina/vagina = getorganslot(ORGAN_SLOT_VAGINA)
			if(penis?.aroused_state)
				string += span_love(" There's a visible bulge on it's front.")
			else if(vagina?.aroused_state)
				string += span_love(" They're wet with arousal.")

		else
			string += "[p_theyre()] not wearing anything! - [p_their()] "
			var/list/genitals = list()
			for(var/obj/item/organ/genital/genital in internal_organs)
				if(genital.genital_flags & (GENITAL_INTERNAL|GENITAL_HIDDEN))
					continue

				var/appended
				switch(genital.type)
					if(/obj/item/organ/genital/vagina)
						if(genital.aroused_state)
							appended += "wet "
						if(lowertext(genital.shape) != "human")
							appended += lowertext(genital.shape)
						if(lowertext(genital.shape) != "cloaca") //their wet cloaca pussy
							appended += " pussy"

					if(/obj/item/organ/genital/testicles)
						appended += "nuts"
					if(/obj/item/organ/genital/penis)
						if(genital.aroused_state)
							appended += "fully erect"
						if(lowertext(genital.shape) != "human")
							appended += ", [lowertext(genital.shape)]"
						if(appended)
							appended += " " //double spaces
						appended += "penis"
					else
						continue
				genitals += appended

			string += english_list(genitals, "featureless groin")
			string += " on full display."

		. += span_purple(string)

#undef PAIRLESS_PANTIES
