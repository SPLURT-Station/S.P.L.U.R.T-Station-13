/obj/item/clothing
	var/last_bites = 3 //Once clothes is shredded, this determines how many more bites till its deleted.
	var/is_edible = 0 //Controls what can or can't be eaten by Clothes Eaters/Insects

//Cloth eaters get some nutrients. A Jumpsuit will roughly give back 50 Nutrition. IF eaten fully.
/obj/item/reagent_containers/food/snacks/clothing
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)

//A call on attemp_forcefeed() without async to properly know if it worked or not. In theory this shouldn't cause any issues as only a small part of the population should ever run this.VS normal eating.
/obj/item/reagent_containers/food/snacks/clothing/attack(mob/living/M, mob/living/user, attackchain_flags = NONE, damage_multiplier = 1)
	if(user.a_intent == INTENT_HARM)
		return ..()
	return attempt_forcefeed(M, user)


//As a bonus for having the Cloth Eater trait. You gain extra mood from eatin clothes, but damage them at the same time.
/obj/item/clothing/attack(mob/M, mob/user, def_zone)
	if(user.a_intent != INTENT_HARM)
		if(HAS_TRAIT(M,TRAIT_CLOTH_EATER) || isinsect(M))
			if(is_edible == 0) //This checks if an item can be shredded.
				to_chat(M, "<span class='warning'>This item is too tough to eat.")
				return FALSE //Return False to prevent the player smacking themselves with the item. Didn't want to risk a player accidently hurting themselves trying to eat anything.
			var/obj/item/reagent_containers/food/snacks/clothing/clothing_as_food = new
			clothing_as_food.name = name
			var/mob/living/H = M
			if(clothing_as_food.attack(M, user, def_zone)) //Staggered as calling it in the original IF will cause anyone who lacks either to eat.
				if(damaged_clothes == CLOTHING_SHREDDED) //Check if we need to start breaking clothes
					last_bites -= 1
					to_chat(M, "<span class='danger'>There isn't much of the [name] left to eat.")
				SEND_SIGNAL(H, COMSIG_ADD_MOOD_EVENT, "cloth_consumed", /datum/mood_event/cloth_eaten, src)
				take_damage(20, sound_effect=FALSE)
				qdel(clothing_as_food)
			if(last_bites <= 0)
				user.visible_message("<span class='notice'>[user] finishes eating the [name].")
				qdel(src)
			return TRUE
	return ..()

// Set the clothing's integrity back to 100%, remove all damage to bodyparts, and generally fix it up
/obj/item/clothing/repair(mob/user, params)
	.=..()
	last_bites = 3

