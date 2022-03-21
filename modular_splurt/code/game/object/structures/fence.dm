//HANDRAIL - Ported from Dymouth Gulch

/obj/structure/fence/handrail
	name = "handrail"
	desc = "A waist high handrail, perhaps you could climb over it."
	icon = 'modular_splurt/icons/obj/fence.dmi'
	icon_state = "handrail"
	cuttable = FALSE
	climbable = TRUE
	max_integrity = 100
	var/health = 70
	var/maxhealth = 70
	resistance_flags = ACID_PROOF
	armor = list("melee" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 80, "acid" = 100)
	CanAtmosPass = ATMOS_PASS_PROC
	var/breaksound = "shatter"
	var/hitsound = 'sound/effects/Glasshit.ogg'
	icon_state = "handrail"

/obj/structure/fence/handrail/handrail_end
	icon_state = "handrail_end"
	cuttable = FALSE
	climbable = TRUE

/obj/structure/fence/handrail/handrail_corner
	icon_state = "handrail_corner"
	cuttable = FALSE
	climbable = TRUE

/obj/structure/fence/handrail/examine(mob/user)
	. = ..()
	if(health < maxhealth)
		switch(health / maxhealth)
			if(0.0 to 0.5)
				. += "<span class='warning'>It looks severely damaged!</span>"
			if(0.25 to 0.5)
				. += "<span class='warning'>It looks damaged!</span>"
			if(0.5 to 1.0)
				. += "<span class='notice'>It has a few scrapes and dents.</span>"

/obj/structure/fence/handrail/take_damage(amount)
	health -= amount
	if(health <= 0)
		visible_message("<span class='warning'>\The [src] breaks down!</span>")
		playsound(src, 'sound/effects/grillehit.ogg', 50, 1)
		new /obj/item/stack/rods(get_turf(src))
		qdel(src)
