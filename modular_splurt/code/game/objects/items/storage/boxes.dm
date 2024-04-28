/obj/item/storage/box/medipens/lewd
	name = "Lewd medipen box"
	icon = 'modular_splurt/icons/obj/storage.dmi'
	desc = "A box full of medipens meant to cause interesting effects on people. None of them with a close to medical application."
	illustration = "syringe_lewd"

/obj/item/storage/box/medipens/lewd/PopulateContents()
	for(var/i in 1 to 2)
		new /obj/item/reagent_containers/hypospray/medipen/crocin(src)
		new /obj/item/reagent_containers/hypospray/medipen/crocin/plus(src)
		new /obj/item/reagent_containers/hypospray/medipen/breastgrowth(src)
		new /obj/item/reagent_containers/hypospray/medipen/penisgrowth(src)
		new /obj/item/reagent_containers/hypospray/medipen/buttgrowth(src)
		new /obj/item/reagent_containers/hypospray/medipen/bellygrowth(src)
		new /obj/item/reagent_containers/hypospray/medipen/prospacillin(src)
		new /obj/item/reagent_containers/hypospray/medipen/lewdbomb(src)

// Kinkmate listing for the rapid disrobe implant
/obj/item/storage/box/implant_disrobe
	name = "rapid disrobe implant box"
	desc = "Comes with an implanter and an implant case for quick application!"
	icon = 'modular_sand/icons/obj/fleshlight.dmi'
	icon_state = "box"
	illustration = null

/obj/item/storage/box/implant_disrobe/ComponentInitialize()
	. = ..()
	var/datum/component/storage/str = GetComponent(/datum/component/storage)
	str.max_items = 2

/obj/item/storage/box/implant_disrobe/PopulateContents()
	new /obj/item/implanter(src)
	new /obj/item/implantcase/disrobe(src)

// Shipment box for Plushmium
/obj/item/storage/box/shipment_plushmium
	name = "plushmium backer rewards box"
	desc = "Comes with a spray bottle quick application!"
	icon = 'modular_sand/icons/obj/fleshlight.dmi'
	icon_state = "box"
	illustration = null

/obj/item/storage/box/shipment_plushmium/ComponentInitialize()
	. = ..()
	var/datum/component/storage/str = GetComponent(/datum/component/storage)
	str.max_items = 2

/obj/item/storage/box/shipment_plushmium/PopulateContents()
	new /obj/item/reagent_containers/spray/plushmium(src)
	new /obj/item/paper/fluff/shipment_plushmium(src)

// Plushmium box's note
/obj/item/paper/fluff/shipment_plushmium
	name = "plushmium backer note"
	info = "<h2>Plushmium Instructions</h2><i>Dear esteemed customer</i>,<br><br><span>Thank for backing the Stuffing For Spessmen© crowd funding initiative. We at Donk Co. pride ourselves on making a wide variety of <i>engaging</i> toys for our loyal customers to enjoy. Now, we're bringing the toy making process directly to your home or workplace!</span> Included in this box is:<ul><li>A spray bottle of Love to Life™ solution<li>A carefully packaged plushie</ul><span>To begin enjoying your new friend, start by unpacking the included plushie. Our selection process goes through rigorous quality testing to ensure you'll always get the best toy for the job. With so many choices, you'll want to get the whole family in on the action.</span><br><br><span>Once you have everything ready, it's time to make the patented Donk Co. magic happen! Spray your new best friend with Love to Life™ solution, included in the complimentary spray bottle, and watch the stunning transformation!</span><br><br><span>But don't leave your new best friend hanging! Give them a big warm hug to celebrate the long and intimate friendship you'll be sharing.</span><br><br><hr><span><i>Donk Co. is not responsible for any injury or loss of life that may occur while using the Love to Life™ solution. Do not allow access to children or adults without supervision by a chemist.</i></span><br><br><span><i>Do not drink, splash, inject, or otherwise handle the solution. Do not come into direct physical contact with the solution, or any object the solution has been applied to, under any circumstances.</i></span>"

// Kinkmate listing for condom box
/obj/item/storage/box/bulk_condoms
	name = "surplus condom box"
	desc = "A large collection of condoms, suitable for the safest of sluts!"
	icon = 'modular_sand/icons/obj/fleshlight.dmi'
	icon_state = "box"
	custom_price = PRICE_BELOW_NORMAL // 20% discount from buying individually
	illustration = null

/obj/item/storage/box/bulk_condoms/ComponentInitialize()
	. = ..()

	// Define storage component
	var/datum/component/storage/str = GetComponent(/datum/component/storage)

	// Set max items to 10
	str.max_items = 10

	// Restrict contents to only condoms
	str.can_hold = typecacheof(list(/obj/item/genital_equipment/condom))

/obj/item/storage/box/bulk_condoms/PopulateContents()
	// Add maximum amount
	for(var/i in 1 to 10)
		new /obj/item/genital_equipment/condom(src)
