GLOBAL_LIST_INIT(slaver_gear, subtypesof(/datum/slaver_gear))

/datum/slaver_gear
	/// Name of the gear
	var/name = "Generic slaver Gear"
	/// Description of the gear
	var/description = "Generic description."
	/// Unique ID of the gear
	var/id = "slaver_generic"
	/// Credit cost of the gear
	var/cost = 1
	/// Build path of the gear itself
	var/build_path = null
	/// Category of the gear
	var/category = "Basic Gear"

/datum/slaver_gear/slave_collars
	name = "Slave Collars"
	description = "Slave collar x 3."
	id = "slave_collar"
	build_path = /obj/item/storage/box/slave_collars
	category = "Slaving"
	cost = 3000

/datum/slaver_gear/jammers
	name = "Radio Jammers"
	description = "Radio jammer x 3."
	id = "jammers"
	build_path = /obj/item/storage/box/jammers
	category = "Slaving"
	cost = 4000

/datum/slaver_gear/gloves
	name = "Combat Krav Maga Gloves"
	description = "Shock and fire-resistant gloves that also teach krav maga x 3."
	id = "gloves"
	build_path = /obj/item/storage/box/krav_gloves
	category = "Slaving"
	cost = 7000

/datum/slaver_gear/pens
	name = "Sleepy Pens"
	description = "Pen that injects sleep-inducing chemicals x 7."
	id = "pens"
	build_path = /obj/item/storage/box/pens
	category = "Slaving"
	cost = 3500

/datum/slaver_gear/codespeak
	name = "Codespeak Manual"
	description = "A handy book that teaches the user how to speak in code. Useful to stop eavesdropping! This one has unlimited uses."
	id = "codespeak"
	build_path = /obj/item/codespeak_manual/unlimited
	category = "Slaving"
	cost = 3000

/datum/slaver_gear/slaver_gear
	name = "Slaver Gear"
	description = "A set of standard-issue slave trader items. The same you would find in your personal locker."
	id = "slaver_gear"
	build_path = /obj/structure/closet/crate/slaver_loadout
	category = "Slaving"
	cost = 3500

/datum/slaver_gear/emag
	name = "Cryptographic Sequencer"
	description = "A card capable of instantly hacking open most doors."
	id = "emag"
	build_path = /obj/item/card/emag
	category = "Advanced"
	cost = 5500

/datum/slaver_gear/implant_teleport
	name = "Emergency Teleport Implants"
	description = "Emergency teleport implant x 2."
	id = "implant_teleport"
	build_path = /obj/item/storage/box/slaver_teleport
	category = "Advanced"
	cost = 15000

/datum/slaver_gear/hardsuits
	name = "Combat Hardsuits"
	description = "Military suit supplied by our Syndicate sponsors x 2."
	id = "hardsuits"
	build_path = /obj/structure/closet/crate/slaver_hardsuits
	category = "Advanced"
	cost = 10000

/datum/slaver_gear/medic
	name = "Medic Kit"
	description = "Advanced medical supplies for field medics."
	id = "implant_teleport"
	build_path = /obj/item/storage/firstaid/tactical/slaver
	category = "Advanced"
	cost = 8500

/datum/slaver_gear/marksman
	name = "Marksman Kit"
	description = ".50 cal sniper rifle with sleep-inducing rounds."
	id = "marksman"
	build_path = /obj/structure/closet/crate/slaver_marksman
	category = "Advanced"
	cost = 17500

/datum/slaver_gear/mech
	name = "Gygax 'Riot-Control' Exosuit"
	description = "A lightweight, agile mecha. This one comes with a taser cannon, clusterbang launcher and breaching missiles. Must be self-assembled."
	id = "mech"
	build_path = /obj/structure/closet/crate/slaver_mech
	category = "Mech"
	cost = 45000

/datum/slaver_gear/mech_ammo
	name = "Gygax Exosuit Ammo"
	description = "A shipment of ammo for the Gygax 'Riot-Control' Exosuit. Clusterbang x 3, breaching missile x 6."
	id = "mech_ammo"
	build_path = /obj/structure/closet/crate/slaver_mech_ammo
	category = "Mech"
	cost = 17000
