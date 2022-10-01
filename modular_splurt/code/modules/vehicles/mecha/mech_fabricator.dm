/obj/machinery/mecha_part_fabricator/Initialize(mapload)
	var/list/extra_part_sets = list(
		"IPC Organs",
		"Prosthetics",
		"Savannah-Ivanov"
	)
	LAZYADD(part_sets, extra_part_sets)
	. = ..()
