/mob/verb/hide_under_tables()
	set name = "Hide under tables"
	set category = "IC"

	var/datum/component/table_fiend = GetComponent(/datum/component/table_fiend)
	if(table_fiend)
		qdel(table_fiend)
		to_chat(src, span_notice("You stop hiding under the tables."))
		return

	var/obj/structure/table/table = locate() in loc
	if(!table)
		to_chat(src, span_warning("There are no tables to hide under here!"))
		return

	if(!lying || !resting)
		to_chat(src, span_warning("You need to be intentionally lying down to hide under tables!"))
		return

	AddComponent(/datum/component/table_fiend)
	to_chat(src, span_notice("You start hiding under the tables."))
