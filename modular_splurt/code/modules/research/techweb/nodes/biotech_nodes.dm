/datum/techweb_node/biotech/New()
	design_ids += "sex_research"
	. = ..()

/datum/techweb_node/memoryscanner
	id = "memory_scanner"
	display_name = "Memory Scanner"
	description = "An illegal xenotech used to scan minds for unknown purposes... now it's mostly used to steal bank account info."
	prereq_ids = list("alien_bio", "syndicate_basic")
	design_ids = list("memory_scanner")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 30000)
	hidden = TRUE
