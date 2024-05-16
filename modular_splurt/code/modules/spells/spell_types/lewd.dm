/obj/effect/proc_holder/spell/targeted/lewd_chems
	name = "Cast Lewd Chems"
	desc = "Cast spells that will cause the target to feel the power of lewd chemistry."
	include_user = TRUE
	clothes_req = NONE
	invocation_type = "whisper"
	invocation = "Et invoco..."
	charge_max = 10 SECONDS
	cooldown_min = 5 SECONDS
	icon = 'modular_splurt/icons/obj/syringe.dmi'
	base_icon_state = "bombpen"
	sparks_amt = 10

/obj/effect/proc_holder/spell/targeted/lewd_chems/cast(list/targets, mob/user = usr)
	. = ..()

	var/list/datum/reagent/choices = list(
		"Crocin" = /datum/reagent/drug/aphrodisiac,
		"Hexacrocin" = /datum/reagent/drug/aphrodisiacplus,
		"Succubus milk" = /datum/reagent/fermi/breast_enlarger,
		"Incubus draft" = /datum/reagent/fermi/penis_enlarger,
		"Denbu Tincture" = /datum/reagent/fermi/butt_enlarger,
		"Belladine nectar" = /datum/reagent/fermi/belly_inflator,
		"Prospacillin" = /datum/reagent/growthchem
	)
	var/datum/reagent/chem = input(user, "What chemical do you want to use?", "Lewd Chems") as null|anything in choices + "All of the above"
	if(!chem)
		return

	for(var/mob/living/carbon/C in targets)
		if(!choices.Find(chem))
			for(var/reagent in choices - "Hexacrocin")
				C.reagents.add_reagent(choices[reagent], 10)
		else
			C.reagents.add_reagent(choices[chem], 30)
