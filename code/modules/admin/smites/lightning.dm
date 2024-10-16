/// Strikes the target with a lightning bolt
/datum/smite/lightning
	name = "Lightning bolt"

/datum/smite/lightning/effect(client/user, mob/living/target)
	. = ..()
	lightningbolt(target)
	to_chat(target, "<span class='userdanger'>The gods have punished you for your sins!</span>")

///this is the actual bolt effect and damage, made into its own proc because it is used elsewhere
/proc/lightningbolt(mob/living/user)
	playsound(get_turf(user), 'modular_splurt/sound/misc/NOW.ogg', 75, FALSE)
	sleep(4 SECONDS)
	var/turf/T = get_step(get_step(user, NORTH), NORTH)
	T.Beam(user, icon_state="lightning[rand(1,12)]", time = 5)
	user.adjustFireLoss(75)
	if(ishuman(user))
		var/mob/living/carbon/human/human_target = user
		human_target.electrocution_animation(40)

