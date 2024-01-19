// jojoel
/obj/machinery/computer/arcade/tetris/prizevend(usr, reward_count)
	if(prob(1))
		playsound(src, 'modular_splurt/sound/misc/GOT_TETRIS.ogg', 50, FALSE, extrarange = -3)
	. = ..()
