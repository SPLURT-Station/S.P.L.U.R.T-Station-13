// SPLURT Edit
/proc/get_syndicate_access(job) // This is for Syndicate titles. Admins do /NOT/ spawn the ID's themselves and instead use Agent IDs
	switch(job) //  so having them all on the same access doesn't make a difference.
		if("Syndicate Admiral")
			return get_all_centcom_access()
		if("Syndicate Sector Commander")
			return get_all_centcom_access()
		if("Syndicate Commander")
			return get_all_centcom_access()
		if("Syndicate Warship Pilot")
			return get_all_centcom_access()
		if("Syndicate Guest")
			return get_all_centcom_access()
		if("Syndicate Intelligence Officer")
			return get_all_centcom_access()
		if("Draconian Agent")
			return get_all_centcom_access()
		if("Syndie Bun") // RuizTheFish's Custom title. Don't ask, I needed suggestions and this was one of them.
			return get_all_centcom_access()
		if("Syndicate Admiral")
			return get_all_centcom_access()

// SPLURT Edit
/proc/get_all_syndicate_jobs()
	return list("Syndicate Admiral","Syndicate Sector Commander","Syndicate Warship Pilot","Syndicate Guest","Syndicate Intelligence Officer","Draconian Agent","Syndie Bun","Syndicate VIP","Gorlex Commander","Gorlex Operative","Cybersun Commander")
