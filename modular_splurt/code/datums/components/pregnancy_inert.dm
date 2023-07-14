#define EGG_STAGE_TIME 2 MINUTES

/datum/component/ovipositor
	dupe_mode = COMPONENT_DUPE_UNIQUE

	var/mob/living/carrier

	var/egg_stage = 0
	var/eggs_stored = 1
	COOLDOWN_DECLARE(egg_timer)

/datum/component/ovipositor/Initialize()
	if(!isgenital(parent))
		return COMPONENT_INCOMPATIBLE

	var/obj/item/organ/genital = parent

	carrier = genital.owner

/datum/component/ovipositor/RegisterWithParent()
	RegisterSignal(parent, COMSIG_ORGAN_INSERTED, .proc/on_inserted)
	RegisterSignal(parent, COMSIG_ORGAN_REMOVED, .proc/on_removed)
	if(carrier)
		register_carrier()

/datum/component/ovipositor/proc/register_carrier()
	RegisterSignal(carrier, COMSIG_LIVING_BIOLOGICAL_LIFE, .proc/handle_life)
	RegisterSignal(carrier, COMSIG_MOB_CLIMAX, .proc/on_climax)

/datum/component/ovipositor/proc/unregister_carrier()
	UnregisterSignal(carrier, COMSIG_LIVING_BIOLOGICAL_LIFE)
	UnregisterSignal(carrier, COMSIG_MOB_CLIMAX)

/datum/component/ovipositor/proc/on_inserted(datum/source)
	SIGNAL_HANDLER

	var/obj/item/organ/genital/gen = parent

	if(gen.owner)
		carrier = gen.owner
		register_carrier()

/datum/component/ovipositor/proc/on_removed(datum/source)
	SIGNAL_HANDLER

	var/obj/item/organ/genital/gen = parent

	if(gen.owner)
		unregister_carrier()
		carrier = null

/datum/component/ovipositor/proc/handle_life(seconds)
	SIGNAL_HANDLER

	if(COOLDOWN_FINISHED(src, egg_timer))
		egg_stage += 1
		egg_stage = min(2, egg_stage)
		COOLDOWN_START(src, egg_timer, EGG_STAGE_TIME)

	if(egg_stage == 2)
		egg_stage = 0
		eggs_stored += 1
		eggs_stored = min(3, eggs_stored)

/datum/component/ovipositor/proc/on_climax(datum/source, datum/reagents/senders_cum, atom/target, obj/item/organ/genital/sender, obj/item/organ/genital/receiver, spill)
	SIGNAL_HANDLER

	var/obj/item/organ/genital/stuff = parent
	if(stuff != sender && stuff.linked_organ != sender)
		return FALSE

	if(eggs_stored <= 0)
		return FALSE

	if(receiver && isliving(target))
		if(CHECK_BITFIELD(receiver.genital_flags, GENITAL_CAN_STUFF))
			return lay_eg(receiver, senders_cum)
	return lay_eg(get_turf(carrier), senders_cum)

/datum/component/ovipositor/proc/lay_eg(atom/location, datum/reagents/senders_cum)
	to_chat(carrier, span_userlove("You feel your egg sliding slowly inside!"))

	if(prob(30))
		return FALSE

	if(isorgan(location))
		var/obj/item/organ/recv = location

		if(!recv.owner)
			return FALSE

	var/obj/item/organ/genital/gen = parent
	if(!(gen.is_exposed() || gen.linked_organ?.is_exposed()))
		return FALSE

	var/obj/item/oviposition_egg/eggo = new(carrier)

	eggo.AddComponent(/datum/component/organ_inflation, 2)

	eggo.icon_state = carrier.client?.prefs?.egg_shell ? ("egg_" + carrier.client.prefs.egg_shell) : "egg_chicken"
	eggo.update_appearance()

	if(isorgan(location))
		var/obj/item/organ/recv = location
		var/datum/component/genital_equipment/equipment = eggo.GetComponent(/datum/component/genital_equipment)
		equipment.holder_genital = recv
		carrier.visible_message(span_userlove("[carrier] laid an egg!"), \
			span_userlove("You laid an egg inside [recv.owner]'s [recv]"))
	else
		carrier.visible_message(span_notice("[carrier] laid an egg!"), \
			span_nicegreen("The egg came out!"))

	playsound(carrier, 'sound/effects/splat.ogg', 70, TRUE)

	if(senders_cum?.total_volume > 5)
		senders_cum.reaction(location, TOUCH, 1, 0)

	eggo.forceMove(location)
	eggs_stored -= 1

	return TRUE
