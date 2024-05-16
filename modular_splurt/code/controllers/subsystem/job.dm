/datum/controller/subsystem/job/build_jobnames()
	. = ..()

	// SPLURT Edit
	// Syndicate jobs are not in occupations either, but we need to handle them anyway
	for(var/title in get_all_syndicate_jobs())
		.[title] = "Syndicate" //Return with the Syndicate logo if it is a Syndicate job
