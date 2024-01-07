/obj/item/hilbertshotel
	w_class = WEIGHT_CLASS_GIGANTIC
	var/list/list/mob_dorms = list()

/obj/item/hilbertshotel/sendToNewRoom(roomNumber, mob/user)
	. = ..()
	if(!mob_dorms[user]?.Find(roomNumber))
		LAZYADD(mob_dorms[user], roomNumber)

/obj/item/hilbertshotel/attack_hand(mob/user, list/modifiers)
	. = ..()
	if(.)
		return
	return promptAndCheckIn(user, user)

// Better SPLURT version of hilbert's
/datum/map_template/hilbertshotel
	mappath = '_maps/splurt_maps/templates/hilbertshotel.dmm'

// Empty room - different due to the dimensions of the updated map
/datum/map_template/hilbertshotel/empty
	mappath = '_maps/splurt_maps/templates/hilbertshotelempty.dmm'

// SELECTABLE APARTMENTS UPDATE
/datum/map_template/hilbertshotel/apartment
	name = "Apartment"
	mappath = '_maps/splurt_maps/templates/hilbertshotel_templates/apartment.dmm'

/datum/map_template/hilbertshotel/apartment/one
	name = "Apartment_1"
	mappath = '_maps/splurt_maps/templates/hilbertshotel_templates/apartment_1.dmm'

/datum/map_template/hilbertshotel/apartment/two
	name = "Apartment_2"
	mappath = '_maps/splurt_maps/templates/hilbertshotel_templates/apartment_2.dmm'

/datum/map_template/hilbertshotel/apartment/three
	name = "Apartment_3"
	mappath = '_maps/splurt_maps/templates/hilbertshotel_templates/apartment_3.dmm'

/datum/map_template/hilbertshotel/apartment/bar
	name = "Apartment_bar"
	mappath = '_maps/splurt_maps/templates/hilbertshotel_templates/apartment_bar.dmm'

/datum/map_template/hilbertshotel/apartment/garden
	name = "Apartment_garden"
	mappath = '_maps/splurt_maps/templates/hilbertshotel_templates/apartment_garden.dmm'

/datum/map_template/hilbertshotel/apartment/syndie
	name = "Apartment_syndie"
	mappath = '_maps/splurt_maps/templates/hilbertshotel_templates/apartment_syndie.dmm'

/datum/map_template/hilbertshotel/apartment/sauna
	name = "Apartment_sauna"
	mappath = '_maps/splurt_maps/templates/hilbertshotel_templates/apartment_sauna.dmm'
