/datum/species/lizard
	// Reptilian humanoids with scaled skin and tails.
	name = "Anthropomorphic Lizard"
	id = SPECIES_LIZARD
	say_mod = "hisses"
	default_color = "00FF00"
	species_traits = list(MUTCOLORS,EYECOLOR,HAIR,FACEHAIR,LIPS,HORNCOLOR,WINGCOLOR,CAN_SCAR,HAS_FLESH,HAS_BONE)
	inherent_biotypes = MOB_ORGANIC|MOB_HUMANOID|MOB_REPTILE
	mutanttongue = /obj/item/organ/tongue/lizard
	mutanttail = /obj/item/organ/tail/lizard
	coldmod = 1.5
	heatmod = 0.67
	mutant_bodyparts = list("mcolor" = "0F0", "mcolor2" = "0F0", "mcolor3" = "0F0", "tail_lizard" = "Smooth", "mam_snouts" = "Round",
							 "horns" = "None", "frills" = "None", "spines" = "None", "mam_body_markings" = list(),
							  "legs" = "Digitigrade", "taur" = "None", "deco_wings" = "None")
	attack_verb = "claw"
	attack_sound = 'sound/weapons/slash.ogg'
	miss_sound = 'sound/weapons/slashmiss.ogg'
	meat = /obj/item/reagent_containers/food/snacks/meat/slab/human/mutant/lizard
	gib_types = list(/obj/effect/gibspawner/lizard, /obj/effect/gibspawner/lizard/bodypartless)
	skinned_type = /obj/item/stack/sheet/animalhide/lizard
	exotic_bloodtype = "L"
	exotic_blood_color = BLOOD_COLOR_LIZARD
	disliked_food = GRAIN | DAIRY
	liked_food = GROSS | MEAT
	inert_mutation = FIREBREATH
	languagewhitelist = list("Draconic") //Skyrat change - species language whitelist
	species_language_holder = /datum/language_holder/lizard

	tail_type = "tail_lizard"
	wagging_type = "waggingtail_lizard"
	species_category = SPECIES_CATEGORY_LIZARD
	wings_icons = SPECIES_WINGS_DRAGON

	ass_image = 'icons/ass/asslizard.png'

	family_heirlooms = list(
		/obj/item/toy/plush/lizardplushie
	)

/datum/species/lizard/random_name(gender,unique,lastname)
	if(unique)
		return random_unique_lizard_name(gender)

	var/randname = lizard_name(gender)

	if(lastname)
		randname += " [lastname]"

	return randname

/*
 Lizard subspecies: ASHWALKERS
*/
/datum/species/lizard/ashwalker
	name = "Ash Walker"
	id = SPECIES_ASHWALKER
	limbs_id = SPECIES_LIZARD
	species_traits = list(MUTCOLORS,EYECOLOR,LIPS,DIGITIGRADE,CAN_SCAR,HAS_FLESH,HAS_BONE)
	inherent_traits = list(TRAIT_CHUNKYFINGERS)
	mutantlungs = /obj/item/organ/lungs/ashwalker
	mutanteyes = /obj/item/organ/eyes/night_vision
	burnmod = 0.9
	brutemod = 0.9
	species_language_holder = /datum/language_holder/lizard/ash

/datum/species/lizard/ashwalker/on_species_gain(mob/living/carbon/human/C, datum/species/old_species)
	if((C.dna.features["spines"] != "None" ) && (C.dna.features["tail_lizard"] == "None")) //tbh, it's kinda ugly for them not to have a tail yet have floating spines
		C.dna.features["tail_lizard"] = "Smooth"
	if(C.dna.features["legs"] != "Digitigrade")
		C.dna.features["legs"] = "Digitigrade"
		for(var/obj/item/bodypart/leggie in C.bodyparts)
			if(leggie.body_zone == BODY_ZONE_L_LEG || leggie.body_zone == BODY_ZONE_R_LEG)
				leggie.update_limb(FALSE, C)
	if(C.dna.features["mam_snouts"] != "Sharp")
		C.dna.features["mam_snouts"] = "Sharp"
	C.dna.features["mcolor2"] = C.dna.features["mcolor"] //for no funne rainbows
	C.dna.features["mcolor3"] = C.dna.features["mcolor"]

	if(C.gender == MALE)
		C.dna.features["has_cock"] = TRUE
		C.dna.features["has_balls"] = TRUE
		C.dna.features["cock_color"] = "A50021"
		C.dna.features["cock_girth"] = 0.78 + (0.02 * rand(-4, prob(10) ? 5 : 1)) //chance for a bigger pleasure
		C.dna.features["cock_shape"] = "Tapered"
		C.dna.features["cock_length"] = 0.5 + rand(4, prob(10) ? 9 : 6) + rand()
		C.dna.features["balls_shape"] = "Hidden"
	else
		C.dna.features["has_vag"] = TRUE
		C.dna.features["has_womb"] = TRUE
		C.dna.features["vag_color"] = C.dna.features["mcolor"]
		C.dna.features["vag_shape"] = "Cloaca"
	C.give_genitals(1)
	C.update_body()
	return ..()
