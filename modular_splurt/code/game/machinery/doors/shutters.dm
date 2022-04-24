/obj/machinery/door/poddoor/shutters/radiation
	rad_insulation = RAD_NEAR_FULL_INSULATION

/obj/machinery/door/poddoor/shutters/radiation/preopen
	opacity = FALSE
	rad_insulation = RAD_NO_INSULATION

/obj/machinery/door/poddoor/shutters/radiation/open()
	. = ..()
	rad_insulation = RAD_NO_INSULATION

/obj/machinery/door/poddoor/shutters/radiation/close()
	. = ..()
	rad_insulation = RAD_NEAR_FULL_INSULATION
