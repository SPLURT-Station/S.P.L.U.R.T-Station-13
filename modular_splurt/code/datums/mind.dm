/datum/mind
	var/show_in_directory
	var/directory_tag
	var/directory_erptag
	var/directory_ad
	var/ooc_notes
	var/flavor_text
	var/silicon_flavor_text

/mob/living/mind_initialize()
	. = ..()
	if(client?.prefs)
		mind.show_in_directory = client?.prefs.show_in_directory
		mind.directory_tag = client?.prefs.directory_tag
		mind.directory_erptag = client?.prefs.directory_erptag
		mind.directory_ad = client?.prefs.directory_ad
		mind.ooc_notes = client?.prefs.features["ooc_notes"]
		mind.flavor_text = client?.prefs.features["flavor_text"]
		mind.silicon_flavor_text = client?.prefs.features["silicon_flavor_text"]

/datum/mind/proc/remove_slaver()
	var/datum/antagonist/slaver/slaver = has_antag_datum(/datum/antagonist/slaver,TRUE)
	if(slaver)
		remove_antag_datum(slaver.type)
		special_role = null
