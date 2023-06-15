/*
****************************************
// Modular Supermatter Delaminations! //
****************************************
The Problems:
• Staff manually delete the supermatter, because...
• Supermatter explosions are so frequent, and so large that people don't want to fix it.
Our Solutions:
• Make all supermatter explosions respect the bombcap, to prevent it annihilating a third of the station.
• Remove the tesla and singularity delaminations, because lets face it, staff would never allow it...
• Gauge prospective interest in fixing the supermatter, and scale damage based on how willing the crew is to fix the damage.
Our Method:
• Override the supermatter's explode() proc to respect the bombcap.
• Scan through the player list an count how many alive engineers are there. If you sign up as an engineer, you consent to fixing the damage.
Custom Bombcaps:
• Small Delam: 1, 2, 5
• Medium Delam: 2, 3, 10
• Big Delam: 3, 5, 15
*/

#define EXPLOSION_MODIFIER_SMALL 0.25
#define EXPLOSION_MODIFIER_MEDIUM 0.5
#define EXPLOSION_MODIFIER_LARGE 0.75

// Let's turn the base explosion power down a little...
/obj/machinery/power/supermatter_crystal
	explosion_power = 22
/obj/machinery/power/supermatter_crystal/shard
	explosion_power = 6

// Proc to screen the mob list for engineers. We'll need this later!
/proc/count_alive_engineers(mob/M)
	if(!istype(M) || isobserver(M))
		return FALSE
	if(M.stat != DEAD && M.mind && (M.mind.assigned_role in GLOB.engineering_positions))
		return TRUE

/obj/item/debug/engineer_counter
	name = "magical engineer counter"
	icon = 'icons/obj/guns/magic.dmi'
	icon_state = "nothingwand"

/obj/item/debug/engineer_counter/attack_self(mob/user)
	var/alive_engineers = 0
	for(var/mob/living/carbon/human/M in GLOB.alive_mob_list)
		if(count_alive_engineers(M))
			alive_engineers++
	priority_announce("There are [alive_engineers] alive engineers!", "How many engineers are there?")

/obj/machinery/power/supermatter_crystal/explode()
// Handle the mood event.
	for(var/mob/M in GLOB.player_list)
		if(M.z == z)
			SEND_SOUND(M, 'sound/magic/charge.ogg')
			to_chat(M, "<span class='boldannounce'>You feel reality distort for a moment...</span>")
			SEND_SIGNAL(M, COMSIG_ADD_MOOD_EVENT, "delam", /datum/mood_event/delam)

// Don't explode if we no allow
	if(!CONFIG_GET(flag/sm_delamination))
		investigate_log("has attempted a delamination, but the config disallows it", INVESTIGATE_SUPERMATTER)
		priority_announce("Supermatter privileges revoked. Current crew is deemed unsuitable to handle a highly hazardous engine. More training is required.", "SIMULATION TERMINATED")
		var/skill_issue_sound = pick('modular_splurt/sound/voice/boowomp.ogg', 'modular_splurt/sound/effects/fart_reverb.ogg')
		sound_to_playing_players(skill_issue_sound)
		var/obj/item/toy/plush/random/plushe = new(get_turf(src))
		plushe.name = "Consolation plushie"
		plushe.desc = "It has \"You tried\" poorly written in its tag."
		plushe.squeak_override = list(skill_issue_sound = 1)
		plushe.resistance_flags = INDESTRUCTIBLE | LAVA_PROOF | FIRE_PROOF | ACID_PROOF | FREEZE_PROOF
		qdel(src)
		return

// Replace the singularity and tesla delaminations with an EMP pulse. It's hard to achieve this without deliberate sabotage.
	if(combined_gas > MOLE_PENALTY_THRESHOLD || power > POWER_PENALTY_THRESHOLD)
		investigate_log("has reached critical mass, causing an EMP.", INVESTIGATE_SUPERMATTER)
		empulse_using_range(src, 14)

// Grab the mob list and count the amount of engineers there are.
	var/alive_engineers = 0
	for(var/mob/living/carbon/human/M in GLOB.alive_mob_list)
		if(count_alive_engineers(M))
			alive_engineers++
	switch(alive_engineers)

//	DELAMINATION A: No engineers, no explosion.
		if(0)
			investigate_log("has delaminated, but there are no engineers! Removing with no explosion.", INVESTIGATE_SUPERMATTER)
			priority_announce("A supermatter crystal delamination has been detected. Crystal hyperstructure has collapsed safely, resulting in a success complete self-annihilation of the supermatter entity.", "CRYSTAL DELAMINATION DETECTED!")
			qdel(src)
			return
//	DELAMINATION B: Too few engineers, minimal explosion.
		if(1 to 2)
			investigate_log("has delaminated, but there are only [alive_engineers] engineers! Defaulting to minimum explosion.", INVESTIGATE_SUPERMATTER)
			priority_announce("A supermatter crystal delamination has been detected. Crystal hyperstructure has collapsed within safety tolerance, resulting in majority self-annihilation.", "CRYSTAL DELAMINATION DETECTED!")
			explosion(get_turf(src), clamp(((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_SMALL), 0, 2), clamp(((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_SMALL), 0, 2), clamp(((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_SMALL), 3, 5), clamp(((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_SMALL), 5, 15), TRUE, FALSE)
			qdel(src)
			return
//	DELAMINATION C: Enough engineers, halved explosion size.
		if(3 to 4)
			investigate_log("has delaminated with [alive_engineers] engineers, explosion size has been halved!", INVESTIGATE_SUPERMATTER)
			priority_announce("A supermatter crystal delamination has been detected. Crystal hyperstructure did not complete a controlled collapse.", "CRYSTAL DELAMINATION DETECTED!")
			explosion(get_turf(src), clamp(((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_MEDIUM), 0, 2), clamp(((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_MEDIUM), 1, 4), clamp(((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_MEDIUM), 3, 10), clamp(((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_MEDIUM), 5, 20), TRUE, FALSE)
			qdel(src)
			return
//	DELAMINATION D:
		if(5 to INFINITY)
			investigate_log("has delaminated with full effect due to there being [alive_engineers] engineers.", INVESTIGATE_SUPERMATTER)
			priority_announce("A supermatter crystal delamination has been detected. Crystal hyperstructure has failed catastrophically.", sender_override="CRYSTAL DELAMINATION DETECTED!")
			explosion(get_turf(src), clamp(((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_LARGE), 1, 3), clamp(((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_LARGE), 2, 7), clamp(((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_LARGE), 3, 15), clamp(((explosion_power*gasmix_power_ratio)*EXPLOSION_MODIFIER_LARGE), 5, 30), TRUE, FALSE)
			qdel(src)
			return
		if(null)
			investigate_log("tried to delaminate, but there are... null alive engineers? [alive_engineers] <- that", INVESTIGATE_SUPERMATTER)
			qdel(src)
			return

#undef EXPLOSION_MODIFIER_SMALL
#undef EXPLOSION_MODIFIER_MEDIUM
#undef EXPLOSION_MODIFIER_LARGE
