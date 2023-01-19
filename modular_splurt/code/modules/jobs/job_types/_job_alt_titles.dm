// Command
/datum/job/captain/New()
	var/list/extra_titles = list(
		"Station Director",
		"Station Commander",
		"Station Overseer",
		"Stationmaster",
		"Condom",
		"Senator",
		"Babysitter",
		"Head of Heads"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/chief_engineer/New()
	var/list/extra_titles = list(
		"Head Engineer",
		"Construction Coordinator",
		"Project Manager",
		"Power Plant Director",
		"Chief Engineering Officer"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/hop/New()
	var/list/extra_titles = list(
		"Personnel Manager",
		"Staff Administrator",
		"Records Administrator",
		"Human Resource Manager",
		"Chief Employment Officer"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/hos/New()
	var/list/extra_titles = list(
		"Security Commander",
		"Head of Slutcurity",
		"Commissar",
		"Commander in Chief",
		"Chief Security Officer",
		"Head Discipline Specialist"
	)
	if(SSevents.holidays && SSevents.holidays[HALLOWEEN])
		LAZYADD(extra_titles, "Head of Spookcurity")
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/qm/New()
	var/list/extra_titles = list(
		"Supply Chief",
		"Postmaster General",
		"Head of Cargo",
		"Provisions Manager"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/rd/New()
	var/list/extra_titles = list(
		"Science Administrator",
		"Research Manager",
		"Chief Research Officer",
		"Senior Researcher"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/cmo
	alt_titles = list(
		"Medical Director",
		"Medical Administrator",
		"Head of Medbay",
		"Surgeon General",
		"Chief Physician"
	) // Sandcode do not have alt titles for CMO at the moment.


// Engineering
/datum/job/atmos/New()
	var/list/extra_titles = list(
		"Atmos Plumber",
		"Disposals Technician",
		"Ventilation Technician"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/engineer/New()
	var/list/extra_titles = list(
		"Structural Engineer",
		"Station Architect",
		"Hazardous Material Operator",
		"Junior Engineer",
		"Apprentice Engineer",
		"Supermatter Specialist"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()


// Service
/datum/job/assistant/New()
	var/list/extra_titles = list(
		"Volunteer",
		"Morale Officer",
		"Stripper",
		"Escort",
		"Tourist",
		"Clerk",
		"Blacksmith",
		"Waiter",
		"All-purpose fleshlight",
		"All-purpose dildo",
		"Cumdump",
		"Greytider",
		"Bard",
		"Snack",
		"Stress Relief",
		"Freeloader",
		"Station Pet",
		"Shitter",
		"Lab Rat"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/bartender/New()
	var/list/extra_titles = list(
		"Mixologist",
		"Sommelier",
		"Bar Owner",
		"Barmaid",
		"Expediter",
		"Drunkard"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/janitor/New()
	var/list/extra_titles = list(
		"Glorified Zoomba",
		"Waste Management Specialist",
		"Station Maintainer",
		"Upkeep Specialist"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/chaplain/New() // Yell at upstream maintainer(s) to fix "Bichop" title.
	var/list/extra_titles = list(
		"Priestess",
		"Prior",
		"Monk",
		"Nun",
		"Counselor",
		"Rabbi",
		"Cardinal"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/clown // Sorry, but no TWO entertainer titles.
	alt_titles = list("Jester", "Comedian", "Brain Damage Inducer")

/datum/job/cook/New()
	var/list/extra_titles = list(
		"Chef de partie",
		"Prey Prepper",
		"Poissonier",
		"Baker",
		"Fry Cook",
		"Gruel Supplier"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/curator/New()
	var/list/extra_titles = list(
		"Keeper",
		"Archaeologist",
		"Historian",
		"Scholar",
		"Artist",
		"Novelist"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/hydro/New()
	var/list/extra_titles = list(
		"Hydroponicist",
		"Farmer",
		"Apiarist",
		"Vintner",
		"Soiler",
		"Agriculturist"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

// No additions for janitor

/datum/job/lawyer/New()
	var/list/extra_titles = list(
		"Attorney",
		"Public Defender",
		"Loophole Specialist"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/mime/New()
	var/list/extra_titles = list(
		"Pantomime",
		"Mimic",
		"Mute Schizophrenic"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()


// Science

/datum/job/scientist/New()
	var/list/extra_titles = list(
		"Researcher",
		"Toxins Researcher",
		"Research Intern",
		"Junior Scientist",
		"Rack Researcher",
		"Pyrotechnician"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/roboticist/New()
	var/list/extra_titles = list(
		"Ripperdoc",
		"Programmer",
		"MODsuit Technician",
		"Biorobotics Doctor"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

// Medical

/datum/job/chemist/New()
	var/list/extra_titles = list(
		"Alchemist",
		"Apothecarist",
		"Chemical Plumber",
		"Mad Scientist",
		"Homeopathist"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/doctor/New()
	var/list/extra_titles = list(
		"Physician",
		"Medical Intern",
		"Medical Resident",
		"Medtech",
		"Gynecologist",
		"Urologist"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/psychologist/New()
	var/list/extra_titles = list(
		"Therapist",
		"Psychiatrist",
		"Hypnotherapist",
		"Counselor",
		"Psychotherapist",
		"Psychoanalyst",
		"Shrink",
		"Adviser"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/geneticist/New()
	var/list/extra_titles = list(
		"Genetics Researcher",
		"DNA Manipulatist",
		"Genomicist"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/paramedic/New()
	var/list/extra_titles = list(
		"Trauma Expert",
		"First Responder",
		"Crew Retriever"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/virologist/New()
	var/list/extra_titles = list(
		"Microbiologist",
		"Biotechnician",
		"Quarantine Expert",
		"Immunologist",
		"Epidemiologist"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()


// Security
/datum/job/detective/New()
	var/list/extra_titles = list(
		"Gumshoe",
		"Sleuth",
		"Van Dorn Agent",
		"Forensic Investigator",
		"Cinder Dick",
		"Cooperate Auditor",
		"Private Eye",
		"Bloodhound"
	)
	if(SSevents.holidays && SSevents.holidays[HALLOWEEN])
		LAZYADD(extra_titles, "Spookective")
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/officer/New()
	var/list/extra_titles = list(
		"Security Agent",
		"Probation Officer",
		"Guardsman",
		"Police Officer",
		"Slutcurity Officer",
		"Mall Cop",
		"Flatfoot"
	)
	if(SSevents.holidays && SSevents.holidays[HALLOWEEN])
		LAZYADD(extra_titles, "Spookcurity Officer")
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/warden/New()
	var/list/extra_titles = list(
		"Prison Chief",
		"Armory Manager",
		"Prison Administrator",
		"Dungeon Master",
		"Brig Superintendent",
		"Voreden",
		"Deputy",
		"Brig Caretaker"
	)
	if(SSevents.holidays && SSevents.holidays[HALLOWEEN])
		LAZYADD(extra_titles, "Spookden")
	LAZYADD(alt_titles, extra_titles)
	. = ..()


// Cargo
/datum/job/cargo_tech/New()
	var/list/extra_titles = list(
		"Deliveries Officer",
		"Mail Man",
		"Mail Woman",
		"Mailroom Technician",
		"Logistics Technician",
		"Shipment Manager",
		"Cargo Receptionist"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/mining/New()
	var/list/extra_titles = list(
		"Exotic Ore Miner",
		"Digger",
		"Hunter",
		"Ashwalker Sex Slave",
		"Ashwalker Breeder",
		"Slayer",
		"Robustinator"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()
	
	
// Silicon
/datum/job/ai
	alt_titles = list(
		"Sample Alt Title"
	) // ZERO CLUE if this will work, need to gametest
	
/datum/job/cyborg
	alt_titles = list(
		"Automaton"
	) 
