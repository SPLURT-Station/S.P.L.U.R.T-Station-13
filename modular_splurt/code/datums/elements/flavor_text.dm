/datum/element/flavor_text/Attach(datum/target, text = "", _name = "Flavor Text", _addendum, _max_len = MAX_FLAVOR_LEN, _always_show = FALSE, _edit = TRUE, _save_key, _examine_no_preview = FALSE, _show_on_naked)
	. = ..()
	if(flavor_name == "OOC Notes") //SPLURT EDIT make it so ooc notes are always visible
		always_show = TRUE

