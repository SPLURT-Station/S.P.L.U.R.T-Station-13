/datum/outfit/slaver
	name = "Slave Trader"

	uniform = /obj/item/clothing/under/syndicate
	shoes = /obj/item/clothing/shoes/workboots
	gloves = /obj/item/clothing/gloves/color/black
	back = /obj/item/storage/backpack
	ears = /obj/item/radio/headset/syndicate/slaver
	id = /obj/item/card/id/syndicate/slaver
	backpack_contents = list(/obj/item/storage/box/survival,\
		/obj/item/kitchen/knife/combat/survival)

/datum/outfit/slaver/leader
	name = "Slave Master"

	id = /obj/item/card/id/syndicate/slaver/leader
	gloves = /obj/item/clothing/gloves/krav_maga/combatglovesplus

/datum/outfit/slaver/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE, client/preference_source)
	H.faction |= ROLE_SLAVER
	H.update_icons()
