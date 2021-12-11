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

/obj/structure/closet/crate/slaver_marksman
	name = "marksman gear shipment"

/obj/structure/closet/crate/slaver_marksman/PopulateContents()
	new /obj/item/ammo_box/magazine/sniper_rounds/soporific(src)
	new /obj/item/ammo_box/magazine/sniper_rounds/soporific(src)
	new /obj/item/gun/ballistic/automatic/sniper_rifle/sleepy(src)
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

/obj/structure/closet/crate/slaver_hardsuits
	name = "combat hardsuits"

/obj/structure/closet/crate/slaver_hardsuits/PopulateContents()
	new /obj/item/clothing/suit/space/hardsuit/syndi(src)
	new /obj/item/clothing/suit/space/hardsuit/syndi(src)

/obj/structure/closet/crate/slaver_mech
	name = "mech parts"

/obj/structure/closet/crate/slaver_mech/PopulateContents()
	new /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/launcher/flashbang/clusterbang(src)
	new /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack/breaching(src)
	new /obj/item/mecha_parts/mecha_equipment/weapon/energy/taser(src)

	new /obj/item/mecha_parts/part/gygax_armor(src)
	new /obj/item/stack/sheet/metal/five(src)

	new /obj/item/stock_parts/cell/bluespace(src)
	new /obj/item/stock_parts/capacitor/quadratic(src)
	new /obj/item/stock_parts/scanning_module/triphasic(src)

	new /obj/item/circuitboard/mecha/gygax/peripherals(src)
	new /obj/item/circuitboard/mecha/gygax/targeting(src)
	new /obj/item/circuitboard/mecha/gygax/main(src)

	new /obj/item/mecha_parts/part/gygax_torso(src)
	new /obj/item/mecha_parts/part/gygax_head(src)
	new /obj/item/mecha_parts/part/gygax_left_arm(src)
	new /obj/item/mecha_parts/part/gygax_right_arm(src)
	new /obj/item/mecha_parts/part/gygax_left_leg(src)
	new /obj/item/mecha_parts/part/gygax_right_leg(src)
	new /obj/item/mecha_parts/chassis/gygax(src)

/obj/structure/closet/crate/slaver_mech_ammo
	name = "mech ammo"

/obj/structure/closet/crate/slaver_mech_ammo/PopulateContents()
	new /obj/item/mecha_ammo/missiles_br(src)
	new /obj/item/mecha_ammo/clusterbang(src)
