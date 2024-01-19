/datum/design/wallet_holding
	name = "Wallet of Holding"
	desc = "A wallet that opens into a tiny bluespace pocket."
	id = "wallet_holding"
	build_type = PROTOLATHE
	materials = list(/datum/material/gold = 300, /datum/material/diamond = 100, /datum/material/bluespace = 200)
	build_path = /obj/item/storage/wallet/bluespace
	category = list("Bluespace Designs")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

//EXTRA DEPARTMENTAL FLAGS
/datum/design/miningsatchel_holding/New()
	departmental_flags |= DEPARTMENTAL_FLAG_SCIENCE
	. = ..()
