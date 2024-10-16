/// Bonks the target
/datum/smite/bonk
	name = "Bonk"

/datum/smite/bonk/effect(client/user, mob/living/target)
	. = ..()
	playsound(target, 'modular_splurt/sound/misc/bonk.ogg', 100, 1)
	target.AddElement(/datum/element/squish, 60 SECONDS)
	to_chat(target, "<span class='warning big'>Bonk.</span>")
