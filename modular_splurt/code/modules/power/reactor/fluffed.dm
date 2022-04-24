/*
This is a pre-destroyed nuclear reactor for the sake of mapping special fluff stuff.
Not actually a reactor, just uses the icon and irradiates the surrounding area a bit.
Nowhere else to really put this.
*/

/obj/structure/fluff/destroyed_nuclear_reactor
	name = "Destroyed Nuclear Reactor"
	desc = "What in the hell happened here?"
	icon = 'modular_splurt/icons/obj/machinery/rbmk.dmi'
	icon_state = "reactor_slagged"
	pixel_x = -32
	pixel_y = -32
	density = FALSE
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | UNACIDABLE | ACID_PROOF | FREEZE_PROOF
	light_color = LIGHT_COLOR_CYAN
	dir = 8 //Less headache inducing :))

/obj/machinery/atmospherics/components/trinary/nuclear_reactor/Initialize()
	. = ..()
	set_light(3)
	AddComponent(/datum/component/radioactive, 15000 , src)
