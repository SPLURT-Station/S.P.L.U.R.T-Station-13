/obj/item/seeds/proc/spawn_product(output_loc)
	var/obj/item/reagent_containers/food/snacks/grown/t_prod = new product(output_loc, src)
	if(plantname != initial(plantname))
		t_prod.name = lowertext(plantname)
	if(productdesc)
		t_prod.desc = productdesc
	/* Why is this a thing? Who put this here.. I am confused
	t_prod.seed.name = name
	t_prod.seed.desc = desc
	t_prod.seed.plantname = plantname
	*/

	return t_prod

