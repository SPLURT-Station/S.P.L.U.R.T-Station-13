/* PROC TO MANAGE LEVELLING UP THIS WAY */
/datum/antagonist/bloodsucker/proc/ForcedRankUp() //I hate this.
	set waitfor = FALSE
	if(!owner || !owner.current)
		return
	bloodsucker_level_unspent ++
	// Spend Rank Immediately?
	if(istype(owner.current.loc, /obj/structure/closet/crate/coffin))
		SpendRank()
	else
		to_chat(owner, "<EM><span class='notice'>You have forced your powers to further through the power of blood; Sleep within your lair to claim your boon.</span></EM>")
		if(bloodsucker_level_unspent >= 2)
			to_chat(owner, "<span class='announce'>Bloodsucker Tip: If you cannot find or steal a coffin to use, you can build one from wooden planks.</span><br>")



/datum/action/cooldown/bloodsucker/levelup
	name = "Forced Evolution"
	desc = "Spend the lovely sanguine running through your veins; aging you at an accelerated rate."
	button_icon_state = "power_feed"
	var/total_uses = 1
	bloodcost = 50
	cooldown_time = 50
	bloodsucker_can_buy = TRUE


/datum/action/cooldown/bloodsucker/levelup/CheckCanUse(display_error)
	. = ..()
	if(!.)
		return

	return TRUE


/datum/action/cooldown/bloodsucker/levelup/ActivatePower()
	var/datum/antagonist/bloodsucker/bloodsuckerdatum = owner.mind.has_antag_datum(ANTAG_DATUM_BLOODSUCKER)
	if(istype(bloodsuckerdatum))
		bloodsuckerdatum.ForcedRankUp()	// Rank up! Must still be in a coffin to level!

	total_uses++
	bloodcost = total_uses * 15 //Far cheaper than the original PR, but for good reason. Vampires here don't have the anti-decap measure.
