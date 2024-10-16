/// Throws a pie at the target
/datum/smite/pie
	name = "Pie"

/datum/smite/pie/effect(client/user, mob/living/target)
	. = ..()
	var/obj/item/reagent_containers/food/snacks/pie/cream/nostun/creamy = new(get_turf(target))
	creamy.splat(target)
