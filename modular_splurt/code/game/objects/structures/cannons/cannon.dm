///how much projectile damage is lost when using a bad fuel
#define BAD_FUEL_DAMAGE_TAX 20
///extra chance it explodes upon firing
#define BAD_FUEL_EXPLODE_PROBABILTY 10

/obj/structure/cannon
	name = "cannon"
	desc = "Holemaker Deluxe: A sporty model with a good stop power. Any cannon enthusiast should be expected to start here."
	density = TRUE
	anchored = TRUE
	icon = 'modular_splurt/icons/obj/structures/cannons.dmi'
	icon_state = "falconet_patina"
	max_integrity = 300
	///whether the cannon can be unwrenched from the ground.
	var/anchorable_cannon = TRUE
	var/obj/item/stack/cannonball/loaded_cannonball = null
	var/charge_ignited = FALSE
	var/fire_delay = 15
	var/charge_size = 15
	var/fire_sound = 'modular_splurt/sound/weapons/gun/general/cannon.ogg'

/obj/structure/cannon/Initialize(mapload)
	. = ..()
	create_reagents(charge_size)

/obj/structure/cannon/examine(mob/user)
	. = ..()
	. += span_notice("[src] accepts gunpowder or welding fuel.")
	. += span_warning("Using welding fuel will weaken the force of the projectile fired.")

/obj/structure/cannon/proc/fire()
	for(var/mob/shaken_mob in urange(10, src))
		if(shaken_mob.stat == CONSCIOUS)
			shake_camera(shaken_mob, 3, 1)

		playsound(src, fire_sound, 50, TRUE)
		flick(icon_state+"_fire", src)
	if(loaded_cannonball)
		var/obj/item/projectile/fired_projectile = new loaded_cannonball.projectile_type(get_turf(src))
		if(reagents.has_reagent(/datum/reagent/fuel, charge_size))
			fired_projectile.damage = max(2, fired_projectile.damage - BAD_FUEL_DAMAGE_TAX)
		QDEL_NULL(loaded_cannonball)
		fired_projectile.firer = src
		fired_projectile.fired_from = src
		fired_projectile.fire(dir2angle(dir))
	reagents.remove_all()
	charge_ignited = FALSE

/obj/structure/cannon/attackby(obj/item/used_item, mob/user, params)
	if(charge_ignited)
		to_chat(user, span_warning("It's gonna fire!"))
		return
	var/ignition_message = used_item.ignition_effect(src, user)

	if(istype(used_item, /obj/item/stack/cannonball))
		if(loaded_cannonball)
			to_chat(user, span_warning("[src] is already loaded!"))
		else
			var/obj/item/stack/cannonball/cannoneers_balls = used_item
			loaded_cannonball = new cannoneers_balls.type(src, 1)
			loaded_cannonball.copy_evidences(cannoneers_balls)
			to_chat(user, span_notice("You load a [cannoneers_balls.singular_name] into \the [src]."))
			cannoneers_balls.use(1, transfer = TRUE)
		return

	else if(ignition_message)
		if(!reagents.has_reagent(/datum/reagent/blackpowder,charge_size) && !reagents.has_reagent(/datum/reagent/fuel,charge_size))
			to_chat(user, span_warning("[src] needs [reagents.maximum_volume]u of charge!"))
			return
		visible_message(ignition_message)
		log_game("Cannon fired by [key_name(user)] in [AREACOORD(src)]")
		addtimer(CALLBACK(src, PROC_REF(fire)), fire_delay)
		charge_ignited = TRUE
		return

	else if(istype(used_item, /obj/item/reagent_containers))
		var/obj/item/reagent_containers/powder_keg = used_item
		if(!(powder_keg.reagent_flags & OPENCONTAINER))
			return ..()
		if(istype(powder_keg, /obj/item/reagent_containers/rag))
			return ..()

		if(!powder_keg.reagents.total_volume)
			to_chat(user, span_warning("[powder_keg] is empty!"))
			return
		if(reagents.total_volume >= reagents.maximum_volume)
			to_chat(user, "<span class='warning'[src] is full!</span>")
			return
		var/has_enough_gunpowder = powder_keg.reagents.has_reagent(/datum/reagent/blackpowder, charge_size)
		var/has_enough_alt_fuel = powder_keg.reagents.has_reagent(/datum/reagent/fuel, charge_size)
		if(!has_enough_gunpowder && !has_enough_alt_fuel)
			to_chat(user, span_warning("[powder_keg] doesn't have at least 15u of fuel to fill [src]!"))
			return
		if(has_enough_gunpowder)
			powder_keg.reagents.trans_id_to(src, /datum/reagent/blackpowder, amount = charge_size)
			to_chat(user, span_notice("You load [src] with gunpowder."))
			return
		if(has_enough_alt_fuel)
			powder_keg.reagents.trans_id_to(src, /datum/reagent/fuel, amount = charge_size)
			to_chat(user, span_notice("You load [src] with welding fuel."))
			return
	if(anchorable_cannon && used_item.tool_behaviour == TOOL_WRENCH)
		if(default_unfasten_wrench(user, used_item, time = 2 SECONDS))
			return
	..()

/obj/structure/cannon/trash
	name = "trash cannon"
	desc = "Okay, sure, you could call it a toolbox welded to an opened oxygen tank cabled to a skateboard, but it's a TRASH CANNON to us."
	icon_state = "garbagegun"
	anchored = FALSE
	anchorable_cannon = FALSE
	var/fires_before_deconstruction = 5

/obj/structure/cannon/trash/fire()
	var/explode_chance = 10
	var/used_alt_fuel = reagents.has_reagent(/datum/reagent/fuel, charge_size)
	if(used_alt_fuel)
		explode_chance += BAD_FUEL_EXPLODE_PROBABILTY
	. = ..()
	fires_before_deconstruction--
	if(used_alt_fuel)
		fires_before_deconstruction--
	if(prob(explode_chance))
		visible_message(span_warning("[src] explodes!"))
		explosion(src, heavy_impact_range = 1, light_impact_range = 5, flame_range = 5)
		return
	if(fires_before_deconstruction <= 0)
		visible_message(span_warning("[src] falls apart from operation!"))
		qdel(src)

/obj/structure/cannon/trash/Destroy()
	new /obj/item/stack/sheet/metal/five(src.loc)
	new /obj/item/stack/rods(src.loc)
	. = ..()

#undef BAD_FUEL_DAMAGE_TAX
#undef BAD_FUEL_EXPLODE_PROBABILTY
