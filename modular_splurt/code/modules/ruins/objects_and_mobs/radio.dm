/obj/item/encryptionkey/headset_service/hotel
	name = "hotel staff radio encryption key"
	channels = list(RADIO_CHANNEL_HOTEL = 1)
	independent = TRUE


/obj/item/radio/headset/headset_srv/hotel
	keyslot = new /obj/item/encryptionkey/headset_service/hotel
	name = "hotel staff headset"

/obj/item/radio/headset/headset_srv/hotel/manager
	name = "hotel manager headset"
	desc = "The local manager's headset. It has loudmode!"
	command = TRUE
