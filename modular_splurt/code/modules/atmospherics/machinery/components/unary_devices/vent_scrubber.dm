//Currently unused as their qdeletion in tryStoredRoom causes runtimes (along with normal pipes).
/obj/machinery/atmospherics/components/unary/vent_scrubber/hilbertshotel

/obj/machinery/atmospherics/components/unary/vent_scrubber/hilbertshotel/Initialize()
	. = ..()
	addtimer(CALLBACK(src, .proc/turn_on), 3 SECONDS)

/obj/machinery/atmospherics/components/unary/vent_scrubber/hilbertshotel/proc/turn_on()
	on = TRUE
	update_appearance()

/obj/machinery/atmospherics/components/unary/vent_scrubber/hilbertshotel/layer3
	piping_layer = 3
	icon_state = "scrub_map-3"
