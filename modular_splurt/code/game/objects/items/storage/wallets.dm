// Bluespace wallet
/obj/item/storage/wallet/bluespace
	name = "\improper wallet of holding"
	desc = "A testament to science's hubris. It holds thrice as many stolen ID cards."
	icon = 'modular_splurt/icons/obj/storage.dmi'
	icon_state = "wallet_bluespace"

	// Copied from bag of holding
	resistance_flags = FIRE_PROOF
	item_flags = NO_MAT_REDEMPTION
	rad_flags = RAD_PROTECT_CONTENTS | RAD_NO_CONTAMINATE

/obj/item/storage/wallet/bluespace/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 12

/obj/item/storage/wallet/bluespace/update_icon_state()
	// Don't update icons
	return

// Tailbags
/obj/item/storage/wallet/tailbag
	name = "tailbag"
	desc = "A bag for holding small items. It fastens around the base of the tail."
	icon = 'modular_splurt/icons/obj/storage.dmi'
	icon_state = "tailbag"

/obj/item/storage/wallet/tailbag/update_icon_state()
	// Don't update icons
	return

/obj/item/storage/wallet/tailbag/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 6
	STR.can_hold += typecacheof(list( // Extra items that can go in tailbags, more than wallets
	/obj/item/restraints/handcuffs,
	/obj/item/assembly/flash,
	/obj/item/laser_pointer,
	/obj/item/pda,
	/obj/item/paicard
	))

/obj/item/storage/wallet/tailbag/xtralg
	name = "XL Tailbag"
	desc = "A larger tail bag for larger creatures"
	icon = 'modular_splurt/icons/obj/storage.dmi'
	icon_state = "tailbag_xl"

/obj/item/storage/wallet/tailbag/xtralg/update_icon_state()
	// Don't update icons
	return

/obj/item/storage/wallet/tailbag/xtralg/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 8

//
