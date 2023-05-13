/datum/supply_pack/costumes_toys/randomised/toys/New()
	var/list/extra_contains = list(
		/obj/item/toy/prize/savannahivanov
	)
	LAZYADD(contains, extra_contains)
	. = ..()

/datum/supply_pack/costumes_toys/wedding/New()
	. = ..()
	var/list/extra_contains = list(
		/obj/item/bouquet,
		/obj/item/bouquet/sunflower,
		/obj/item/bouquet/poppy
	)
	LAZYADD(contains, extra_contains)
