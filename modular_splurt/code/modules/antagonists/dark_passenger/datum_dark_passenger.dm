/datum/antagonist/dark_passenger
	name = "Dark Passenger"
	job_rank = ROLE_TRAITOR

/datum/antagonist/dark_passenger/greet()
	to_chat(owner, span_warning("You feel the intrusive thoughts taking over your mind..."))
	to_chat(owner, span_boldwarning("Ahelp IMMEDIATELY if you got this antag in any way that wasn't through admin intervention."))
	owner.announce_objectives()
	antag_memory += "I just know there's something dark in me. I hide it. I certainly don't talk about it. But it's there. Always. This 'Dark Passenger.' And when he's driving, I feel...alive. Half sick with the thrill of complete wrongness. I don't fight him. I don't want to."

/datum/antagonist/dark_passenger/farewell()
	to_chat(owner, span_warning("The intrusive thoughts begin to fade away..."))

