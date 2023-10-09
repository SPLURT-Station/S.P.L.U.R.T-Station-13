//Meant for simple animals to drop lootable human bodies.

//If someone can do this in a neater way, be my guest-Kor

//This has to be separate from the Away Mission corpses, because New() doesn't work for those, and initialize() doesn't work for these.

//To do: Allow corpses to appear mangled, bloody, etc. Allow customizing the bodies appearance (they're all bald and white right now).

//List of different corpse types

/obj/effect/mob_spawn/human/corpse/nanotrasenassaultsoldier
	name = "Nanotrasen Private Security Officer"
	id_job = "Nanotrasen Assault Force"
	id_access = "Security Officer"
	outfit = /datum/outfit/nanotrasenassaultsoldiercorpse
	hair_style = "Bald"
	facial_hair_style = "Shaved"

/datum/outfit/nanotrasenassaultsoldiercorpse
	name = "NT Assault Officer Corpse"
	uniform = /obj/item/clothing/under/syndicate
	suit = /obj/item/clothing/suit/armor/vest
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/combat
	ears = /obj/item/radio/headset
	mask = /obj/item/clothing/mask/gas/sechailer/swat
	head = /obj/item/clothing/head/helmet/swat/nanotrasen
	back = /obj/item/storage/backpack/security
	id = /obj/item/card/id
