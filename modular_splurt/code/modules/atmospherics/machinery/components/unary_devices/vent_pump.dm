//Currently unused as their qdeletion in tryStoredRoom causes runtimes (along with normal pipes).
/obj/machinery/atmospherics/components/unary/vent_pump/hilbertshotel

/obj/machinery/atmospherics/components/unary/vent_pump/hilbertshotel/Initialize()
	. = ..()
	addtimer(CALLBACK(src, PROC_REF(turn_on)), 3 SECONDS)

/obj/machinery/atmospherics/components/unary/vent_pump/hilbertshotel/proc/turn_on()
	on = TRUE
	update_appearance()
