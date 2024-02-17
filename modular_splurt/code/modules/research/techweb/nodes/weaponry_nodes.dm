//MODULAR SPLURT CHANGES OF ALREADY EXISTING NODES
/datum/techweb_node/adv_weaponry/New()
	var/list/extra_designs = list(
		"pin_electronic",
	)
	LAZYADD(design_ids, extra_designs)
	. = ..()
