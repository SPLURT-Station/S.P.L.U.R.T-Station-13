/client/proc/cmd_admin_subtle_headset_message(mob/M, sender = null)
	if(!ismob(M))
		return
	if(!check_rights(R_ADMIN))
		return

	if (!sender)
		var/list/subtle_message_options = list("Voice in head", RADIO_CHANNEL_CENTCOM, RADIO_CHANNEL_SYNDICATE)
		sender = tgui_input_list(usr, "Choose the method of subtle messaging", "Subtle Message", subtle_message_options)
		if (!sender)
			return

	message_admins("[key_name_admin(src)] has started answering [ADMIN_LOOKUPFLW(M)]'s prayer / faction PM.")
	var/msg = input("Contents of the message", text("Subtle PM to [M.key]")) as text
	if (!msg)
		message_admins("[key_name_admin(src)] decided not to answer [ADMIN_LOOKUPFLW(M)]'s prayer / faction PM.")
		return

	if (sender == "Voice in head")
		to_chat(M, "<i>You hear a voice in your head... <b>[msg]</i></b>")
	else
		var/mob/living/carbon/human/H = M

		if(!istype(H))
			to_chat(usr, "The person you are trying to contact is not human. Unsent message: [msg]")
			return

		if(!istype(H.ears, /obj/item/radio/headset))
			to_chat(usr, "The person you are trying to contact is not wearing a headset. Unsent message: [msg]")
			return

		to_chat(H, "You hear something crackle in your ears for a moment before a voice speaks.  \"Please stand by for a message from [sender == RADIO_CHANNEL_SYNDICATE ? "your benefactor" : "Central Command"].  Message as follows[sender == RADIO_CHANNEL_SYNDICATE ? ", agent." : ":"] <span class='bold'>[msg].</span> Message ends.\"")


	log_admin("SubtlePM ([sender]): [key_name(usr)] -> [key_name(M)] : [msg]")
	msg = span_adminnotice("<b> SubtleMessage ([sender]): [key_name_admin(usr)] -> [key_name_admin(M)] :</b> [msg]")
	message_admins(msg)
	admin_ticket_log(M, msg)
	SSblackbox.record_feedback("tally", "admin_verb", 1, "Subtle Message") //If you are copy-pasting this, ensure the 2nd parameter is unique to the new proc!
