/datum/component/organ_inflation
	dupe_mode = COMPONENT_DUPE_UNIQUE_PASSARGS

	var/obj/item/organ/container
	var/size

/datum/component/organ_inflation/Initialize(added_size)
	if(added_size < 0)
		return COMPONENT_INCOMPATIBLE
	if(!isitem(parent))
		return COMPONENT_INCOMPATIBLE

	size = added_size

	var/obj/item/thing = parent

	if(istype(thing.loc, /obj/item/organ))
		container = thing.loc
		inflate_organ(size)

/datum/component/organ_inflation/InheritComponent(datum/component/C, i_am_original, _size)
	if(!i_am_original)
		return
	var/old_size = size
	if(C)
		var/datum/component/organ_inflation/other = C
		size += other.size
	else
		size += _size

	if(abs(size - old_size) > 0 && container)
		inflate_organ(size - old_size)

/datum/component/organ_inflation/RegisterWithParent()
	RegisterSignal(parent, COMSIG_ATOM_ENTERING, PROC_REF(on_entering))
	if(container)
		register_container()

/datum/component/organ_inflation/UnregisterFromParent()
	UnregisterSignal(parent, COMSIG_ATOM_ENTERING)
	if(container)
		unregister_container()

/datum/component/organ_inflation/proc/register_container()
	RegisterSignal(container, COMSIG_ORGAN_INSERTED, PROC_REF(on_inserted))
	RegisterSignal(container, COMSIG_ORGAN_REMOVED, PROC_REF(on_removed))

/datum/component/organ_inflation/proc/unregister_container()
	UnregisterSignal(container, COMSIG_ORGAN_REMOVED)
	UnregisterSignal(container, COMSIG_ORGAN_INSERTED)

/datum/component/organ_inflation/Destroy(force)
	if(container)
		deflate_organ()
	return ..()

/datum/component/organ_inflation/proc/on_entering(datum/source, atom/destination, atom/oldLoc)
	SIGNAL_HANDLER
	if(istype(destination, /obj/item/organ))
		container = destination
		register_container()
		inflate_organ(size)
	else if(container)
		deflate_organ()
		unregister_container()
		container = null

/datum/component/organ_inflation/proc/on_inserted(datum/source)
	SIGNAL_HANDLER
	inflate_organ(size)

/datum/component/organ_inflation/proc/on_removed(datum/source)
	SIGNAL_HANDLER
	deflate_organ()

/datum/component/organ_inflation/proc/inflate_organ(new_size)
	if(!container.owner?.client?.prefs?.pregnancy_inflation)
		return

	switch(container.slot)
		if(ORGAN_SLOT_PENIS)
			var/obj/item/organ/genital/penis/peenus = container.owner.getorganslot(ORGAN_SLOT_PENIS)
			peenus?.modify_size(new_size)
		if(ORGAN_SLOT_BREASTS)
			var/obj/item/organ/genital/breasts/breasts = container.owner.getorganslot(ORGAN_SLOT_BREASTS)
			breasts?.modify_size(new_size)
		else
			var/obj/item/organ/genital/belly/belly = container.owner.getorganslot(ORGAN_SLOT_BELLY)
			if(!belly && ishuman(container.owner))
				var/mob/living/carbon/human/human_owner = container.owner
				belly = human_owner.give_genital(/obj/item/organ/genital/belly)
			belly?.modify_size(new_size)

/datum/component/organ_inflation/proc/deflate_organ()
	if(!container.owner)
		return

	switch(container.slot)
		if(ORGAN_SLOT_PENIS)
			var/obj/item/organ/genital/penis/peenus = container.owner.getorganslot(ORGAN_SLOT_PENIS)
			peenus?.modify_size(-size)
		if(ORGAN_SLOT_BREASTS)
			var/obj/item/organ/genital/breasts/breasts = container.owner.getorganslot(ORGAN_SLOT_BREASTS)
			breasts?.modify_size(-size)
		else
			var/obj/item/organ/genital/belly/belly = container.owner.getorganslot(ORGAN_SLOT_BELLY)
			belly?.modify_size(-size)
