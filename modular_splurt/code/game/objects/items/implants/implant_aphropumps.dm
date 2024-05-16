// - Crocin -
/obj/item/implant/aphrodisiac_pump
	name = "crocin pumping implant"
	desc = "A pump that injects an aphrodisiac drug into the bloodstream constantly."
	activated = FALSE
	var/reagent = /datum/reagent/drug/aphrodisiac
	var/base_amount = 5
	var/amount
	var/max_amount = 50

/obj/item/implant/aphrodisiac_pump/get_data()
	var/data = {"
		<b>Implant Specifications:</b><br>
		<b>Name:</b> Prudism Treatment Implant<br>
		<b>Function:</b> Official use is for the treatment of prudism but is frequently abused to make crocin-crazed bimbos and prostitutes.<br>
		<i>Will currently synthetize [amount]u upon implantation</i><br>
		"}
	return data

/obj/item/implant/aphrodisiac_pump/Initialize(mapload)
	. = ..()
	amount = base_amount

/obj/item/implant/aphrodisiac_pump/implant()
	. = ..()
	START_PROCESSING(SSobj, src)

/obj/item/implant/aphrodisiac_pump/removed(source, silent = FALSE, special = 0)
	. = ..()
	STOP_PROCESSING(SSobj, src)

/obj/item/implant/aphrodisiac_pump/proc/pump(amt)
	if(imp_in && iscarbon(imp_in))
		imp_in.reagents.add_reagent(reagent, amt)

/obj/item/implant/aphrodisiac_pump/process()
	if(imp_in.reagents.get_reagent_amount(reagent) < amount)
		pump(amount - imp_in.reagents.get_reagent_amount(reagent))

/obj/item/implanter/aphrodisiac_pump
	name = "implanter (crocin pump)"
	imp_type = /obj/item/implant/aphrodisiac_pump

/obj/item/implantcase/aphrodisiac_pump
	name = "implant case - 'Crocin pump'"
	desc = "A glass case containing a crocin pumping implant."
	imp_type = /obj/item/implant/aphrodisiac_pump

/obj/item/implantcase/aphrodisiac_pump/attack_self(mob/user)
	if(!imp || !istype(imp, /obj/item/implant/aphrodisiac_pump))
		return

	var/obj/item/implant/aphrodisiac_pump/pump = imp
	if(pump.amount >= pump.max_amount)
		pump.amount = pump.base_amount
	else
		pump.amount += 5
	balloon_alert(user, "Now synthesizing [pump.amount]u.")
//

// - Hexacrocin -
/obj/item/implant/aphrodisiac_pump/plus
	name = "hexacrocin pumping implant"
	desc = "A pump that injects a potent aphrodisiac drug into the bloodstream constantly."
	reagent = /datum/reagent/drug/aphrodisiacplus

/obj/item/implant/aphrodisiac_pump/plus/get_data()
	var/data = {"
		<b>Implant Specifications:</b><BR>
		<b>Name:</b> Severe Prudism Treatment<BR>
		<b>Function:</b> Official use is for the treatment of severe prudism but is frequently abused to make hexacrocin-crazed bimbos and prostitutes.<BR>
		<i>Will currently synthetize [amount]u upon implantation</i><br>
		<hr>
		<u><b>WARNING: 20u is the overdose threshold, please do not set past that limit without consulting your medical team!</b></u>
		"}
	return data

/obj/item/implanter/aphrodisiac_pump/plus
	name = "implanter (hexacrocin pump)"
	imp_type = /obj/item/implant/aphrodisiac_pump/plus

/obj/item/implantcase/aphrodisiac_pump/plus
	name = "implant case - 'Hexacrocin pump'"
	desc = "A glass case containing a hexacrocin pumping implant."
	imp_type = /obj/item/implant/aphrodisiac_pump/plus
//

/obj/item/storage/box/aphrodisiac_pump
	name = "crocin pump box"
	desc = "Comes with an implanter and an implant case for quick application!"
	icon = 'modular_sand/icons/obj/fleshlight.dmi'
	icon_state = "box"
	illustration = null

/obj/item/storage/box/aphrodisiac_pump/examine(mob/user)
	. = ..()
	. += span_notice("Click the implant case while with the implant inside to change the desired dosage amounts.")

/obj/item/storage/box/aphrodisiac_pump/ComponentInitialize()
	. = ..()
	var/datum/component/storage/str = GetComponent(/datum/component/storage)
	str.max_items = 2

/obj/item/storage/box/aphrodisiac_pump/PopulateContents()
	new /obj/item/implanter(src)
	new /obj/item/implantcase/aphrodisiac_pump(src)

/obj/item/storage/box/aphrodisiac_pump/plus
	name = "hexacrocin pump box"

/obj/item/storage/box/aphrodisiac_pump/plus/PopulateContents()
	new /obj/item/implanter(src)
	new /obj/item/implantcase/aphrodisiac_pump/plus(src)
