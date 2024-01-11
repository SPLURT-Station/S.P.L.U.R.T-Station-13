/atom
	var/mutable_appearance/cum_splatter_icon

/atom/log_message(message, message_type, color=null, log_globally=TRUE) //This is only a "temporal" measure until cit and tg decide to fix their shit
	if(!log_globally)
		return

	var/log_text = "[key_name(src)] [message] [loc_name(src)]"
	switch(message_type)
		if(LOG_VICTIM)
			log_victim(log_text)
			return

	. = ..()

