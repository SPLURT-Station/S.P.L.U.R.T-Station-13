/obj/item/storage/belt/slut
	name = "slutcurity belt"
	desc = "Holds a variety of gear for \"alternative\" peacekeeping."
	icon = 'modular_splurt/icons/obj/clothing/belts.dmi'
	icon_state = "slutbelt"
	item_state = "security"

obj/item/storage/belt/slut/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 5
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.can_hold = typecacheof(list(
		/obj/item/melee/baton,
		/obj/item/melee/classic_baton,
		/obj/item/grenade,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/restraints/handcuffs,
		/obj/item/assembly/flash/handheld,
		/obj/item/clothing/glasses,
		/obj/item/reagent_containers/food/snacks/donut,
		/obj/item/flashlight/seclite,
		/obj/item/melee/classic_baton/telescopic,
		/obj/item/radio,
		/obj/item/clothing/gloves,
		/obj/item/restraints/legcuffs/bola,
		/obj/item/dildo,
		/obj/item/leash,
		/obj/item/genital_equipment/condom,
		/obj/item/bdsm_whip,
		/obj/item/clothing/mask/gas/sechailer/slut
	))

/obj/item/storage/belt/cummerbund
	name = "cummerbund" //I swear to god if you people aren't mature enough to handle this I'm just gonna call it a sash.
	desc = "A pleated sash that pairs well with a suit jacket."
	icon = 'modular_splurt/icons/obj/clothing/belts.dmi'
	icon_state = "cummerbund"
	item_state = "cummerbund"

