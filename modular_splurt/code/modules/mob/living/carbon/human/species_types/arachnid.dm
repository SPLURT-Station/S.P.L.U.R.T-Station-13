/datum/action/innate/spin_web
	var/web_cooldown = 200
	var/web_ready = TRUE
	var/spinner_rate = 20

/datum/action/innate/spin_cocoon
	var/web_cooldown = 200
	var/web_ready = TRUE
	var/spinner_rate = 20
	var/cocoon_ready = FALSE
	var/first_time_tutorial = TRUE

/datum/action/innate/spin_web/Activate()
	var/mob/living/carbon/human/H = owner
	if(H.stat == "DEAD")
		return
	if(web_ready == FALSE)
		to_chat(H, "<span class='warning'>You need to wait a while to regenerate web fluid.</span>")
		return
	var/turf/T = get_turf(H)
	if(!T)
		to_chat(H, "<span class='warning'>There's no room to spin your web here!</span>")
		return
	var/obj/structure/spider/stickyweb/W = locate() in T
	var/obj/structure/arachnid/W2 = locate() in T
	if(W || W2)
		to_chat(H, "<span class='warning'>There's already a web here!</span>")
		return
	// Should have some minimum amount of food before trying to activate
	var/nutrition_threshold = NUTRITION_LEVEL_FED
	if (H.nutrition >= nutrition_threshold)
		to_chat(H, "<i>You begin spinning some web...</i>")
		if(!do_after(H, 10 SECONDS, 1, T))
			to_chat(H, "<span class='warning'>Your web spinning was interrupted!</span>")
			return
		H.adjust_nutrition(spinner_rate * -1)
		addtimer(VARSET_CALLBACK(src, web_ready, TRUE), web_cooldown)
		to_chat(H, "<i>You use up a fair amount of energy weaving a web on the ground with your spinneret!</i>")
		new /obj/structure/arachnid(T, owner)

	else
		to_chat(H, "<span class='warning'>You're too hungry to spin web right now, eat something first!</span>")
		return

/datum/action/innate/spin_cocoon/Activate()
	var/mob/living/carbon/human/H = owner
	if(cocoon_ready)
		cocoon_ready = FALSE
		to_chat(H, "<span class='warning'>You put the strand away.</span>")
		UnregisterSignal(H, list(COMSIG_MOB_ALTCLICKON))
		return
	if(H.stat == "DEAD")
		return
	if(web_ready == FALSE)
		to_chat(H, "<span class='warning'>You need to wait awhile to regenerate web fluid.</span>")
		return
	var/nutrition_threshold = NUTRITION_LEVEL_FED
	if (H.nutrition < nutrition_threshold)
		to_chat(H, "<span class='warning'>You're too hungry to spin web right now, eat something first!</span>")
		return
	cocoon_ready = TRUE
	to_chat(H, "<span class='warning'>You pull out a strand from your spinneret, ready to wrap a target. (Press ALT+CLICK on the target to start wrapping.)</span>")
	if(first_time_tutorial)
		first_time_tutorial = FALSE
		to_chat(H,"<span class='notice'>Note: When cocooning a human, you can target different parts of the body for different results. Targetting the chest will wrap the whole body, while targetting the legs, groin, and head will wrap individual parts of the body. Additionally, you can create a web blindfold, muzzle, or handcuffs by targetting the eyes, mouth, or arms.</span>")
	addtimer(VARSET_CALLBACK(src, web_ready, TRUE), web_cooldown)
	RegisterSignal(H, list(COMSIG_MOB_ALTCLICKON), .proc/cocoonAtom)
	return

/datum/action/innate/spin_cocoon/cocoonAtom(mob/living/carbon/human/H, atom/movable/A)
	cocoon_ready = FALSE
	UnregisterSignal(H, list(COMSIG_MOB_ALTCLICKON))
	if (!H || !isarachnid(H))
		return COMSIG_MOB_CANCEL_CLICKON
	else
		if(web_ready == FALSE)
			to_chat(H, "<span class='warning'>You need to wait awhile to regenerate web fluid.</span>")
			return
		if(!H.Adjacent(A))	//No.
			return
		if(!isliving(A) && A.anchored)
			to_chat(H, "<span class='warning'>[A] is bolted to the floor!</span>")
			return
		if(istype(A, /obj/structure/arachnid))
			to_chat(H, "<span class='warning'>No double wrapping.</span>")
			return
		if(istype(A, /obj/effect))
			to_chat(H, "<span class='warning'>You cannot wrap this.</span>")
			return
		// Processing time
		if(ishuman(A))
			var/mob/living/carbon/human/T = A
			var/obj/item/W = null
			var/slot = NONE
			var/bodypart = ""
			var/spintime = 8 SECONDS
			var/spinratemod = -1
			switch(H.zone_selected)
				if(BODY_ZONE_CHEST)
					if(T.get_item_by_slot(ITEM_SLOT_FEET) && T.get_item_by_slot(ITEM_SLOT_OCLOTHING) && T.get_item_by_slot(ITEM_SLOT_HEAD))
						to_chat(H, "<span class='warning'>There's nowhere on [H == T ? "you" : T] to cocoon!</span>")
						return
					H.visible_message("<span class='danger'>[H] starts to wrap [H == T ? "[T.p_them()]self" : T] into a cocoon!</span>","<span class='danger'>You start to wrap [H == T ? "yourself" : T] into a cocoon!</span>",
						target = T, target_message = "<span class='userdanger'>[H == T ? "You start" : "[H] starts"] to wrap you[H == T ? "rself" : ""] into a cocoon!</span>")
					if(!T.get_item_by_slot(ITEM_SLOT_FEET))
						to_chat(H, "<span class='warning'>You begin wrapping [H == T ? "your" : "[T]'s"] legs!</span>")
						if(!do_after(H, 6 SECONDS, TRUE, T))
							to_chat(H, "<span class='warning'>Your web spinning was interrupted!</span>")
							return
						var/obj/item/clothing/shoes/web/I = new
						if(!T.equip_to_slot_if_possible(I, ITEM_SLOT_FEET, FALSE, TRUE))
							to_chat(H, "<span class='warning'>You failed to wrap [H == T ? "your" : "[T]'s"] legs!</span>")
							return
						to_chat(H, "<span class='warning'>You wrap [H == T ? "your" : "[T]'s"] legs!</span>")
						H.adjust_nutrition(spinner_rate * -1.25)
					if(!T.get_item_by_slot(ITEM_SLOT_OCLOTHING))
						to_chat(H, "<span class='warning'>You begin wrapping [H == T ? "your" : "[T]'s"] chest!</span>")
						if(!do_after(H, 6 SECONDS, TRUE, T))
							to_chat(H, "<span class='warning'>Your web spinning was interrupted!</span>")
							return
						var/obj/item/clothing/suit/straight_jacket/web/I = new
						if(!T.equip_to_slot_if_possible(I, ITEM_SLOT_OCLOTHING, FALSE, TRUE))
							to_chat(H, "<span class='warning'>You failed to wrap [H == T ? "your" : "[T]'s"] chest!</span>")
							return
						to_chat(H, "<span class='warning'>You wrap [H == T ? "your" : "[T]'s"] chest!</span>")
						H.adjust_nutrition(spinner_rate * -1.25)
					if(!T.get_item_by_slot(ITEM_SLOT_HEAD))
						to_chat(H, "<span class='warning'>You begin wrapping [H == T ? "your" : "[T]'s"] head!</span>")
						if(!do_after(H, 6 SECONDS, TRUE, T))
							to_chat(H, "<span class='warning'>Your web spinning was interrupted!</span>")
							return
						var/obj/item/clothing/head/web/I = new
						if(!T.equip_to_slot_if_possible(I, ITEM_SLOT_HEAD, FALSE, TRUE))
							to_chat(H, "<span class='warning'>You failed to wrap [H == T ? "your" : "[T]'s"] head!</span>")
							return
						to_chat(H, "<span class='warning'>You wrap [H == T ? "your" : "[T]'s"] head!</span>")
						H.adjust_nutrition(spinner_rate * -1.25)
					H.visible_message("<span class='danger'>[H] cocoons [H == T ? "[T.p_them()]self" : T]!</span>","<span class='danger'>You finish cocooning [H == T ? "yourself" : T]!</span>",
						target = T, target_message = "<span class='danger'>[H == T ? "You" : H] finished cocooning you[H == T ? "rself" : ""]!</span>")
					return
				if(BODY_ZONE_PRECISE_EYES)
					W = /obj/item/clothing/glasses/sunglasses/blindfold/web
					slot = ITEM_SLOT_EYES
					bodypart = "eyes"
					spintime = 6 SECONDS
					spinratemod = -0.5
				if(BODY_ZONE_PRECISE_MOUTH)
					W = /obj/item/clothing/mask/muzzle/web
					slot = ITEM_SLOT_MASK
					bodypart = "mouth"
					spintime = 6 SECONDS
					spinratemod = -0.5
				if(BODY_ZONE_L_LEG,BODY_ZONE_R_LEG)
					W = /obj/item/clothing/shoes/web
					slot = ITEM_SLOT_FEET
					bodypart = "legs"
				if(BODY_ZONE_PRECISE_GROIN)
					W = /obj/item/clothing/suit/straight_jacket/web
					slot = ITEM_SLOT_OCLOTHING
					bodypart = "body"
				if(BODY_ZONE_HEAD)
					W = /obj/item/clothing/head/web
					slot = ITEM_SLOT_HEAD
					bodypart = "head"
				if(BODY_ZONE_L_ARM,BODY_ZONE_R_ARM)
					W = /obj/item/restraints/handcuffs/web
					slot = ITEM_SLOT_HANDCUFFED
					bodypart = "wrists"
			if(T.get_item_by_slot(slot))
				to_chat(H, "<span class='warning'>You can't wrap [H == T ? "your" : "[T]'s"] [bodypart]!</span>")
				return
			H.visible_message("<span class='danger'>[H] starts to wrap webbing around [H == T ? T.p_their() : "[T]'s"] [bodypart]!</span>","<span class='warning'>You start to wrap webbing around [H == T ? "your" : "[T]'s"] [bodypart].</span>",
				target = T, target_message = "<span class='userdanger'>[H == T ? "You start" : "[H] starts"] to wrap webbing around your [bodypart]!</span>")
			if(!do_after(H, spintime, TRUE, T))
				to_chat(H, "<span class='warning'>Your web spinning was interrupted!</span>")
				return
			var/obj/item/I = new W()
			if(!T.equip_to_slot_if_possible(I, slot, FALSE, TRUE))
				to_chat(H, "<span class='warning'>You failed to wrap [H == T ? "your" : "[T]'s"] [bodypart]!</span>")
				return
			H.visible_message("<span class='danger'>[H] wrapped webbing around [H == T ? T.p_their() : "[T]'s"] [bodypart]!</span>","<span class='warning'>You finish wrapping webbing around [H == T ? "your" : "[T]'s"] [bodypart].</span>",
				target = T, target_message = "<span class='danger'>[H == T ? "You" : H] wrapped webbing around your [bodypart]!</span>")
			H.adjust_nutrition(spinner_rate * spinratemod)
			return
		H.visible_message("<span class='danger'>[H] starts to wrap [A] into a cocoon!</span>","<span class='warning'>You start to wrap [A] into a cocoon.</span>")
		if(!do_after(H, 10 SECONDS, 1, A))
			to_chat(H, "<span class='warning'>Your web spinning was interrupted!</span>")
			return
		H.adjust_nutrition(spinner_rate * -3)
		var/obj/structure/arachnid/cocoon/C = new(A.loc)
		if(isliving(A))
			C.icon_state = pick("cocoon_large1","cocoon_large2","cocoon_large3")
			H.visible_message("<span class='danger'>[H] wraps [A] into a large cocoon!</span>")
		else
			H.visible_message("<span class='danger'>[H] wraps [A] into a cocoon!</span>")
		A.forceMove(C)
		return
		/*
		H.visible_message("<span class='danger'>[H] starts to wrap [A] into a cocoon!</span>","<span class='warning'>You start to wrap [A] into a cocoon.</span>")
		if(!do_after(H, 10 SECONDS, 1, A))
			to_chat(H, "<span class='warning'>Your web spinning was interrupted!</span>")
			return
		H.adjust_nutrition(spinner_rate * -3)
		var/obj/structure/arachnid/cocoon/C = new(A.loc)
		if(isliving(A))
			if(ishuman(A))
				switch()
				return
			C.icon_state = pick("cocoon_large1","cocoon_large2","cocoon_large3")
			A.forceMove(C)
			H.visible_message("<span class='danger'>[H] wraps [A] into a large cocoon!</span>")
			return
		else
			A.forceMove(C)
			H.visible_message("<span class='danger'>[H] wraps [A] into a cocoon!</span>")
			return
		*/
