#define PROTOLOCK_ALL_ACCESS CONFIG_GET(flag/protolock_all_access)

/mob/Initialize()
	. = ..()
	create_player_panel()

/mob/Destroy()
	QDEL_NULL(mob_panel)
	. = ..()

//pixelshift overrides
/mob/northshift()
	pixel_shift(NORTH)

/mob/southshift()
	pixel_shift(SOUTH)

/mob/eastshift()
	pixel_shift(EAST)

/mob/westshift()
	pixel_shift(WEST)

/mob/verb/tilt_left()
	set hidden = TRUE
	if(!canface() || is_tilted < -45)
		return FALSE
	transform = transform.Turn(-1)
	is_tilted--

/mob/verb/tilt_right()
	set hidden = TRUE
	if(!canface() || is_tilted > 45)
		return FALSE
	transform = transform.Turn(1)
	is_tilted++

/mob/proc/has_spell(spelltype)
	if (!mind)
		return FALSE

	for(var/obj/effect/proc_holder/spell/S in mind.spell_list)
		if(S.type == spelltype)
			return TRUE
	return FALSE

/mob/proc/create_player_panel()
	QDEL_NULL(mob_panel)
	mob_panel = new(src)

/mob/verb/check_out(atom/A as mob in view())
	set name = "Check Out"
	set category = "IC"

	. = examinate(A)
	if (.)
		return
	to_chat(A, span_notice("[src] seems to be checking you out."))

/mob/proc/allow_vampiric_ability(check_anti_magic = TRUE, check_holy = TRUE, check_garlic_neck = TRUE, check_garlic_blood = TRUE, check_stake = TRUE, silent = TRUE)
	// Check if carbon
	if(!iscarbon(src))
		// Warn user and return false
		if(!silent)
			to_chat(src, span_warning("Your body cannot form connections to the other-world!"))
		return FALSE

	// Check for anti-magic variables
	if(check_anti_magic || check_holy)
		// Check for anti-magic
		if(src.anti_magic_check(check_anti_magic, check_holy, FALSE, 0, TRUE))
			// Warn user and return false
			if(!silent)
				to_chat(src, span_warning("A powerful anti-magic force is blocking your connection to the other-world!"))
			return FALSE

	// Check for anti-garlic variables
	if(check_garlic_neck || check_garlic_blood)
		// Check bloodsucker checks
		if(!blood_sucking_checks(src, check_garlic_neck, check_garlic_blood))
			// Warn user and return false
			if(!silent)
				to_chat(src, span_warning("The warding power of Allium Sativum prevents you from using any sanguine powers!"))
			return FALSE

	// Check for stake variable
	if(check_stake)
		// Check for stake
		if(src.AmStaked())
			// Warn user and return false
			if(!silent)
				to_chat(src, span_warning("You are staked! You must remove the offending weapon from your heart before using any sanguine powers!"))
			return FALSE

	// All checks passed
	return TRUE

//Makes the protolocks able to be disabled
/mob/can_use_production(obj/machinery/machine_target)
	if(PROTOLOCK_ALL_ACCESS)
		return TRUE
	. = ..()

/mob/on_item_dropped(obj/item/I)
	SEND_SIGNAL(src, COMSIG_MOB_ITEM_DROPPED, I) //SPLURT edit
	. = ..()
