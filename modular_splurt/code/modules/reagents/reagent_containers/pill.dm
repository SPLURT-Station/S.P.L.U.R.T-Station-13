//Main code edits
/obj/item/reagent_containers/pill/breast_enlargement
	icon = 'modular_splurt/icons/obj/chemical.dmi'
	icon_state = "pill_lewd"

/obj/item/reagent_containers/pill/butt_enlargement
	icon = 'modular_splurt/icons/obj/chemical.dmi'
	icon_state = "pill_lewd"

//Own stuff
/obj/item/reagent_containers/pill/lsdpsych
	name = "antipsychotic pill"
	desc = "Talk to your healthcare provider immediately if hallucinations worsen or new hallucinations emerge."
	icon_state = "pill14"
	list_reagents = list(/datum/reagent/toxin/mindbreaker = 5)

/obj/item/reagent_containers/pill/happinesspsych
	name = "mood stabilizer pill"
	desc = "Used to temporarily alleviate anxiety and depression, take only as prescribed."
	icon_state = "pill_happy"
	list_reagents = list(/datum/reagent/drug/happiness = 5)

/obj/item/reagent_containers/pill/paxpsych
	name = "pacification pill"
	desc = "Used to temporarily suppress violent, homicidal, or suicidal behavior in patients."
	list_reagents = list(/datum/reagent/pax = 5)
	icon_state = "pill12"

/obj/item/reagent_containers/pill/anal_allure
	name = "anal allure pill"
	desc = "Significantly increases arousal gain from stimulation to the user's anus."
	list_reagents = list(/datum/reagent/drug/genital_stimulator/anal_allure = 5)
	icon_state = "pill15"

/obj/item/reagent_containers/pill/breast_buzzer
	name = "breast buzzer pill"
	desc = "Significantly increases arousal gain from stimulation to the user's breasts."
	list_reagents = list(/datum/reagent/drug/genital_stimulator/breast_buzzer = 5)
	icon_state = "pill15"

/obj/item/reagent_containers/pill/vaginal_vigour
	name = "vaginal vigour pill"
	desc = "Significantly increases arousal gain from stimulation to the user's vagina."
	list_reagents = list(/datum/reagent/drug/genital_stimulator/vaginal_vigour = 5)
	icon_state = "pill15"

/obj/item/reagent_containers/pill/peen_pop
	name = "peen pop pill"
	desc = "Significantly increases arousal gain from stimulation to the user's penis."
	list_reagents = list(/datum/reagent/drug/genital_stimulator/peen_pop = 5)
	icon_state = "pill15"

/obj/item/reagent_containers/pill/PEsmaller
	name = "penis reduction pill"
	desc = "Causes atrophy of the penis."
	list_reagents = list(/datum/reagent/fermi/PEsmaller = 5)
	icon_state = "pill19"

/obj/item/reagent_containers/pill/BEsmaller
	name = "breast reduction pill"
	desc = "Causes atrophy of the mammary glands."
	list_reagents = list(/datum/reagent/fermi/BEsmaller = 5)
	icon_state = "pill19"
