/datum/techweb_node/subdermal_implants/New()
	var/list/extra_designs = list(
		"implant_gfluid",
		"implant_slave"
	)
	LAZYADD(design_ids, extra_designs)
	. = ..()

/datum/techweb_node/basic_cyber_organs/New()
	var/list/extra_designs = list(
		"ipc_heart",
		"ipc_lungs",
		"ipc_liver",
		"ipc_stomach",
		"ipc_eyes",
		"ipc_ears",
		"ipc_tongue",
		"ipc_brain",
		"ci-power-cord"
	)
	LAZYADD(design_ids, extra_designs)
	. = ..()

/datum/techweb_node/cyber_implants/New()
	var/list/removed_designs = list(
		"ci-power-cord"
	)
	LAZYREMOVE(design_ids, removed_designs)
	. = ..()
