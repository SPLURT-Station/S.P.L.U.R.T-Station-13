/datum/admins/Topic(href, href_list)
	. = ..()

	// Check for admin rights
	if(!check_rights(R_ADMIN))
		return

	// Check for blessed request
	if(href_list["blessed_request_permit"])
		// Locate target mob
		var/mob/living/target_mob = locate(href_list["blessed_request_target"])

		// Check if target mob exists
		if(!target_mob || !istype(target_mob))
			// Warn user and return
			to_chat(usr, span_boldwarning("Failed to grant the request due to an invalid mob!"))
			return

		// Locate altar
		var/obj/structure/fluff/divine/convertaltar/blessed_altar/target_object = locate(href_list["blessed_request_permit"])

		// Check if target exists
		if(!target_object)
			return

		// Define prayer type
		var/request_type = locate(href_list["blessed_request_type"])

		// Check if type exists
		if(!request_type)
			return

		// Accept request
		target_object.accept_request(target_mob,request_type)

		// Send admin notice
		message_admins("[key_name(usr)] granted a holy request for [request_type] from [ADMIN_LOOKUPFLW(target_mob)].")

		// Log admin action
		log_admin("[key_name(usr)] granted a holy request from [key_name(target_mob)] for [request_type]")
