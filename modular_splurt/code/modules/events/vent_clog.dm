/datum/round_event_control/vent_clog/cope_and_seethe
	name = "Copium Flood"
	typepath = /datum/round_event/vent_clog/cope_and_seethe
	max_occurrences = 0

/datum/round_event/vent_clog/cope_and_seethe/announce()
	priority_announce("We have detected high levels of seething on station. To combat this, we will be deploying mass amounts of copium. Please stand away from vents until pressure evens out.", "Central Command")

/datum/round_event/vent_clog/cope_and_seethe
	saferChems = list(
		/datum/reagent/drug/copium
	)

/datum/round_event/vent_clog/cope_and_seethe/start()
	for (var/obj/machinery/atmospherics/components/unary/vent in vents)
		if (vent && vent.loc && !vent.welded)
			var/datum/reagents/R = new/datum/reagents(1000)
			R.my_atom = vent
			R.add_reagent(/datum/reagent/drug/copium, 5)

			var/datum/effect_system/smoke_spread/chem/smoke = new
			smoke.set_up(R, 7, get_turf(vent), TRUE) // Intentionally silent. There's a fuck ton of vents.
			smoke.start()
		CHECK_TICK

/datum/round_event_control/vent_clog/female
	name = "Clogged Vents: Girlcum"
	typepath = /datum/round_event/vent_clog/female
	max_occurrences = 1

/datum/round_event/vent_clog/female
	saferChems = list(
		/datum/reagent/consumable/semen/femcum
	)
	reagentsAmount = 100

/datum/round_event/vent_clog/female/announce()
	priority_announce("The scrubbers network is experiencing a backpressure squirt. Some squirting of contents may occur.", "Atmospherics alert")

/datum/round_event/vent_clog/female/start()
	for(var/obj/machinery/atmospherics/components/unary/vent in vents)
		if(vent && vent.loc && !vent.welded)
			var/datum/reagents/R = new/datum/reagents(1000)
			R.my_atom = vent
			R.add_reagent(/datum/reagent/consumable/semen/femcum, reagentsAmount)

			var/datum/effect_system/foam_spread/foam = new
			foam.set_up(200, get_turf(vent), R)
			foam.start()
		CHECK_TICK

/datum/round_event_control/vent_clog/male
	name = "Clogged Vents: Semen"
	typepath = /datum/round_event/vent_clog/male
	max_occurrences = 1

/datum/round_event/vent_clog/male
	saferChems = list(
		/datum/reagent/consumable/semen
	)
	reagentsAmount = 100

/datum/round_event/vent_clog/male/announce()
	priority_announce("The scrubbers network is experiencing a backpressure surge. Some ejaculation of contents may occur.", "Atmospherics alert")

/datum/round_event/vent_clog/male/start()
	for(var/obj/machinery/atmospherics/components/unary/vent in vents)
		if(vent && vent.loc && !vent.welded)
			var/datum/reagents/R = new/datum/reagents(1000)
			R.my_atom = vent
			R.add_reagent(/datum/reagent/consumable/semen, reagentsAmount)

			var/datum/effect_system/foam_spread/foam = new
			foam.set_up(200, get_turf(vent), R)
			foam.start()
		CHECK_TICK

/datum/round_event_control/vent_clog/crocin
	name = "Aphrodisiac Flood"
	typepath = /datum/round_event/vent_clog/crocin
	weight = 0
	max_occurrences = 1

/datum/round_event/vent_clog/crocin
	saferChems = list(
		/datum/reagent/drug/aphrodisiac
	)
	reagentsAmount = 100
	var/reagent = /datum/reagent/drug/aphrodisiac

/datum/round_event/vent_clog/crocin/announce()
	priority_announce("We have detected a decrease of the lust levels on the station. To fix this, we will be deploying large amounts of a light aphrodisiac. Please stand away from the vents until the pink gas dissipates.", "Central Command")

/datum/round_event/vent_clog/crocin/start()
	for(var/obj/machinery/atmospherics/components/unary/vent in vents)
		if(vent && vent.loc && !vent.welded)
			var/datum/reagents/R = new(1000)
			R.my_atom = vent
			R.add_reagent(reagent, reagentsAmount)

			var/datum/effect_system/smoke_spread/chem/smoke = new
			smoke.set_up(R, 10, get_turf(vent), FALSE)
			smoke.start()
		CHECK_TICK

/datum/round_event_control/vent_clog/crocin/hexacrocin
	name = "Strong Aphrodisiac Flood"
	typepath = /datum/round_event/vent_clog/crocin/hexacrocin
	max_occurrences = 0 //Only adminspawn because this one causes brain damage

/datum/round_event/vent_clog/crocin/hexacrocin
	saferChems = list(
		/datum/reagent/drug/aphrodisiacplus
	)
	reagent = /datum/reagent/drug/aphrodisiacplus

/datum/round_event/vent_clog/crocin/hexacrocin/announce()
	priority_announce("We have detected dangerously low levels of lust on the station. To fix this, we will be deploying voluminous amounts of strong aphrodisiacs. Please stand away from the vents until the pink gas dissipates if you desire to avoid brain damage.", "Central Command")
