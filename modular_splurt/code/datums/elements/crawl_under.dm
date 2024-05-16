#define COMVER_CRAWL_UNDER "comver_crawl_under"
#define ELEMENT_CRAWL_UNDER "element_crawl_under"

//ATTENTION: only handles the crawling-under action and layers.
//you need to manually set CanPass() to allow PASSCRAWL for the object you're applying it to.
/datum/element/crawl_under
	element_flags = ELEMENT_DETACH

/datum/element/crawl_under/Attach(datum/target)
	. = ..()
	if(!isstructure(target)) //it would work up to movable but no.
		return ELEMENT_INCOMPATIBLE //if any machinery comes up feel free to move up to /obj

	RegisterSignal(target, COMSIG_MOUSEDROPPED_ONTO, PROC_REF(check_crawl))
	RegisterSignal(target, COMVER_CRAWL_UNDER, PROC_REF(Affirm))
	RegisterSignal(target, COMSIG_MOVABLE_UNCROSSED, PROC_REF(uncrawl_from))

/datum/element/crawl_under/Detach(datum/source, force)
	var/obj/object = source //if src somehow changes type fuck you
	var/turf/src_turf = get_turf(object)
	for(var/mob/living/living in src_turf)
		REMOVE_TRAIT(living, IGNORE_FAKE_Z_AXIS, ELEMENT_CRAWL_UNDER)
		REMOVE_TRAIT(living, TRAIT_FLOORED, ELEMENT_CRAWL_UNDER)
		living.layer = initial(living.layer)
		living.pass_flags &= ~PASSCRAWL

	UnregisterSignal(source, list(
		COMSIG_MOUSEDROPPED_ONTO,
		COMVER_CRAWL_UNDER,
		COMSIG_MOVABLE_UNCROSSED
	))
	return ..()


/datum/element/crawl_under/proc/check_crawl(obj/structure/source, mob/living/user) //not checking if it's a structure. y'all should know better.
	SIGNAL_HANDLER

	if(!istype(user)) //valid user, also checks for if it exists
		return
	if(user.mobility_flags & MOBILITY_STAND || user.incapacitated(TRUE, FALSE, TRUE))
		return
	if((user.pass_flags & PASSCRAWL) || HAS_TRAIT_FROM(user, TRAIT_FLOORED, ELEMENT_CRAWL_UNDER)) //already under
		return

	INVOKE_ASYNC(src, PROC_REF(do_crawl), source, user)
	return COMSIG_MOB_CANCEL_CLICKON

/datum/element/crawl_under/proc/do_crawl(obj/structure/source, mob/living/user)
	if(QDELETED(source) || QDELETED(user)) //sanity
		return
	to_chat(user, span_notice("You start crawling under [source].."))
	if(!do_after(user, 20, source) || (user.mobility_flags & MOBILITY_STAND || user.incapacitated(TRUE, FALSE, TRUE)))
		to_chat(user, span_warning("You fail to crawl under [source]!"))
		return

	user.pass_flags |= PASSCRAWL
	ADD_TRAIT(user, IGNORE_FAKE_Z_AXIS, ELEMENT_CRAWL_UNDER)
	step(user, get_dir(user, source))
	if(!(source in user.loc))
		REMOVE_TRAIT(user, IGNORE_FAKE_Z_AXIS, ELEMENT_CRAWL_UNDER)
		user.pass_flags &= ~PASSCRAWL
		return
	ADD_TRAIT(user, TRAIT_FLOORED, ELEMENT_CRAWL_UNDER)
	user.layer = source.layer - 0.01 //just a lil under it
	user.pass_flags |= PASSCRAWL
	step(user, get_dir(user, source))

/datum/element/crawl_under/proc/uncrawl_from(obj/structure/source, atom/movable/movable)
	if(QDELETED(source) || QDELETED(movable) || !get_turf(movable)) //sanity
		return
	if(!isliving(movable)) //no
		return

	for(var/obj/structure/structure in get_turf(movable))
		if(structure.type == source.type || SEND_SIGNAL(structure, COMVER_CRAWL_UNDER))
			return


	REMOVE_TRAIT(movable, IGNORE_FAKE_Z_AXIS, ELEMENT_CRAWL_UNDER)
	REMOVE_TRAIT(movable, TRAIT_FLOORED, ELEMENT_CRAWL_UNDER)
	movable.layer = initial(movable.layer)
	movable.pass_flags &= ~PASSCRAWL

/datum/element/crawl_under/proc/Affirm() //todo: move to /element and implement for /component ?
	return TRUE

#undef COMVER_CRAWL_UNDER
#undef ELEMENT_CRAWL_UNDER
