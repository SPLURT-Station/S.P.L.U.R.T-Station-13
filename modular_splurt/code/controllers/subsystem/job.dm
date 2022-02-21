/**
 * Some modifications to the jobs subsystem, courtesy of SandPoot.
 * If we pull from upstream we should have this somewhere at some point, so it's shoehorned
 * in here for the moment.
 * SandPoot made it a proc in general, but I'm making it part of SSjobs because I like namespaces. Cope.
 */

/datum/controller/subsystem/job/proc/get_job_name(job_name)
	if (!job_name)
		return "Unknown"	// Invalid job
	var/all_alt_titles = get_all_alt_titles()
	if (job_name in all_alt_titles)						// Check if the name is an alt title
		return get_job_name(all_alt_titles[job_name])	// Locate the original job title and return it
	if (job_name in get_all_job_icons())				// Check if the job has a HUD icon
		return job_name
	if (job_name in get_all_centcom_jobs())				// Return the NT logo if it is a CentCom job
		return "CentCom"
	return "Unknown"									// Return unknown if none of the above apply
