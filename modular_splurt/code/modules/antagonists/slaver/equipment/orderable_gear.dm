GLOBAL_LIST_INIT(slaver_gear, subtypesof(/datum/slaver_gear))

/datum/slaver_gear
	/// Name of the gear
	var/name = "Generic slaver Gear"
	/// Description of the gear
	var/description = "Generic description."
	/// Credit cost of the gear
	var/cost = 1
	/// Build path of the gear itself
	var/build_path = null
	/// Category of the gear
	var/category = "Basic Gear"

/datum/slaver_gear/slave_collars
	name = "Slave Collars"
	description = "Slave collar x 3."
	build_path = /obj/item/storage/box/slave_collars
	category = "Slaving"
	cost = 500

/datum/slaver_gear/jammers
	name = "Radio Jammers"
	description = "Radio jammer x 3."
	build_path = /obj/item/storage/box/jammers
	category = "Slaving"
	cost = 1000

/datum/slaver_gear/gloves
	name = "Combat Krav Maga Gloves"
	description = "Shock and fire-resistant gloves that also teach krav maga x 3."
	build_path = /obj/item/storage/box/krav_gloves
	category = "Slaving"
	cost = 1750

/datum/slaver_gear/pens
	name = "Sleepy Pens"
	description = "Pen that injects sleep-inducing chemicals x 7."
	build_path = /obj/item/storage/box/pens
	category = "Slaving"
	cost = 1500

/datum/slaver_gear/codespeak
	name = "Codespeak Manual"
	description = "A handy book that teaches the user how to speak in code. Useful to stop eavesdropping! This one has unlimited uses."
	build_path = /obj/item/codespeak_manual/unlimited
	category = "Slaving"
	cost = 1250

/datum/slaver_gear/chameleon
	name = "Chameleon Kit"
	description = "A set of items that contain chameleon technology allowing you to disguise as pretty much anything on the station, and more! \
			Due to budget cuts, the shoes don't provide protection against slipping."
	build_path = /obj/item/storage/box/syndie_kit/chameleon/ghostcafe/generic
	category = "Slaving"
	cost = 1000

/datum/slaver_gear/policing
	name = "Policing Kit"
	description = "Strobe shield x 1. Strobe replacement bulbs x 2. Stunbaton x 1. Box of handcuffs x 1. Electrostaff x 1."
	build_path = /obj/item/storage/backpack/duffelbag/syndie/policing_shipment
	category = "Slaving"
	cost = 3000

/datum/slaver_gear/slaver_gear
	name = "Slaver Gear"
	description = "A set of standard-issue slave trader items. The same you would find in your personal locker."
	build_path = /obj/structure/closet/crate/slaver_loadout
	category = "Slaving"
	cost = 1000

/datum/slaver_gear/x4
	name = "X4 charges"
	description = "X4 plastic explosive charge x 3."
	build_path = /obj/item/storage/box/syndie_kit/x4
	category = "Advanced"
	cost = 2500

/datum/slaver_gear/emag
	name = "Cryptographic Sequencer"
	description = "A card capable of instantly hacking open most doors."
	build_path = /obj/item/card/emag
	category = "Advanced"
	cost = 6000

/datum/slaver_gear/hardsuits
	name = "Combat Hardsuits"
	description = "Military suit supplied by our Syndicate sponsors x 2."
	build_path = /obj/item/storage/backpack/duffelbag/syndie/slaver_hardsuits
	category = "Advanced"
	cost = 10000

/datum/slaver_gear/jetpack
	name = "Jetpack"
	description = "Back-mounted jetpack for use in zero-gravity environments."
	build_path = /obj/item/tank/jetpack/oxygen/harness
	category = "Advanced"
	cost = 3000

/datum/slaver_gear/riot
	name = "Riot Kit"
	description = "Toy L6 SAW with riot darts."
	build_path = /obj/item/storage/backpack/duffelbag/syndie/l6saw_shipment
	category = "Advanced"
	cost = 4000

/datum/slaver_gear/medic
	name = "Medic Kit"
	description = "Advanced medical supplies for field medics."
	build_path = /obj/item/storage/firstaid/tactical/slaver
	category = "Advanced"
	cost = 3500

/datum/slaver_gear/chems
	name = "Bio Kit"
	description = "Chemical warfare? Warcrimes? Better not tell your mom! A set of items that drug your victim in case asking them nicely didn't work. \
			Contains a chem sprayer that confuses, knocks down and eventually knocks out the victim. A dart pistol. A mix of knockout and mute chems. And some teargas grenades just in case. \
			Disclaimer: Does not work on synthetic targets."
	build_path = /obj/item/storage/backpack/duffelbag/syndie/med/sleeperbundle
	category = "Advanced"
	cost = 5500

/datum/slaver_gear/disablers
	name = "Disablers"
	description = "An energy weapon that exhausts organic targets, weakening them until they collapse x 2"
	build_path = /obj/item/storage/backpack/duffelbag/syndie/disablers
	category = "Firearms"
	cost = 5000

/datum/slaver_gear/energy
	name = "Energy Weapons"
	description = "A basic hybrid energy gun with two settings: disable and kill x 2"
	build_path = /obj/item/storage/backpack/duffelbag/syndie/energy
	category = "Firearms"
	cost = 12000

/datum/slaver_gear/smg
	name = "SMG Kit"
	description = "WT-550 Semi-Automatic SMG. Spare magazine x 3."
	build_path = /obj/item/storage/backpack/duffelbag/syndie/smg
	category = "Firearms"
	cost = 15000

/datum/slaver_gear/smg_rubber
	name = "SMG Kit (rubber)"
	description = "WT-550 Semi-Automatic SMG with rubber munitions. Spare magazine x 3."
	build_path = /obj/item/storage/backpack/duffelbag/syndie/smg_rubber
	category = "Firearms"
	cost = 10000

/datum/slaver_gear/ion
	name = "Ion carbines"
	description = "Ion carbine x 2."
	build_path = /obj/item/storage/backpack/duffelbag/syndie/ion
	category = "Firearms"
	cost = 7500

/datum/slaver_gear/marksman
	name = "Marksman Kit"
	description = ".50 cal sniper rifle with sleep-inducing rounds."
	build_path = /obj/item/storage/backpack/duffelbag/syndie/slaver_marksman
	category = "Firearms"
	cost = 50000

/datum/slaver_gear/freedom
	name = "Freedom Implant"
	description = "An implant that instantly releases you from handcuffs."
	build_path = /obj/item/storage/box/syndie_kit/imp_freedom
	category = "Implants"
	cost = 4000

/datum/slaver_gear/xray
	name = "X-Ray Implant"
	description = "An implant that lets you see through solid walls."
	build_path = /obj/item/autosurgeon/xray_eyes
	category = "Implants"
	cost = 10000

/datum/slaver_gear/implant_teleport
	name = "Emergency Teleport Implants"
	description = "Emergency teleport implant x 2. Once activated, user needs to stand still for 5 seconds, after which they will be teleported from any location back to the slaver hideout. Has only one use."
	build_path = /obj/item/storage/box/slaver_teleport
	category = "Implants"
	cost = 15000

/datum/slaver_gear/borg_generic
	name = "Cyborg (Generic)"
	description = "A hacked cyborg, capable of using any module."
	build_path = /obj/item/antag_spawner/slaver_borg
	category = "Mech"
	cost = 50000

/datum/slaver_gear/borg_medical
	name = "Cyborg (Medical)"
	description = "A hacked medical combat cyborg, outfitted with a regenerative beam-gun and more powerful healing chemical."
	build_path = /obj/item/antag_spawner/slaver_borg/medical
	category = "Mech"
	cost = 50000

/datum/slaver_gear/mech
	name = "Gygax 'Riot-Control' Exosuit"
	description = "A lightweight, agile mecha. Weapons sold separately."
	build_path = /obj/mecha/combat/gygax/bluespace
	category = "Mech"
	cost = 50000

/datum/slaver_gear/mech_taser
	name = "PBT \"Pacifier\" Mounted Taser"
	description = "Shoots non-lethal stunning electrodes."
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/energy/taser
	category = "Mech"
	cost = 3000

/datum/slaver_gear/mech_ion
	name = "MKIV Ion Heavy Cannon"
	description = "Shoots technology-disabling ion beams. Don't catch yourself in the blast!"
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/energy/ion
	category = "Mech"
	cost = 3000

/datum/slaver_gear/mech_shotgun
	name = "LBX AC 10 \"Scattershot\""
	description = "Shoots a spread of pellets."
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/scattershot
	category = "Mech"
	cost = 3000

/datum/slaver_gear/mech_shotgun_ammo
	name = "LBX AC 10 \"Scattershot\" Ammo"
	description = "Buckshot for the LBX AC 10 \"Scattershot\" x 40."
	build_path = /obj/item/mecha_ammo/scattershot
	category = "Mech"
	cost = 1000

/datum/slaver_gear/mech_lmg
	name = "Ultra AC 2"
	description = "Shoots a rapid, three shot burst."
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/lmg
	category = "Mech"
	cost = 3000

/datum/slaver_gear/mech_lmg_ammo
	name = "Ultra AC 2 Ammo"
	description = "Rounds for the Ultra AC 2 x 300."
	build_path = /obj/item/mecha_ammo/lmg
	category = "Mech"
	cost = 1000

/datum/slaver_gear/mech_laser
	name = "CH-LC \"Solaris\" Laser Cannon"
	description = "Shoots heavy lasers."
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/energy/laser/heavy
	category = "Mech"
	cost = 3000

/datum/slaver_gear/mech_missiles
	name = "BRM-6 Missile Rack"
	description = "Launches low-explosive breaching missiles designed to explode only when striking a sturdy target."
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack/breaching
	category = "Mech"
	cost = 1500

/datum/slaver_gear/mech_missiles_ammo
	name = "BRM-6 Missile Rack Ammo"
	description = "Missiles for the BRM-6 missile rack x 6."
	build_path = /obj/item/mecha_ammo/missiles_br
	category = "Mech"
	cost = 500

/datum/slaver_gear/mech_cluster
	name = "SOB-3 Grenade Launcher"
	description = "Launches primed clusterbangs. You monster."
	build_path = /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/launcher/flashbang/clusterbang
	category = "Mech"
	cost = 3000

/datum/slaver_gear/mech_cluster_ammo
	name = "SOB-3 Grenade Launcher Ammo"
	description = "Grenades for the SOB-3 grenade launcher x 3"
	build_path = /obj/item/mecha_ammo/clusterbang
	category = "Mech"
	cost = 1000

/datum/slaver_gear/mech_repair
	name = "Exosuit Repair Droid"
	description = "An automated repair droid for exosuits. Scans for damage and repairs it. Can fix almost all types of external or internal damage."
	build_path = /obj/item/mecha_parts/mecha_equipment/repair_droid
	category = "Mech"
	cost = 1500
