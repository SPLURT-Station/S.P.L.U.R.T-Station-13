/obj/docking_port/get_save_vars()
	return list("pixel_x", "pixel_y", "dir", "name", "req_access", "req_access_txt", "piping_layer", "color", "icon_state", "pipe_color", "amount", "width", "height", "dwidth", "dheight")

/obj/docking_port/mobile
	movement_force = list("KNOCKDOWN" = 8, "THROW" = 6)
