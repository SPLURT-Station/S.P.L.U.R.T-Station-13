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
