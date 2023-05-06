// WINTER COATS

// Winter Coat
/obj/item/clothing/suit/hooded/wintercoat
	name = "winter coat"
	desc = "A heavy jacket made from 'synthetic' animal furs."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatwinter"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	body_parts_covered = CHEST|GROIN|ARMS
	cold_protection = CHEST|GROIN|ARMS
	heat_protection = CHEST|GROIN|ARMS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	max_heat_protection_temperature = COAT_MAX_TEMP_PROTECT
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 10, RAD = 0, FIRE = 0, ACID = 0)
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter)
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/clothing/head/hooded/winterhood
	name = "winter hood"
	desc = "A hood attached to a heavy winter jacket."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_winter"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'
	body_parts_covered = HEAD
	cold_protection = HEAD
	heat_protection = HEAD
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT
	max_heat_protection_temperature = COAT_MAX_TEMP_PROTECT
	flags_inv = HIDEHAIR|HIDEEARS
	rad_flags = RAD_NO_CONTAMINATE

// Centcomm
/obj/item/clothing/suit/hooded/wintercoat/centcom
	name = "centcom winter coat"
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatcentcom"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	armor = list(MELEE = 40, BULLET = 45, LASER = 45, ENERGY = 35, BOMB = 40, BIO = 25, RAD = 25, FIRE = 35, ACID = 50)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/centcom

/obj/item/clothing/suit/hooded/wintercoat/centcom/Initialize(mapload)
	. = ..()
	allowed = GLOB.security_wintercoat_allowed

/obj/item/clothing/head/hooded/winterhood/centcom
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_centcom"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'
	armor = list(MELEE = 40, BULLET = 45, LASER = 45, ENERGY = 35, BOMB = 40, BIO = 25, RAD = 25, FIRE = 35, ACID = 50)

//Captain
/obj/item/clothing/suit/hooded/wintercoat/captain
	name = "captain's winter coat"
	desc = "A luxurious winter coat, stuffed with the down of the endangered Uka bird and trimmed with genuine sable. The fabric is an indulgently soft micro-fiber, and the deep ultramarine color is only one that could be achieved with minute amounts of crystalline bluespace dust woven into the thread between the plectrums. Extremely lavish, and extremely durable. The tiny flakes of protective material make it nothing short of extremely light lamellar armor."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatcaptain"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	armor = list(MELEE = 25, BULLET = 30, LASER = 30, ENERGY = 10, BOMB = 25, BIO = 0, RAD = 0, FIRE = 0, ACID = 50)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/captain

/obj/item/clothing/suit/hooded/wintercoat/captain/Initialize(mapload)
	. = ..()
	allowed = GLOB.security_wintercoat_allowed

/obj/item/clothing/head/hooded/winterhood/captain
	desc = "A blue and yellow hood attached to a heavy winter jacket."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_captain"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Head of Personel
/obj/item/clothing/suit/hooded/wintercoat/hop
	name = "head of personnel's winter coat"
	desc = "A cozy winter coat, covered in thick fur. The breast features a proud yellow chevron, reminding everyone that you're the second banana."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coathop"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	armor = list(MELEE = 5, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 5, BIO = 5, RAD = 0, FIRE = 0, ACID = 5)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/hop

/obj/item/clothing/head/hooded/winterhood/hop
	desc = "A cozy winter hood attached to a heavy winter jacket."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_hop"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Security
/obj/item/clothing/suit/hooded/wintercoat/security
	name = "security winter coat"
	desc = "A red, armor-padded winter coat. It glitters with a mild ablative coating and a robust air of authority.  The zipper tab is a pair of jingly little handcuffs that get annoying after the first ten seconds."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatsecurity"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	armor = list(MELEE = 25, BULLET = 15, LASER = 30, ENERGY = 10, BOMB = 25, BIO = 0, RAD = 0, FIRE = 0, ACID = 45)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/security

/obj/item/clothing/suit/hooded/wintercoat/security/Initialize(mapload)
	. = ..()
	allowed = GLOB.security_wintercoat_allowed

/obj/item/clothing/head/hooded/winterhood/security
	desc = "A red, armor-padded winter hood."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_security"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Head of Security
/obj/item/clothing/suit/hooded/wintercoat/hos
	name = "head of security's winter coat"
	desc = "A red, armor-padded winter coat, lovingly woven with a Kevlar interleave and reinforced with semi-ablative polymers and a silver azide fill material. The zipper tab looks like a tiny replica of Beepsky."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coathos"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	armor = list(MELEE = 35, BULLET = 35, LASER = 35, ENERGY = 15, BOMB = 30, BIO = 0, RAD = 0, FIRE = 0, ACID = 55)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/hos

/obj/item/clothing/suit/hooded/wintercoat/hos/Initialize(mapload)
	. = ..()
	allowed = GLOB.security_wintercoat_allowed

/obj/item/clothing/head/hooded/winterhood/hos
	desc = "A red, armor-padded winter hood, lovingly woven with a Kevlar interleave. Definitely not bulletproof, especially not the part where your face goes."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_hos"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Medical
/obj/item/clothing/suit/hooded/wintercoat/medical
	name = "medical winter coat"
	desc = "An arctic white winter coat with a small blue caduceus instead of a plastic zipper tab. Snazzy."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatmedical"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	allowed = list(/obj/item/analyzer, /obj/item/sensor_device, /obj/item/stack/medical, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/hypospray, /obj/item/healthanalyzer, /obj/item/flashlight/pen, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/melee/classic_baton/telescopic, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman)
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 50, RAD = 0, FIRE = 0, ACID = 45)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/medical

/obj/item/clothing/head/hooded/winterhood/medical
	desc = "A white winter coat hood."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_medical"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Chief Medical Officer
/obj/item/clothing/suit/hooded/wintercoat/cmo
	name = "chief medical officer's winter coat"
	desc = "An arctic white winter coat with a small blue caduceus instead of a plastic zipper tab. The normal liner is replaced with an exceptionally thick, soft layer of fur."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatcmo"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	allowed = list(/obj/item/analyzer, /obj/item/sensor_device, /obj/item/stack/medical, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/hypospray, /obj/item/healthanalyzer, /obj/item/flashlight/pen, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/melee/classic_baton/telescopic, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman)
	armor = list(MELEE = 5, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 50, RAD = 0, FIRE = 0, ACID = 0)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/cmo

/obj/item/clothing/head/hooded/winterhood/cmo
	desc = "A white winter coat hood."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_cmo"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Chemistry
/obj/item/clothing/suit/hooded/wintercoat/chemistry
	name = "chemistry winter coat"
	desc = "A lab-grade winter coat made with acid resistant polymers. For the enterprising chemist who was exiled to a frozen wasteland on the go."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatchemistry"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	allowed = list(/obj/item/analyzer, /obj/item/sensor_device, /obj/item/stack/medical, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/hypospray, /obj/item/healthanalyzer, /obj/item/flashlight/pen, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/melee/classic_baton/telescopic, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman)
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 30, RAD = 0, FIRE = 30, ACID = 45)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/chemistry

/obj/item/clothing/head/hooded/winterhood/chemistry
	desc = "A white winter coat hood."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_chemistry"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Virology
/obj/item/clothing/suit/hooded/wintercoat/viro
	name = "virology winter coat"
	desc = "A white winter coat with green markings. Warm, but wont fight off the common cold or any other disease. Might make people stand far away from you in the hallway. The zipper tab looks like an oversized bacteriophage."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatviro"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	allowed = list(/obj/item/analyzer, /obj/item/sensor_device, /obj/item/stack/medical, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/hypospray, /obj/item/healthanalyzer, /obj/item/flashlight/pen, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/melee/classic_baton/telescopic, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman)
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 30, RAD = 0, FIRE = 0, ACID = 0)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/viro

/obj/item/clothing/head/hooded/winterhood/viro
	desc = "A white winter coat hood with green markings."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_viro"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Paramedic
/obj/item/clothing/suit/hooded/wintercoat/paramedic
	name = "paramedic winter coat"
	desc = "A winter coat with blue markings. Warm, but probably won't protect from biological agents. For the cozy doctor on the go."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatparamed"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	allowed = list(/obj/item/analyzer, /obj/item/sensor_device, /obj/item/stack/medical, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/hypospray, /obj/item/healthanalyzer, /obj/item/flashlight/pen, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/melee/classic_baton/telescopic, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman)
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 50, RAD = 0, FIRE = 0, ACID = 45)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/paramedic

/obj/item/clothing/head/hooded/winterhood/paramedic
	desc = "A white winter coat hood with blue markings."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_paramed"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Science
/obj/item/clothing/suit/hooded/wintercoat/science
	name = "science winter coat"
	desc = "A white winter coat with an outdated atomic model instead of a plastic zipper tab."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatscience"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	allowed = list(/obj/item/analyzer, /obj/item/stack/medical, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/hypospray, /obj/item/healthanalyzer, /obj/item/flashlight/pen, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/melee/classic_baton/telescopic, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman)
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 10, BIO = 0, RAD = 0, FIRE = 0, ACID = 0)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/science

/obj/item/clothing/head/hooded/winterhood/science
	desc = "A white winter coat hood. This one will keep your brain warm. About as much as the others, really."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_science"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Roboticist
/obj/item/clothing/suit/hooded/wintercoat/robotics
	name = "robotics winter coat"
	desc = "A black winter coat with a badass flaming robotic skull for the zipper tab. This one has bright red designs and a few useless buttons."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatrobotics"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	allowed = list(/obj/item/analyzer, /obj/item/stack/medical, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/hypospray, /obj/item/healthanalyzer, /obj/item/melee/classic_baton/telescopic, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/screwdriver, /obj/item/crowbar, /obj/item/wrench, /obj/item/stack/cable_coil, /obj/item/weldingtool, /obj/item/multitool)
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 10, BIO = 0, RAD = 0, FIRE = 0, ACID = 0)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/robotics

/obj/item/clothing/head/hooded/winterhood/robotics
	desc = "A black winter coat hood. You can pull it down over your eyes and pretend that you're an outdated, late 1980s interpretation of a futuristic mechanized police force. They'll fix you. They fix everything."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_robotics"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Geneticist
/obj/item/clothing/suit/hooded/wintercoat/genetics
	name = "genetics winter coat"
	desc = "A white winter coat with a DNA helix for the zipper tab. "
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatgenetics"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	allowed = list(/obj/item/analyzer, /obj/item/stack/medical, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/hypospray, /obj/item/healthanalyzer, /obj/item/flashlight/pen, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/melee/classic_baton/telescopic, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/genetics

/obj/item/clothing/head/hooded/winterhood/genetics
	desc = "A white winter coat hood. It's warm."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_genetics"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Research Director
/obj/item/clothing/suit/hooded/wintercoat/rd
	name = "research director's winter coat"
	desc = "A thick arctic winter coat with an outdated atomic model instead of a plastic zipper tab. Most in the know are heavily aware that Bohr's model of the atom was outdated by the time of the 1930s when the Heisenbergian and Schrodinger models were generally accepted for true. Nevertheless, we still see its use in anachronism, roleplaying, and, in this case, as a zipper tab. At least it should keep you warm on your ivory pillar."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatrd"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	allowed = list(/obj/item/analyzer, /obj/item/stack/medical, /obj/item/dnainjector, /obj/item/reagent_containers/dropper, /obj/item/reagent_containers/syringe, /obj/item/reagent_containers/hypospray, /obj/item/healthanalyzer, /obj/item/flashlight/pen, /obj/item/reagent_containers/glass/bottle, /obj/item/reagent_containers/glass/beaker, /obj/item/reagent_containers/pill, /obj/item/storage/pill_bottle, /obj/item/paper, /obj/item/melee/classic_baton/telescopic, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman)
	armor = list(MELEE = 0, BULLET = 0, LASER = 5,ENERGY = 0, BOMB = 15, BIO = 5, RAD = 5, FIRE = 0, ACID = 0)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/rd

/obj/item/clothing/head/hooded/winterhood/rd
	desc = "A white winter coat hood. It smells faintly of hair gel."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_rd"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Chief Engineer
/obj/item/clothing/suit/hooded/wintercoat/ce
	name = "chief engineer's winter coat"
	desc = "A white winter coat with reflective green and yellow stripes. Stuffed with asbestos, treated with fire retardant PBDE, lined with a micro thin sheet of lead foil and snugly fitted to your body's measurements. This baby's ready to save you from anything except the thyroid cancer and systemic fibrosis you'll get from wearing it. The zipper tab is a tiny golden wrench."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatce"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	armor = list(MELEE = 0, BULLET = 0, LASER = 5, ENERGY = 0, BOMB = 10, BIO = 0, RAD = 30, FIRE = 35, ACID = 45)
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/t_scanner, /obj/item/construction/rcd, /obj/item/pipe_dispenser, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/ce

/obj/item/clothing/head/hooded/winterhood/ce
	desc = "A white winter coat hood. Feels surprisingly heavy. The tag says that it's not child safe."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_ce"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Engineering
/obj/item/clothing/suit/hooded/wintercoat/engineering
	name = "engineering winter coat"
	desc = "A surprisingly heavy yellow winter coat with reflective orange stripes. It has a small wrench for its zipper tab, and the inside layer is covered with a radiation-resistant silver-nylon blend. Because you're worth it."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatengineer"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 20, FIRE = 30, ACID = 45)
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/t_scanner, /obj/item/construction/rcd, /obj/item/pipe_dispenser, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/engineering

/obj/item/clothing/head/hooded/winterhood/engineering
	desc = "A yellow winter coat hood. Definitely not a replacement for a hard hat."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_engineer"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Atmospherics
/obj/item/clothing/suit/hooded/wintercoat/engineering/atmos
	name = "atmospherics winter coat"
	desc = "A yellow and blue winter coat. The zipper pull-tab is made to look like a miniature breath mask."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatatmos"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	hoodtype = /obj/item/clothing/head/hooded/winterhood/engineering/atmos

/obj/item/clothing/head/hooded/winterhood/engineering/atmos
	desc = "A yellow and blue winter coat hood."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_atmos"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Hydroponics
/obj/item/clothing/suit/hooded/wintercoat/hydro
	name = "hydroponics winter coat"
	desc = "A green and blue winter coat. The zipper tab looks like the flower from a member of Rosa Hesperrhodos, a pretty pink-and-white rose. The colors absolutely clash."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coathydro"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	allowed = list(/obj/item/reagent_containers/spray/plantbgone, /obj/item/plant_analyzer, /obj/item/seeds, /obj/item/reagent_containers/glass/bottle, /obj/item/cultivator, /obj/item/reagent_containers/spray/pestspray, /obj/item/hatchet, /obj/item/storage/bag/plants, /obj/item/toy, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/storage/fancy/cigarettes, /obj/item/lighter)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/hydro

/obj/item/clothing/head/hooded/winterhood/hydro
	desc = "A green winter coat hood."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_hydro"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Bartender
/obj/item/clothing/suit/hooded/wintercoat/bar
	name = "bartender winter coat"
	desc = "A fancy winter coat with a waistcoat and flamboyant bowtie stuck onto it. The zipper tab is actually the bowtie."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatbar"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	hoodtype = /obj/item/clothing/head/hooded/winterhood/bar

/obj/item/clothing/head/hooded/winterhood/bar
	desc = "A fancy winter coat hood."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_bar"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Cosmic
/obj/item/clothing/suit/hooded/wintercoat/cosmic
	name = "cosmic winter coat"
	desc = "A starry winter coat that even glows softly."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatcosmic"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	hoodtype = /obj/item/clothing/head/hooded/winterhood/cosmic
	light_power = 1.8
	light_range = 1.2

/obj/item/clothing/head/hooded/winterhood/cosmic
	desc = "A starry winter hood."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_cosmic"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Janitor
/obj/item/clothing/suit/hooded/wintercoat/janitor
	name = "janitors winter coat"
	desc = "A purple-and-beige winter coat that smells of space cleaner."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatjanitor"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	allowed = list(/obj/item/toy, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/storage/fancy/cigarettes, /obj/item/lighter,/obj/item/grenade/chem_grenade,/obj/item/lightreplacer,/obj/item/flashlight,/obj/item/reagent_containers/glass/beaker,/obj/item/reagent_containers/glass/bottle,/obj/item/reagent_containers/spray,/obj/item/soap,/obj/item/holosign_creator,/obj/item/key/janitor,/obj/item/melee/flyswatter,/obj/item/paint/paint_remover,/obj/item/storage/bag/trash,/obj/item/reagent_containers/glass/bucket)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/janitor

/obj/item/clothing/head/hooded/winterhood/janitor
	desc = "A purple hood that smells of space cleaner."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_janitor"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Cargo
/obj/item/clothing/suit/hooded/wintercoat/cargo
	name = "cargo winter coat"
	desc = "A tan-and-grey winter coat that has a crate for its zipper pull tab. It fills you with the warmth of a fierce independence."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatcargo"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	hoodtype = /obj/item/clothing/head/hooded/winterhood/cargo

/obj/item/clothing/head/hooded/winterhood/cargo
	desc = "A grey hood for a winter coat."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_cargo"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Quartermaster
/obj/item/clothing/suit/hooded/wintercoat/qm
	name = "quartermaster's winter coat"
	desc = "A dark brown winter coat that has a golden crate pin for its zipper pully."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatqm"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	hoodtype = /obj/item/clothing/head/hooded/winterhood/qm

/obj/item/clothing/head/hooded/winterhood/qm
	desc = "A dark brown winter hood"
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_qm"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Aformal
/obj/item/clothing/suit/hooded/wintercoat/aformal
	name = "assistant's formal winter coat"
	desc = "A black button up winter coat."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coataformal"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter,/obj/item/clothing/gloves/color/yellow)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/aformal

/obj/item/clothing/head/hooded/winterhood/aformal
	desc = "A black winter coat hood."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_aformal"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Miner
/obj/item/clothing/suit/hooded/wintercoat/miner
	name = "mining winter coat"
	desc = "A dusty button up winter coat. The zipper tab looks like a tiny pickaxe."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatminer"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	allowed = list(/obj/item/pickaxe, /obj/item/flashlight, /obj/item/tank/internals, /obj/item/resonator, /obj/item/mining_scanner, /obj/item/t_scanner/adv_mining_scanner, /obj/item/gun/energy/kinetic_accelerator, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter)
	armor = list(MELEE = 10, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 0, ACID = 0)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/miner

/obj/item/clothing/head/hooded/winterhood/miner
	desc = "A dusty winter coat hood."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_miner"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Ratvar
/obj/item/clothing/suit/hooded/wintercoat/ratvar
	name = "ratvarian winter coat"
	desc = "A brass-plated button up winter coat. Instead of a zipper tab, it has a brass cog with a tiny red gemstone inset."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatratvar"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	armor = list(MELEE = 30, BULLET = 45, LASER = -10, ENERGY = 0, BOMB = 30, BIO = 0, RAD = 0, FIRE = 60, ACID = 60)
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter, /obj/item/clockwork/replica_fabricator, /obj/item/clockwork/integration_cog, /obj/item/clockwork/slab, /obj/item/clockwork/weapon/ratvarian_spear)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/ratvar
	var/real = TRUE

/obj/item/clothing/head/hooded/winterhood/ratvar
	desc = "A brass-plated winter hood that glows softly, hinting at its divinity."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_ratvar"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'
	light_range = 3
	light_power = 1
	light_color = "#B18B25" //clockwork slab background top color

/obj/item/clothing/suit/hooded/wintercoat/ratvar/equipped(mob/living/user,slot)
	..()
	if (slot != ITEM_SLOT_OCLOTHING || !real)
		return
	if (is_servant_of_ratvar(user))
		return
	else
		user.dropItemToGround(src)
		to_chat(user,"<span class='large_brass'>\"Amusing that you think you are fit to wear this.\"</span>")
		to_chat(user,"<span class='userdanger'>Your skin burns where the coat touched your skin!</span>")
		user.adjustFireLoss(rand(10,16))

// Narsie
/obj/item/clothing/suit/hooded/wintercoat/narsie
	name = "narsian winter coat"
	desc = "A somber button-up in tones of grey entropy and a wicked crimson zipper. When pulled all the way up, the zipper looks like a bloody gash. The zipper pull looks like a single drop of blood."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatnarsie"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	armor = list(MELEE = 30, BULLET = 20, LASER = 30,ENERGY = 10, BOMB = 30, BIO = 10, RAD = 10, FIRE = 30, ACID = 30)
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter, /obj/item/restraints/legcuffs/bola/cult,/obj/item/melee/cultblade,/obj/item/melee/cultblade/dagger,/obj/item/reagent_containers/glass/beaker/unholywater,/obj/item/cult_shift,/obj/item/flashlight/flare/culttorch,/obj/item/cult_spear)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/narsie
	var/real = TRUE

/obj/item/clothing/suit/hooded/wintercoat/narsie/equipped(mob/living/user,slot)
	..()
	if (slot != ITEM_SLOT_OCLOTHING || !real)
		return
	if (iscultist(user))
		return
	else
		user.dropItemToGround(src)
		to_chat(user,"<span class='cultlarge'>\"You are not fit to wear my follower's coat!\"</span>")
		to_chat(user,"<span class='userdanger'>Sharp spines jab you from within the coat!</span>")
		user.adjustBruteLoss(rand(10,16))

/obj/item/clothing/head/hooded/winterhood/narsie
	desc = "A black winter hood full of whispering secrets that only She shall ever know."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_narsie"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Ratvar Fake
/obj/item/clothing/suit/hooded/wintercoat/ratvar/fake
	name = "brass winter coat"
	desc = "A brass-plated button up winter coat. Instead of a zipper tab, it has a brass cog with a tiny red piece of plastic as an inset."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatratvar"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter)
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 0, ACID = 0)
	real = FALSE

/obj/item/clothing/head/hooded/winterhood/ratvar
	desc = "A brass-plated winter hood that glows softly, hinting at its divinity."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_ratvar"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'
	light_range = 3
	light_power = 1
	light_color = "#B18B25" //clockwork slab background top color

// Narsie Fake
/obj/item/clothing/suit/hooded/wintercoat/narsie/fake
	name = "runed winter coat"
	desc = "A dusty button up winter coat in the tones of oblivion and ash. The zipper pull looks like a single drop of blood."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatnarsie"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	allowed = list(/obj/item/flashlight, /obj/item/tank/internals/emergency_oxygen, /obj/item/tank/internals/plasmaman, /obj/item/toy, /obj/item/storage/fancy/cigarettes, /obj/item/lighter)
	armor = list(MELEE = 0, BULLET = 0, LASER = 0,ENERGY = 0, BOMB = 0, BIO = 0, RAD = 0, FIRE = 0, ACID = 0)
	real = FALSE

/obj/item/clothing/head/hooded/winterhood/narsie
	desc = "A black winter hood full of whispering secrets that only She shall ever know."
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_narsie"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Durathread
/obj/item/clothing/suit/hooded/wintercoat/durathread
	name = "durathread winter coat"
	desc = "The one coat to rule them all. Extremely durable while providing the utmost comfort."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatdurathread"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	armor = list(MELEE = 15, BULLET = 8, LASER = 25, ENERGY = 5, BOMB = 12, BIO = 0, RAD = 0, FIRE = 0, ACID = 50)
	hoodtype = /obj/item/clothing/head/hooded/winterhood/durathread

/obj/item/clothing/suit/hooded/wintercoat/durathread/Initialize(mapload)
	. = ..()
	allowed = GLOB.security_wintercoat_allowed

/obj/item/clothing/head/hooded/winterhood/durathread
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_durathread"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'
	armor = list(MELEE = 20, BULLET = 8, LASER = 15, ENERGY = 8, BOMB = 25, BIO = 10, RAD = 15, FIRE = 75, ACID = 37)

// Christmas Red
/obj/item/clothing/suit/hooded/wintercoat/christmascoatr
	name = "red christmas coat"
	desc = "A festive red Christmas coat! Smells like Candy Cane!"
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "christmascoatr"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	hoodtype = /obj/item/clothing/head/hooded/winterhood/christmashoodr

/obj/item/clothing/head/hooded/winterhood/christmashoodr
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_christmashoodr"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Christmas Green
/obj/item/clothing/suit/hooded/wintercoat/christmascoatg
	name = "green christmas coat"
	desc = "A festive green Christmas coat! Smells like Candy Cane!"
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "christmascoatg"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	hoodtype = /obj/item/clothing/head/hooded/winterhood/christmashoodg

/obj/item/clothing/head/hooded/winterhood/christmashoodg
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_christmashoodg"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Christmas Red & Green
/obj/item/clothing/suit/hooded/wintercoat/christmascoatrg
	name = "red and green christmas coat"
	desc = "A festive red and green Christmas coat! Smells like Candy Cane!"
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "christmascoatrg"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	hoodtype = /obj/item/clothing/head/hooded/winterhood/christmashoodrg

/obj/item/clothing/head/hooded/winterhood/christmashoodrg
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_christmashoodrg"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Polychromic
/obj/item/clothing/suit/hooded/wintercoat/polychromic
	name = "polychromic winter coat"
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "coatpoly"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	hoodtype = /obj/item/clothing/head/hooded/winterhood/polychromic

/obj/item/clothing/suit/hooded/wintercoat/polychromic/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/polychromic, list("#6A6964", "#C4B8A6", "#0000FF"), 3)

/obj/item/clothing/head/hooded/winterhood/polychromic
	icon = 'icons/obj/clothing/head/winterhood.dmi'
	icon_state = "hood_poly"
	mob_overlay_icon = 'icons/mob/clothing/head/winterhood.dmi'

// Timid Woman
/obj/item/clothing/suit/hooded/wintercoat/timidcostume
	name = "timid woman hoodie"
	desc = "A snug, tight yet warm outfit with belts wrapped around it. Looks to be made of polychromic materials."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "timidwoman"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	hoodtype = /obj/item/clothing/head/hooded/winterhood/timidcostume

/obj/item/clothing/suit/hooded/wintercoat/timidcostume/ComponentInitialize()
	. = ..()
	AddElement(/datum/element/polychromic, list("#EB0C07", "#5E2400", "#CEA100"), 3)

/obj/item/clothing/head/hooded/winterhood/timidcostume
	name = "timid woman hood"
	desc = "A hood attached to the hoodie."
	icon_state = "timidwoman"
	item_state = "timidwoman"

// Timid Man
/obj/item/clothing/suit/hooded/wintercoat/timidcostume/man
	name = "timid man hoodie"
	desc = "A snug, tight yet warm outfit a belt wrapped around it. Looks to be made of polychromic materials."
	icon = 'icons/obj/clothing/suits/wintercoat.dmi'
	icon_state = "timidman"
	mob_overlay_icon = 'icons/mob/clothing/suits/wintercoat.dmi'
	hoodtype = /obj/item/clothing/head/hooded/winterhood/timidcostume/man

/obj/item/clothing/head/hooded/winterhood/timidcostume/man
	name = "timid man hood"
	icon_state = "timidman"
	item_state = "timidman"
