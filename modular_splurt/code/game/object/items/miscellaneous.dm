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
		user.audible_message("<span class='warning'>[user]'s [name] rasps, \"[use_message]\"</span>", "<span class='warning'>\The [user] holds up \the [name].</span>")
	else
		if(insults > 0)
			playsound(get_turf(src), 'sound/voice/beepsky/insult.ogg', 100, 1, vary = 0)
			// Yes, it used to show the transcription of the sound clip. That was a) inaccurate b) immature as shit.
			user.audible_message("<span class='warning'>[user]'s [name] gurgles something indecipherable and deeply offensive.</span>", "<span class='warning'>\The [user] holds up \the [name].</span>")
			insults--
		else
			user << "<span class='danger'>*BZZZZZZZZT*</span>"

	spamcheck = 1
	spawn(20)
		spamcheck = 0

/obj/item/device/hailer/emag_act(remaining_charges, mob/user)
	if(isnull(insults))
		user << "<span class='danger'>You overload \the [src]'s voice synthesizer.</span>"
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
