/**
 * Table fiend component
 * Essentially, while this component is applied and the fiend is on a tile with some sort of table,
 * the layer of the fiend will be changed to be just under the table.
 * Every time the fiend moves, a check will be done to see if the component should be removed.
 */
/datum/component/table_fiend
	/// Original layer of the movable when the component was first applied
	var/original_layer = 0
	/// This is used so we don't accidentally remove the PASSTABLE flag from a movable that should pass tables by default
	var/already_passed_tables = FALSE

/datum/component/table_fiend/Initialize(atom/movable/fiend)
	if(!istype(fiend) || (fiend.layer < TABLE_LAYER))
		return COMPONENT_INCOMPATIBLE
	original_layer = fiend.layer
	already_passed_tables = fiend.pass_flags & PASSTABLE
	fiend.pass_flags |= PASSTABLE
	if(isliving(fiend))
		// we need to ensure living mobs won't suddenly stand up, that would be wack
		ADD_TRAIT(fiend, TRAIT_MOBILITY_NOREST, TABLE_FIEND_TRAIT)
	update_fiend()

/datum/component/table_fiend/Destroy(force, silent)
	var/atom/movable/fiend = parent
	fiend.layer = original_layer
	if(!already_passed_tables)
		fiend.pass_flags &= ~PASSTABLE
	if(isliving(fiend))
		// we no longer need the mob to be lying down
		REMOVE_TRAIT(fiend, TRAIT_MOBILITY_NOREST, TABLE_FIEND_TRAIT)
	return ..()

/datum/component/table_fiend/RegisterWithParent()
	RegisterSignal(parent, COMSIG_MOVABLE_MOVED, .proc/fiend_moved)

/datum/component/table_fiend/UnregisterFromParent()
	UnregisterSignal(parent, COMSIG_MOVABLE_MOVED)

/datum/component/table_fiend/proc/update_fiend()
	var/atom/movable/fiend = parent
	var/obj/structure/table/table = locate() in fiend.loc
	if(!table)
		qdel(src)
		return FALSE
	fiend.layer = table.layer - 0.01 //most of the time this will be layer 2.79
	if(isliving(fiend))
		var/mob/living/living_fiend = fiend
		if(!living_fiend.lying)
			qdel(src)
			return FALSE
	return TRUE

/datum/component/table_fiend/proc/fiend_moved(atom/movable/source)
	SIGNAL_HANDLER

	update_fiend()
