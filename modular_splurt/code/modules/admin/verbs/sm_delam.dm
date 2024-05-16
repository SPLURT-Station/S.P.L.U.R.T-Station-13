/client/proc/override_sm_delam()
	set category = "Admin.Fun"
	set name = "Toggle SM delam"
	set desc = "Toggles this round's SM delam mode."

	switch(GLOB.delam_override)
		if(TRUE)
			GLOB.delam_override = FALSE
		if(FALSE)
			GLOB.delam_override = null
		else
			GLOB.delam_override = TRUE

	log_admin("[key_name(usr)] [isnull(GLOB.delam_override) ? "reset the SM delam to follow the config's rules. It is [check_sm_delam() ? "ON" : "OFF"]" : "has forced the SM delam [GLOB.delam_override ? "ON" : "OFF"]"] for the round.")
	message_admins("[ADMIN_LOOKUPFLW(usr)] [isnull(GLOB.delam_override) ? "reset the SM delam to follow the config's rules. It is [check_sm_delam() ? "ON" : "OFF"]" : "has forced the SM delam [GLOB.delam_override ? "ON" : "OFF"]"] for the round.")
