/mob/living/silicon/robot
	var/hasShrunk = FALSE

/mob/living/silicon/robot/modules/roleplay
	lawupdate = FALSE
	scrambledcodes = TRUE // Roleplay borgs aren't real
	set_module = /obj/item/robot_module/roleplay

/mob/living/silicon/robot/modules/roleplay/Initialize(mapload)
	. = ..()
	cell = new /obj/item/stock_parts/cell/infinite(src, 30000)
	laws = new /datum/ai_laws/roleplay()
	//You aren't allowed to unlock, not sorry
	//Moved to tgui\packages\tgui\interfaces\NtosRobotact.js:179
	//This part is because the camera stays in the list, so we'll just do a check
	if(!QDELETED(builtInCamera))
		QDEL_NULL(builtInCamera)

/mob/living/silicon/robot/modules/roleplay/binarycheck()
	return FALSE //Roleplay borgs aren't truly borgs

/// Allows "cyborg" players to change gender at will
/mob/living/silicon/robot/verb/toggle_gender()
	set name = "Set Gender"
	set desc = "Allows you to set your gender."

	if(stat != CONSCIOUS)
		to_chat(usr, span_warning("You cannot toggle your gender while unconcious!"))
		return

	var/choice = tgui_alert(usr, "Select Gender.", "Gender", list("Both", "Male", "Female"))
	switch(choice)
		if("Both")
			has_penis = TRUE
			has_vagina = TRUE
		if("Male")
			has_penis = TRUE
			has_vagina = FALSE
		if("Female")
			has_penis = FALSE
			has_vagina = TRUE
