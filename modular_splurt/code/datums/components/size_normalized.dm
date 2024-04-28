/datum/component/size_normalized
	dupe_mode = COMPONENT_DUPE_UNIQUE
	var/obj/item/clothing/attached_wear
	var/normal_resize = RESIZE_NORMAL
	var/natural_size //The value of the wearer's body_size var in prefs. Unused for now.
	var/recorded_size //the user's height prior to equipping

//Set up the linked clothing
/datum/component/size_normalized/Initialize(obj/item/clothing/wear)
	. = ..()
	if(!isliving(parent))
		return COMPONENT_INCOMPATIBLE
	attached_wear = wear

//Normalize the mob on add in case it's necessary
/datum/component/size_normalized/RegisterWithParent()
	. = ..()
	var/mob/living/wearer = parent
	recorded_size = get_size(wearer)
	if(recorded_size != normal_resize)
		playsound(wearer, 'sound/effects/magic.ogg', 50, 1)
		wearer.flash_lighting_fx(3, 3, LIGHT_COLOR_PURPLE)
		wearer.visible_message(span_warning("A flash of purple light engulfs \the [wearer], before [wearer.p_they()] jump[wearer.p_s()] to a more average size!"),span_notice("You feel warm for a moment, before everything scales to your size..."))
		wearer.update_size(normal_resize)
	RegisterSignal(wearer, COMSIG_MOB_RESIZED, PROC_REF(normalize_size))

//Denormalize the mob when the component is destroyed (if needed)
/datum/component/size_normalized/UnregisterFromParent()
	. = ..()
	var/mob/living/wearer = parent
	UnregisterSignal(wearer, COMSIG_MOB_RESIZED)
	if(recorded_size == normal_resize)
		return
	playsound(wearer,'sound/weapons/emitter2.ogg', 50, 1)
	wearer.flash_lighting_fx(3, 3, LIGHT_COLOR_YELLOW)
	wearer.visible_message(span_warning("Golden light engulfs \the [wearer], and [wearer.p_they()] shoot[wearer.p_s()] back to [wearer.p_their()] default height!"),span_notice("Energy rushes through your body, and you return to normal."))
	wearer.update_size(recorded_size)

//Make sure the size stays normalized while worn and add the change to the recorded size
/datum/component/size_normalized/proc/normalize_size(mob/living/source, new_size, cur_size)
	SIGNAL_HANDLER

	. = TRUE
	if(get_size(source) == normal_resize)
		return FALSE

	recorded_size += new_size - cur_size
	if(recorded_size > RESIZE_MACRO || recorded_size < RESIZE_MICRO)
		recorded_size -= new_size - cur_size

	source.update_size(normal_resize)
