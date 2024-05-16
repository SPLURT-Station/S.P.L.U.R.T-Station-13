GLOBAL_VAR_INIT(slavers_team_name, "Slave Traders")
GLOBAL_VAR_INIT(slavers_spawned, FALSE)
GLOBAL_VAR_INIT(slavers_credits_balance, 5000)
GLOBAL_VAR_INIT(slavers_credits_total, 0)
GLOBAL_VAR_INIT(slavers_slaves_sold, 0)

#define SLAVER_STANDARD_RANSOM 7500

/// Price table for when trying to set slave prices automatically
GLOBAL_LIST_INIT(slavers_ransom_values, list(
	"Captain" 					= 175000,
	"Head of Personnel" 		= 125000,
	"Head of Security" 			= 100000,
	"Chief Engineer" 			= 80000,
	"Research Director" 		= 80000,
	"Chief Medical Officer" 	= 80000,
	"Blueshield" 				= 30000,

	"Warden" 					= 30000,
	"Brig Physician" 			= 20000,
	"Security Officer" 			= 20000,
	"Detective" 				= 20000,

	"Quartermaster" 			= 10000,
	"Cargo Technician" 			= SLAVER_STANDARD_RANSOM,
	"Shaft Miner"				= SLAVER_STANDARD_RANSOM,
	"Assistant" 				= SLAVER_STANDARD_RANSOM,
	"Bartender"					= SLAVER_STANDARD_RANSOM,
	"Cook"						= SLAVER_STANDARD_RANSOM,
	"Botanist"					= SLAVER_STANDARD_RANSOM,
	"Janitor"					= SLAVER_STANDARD_RANSOM,
	"Clown"						= SLAVER_STANDARD_RANSOM,
	"Mime"						= SLAVER_STANDARD_RANSOM,
	"Curator"					= SLAVER_STANDARD_RANSOM,
	"Lawyer"					= SLAVER_STANDARD_RANSOM,
	"Chaplain"					= SLAVER_STANDARD_RANSOM,
	"Station Engineer"			= SLAVER_STANDARD_RANSOM,
	"Atmospheric Technician"	= SLAVER_STANDARD_RANSOM,
	"Medical Doctor" 			= SLAVER_STANDARD_RANSOM,
	"Paramedic" 				= SLAVER_STANDARD_RANSOM,
	"Chemist"					= SLAVER_STANDARD_RANSOM,
	"Virologist"				= SLAVER_STANDARD_RANSOM,
	"Geneticist"				= SLAVER_STANDARD_RANSOM,
	"Scientist"					= SLAVER_STANDARD_RANSOM,
	"Roboticist"				= SLAVER_STANDARD_RANSOM,
	"Prisoner"					= SLAVER_STANDARD_RANSOM,
	"Stowaway"					= SLAVER_STANDARD_RANSOM,
	"Curator"					= SLAVER_STANDARD_RANSOM,
	"Lawyer"					= SLAVER_STANDARD_RANSOM,
	"Chaplain"					= SLAVER_STANDARD_RANSOM,
))

#undef SLAVER_STANDARD_RANSOM

/datum/antagonist/slaver
	name = "Slave Trader"
	roundend_category = "slaver"
	antagpanel_category = "Slaver"
	job_rank = ROLE_SLAVER
	antag_moodlet = /datum/mood_event/focused
	threat = 7
	show_to_ghosts = TRUE
	var/static/datum/team/slavers/slaver_team = new /datum/team/slavers
	var/slaver_outfit = /datum/outfit/slaver
	var/send_to_spawnpoint = TRUE //Should the user be moved to default spawnpoint.
	var/equip_outfit = TRUE

/datum/antagonist/slaver/proc/update_slaver_icons_added(mob/living/M)
	var/datum/atom_hud/antag/slaverhud = GLOB.huds[ANTAG_HUD_SLAVER]
	slaverhud.join_hud(M)
	set_antag_hud(M, "slaver")

/datum/antagonist/slaver/proc/update_slaver_icons_removed(mob/living/M)
	var/datum/atom_hud/antag/slaverhud = GLOB.huds[ANTAG_HUD_SLAVER]
	slaverhud.leave_hud(M)
	set_antag_hud(M, null)

/datum/antagonist/slaver/apply_innate_effects(mob/living/mob_override)
	var/mob/living/M = mob_override || owner.current
	update_slaver_icons_added(M)

/datum/antagonist/slaver/remove_innate_effects(mob/living/mob_override)
	var/mob/living/M = mob_override || owner.current
	update_slaver_icons_removed(M)

/datum/antagonist/slaver/proc/equip_slaver()
	if(!ishuman(owner.current))
		return
	var/mob/living/carbon/human/H = owner.current

	H.equipOutfit(slaver_outfit)
	return TRUE

/datum/antagonist/slaver/greet()
	owner.assigned_role = ROLE_SLAVER
	owner.current.playsound_local(get_turf(owner.current), 'modular_splurt/sound/ambience/antag/slavers.ogg',100,0)
	to_chat(owner, "<B>You are a Slave Trader!</B>")
	spawnText()

	var/mob/living/carbon/human/H = owner.current
	if(istype(H))
		H.set_antag_target_indicator() // Hide consent of this player, they are an antag and can't be a target

/datum/antagonist/slaver/on_gain()
	forge_objectives()
	. = ..()
	if(equip_outfit)
		equip_slaver()
	if(send_to_spawnpoint)
		move_to_spawnpoint()

	// Can see what players consent to being a victim
	var/datum/atom_hud/H = GLOB.huds[DATA_HUD_ANTAGTARGET]
	H.add_hud_to(owner.current)

// Lose antag status
/datum/antagonist/slaver/farewell()
	// Can no longer see what players consent to being a victim
	var/datum/atom_hud/H = GLOB.huds[DATA_HUD_ANTAGTARGET]
	H.remove_hud_from(owner.current)

/datum/antagonist/slaver/get_team()
	return slaver_team

/datum/antagonist/slaver/proc/forge_objectives()
	objectives |= slaver_team.objectives

/datum/antagonist/slaver/proc/move_to_spawnpoint()
	owner.current.forceMove(GLOB.slaver_start[(0 % GLOB.slaver_start.len) + 1])

/datum/antagonist/slaver/leader/move_to_spawnpoint()
	owner.current.forceMove(pick(GLOB.slaver_leader_start))

/datum/antagonist/slaver/admin_add(datum/mind/new_owner,mob/admin)
	send_to_spawnpoint = FALSE
	new_owner.add_antag_datum(src)

	message_admins("[key_name_admin(admin)] has slaver'd [new_owner.current].")
	log_admin("[key_name(admin)] has slaver'd [new_owner.current].")

/datum/antagonist/slaver/admin_remove(mob/user)
	var/datum/mind/player = owner
	. = ..()
	var/mob/living/carbon/human/H = player.current
	if(istype(H))
		H.set_antag_target_indicator() // Update consent HUD

/datum/antagonist/slaver/get_admin_commands()
	. = ..()
	.["Send to base"] = CALLBACK(src,PROC_REF(admin_send_to_base))

/datum/antagonist/slaver/proc/admin_send_to_base(mob/admin)
	owner.current.forceMove(pick(GLOB.slaver_start))

/datum/antagonist/slaver/leader
	name = "Slave Master"
	slaver_outfit = /datum/outfit/slaver/leader

/datum/antagonist/slaver/leader/greet()
	owner.assigned_role = ROLE_SLAVER_LEADER
	owner.current.playsound_local(get_turf(owner.current), 'modular_splurt/sound/ambience/antag/slavers.ogg',100,0)
	to_chat(owner, "<B>You are the Slave Master!</B>")
	spawnText()

	var/mob/living/carbon/human/H = owner.current
	if(istype(H))
		H.set_antag_target_indicator() // Hide consent of this player, they are an antag and can't be a target

	addtimer(CALLBACK(src, PROC_REF(slavers_name_assign)), 1)

/datum/antagonist/slaver/proc/spawnText()
	to_chat(owner, "<br><B>You are tasked with infiltrating the station and kidnapping members of the crew. Once brought back to the hideout, they can be collared and priced using the console.</B>")
	to_chat(owner, "<B>The station can choose whether to pay the ransom, and if they do, you can take the slave to the green floor and use the console to 'export' them back, where the ransom will then be paid to your crew to buy new gear. Make sure you give all of the slave's items back before exporting them.</B>")
	to_chat(owner, "<br><B><span class='adminhelp'>Important:</span> This role does NOT mean you can break server rules. Additionally to avoid round removing people, you can <span class='adminnotice'>only kidnap crew who consent OOC</span> or attack you.</B>")
	to_chat(owner, "<B>You have a special HUD that shows consent for each player at the bottom right of their sprite. A tick means you can kidnap them. A cross means do not. A question mark means ask first.</B>")

/datum/antagonist/slaver/leader/proc/slavers_name_assign()
	GLOB.slavers_team_name = ask_name()

/datum/antagonist/slaver/leader/proc/ask_name()
	var/defaultname = GLOB.slavers_team_name
	var/newname = stripped_input(owner.current, "You are the slave master. Please choose a name for your crew.", "Crew name", defaultname)
	if (!newname)
		newname = defaultname
	else
		newname = reject_bad_name(newname)
		if(!newname)
			newname = defaultname

	return capitalize(newname)

/datum/team/slavers
	var/core_objective = /datum/objective/slaver

/datum/team/slavers/proc/update_objectives()
	if(core_objective)
		var/datum/objective/O = new core_objective
		O.team = src
		objectives += O

/datum/team/slavers/roundend_report()
	var/list/parts = list()
	parts += span_header("Slave Traders:")

	var/text = "<br><span class='header'>The crew were:</span>"
	var/slavesSold = GLOB.slavers_slaves_sold
	var/earnedMoney = GLOB.slavers_credits_total
	var/slavesUnsold = 0

	var/all_dead = TRUE
	for(var/datum/mind/M in members)
		if(considered_alive(M))
			all_dead = FALSE

	for(var/obj/item/electropack/shockcollar/slave/collar in GLOB.tracked_slaves)
		if (isliving(collar.loc))
			slavesUnsold++

	text += "<br>"
	text += printplayerlist(members)
	text += "<br>"
	text += "<b>Slaves sold:</b> [slavesSold]<br>"
	text += "<b>Slaves not sold:</b> [slavesUnsold]<br>"
	text += "<b>Total money earned:</b> [earnedMoney]cr (needed at least 200,000cr)"

	// var/datum/objective/slaver/O = locate() in objectives
	if(GLOB.slavers_credits_total >= 200000 && !all_dead)
		parts += span_greentext("The slaver crew were successful!")
	else
		parts += span_redtext("The slaver crew have failed.")

	parts += text

	return "<div class='panel redborder'>[parts.Join("<br>")]</div>"

/proc/is_slaver(mob/M)
	return M && istype(M) && M.mind && M.mind.has_antag_datum(/datum/antagonist/slaver)
