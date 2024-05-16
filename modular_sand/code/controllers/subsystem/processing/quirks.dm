/datum/controller/subsystem/processing/quirks/AssignQuirks(mob/living/user, client/cli, spawn_effects, roundstart = FALSE, datum/job/job, silent = FALSE, mob/to_chat_target)
	. = ..()
	var/list/my_quirks = cli.prefs.all_quirks.Copy()
	var/list/cut_because_balance = check_and_cut_balance(my_quirks)
	if(LAZYLEN(cut_because_balance))
		to_chat(to_chat_target || user, span_boldwarning("Some quirks have been cut from your character due to invalid balance: [english_list(cut_because_balance)]"))
		log_admin("Quirks cut from [key_name(user)] due to balance: [english_list(cut_because_balance)]")

/// Code to automatically reduce positive quirks until balance is even.
/datum/controller/subsystem/processing/quirks/proc/check_and_cut_balance(list/our_quirks)
	var/list/cut = list()
	var/points_used = total_points(our_quirks)

	if(points_used > 0)
		//they owe us points, let's collect.
		for(var/i in our_quirks)
			var/points = quirk_points_by_name(i)
			if(points > 0)
				cut += i
				our_quirks -= i
				points_used -= points
			if(points_used <= 0)
				break

	return cut
