/datum/component/genital_equipment
	var/list/genital_slot = list()
	var/obj/item/organ/genital/holder_genital
	var/list/datum/callback/procs_list = list()

/datum/component/genital_equipment/Initialize(list/slot, list/procs)
	if(!slot)
		return COMPONENT_INCOMPATIBLE

	procs_list = procs || procs_list

	if(islist(slot))
		genital_slot = slot
	else
		LAZYADD(genital_slot, slot)

/datum/component/genital_equipment/proc/get_wearer()
	if(!holder_genital)
		return

	if(istype(holder_genital))
		return holder_genital.owner

	return holder_genital["wearer"]

/datum/component/genital_equipment/proc/insert_genital(obj/item/organ/genital/G, mob/user)
	if(!genital_slot.Find(G.slot))
		to_chat(user, span_warning("You can't put that there!"))
		return FALSE

	var/datum/callback/pre_insert = LAZYACCESS(procs_list, "before_inserting")
	. = pre_insert?.Invoke(parent, G, user)
	. = isnull(.) || .
	if(!.)
		return FALSE

	holder_genital = G

	if(!user.transferItemToLoc(parent, G))
		return FALSE

	var/datum/callback/after_insert = LAZYACCESS(procs_list, "after_inserting")
	after_insert?.Invoke(parent, G, user)

/datum/component/genital_equipment/proc/remove_genital(obj/item/organ/genital/G, mob/user)
	var/datum/callback/pre_remove = LAZYACCESS(procs_list, "before_removing")
	. = pre_remove?.Invoke(parent, G, user)
	. = isnull(.) || .
	if(!(isnull(.) || .))
		return FALSE

	holder_genital = null

	if(!user.put_in_hands(parent))
		user.transferItemToLoc(get_turf(user))

	var/datum/callback/after_remove = LAZYACCESS(procs_list, "after_removing")
	after_remove?.Invoke(parent, G, user)

