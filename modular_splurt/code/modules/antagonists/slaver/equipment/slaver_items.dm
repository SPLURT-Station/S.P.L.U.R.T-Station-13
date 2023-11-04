/obj/item/slaver
	icon = 'icons/obj/abductor.dmi'
	lefthand_file = 'icons/mob/inhands/antag/abductor_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/antag/abductor_righthand.dmi'

/obj/item/slaver/gizmo
	name = "\improper collection tool"
	desc = "A short-range teleportation device. Use on another creature to instantly beam them to your ship."
	icon_state = "silencer"
	item_state = "gizmo"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/slaver/gizmo/attack(mob/living/M, mob/user)
	var/datum/antagonist/slaver/S = locate() in user.mind.antag_datums
	if(!S) // Is not a slaver antag.
		to_chat(user, span_warning("You aren't sure how to use this tech!"))
		return

	if(user == M)
		to_chat(user, span_warning("You can't teleport yourself!"))
		return

	// Find a location to teleport to
	var/list/turf/L = list()
	for(var/turf/T in get_area_turfs(/area/shuttle/slaveship/brig))
		L+=T
	if(!L || !L.len)
		to_chat(user, "Error: No slaveship detected (Tell a coder!).")
		return
	var/turf/teleportDestination = pick(L)
	var/turf/mobLocation = get_turf(M)

	// Check we are in range of the destination
	if(!mobLocation || mobLocation.z != teleportDestination.z)
		to_chat(user, span_warning("The mothership is out of range, you need to be on the same z-level!"))
		return

	user.visible_message(span_notice("[user] begins scanning [M] with [src]."), span_notice("You begin scanning [M] with [src]."))
	if(do_mob(user, M, 15 SECONDS))
		// Teleport!
		playsound(get_turf(M.loc), 'sound/magic/blink.ogg', 50, 1)
		M.visible_message(span_notice("[M] vanishes from sight!"), \
					span_notice("You feel a rush of energy as you are beamed to the slaver mothership!"))
		new /obj/effect/temp_visual/dir_setting/ninja(get_turf(M), M.dir)
		M.forceMove(teleportDestination)
	else
		to_chat(user, span_warning("You need to stand still and uninterrupted for 15 seconds!"))

// Buyable gear kits at the slaver console
/obj/item/storage/box/slaver_teleport
	name = "boxed emergency teleport implants (x2)"

/obj/item/storage/box/slaver_teleport/PopulateContents()
	var/obj/item/implanter/O = new(src)
	O.imp = new /obj/item/implant/slaver(O)
	O.update_icon()

	O = new(src)
	O.imp = new /obj/item/implant/slaver(O)
	O.update_icon()

/obj/item/storage/box/slave_collars
	name = "boxed slave collars (x3)"

/obj/item/storage/box/slave_collars/PopulateContents()
	new /obj/item/electropack/shockcollar/slave(src)
	new /obj/item/electropack/shockcollar/slave(src)
	new /obj/item/electropack/shockcollar/slave(src)

/obj/item/storage/backpack/duffelbag/syndie/slaver_marksman
	name = "marksman gear shipment"

/obj/item/storage/backpack/duffelbag/syndie/slaver_marksman/PopulateContents()
	new /obj/item/ammo_box/magazine/sniper_rounds/soporific(src)
	new /obj/item/ammo_box/magazine/sniper_rounds/soporific(src)
	new /obj/item/ammo_box/magazine/sniper_rounds/soporific(src)
	new /obj/item/gun/ballistic/rifle/sniper_rifle/sleepy(src)
	new /obj/item/suppressor/specialoffer(src)

/obj/item/storage/box/jammers
	name = "boxed radio jammers (x3)"

/obj/item/storage/box/jammers/PopulateContents()
	new /obj/item/jammer(src)
	new /obj/item/jammer(src)
	new /obj/item/jammer(src)

/obj/item/storage/box/pens
	name = "boxed sleepy pens (x7)"

/obj/item/storage/box/pens/PopulateContents()
	new /obj/item/pen/sleepy(src)
	new /obj/item/pen/sleepy(src)
	new /obj/item/pen/sleepy(src)
	new /obj/item/pen/sleepy(src)
	new /obj/item/pen/sleepy(src)
	new /obj/item/pen/sleepy(src)
	new /obj/item/pen/sleepy(src)

/obj/item/storage/box/krav_gloves
	name = "boxed krav maga combat gloves (x3)"

/obj/item/storage/box/krav_gloves/PopulateContents()
	new /obj/item/clothing/gloves/krav_maga/combatglovesplus(src)
	new /obj/item/clothing/gloves/krav_maga/combatglovesplus(src)
	new /obj/item/clothing/gloves/krav_maga/combatglovesplus(src)

/obj/item/storage/backpack/duffelbag/syndie/slaver_hardsuits
	name = "combat hardsuits"

/obj/item/storage/backpack/duffelbag/syndie/slaver_hardsuits/PopulateContents()
	new /obj/item/clothing/suit/space/hardsuit/syndi(src)
	new /obj/item/clothing/suit/space/hardsuit/syndi(src)

/obj/item/storage/backpack/duffelbag/syndie/disablers
	name = "disablers"

/obj/item/storage/backpack/duffelbag/syndie/disablers/PopulateContents()
	new /obj/item/gun/energy/disabler(src)
	new /obj/item/gun/energy/disabler(src)

/obj/item/storage/backpack/duffelbag/syndie/energy
	name = "energy weapons"

/obj/item/storage/backpack/duffelbag/syndie/energy/PopulateContents()
	new /obj/item/gun/energy/e_gun(src)
	new /obj/item/gun/energy/e_gun(src)

/obj/item/storage/backpack/duffelbag/syndie/smg_rubber
	name = "SMG kit (rubber)"

/obj/item/storage/backpack/duffelbag/syndie/smg_rubber/PopulateContents()
	new /obj/item/gun/ballistic/automatic/wt550/wtrubber(src)
	new /obj/item/ammo_box/magazine/wt550m9/wtrubber(src)
	new /obj/item/ammo_box/magazine/wt550m9/wtrubber(src)
	new /obj/item/ammo_box/magazine/wt550m9/wtrubber(src)

/obj/item/storage/backpack/duffelbag/syndie/smg
	name = "SMG kit"

/obj/item/storage/backpack/duffelbag/syndie/smg/PopulateContents()
	new /obj/item/gun/ballistic/automatic/wt550(src)
	new /obj/item/ammo_box/magazine/wt550m9(src)
	new /obj/item/ammo_box/magazine/wt550m9(src)
	new /obj/item/ammo_box/magazine/wt550m9(src)

/obj/item/storage/backpack/duffelbag/syndie/ion
	name = "Ion carbine kit"

/obj/item/storage/backpack/duffelbag/syndie/ion/PopulateContents()
	new /obj/item/gun/energy/ionrifle/carbine/with_pin(src)
	new /obj/item/gun/energy/ionrifle/carbine/with_pin(src)

/obj/item/storage/box/syndie_kit/sleeper
	name = "boxed chemical kit"

/obj/item/storage/box/syndie_kit/sleeper/PopulateContents()
	new /obj/item/reagent_containers/glass/bottle/mutetoxin(src)
	new /obj/item/reagent_containers/glass/bottle/mutetoxin(src)
	new /obj/item/reagent_containers/glass/bottle/mutetoxin(src)
	new /obj/item/reagent_containers/glass/bottle/chloralhydrate(src)
	new /obj/item/reagent_containers/glass/bottle/chloralhydrate(src)
	new /obj/item/reagent_containers/glass/bottle/chloralhydrate(src)
	new /obj/item/reagent_containers/syringe(src)

/obj/item/storage/box/syndie_kit/x4
	name = "boxed X4 charges"

/obj/item/storage/box/syndie_kit/x4/PopulateContents()
	new /obj/item/grenade/plastic/x4(src)
	new /obj/item/grenade/plastic/x4(src)
	new /obj/item/grenade/plastic/x4(src)

/obj/item/storage/backpack/duffelbag/syndie/l6saw_shipment
	name = "L6 saw shipment"

/obj/item/storage/backpack/duffelbag/syndie/l6saw_shipment/PopulateContents()
	new /obj/item/gun/ballistic/automatic/l6_saw/toy/unrestricted/riot(src)
	new /obj/item/ammo_box/magazine/toy/m762/riot(src)
	new /obj/item/ammo_box/foambox/riot(src)
	new /obj/item/ammo_box/foambox/riot(src)

/obj/item/storage/backpack/duffelbag/syndie/policing_shipment
	name = "policing shipment"

/obj/item/storage/backpack/duffelbag/syndie/policing_shipment/PopulateContents()
	new /obj/item/shield/riot/flash(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/melee/baton/loaded(src)
	new /obj/item/storage/box/handcuffs(src)
	new /obj/item/electrostaff(src)

// A chameleon kit that anybody can use, with a generic name.
/obj/item/storage/box/syndie_kit/chameleon/ghostcafe/generic
	name = "chameleon kit"
	desc = "Now you don't have to steal your mom's clothes anymore."

/obj/item/storage/box/syndie_kit/garand_rubber
	name = "Mars Service Rifle kit (rubber)"

/obj/item/storage/backpack/duffelbag/syndie/garand_rubber/PopulateContents()
	new /obj/item/gun/ballistic/automatic/m1garand/nomag(src)
	new /obj/item/ammo_box/magazine/garand/rubber(src)
	new /obj/item/ammo_box/magazine/garand/rubber(src)
	new /obj/item/ammo_box/magazine/garand/rubber(src)
	new /obj/item/ammo_box/magazine/garand/rubber(src)
	new /obj/item/ammo_box/magazine/garand/rubber(src)
	new /obj/item/ammo_box/magazine/garand/rubber(src)

/obj/item/storage/box/syndie_kit/garand_mixed
	name = "Mars Service Rifle kit (mixed)"

/obj/item/storage/backpack/duffelbag/syndie/garand_mixed/PopulateContents()
	new /obj/item/gun/ballistic/automatic/m1garand/nomag(src)
	new /obj/item/ammo_box/magazine/garand/rubber(src)
	new /obj/item/ammo_box/magazine/garand/rubber(src)
	new /obj/item/ammo_box/magazine/garand/rubber(src)
	new /obj/item/ammo_box/magazine/garand/sleepy(src)
	new /obj/item/ammo_box/magazine/garand/sleepy(src)
	new /obj/item/ammo_box/magazine/garand/sleepy(src)

/obj/item/storage/box/syndie_kit/garand_lethal
	name = "Mars Service Rifle kit (lethal)"

/obj/item/storage/backpack/duffelbag/syndie/garand_lethal/PopulateContents()
	new /obj/item/gun/ballistic/automatic/m1garand/nomag(src)
	new /obj/item/ammo_box/magazine/garand(src)
	new /obj/item/ammo_box/magazine/garand(src)
	new /obj/item/ammo_box/magazine/garand(src)
	new /obj/item/ammo_box/magazine/garand(src)
	new /obj/item/ammo_box/magazine/garand(src)
	new /obj/item/ammo_box/magazine/garand(src)

/obj/item/storage/box/syndie_kit/fal_rubber
	name = "FTU Rifle kit (rubber)"

/obj/item/storage/backpack/duffelbag/syndie/fal_rubber/PopulateContents()
	new /obj/item/gun/ballistic/automatic/fal/nomag(src)
	new /obj/item/ammo_box/magazine/fal/rubber(src)
	new /obj/item/ammo_box/magazine/fal/rubber(src)
	new /obj/item/ammo_box/magazine/fal/rubber(src)
	new /obj/item/ammo_box/magazine/fal/rubber(src)
	new /obj/item/ammo_box/magazine/fal/rubber(src)
	new /obj/item/ammo_box/magazine/fal/rubber(src)

/obj/item/storage/box/syndie_kit/fal_mix
	name = "FTU Rifle kit (mixed)"

/obj/item/storage/backpack/duffelbag/syndie/fal_mix/PopulateContents()
	new /obj/item/gun/ballistic/automatic/fal/nomag(src)
	new /obj/item/ammo_box/magazine/fal/r10/rubber(src)
	new /obj/item/ammo_box/magazine/fal/r10/rubber(src)
	new /obj/item/ammo_box/magazine/fal/r10/rubber(src)
	new /obj/item/ammo_box/magazine/fal/r10/sleepy(src)
	new /obj/item/ammo_box/magazine/fal/r10/sleepy(src)
	new /obj/item/ammo_box/magazine/fal/r10/sleepy(src)

/obj/item/storage/box/syndie_kit/fal_lehtal
	name = "FTU Rifle kit (lehtal)"

/obj/item/storage/backpack/duffelbag/syndie/fal_lehtal/PopulateContents()
	new /obj/item/gun/ballistic/automatic/fal/nomag(src)
	new /obj/item/ammo_box/magazine/fal(src)
	new /obj/item/ammo_box/magazine/fal(src)
	new /obj/item/ammo_box/magazine/fal(src)
	new /obj/item/ammo_box/magazine/fal(src)
	new /obj/item/ammo_box/magazine/fal(src)
	new /obj/item/ammo_box/magazine/fal(src)

/obj/item/storage/box/syndie_kit/smg22
	name = "FTU SMG kit (rubber)"

/obj/item/storage/backpack/duffelbag/syndie/smg22/PopulateContents()
	new /obj/item/gun/ballistic/automatic/smg22/nomag(src)
	new /obj/item/ammo_box/magazine/smg22/rubber(src)
	new /obj/item/ammo_box/magazine/smg22/rubber(src)
	new /obj/item/ammo_box/magazine/smg22/rubber(src)
