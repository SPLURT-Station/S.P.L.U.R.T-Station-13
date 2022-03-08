
//Jay Sparrow
//The base for this datum is found in reagent.dm
/datum/bounty/lewd
	var/required_volume = 10
	var/shipped_volume = 0
	var/datum/reagent/wanted_reagent


/datum/bounty/lewd/completion_string()
	return {"[round(shipped_volume)]/[required_volume] Units"}

/datum/bounty/lewd/can_claim()
	return ..() && shipped_volume >= required_volume

/datum/bounty/lewd/applies_to(obj/O)
	if(!istype(O, /obj/item/reagent_containers))
		return FALSE
	if(!O.reagents || !O.reagents.has_reagent(wanted_reagent.type))
		return FALSE
	if(O.flags_1 & HOLOGRAM_1)
		return FALSE
	return shipped_volume < required_volume

/datum/bounty/lewd/ship(obj/O)
    if(!applies_to(O))
        return
    shipped_volume += O.reagents.get_reagent_amount(wanted_reagent.type)
    if(shipped_volume > required_volume)
        shipped_volume = required_volume

/datum/bounty/lewd/compatible_with(other_bounty)
    return TRUE //Not a lot of different reagents right now, so no sense in closing these off.

/datum/bounty/lewd/fluid
    name = "Discretionary Bounty"
    reward = 1500

/datum/bounty/lewd/fluid/New()
    var/reagent_type
    switch(rand(1, 20)) //So we can set probabilities for each kind
        if(1,2,3,4,5)//Cum bounty
            required_volume = 200
            reagent_type = /datum/reagent/consumable/semen
            wanted_reagent = new reagent_type
            name = wanted_reagent.name
            description = "CentCom is in need of donors for their fertility program."
            reward += rand(2, 7) * 500
        if(6,7) //Big cum bounty
            required_volume = 1000
            reagent_type = /datum/reagent/consumable/semen
            wanted_reagent = new reagent_type
            name = wanted_reagent.name
            description = "Yes. We really need that much. We hear you're the best suppliers around."
            reward += rand(10, 17) * 500
        if(8,9,10,11,12) //Milk
            required_volume = 200
            reagent_type = /datum/reagent/consumable/milk
            wanted_reagent = new reagent_type
            name = wanted_reagent.name
            description = "CentCom's kitchen is low on dairy, and this station always seems to have plenty for some reason. Mind sending us some?"
            reward += rand(2, 7) * 500
        if(13,14) //Mega Milk
            required_volume = 1000
            reagent_type = /datum/reagent/consumable/milk
            wanted_reagent = new reagent_type
            name = wanted_reagent.name
            description = "The Nanotrasen annual bake sale is soon, and all of our milk has expired. Help us out."
            reward += rand(10, 17) * 500 //Milk is generally easier to get. Make the reward a little lower.
        if(15,16,17,18,19) //A little romance
            var/static/list/possible_reagents = list(\
                /datum/reagent/drug/aphrodisiac,\
                /datum/reagent/consumable/ethanol/between_the_sheets,\
                /datum/reagent/drug/aphrodisiacplus,\
                /datum/reagent/lube)
            required_volume = 30
            reagent_type = pick(possible_reagents)
            wanted_reagent = new reagent_type
            name = wanted_reagent.name
            description = "A CentCom official wants something to spice up the bedroom. We told them this was a misuse of their power. It went through anyways."
            reward += rand(0, 5) * 500
        if(20) //Not as popular of a fluid, so we will leave it the lowest chance.
            required_volume = 30
            reagent_type = /datum/reagent/consumable/semen/femcum
            wanted_reagent = new reagent_type
            name = wanted_reagent.name
            description = "A CentCom official requested this for undisclosed research purposes."
            reward += rand(2, 7) * 500

/* //Just not getting this to work.
//Freeform sales
/datum/export/lewd/reagent_container
	cost = 0 //Base cost of canister. We only care about what's inside.
	unit_name = "Fluid Container"
	export_types = list(/obj/item/reagent_containers/)
/datum/export/lewd/reagent_containers/get_cost(obj/O)
	var/obj/item/reagent_containers/C = O
	var/worth = 0
	var/fluids = C.reagents.reagent_list

	worth += fluids[/datum/reagent/consumable/semen]*2
	worth += fluids[/datum/reagent/consumable/milk]*2
	worth += fluids[/datum/reagent/consumable/semen/femcum]*5
	return worth
*/
