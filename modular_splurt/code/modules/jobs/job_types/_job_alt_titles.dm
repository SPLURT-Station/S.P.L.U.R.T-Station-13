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
		"Chief Heal Slut",
		"Head of Medbay",
		"Surgeon General",
		"Chief Physician",
		"Doctor Dick"
	) // Sandcode do not have alt titles for CMO at the moment.

/datum/job/bridgeofficer
	alt_titles = list(
		"Command Secretary",
		"Command Officer",
		"Bridge Secretary",
		"Ensign",
		"Bridge Bitch",
		"Bridge Advisor",
		"Bridge Intern",
		"Command Assistant"
	)

/datum/job/blueshield
	alt_titles = list(
		"Command Security",
		"Command Guard",
		"Command Bodyguard",
		"Blueguard",
		"Blueshit",
		"Command Escort",
		"Command Security Detail"
	)


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
		"Lab Rat",
		"Free-Use Toy"
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
		"Drunkard",
		"Angry Step-Father"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/janitor/New()
	var/list/extra_titles = list(
		"Glorified Zoomba",
		"Waste Management Specialist",
		"Station Maintainer",
		"Upkeep Specialist",
		"Pussy Magnet",
		"Professional Dick Cleaner"
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
	alt_titles = list(
		"Jester",
		"Comedian",
		"Professional Brain Damager",
		"Escaped Sanatorium Patient"
	)

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
		"Pyrotechnician",
		"Pleasure Researcher"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/roboticist/New()
	var/list/extra_titles = list(
		"Ripperdoc",
		"Programmer",
		"MODsuit Technician",
		"Synthetics Doctor",
		"Sextoy Designer"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

// Medical

/datum/job/chemist/New()
	var/list/extra_titles = list(
		"Alchemist",
		"Apothecarist",
		"Chemical Plumber",
		"Chemi-Slut",
		"Mad Scientist",
		"Homeopathist",
		"Crocin Junkie",
		"Chemi-Slut"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/doctor/New()
	var/list/extra_titles = list(
		"Physician",
		"Medical Intern",
		"Medical Resident",
		"Medtech",
		"Medi-Slut",
		"Gynecologist",
		"Urologist",
		"Medbay Receptionist"
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
		"Adviser",
		"Expert Softdom",
		"Mommy",
		"Daddy",
		"Sex Therapist",
		"Sex Educator",
		"Psycholo-Slut"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/geneticist/New()
	var/list/extra_titles = list(
		"Genetics Researcher",
		"Gene-Slut",
		"DNA Manipulatist",
		"Genomicist"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/paramedic/New()
	var/list/extra_titles = list(
		"Para-Slut",
		"Trauma Expert",
		"First Responder",
		"Search and Rescue",
		"EMToy",
		"EMTwink"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()

/datum/job/virologist/New()
	var/list/extra_titles = list(
		"Microbiologist",
		"Biochemist",
		"Viro-Slut",
		"Biotechnician",
		"Quarantine Expert",
		"Immunologist",
		"Epidemiologist",
		"Viro-Slut",
		"STD Specialist"
	)
	LAZYADD(alt_titles, extra_titles)
	. = ..()


// Security
/datum/job/detective/New()
	var/list/extra_titles = list(
		"Gumshoe",
		"Slutective",
		"Sleuth",
		"Van Dorn Agent",
		"Forensic Investigator",
		"Cinder Dick",
		"Cooperate Auditor",
		"Private Eye",
		"Bloodhound",
		"Dicktective",
		"Cock Inspector",
		"Slutective"
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
		"Fed",
		"Flatfoot",
		"Gendarme"
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

/datum/job/brigdoc
	alt_titles = list(
		"Security Doctor",
		"Security Medic",
		"Brig Doctor",
		"Brig EMT",
		"Security Physician",
		"Security EMT",
		"Slutcurity Nurse",
		"Correctional Doctor",
		"Correctional Medicine Physician"
	)
	
/datum/job/peacekeeper
	alt_titles = list(
		"Slutcurity Trainee",
		"Security Trainee",
		"Security Assistant",
		"Security Cadet",
		"Security Trainee",
		"Rookie",
		"Hired Muscle",
		"Bodyguard",
		"Mall Cop",
		"Narc"
	)

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
	
