#define BOOKIFY_TIME (2 SECONDS)
/// Turns the target into a book
/datum/smite/bookify
	name = "Bookify"

/datum/smite/bookify/effect(client/user, mob/living/carbon/human/target as mob)
	. = ..()
	var/mutable_appearance/book_appearance = mutable_appearance('icons/obj/library.dmi', "book")
	var/mutable_appearance/transform_scanline = mutable_appearance('modular_splurt/icons/effects/effects.dmi', "transform_effect")
	target.transformation_animation(book_appearance, time = BOOKIFY_TIME, transform_overlay=transform_scanline, reset_after=TRUE)
	addtimer(CALLBACK(GLOBAL_PROC, .proc/bookify, target), BOOKIFY_TIME)
	playsound(target, 'modular_splurt/sound/misc/bookify.ogg', 60, 1)
#undef BOOKIFY_TIME
