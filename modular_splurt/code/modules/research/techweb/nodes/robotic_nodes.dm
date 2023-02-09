/datum/techweb_node/neural_programming
	design_ids = list("impant_radio")

/datum/techweb_node/ai/New()
	var/extra_designs = list(
		"slut_module",
		"shebang_module",
		"milker_module",
		"vore_pred_module"
	)
	LAZYADD(design_ids, extra_designs)
	. = ..()
