/obj/item/reagent_containers/food/snacks/store/book
	name = "book"
	desc = "Could it be? A LoR reference? And is it... Edible?"
	icon = 'icons/obj/library.dmi'
	icon_state = "book"
	tastes = list("broken dreams and promises" = 10)
	foodtype = GROSS
	dunkable = TRUE
	volume = 80
	bitesize = 4
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1)
	list_reagents = list(/datum/reagent/consumable/sodiumchloride = 1)

/obj/item/reagent_containers/food/snacks/soup/brain
	name = "brain soup"
	desc = "Disgusting float lumps of grey matter in a sickly brownish-pink off-color gravy of sorts.....Eat it"
	icon = 'modular_splurt/icons/obj/food/food.dmi'
	icon_state = "brain_soup"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 6, /datum/reagent/consumable/nutriment/vitamin = 3, /datum/reagent/medicine/brain_mush = 20, /datum/reagent/medicine/mannitol = 5)
	tastes = list("meat" = 2, "brains" = 4)
	foodtype =  MEAT | GROSS | PRION
