/datum/chemical_reaction/fermi/enthrall/FermiFinish(datum/reagents/holder, var/atom/my_atom)
	var/datum/reagent/blood/B = locate(/datum/reagent/blood) in my_atom.reagents.reagent_list
	var/datum/reagent/fermi/enthrall/E = locate(/datum/reagent/fermi/enthrall) in my_atom.reagents.reagent_list
	if(!B || !E)
		return
	if(!B.data)
		my_atom.visible_message("<span class='warning'>The reaction splutters and fails to react properly.</span>") //Just in case
		E.purity = 0
	E.SetDataFromBloodData(B.data)
