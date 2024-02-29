/obj/item/choice_beacon/hosgun
    desc = "Use this to summon your personal Head of Security issued sidearm!"

/obj/item/choice_beacon/copgun
	name = "personal weapon beacon"
	desc = "Use this to summon your personal Security issued sidearm!"

/obj/item/choice_beacon/copgun/generate_display_names()
	var/static/list/cop_gun_list
	if(!cop_gun_list)
		cop_gun_list = list()
		var/list/templist = subtypesof(/obj/item/storage/secure/briefcase/cop/) //we have to convert type = name to name = type, how lovely!
		for(var/V in templist)
			var/atom/A = V
			cop_gun_list[initial(A.name)] = A
	return cop_gun_list

/obj/item/choice_beacon/bsbaton
	name = "personal weapon beacon"
	desc = "Use this to summon your personal baton!"

/obj/item/choice_beacon/bsbaton/generate_display_names()
	var/static/list/bsbaton_list
	if(!bsbaton_list)
		bsbaton_list = list()
		var/list/templist = subtypesof(/obj/item/storage/secure/briefcase/bsbaton/) //we have to convert type = name to name = type, how lovely!
		for(var/V in templist)
			var/atom/A = V
			bsbaton_list[initial(A.name)] = A
	return bsbaton_list


/obj/item/device/hailer
	name = "hailer"
	desc = "Used by obese officers to save their breath for running."
	icon = 'modular_splurt/icons/obj/device.dmi'
	icon_state = "voice0"
	item_state = "flashbang"	//looks exactly like a flash (and nothing like a flashbang)
	w_class = WEIGHT_CLASS_TINY
	var/use_message = "Halt! Security!"
	var/spamcheck = 0
	var/insults

/obj/item/device/hailer/verb/set_message()
	set name = "Set Hailer Message"
	set category = "Object"
	set desc = "Alter the message shouted by your hailer."

	if(!isnull(insults))
		usr << "The hailer is fried. The tiny input screen just shows a waving ASCII penis."
		return

	var/new_message = input(usr, "Please enter new message (leave blank to reset).") as text
	if(!new_message || new_message == "")
		use_message = "Halt! Security!"
	else
		use_message = capitalize(copytext(sanitize(new_message), 1, MAX_MESSAGE_LEN))

	usr << "You configure the hailer to shout \"[use_message]\"."

/obj/item/device/hailer/attack_self(mob/living/carbon/user as mob)
	if (spamcheck)
		return

	if(isnull(insults))
		playsound(get_turf(src), 'modular_splurt/sound/voice/halt.ogg', 100, 1, vary = 0)
		user.audible_message(span_warning("[user]'s [name] rasps, \"[use_message]\""), span_warning("\The [user] holds up \the [name]."))
	else
		if(insults > 0)
			playsound(get_turf(src), 'sound/voice/beepsky/insult.ogg', 100, 1, vary = 0)
			// Yes, it used to show the transcription of the sound clip. That was a) inaccurate b) immature as shit.
			user.audible_message(span_warning("[user]'s [name] gurgles something indecipherable and deeply offensive."), span_warning("\The [user] holds up \the [name]."))
			insults--
		else
			user << span_danger("*BZZZZZZZZT*")

	spamcheck = 1
	spawn(20)
		spamcheck = 0

/obj/item/device/hailer/emag_act(remaining_charges, mob/user)
	if(isnull(insults))
		user << span_danger("You overload \the [src]'s voice synthesizer.")
		insults = rand(1, 3)//to prevent dickflooding
		return 1
	else
		user << "The hailer is fried. You can't even fit the sequencer into the input slot."


/obj/item/disk/data
	max_mutations = 15

//This'll be used for gun permits, such as for heads of staff, crew, and bartenders. Sec and the Captain do not require these

/obj/item/clothing/accessory/permit
	name = "Weapons permit"
	desc = "A permit for carrying weapons."
	icon = 'modular_splurt/icons/obj/permits.dmi'
	icon_state = "permit"
	mob_overlay_icon = 'icons/mob/clothing/accessories.dmi'
	w_class = WEIGHT_CLASS_TINY
	resistance_flags = FIRE_PROOF
	var/access = null
	var/owner = 0	//To prevent people from just renaming the thing if they steal it

/obj/item/clothing/accessory/permit/attack_self(mob/user as mob)
    if(isliving(user))
        if(!owner)
            set_name(user.name)
            to_chat(user, "[src] registers your name.")
            access += list(ACCESS_WEAPONS)
        else
            to_chat(user, "[src] already has an owner!")

/obj/item/clothing/accessory/permit/proc/set_name(new_name)
	owner = 1
	if(new_name)
		src.name += " ([new_name])"
		desc += " It belongs to [new_name]."

/obj/item/clothing/accessory/permit/head
	name = "Heads of staff weapon permit"
	desc = "A card indicating that the Head of staff is allowed to carry a weapon."
	icon_state = "compermit"

/obj/item/clothing/accessory/permit/bar
	name = "bar weapon permit"
	desc = "A card indicating that the barkeep is allowed to carry a weapon, most likely their shotgun."
	icon_state = "permit"

//Hyper stuff
// Bouquets
/obj/item/bouquet
	name = "mixed bouquet"
	desc = "A bouquet of sunflowers, lilies, and geraniums. How delightful."
	icon = 'modular_splurt/icons/obj/items_and_weapons.dmi'
	icon_state = "mixedbouquet"

/obj/item/bouquet/sunflower
	name = "sunflower bouquet"
	desc = "A bright bouquet of sunflowers."
	icon_state = "sunbouquet"

/obj/item/bouquet/poppy
	name = "poppy bouquet"
	desc = "A bouquet of poppies. You feel loved just looking at it."
	icon_state = "poppybouquet"

/obj/item/bouquet/rose
	name = "rose bouquet"
	desc = "A bouquet of roses. A bundle of love."
	icon_state = "rosebouquet"

/obj/item/clothing/accessory/badge
	name = "security badge"
	desc = "A badge showing the wearer is a member of Security."
	icon = 'modular_splurt/icons/obj/badge.dmi'
	icon_state = "security_badge"
	mob_overlay_icon = 'icons/mob/clothing/accessories.dmi'
	item_state = "lawerbadge"
	w_class = WEIGHT_CLASS_TINY
	resistance_flags = FIRE_PROOF
	var/owner = null	//To prevent people from just renaming the thing if they steal it
	var/ownjob = null

/obj/item/clothing/accessory/badge/proc/update_label()
	name = "Badge-[owner] ([ownjob])"

/obj/item/clothing/accessory/badge/attackby(obj/item/C, mob/user)
	if(istype(C, /obj/item/card/id))
		var/obj/item/card/id/idcard = C
		if(!idcard.registered_name)
			to_chat(user, span_warning("\The [src] rejects the ID!"))
			return

		if(!owner)
			owner = idcard.registered_name
			ownjob = idcard.assignment
			update_label()
			to_chat(user, span_notice("Badge updated."))


/obj/item/clothing/accessory/badge/attack_self(mob/user)
	if(Adjacent(user))
		user.visible_message(span_notice("[user] shows you: [icon2html(src, viewers(user))] [src.name]."), \
					span_notice("You show \the [src.name]."))
		add_fingerprint(user)

/obj/item/clothing/accessory/badge/holo
	name = "security holo badge"
	desc = "A more futuristic hard-light badge"
	icon_state = "security_badge_holo"

/obj/item/clothing/accessory/badge/deputy
	name = "security deputy badge"
	desc = "A shiny silver badge for deputies on the Security force"
	icon_state = "security_badge_deputy"

/datum/design/sec_badge
	name = "Security Badge"
	desc = "A shiny badge to show the bearer is part of the Security force."
	id = "sec_badge"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 200, /datum/material/gold = 100)
	build_path = /obj/item/clothing/accessory/badge
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/datum/design/dep_badge
	name = "Deputy Badge"
	desc = "A shiny badge for deputies to the Security force."
	id = "dep_badge"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 200, /datum/material/silver = 100)
	build_path = /obj/item/clothing/accessory/badge/deputy
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/obj/item/handmirror/split_personality
	name = "dissociative mirror"
	desc = "An enchanted hand mirror. You may not recognize who stares back."
	var/item_used

/obj/item/handmirror/split_personality/attack_self(mob/user)
	// Check if already used
	if(item_used)
		// Warn user, then return
		to_chat(user, span_warning("[src] is no longer functional."))
		return

	// Check if human user exists
	if(!ishuman(user))
		// Warn user, then return
		to_chat(user, span_warning("You see nothing in [src]."))
		return

	// Define human user
	var/mob/living/carbon/human/mirror_user = user

	// Add brain trauma
	mirror_user.gain_trauma(/datum/brain_trauma/severe/split_personality, TRAUMA_RESILIENCE_SURGERY)

	// Set item used variable
	// This prevents future use
	item_used = TRUE

	// Alert in local chat
	mirror_user.visible_message(span_warning("The [src] shatters in [mirror_user]'s hands!"), span_warning("The mirror shatters in your hands!"))

	// Play mirror break sound
	playsound(src, 'sound/effects/Glassbr3.ogg', 50, 1)

	// Set flavor text
	name = "broken hand mirror"
	desc = "You won\'t get much use out of it."

/obj/item/choice_beacon/box/plushie/deluxe
	name = "Deluxe choice box (plushie)"
	desc =  "Using the power of quantum entanglement, this box contains five times every plush, until the moment it is opened!"
	var/uses = 5

/obj/item/choice_beacon/box/plushie/deluxe/spawn_option(choice, mob/living/M)
	//I don't wanna recode two different procs just for it to do the same as doing this
	if(uses > 1)
		var/obj/item/choice_beacon/box/plushie/deluxe/replace = new
		replace.uses = uses - 1
		M.put_in_hands(replace)
	. = ..()

/obj/item/choice_beacon/ouija
	name = "spirit board delivery beacon"
	desc = "Ghost communication on demand! It is unclear how this thing is still operational."

/obj/item/choice_beacon/ouija/generate_display_names()
	var/static/list/ouija_spaghetti_list
	if(!ouija_spaghetti_list)
		ouija_spaghetti_list = list()
		var/list/templist = list(/obj/structure/spirit_board)
		for(var/V in templist)
			var/atom/A = V
			ouija_spaghetti_list[initial(A.name)] = A
	return ouija_spaghetti_list
