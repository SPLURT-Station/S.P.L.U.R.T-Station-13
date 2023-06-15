/datum/techweb_node/subdermal_implants/New()
	var/list/extra_designs = list(
		"implant_gfluid",
		"implant_slave",
		"implant_hide_backpack"
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
		"ci-medhud", // Removing and re-adding the HUDs to the list because
		"ci-sechud", // the positioning bothers my pattern-seeking mind
		"ci-power-cord"
	)
	var/list/added_designs = list(
		"ci-medhud",
		"ci-sechud",
		"ci-diaghud"
	)
	LAZYREMOVE(design_ids, removed_designs)
	LAZYADD(design_ids, added_designs)
	. = ..()

/datum/techweb_node/alien_cyber_organs
	id = "alien_cyber_organs"
	display_name = "Alien Cybernetic Organs"
	description = "Morally dubious experimental parts."
	prereq_ids = list("cyber_organs", "alien_surgery")
	design_ids = list("ci-hypnoeyes")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 1000)
