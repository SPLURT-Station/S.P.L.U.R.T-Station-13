
//This file contains all of the code for the map-specific things like items, techwebs, and reagents.
//Sprites are located in their relevant files, notably suit.dmi, head.dmi, items_and_weapons.dmi, syringe.dmi, tools.dmi, growing.dmi, harvest.dmi, seeds.dmi, library.dmi staves_left/righthanded.dmi, stock_parts.dmi, simple_human.dmi, food.dmi, soupsalad.dmi, and pizzaspaghetti.dmi
//This is also an excuse to keep everything together so merging won't be a pain in my a-

//Complex Areas

/area/awaymission/complex
	name = "Complex"
	icon_state = "away"
	always_unpowered = FALSE
	power_environ = FALSE
	power_equip = FALSE
	power_light = FALSE
	requires_power = TRUE
	ambientsounds = AWAY_MISSION
	area_flags = UNIQUE_AREA | NO_ALERTS | CULT_PERMITTED | CULTMAGIC_BYPASS
	outdoors = FALSE

/area/awaymission/complex/exterior
	name = "Exterior Complex Grounds"
	icon_state = "away1"
	outdoors = TRUE

/area/awaymission/complex/gateway
	name = "Nanotrasen Outpost"
	icon_state = "awaycontent2"

/area/awaymission/complex/gatehouse
	name = "Security Gatehouse"
	icon_state = "awaycontent3"

/area/awaymission/complex/cultcabin
	name = "Occult Hideout"
	icon_state = "awaycontent4"

/area/awaymission/complex/woodcabin
	name = "Woodland Cabin"
	icon_state = "awaycontent5"

/area/awaymission/complex/security
	name = "Security Substation"
	icon_state = "awaycontent6"

/area/awaymission/complex/prison
	name = "Detention Center"
	icon_state = "awaycontent7"

/area/awaymission/complex/cultholdout
	name = "Occult Stronghold"
	icon_state = "awaycontent8"

/area/awaymission/complex/thewall
	name = "Substation02"
	icon_state = "awaycontent9"

/area/awaymission/complex/engineering
	name = "Engineering Substation"
	icon_state = "awaycontent10"

/area/awaymission/complex/outpost
	name = "Substation01"
	icon_state = "awaycontent11"

/area/awaymission/complex/mainfacility
	name = "Primary Complex"
	icon_state = "awaycontent12"

/area/awaymission/complex/logistics
	name = "Logistics Department"
	icon_state = "awaycontent13"

/area/awaymission/complex/dorms
	name = "Dormitories"
	icon_state = "awaycontent14"

/area/awaymission/complex/minerhouse
	name = "Miner Housing/Processing"
	icon_state = "awaycontent15"

/area/awaymission/complex/facilityresearch
	name = "Research Department"
	icon_state = "awaycontent16"

/area/awaymission/complex/medical
	name = "Medical Department"
	icon_state = "awaycontent17"

/area/awaymission/complex/command
	name = "Command Facilities"
	icon_state = "awaycontent18"

/area/awaymission/complex/hydroponics
	name = "Hydroponics Substation"
	icon_state = "awaycontent19"

/area/awaymission/complex/janitorial
	name = "Waste Processing Substation"
	icon_state = "awaycontent20"

/area/awaymission/complex/miningcamp
	name = "Mining Encampment"
	icon_state = "awaycontent21"

/area/awaymission/complex/cultfacility
	name = "Occult Research Complex"
	icon_state = "awaycontent22"
	ambientsounds = REEBE

/area/awaymission/complex/research
	name = "Xenoarcheology Substation"
	icon_state = "awaycontent23"
	ambientsounds = REEBE

/area/awaymission/complex/greenhouse
	name = "Occult Greenhouse"
	icon_state = "awaycontent24"
	ambientsounds = REEBE

/area/awaymission/complex/gravgen
	name = "Mercenary Administrations"
	icon_state = "awaycontent25"
	requires_power = FALSE

//Lore Papers/Logs

/obj/item/disk/holodisk/complex
	name = "Critical Request"
	preset_image_type = /datum/preset_holoimage/nanotrasenprivatesecurity
	preset_record_text = {"
	NAME  Security Officer
	DELAY 10
	SAY Use holodisks more!
	DELAY 30;"}

/obj/item/disk/holodisk/complex/welcomeagent
	name = "Mission Briefing - A.G.R Complex"
	preset_image_type = /datum/preset_holoimage/nanotrasenprivatesecurity
	preset_record_text = {"
	NAME  Levine Terrace
	DELAY 10
	SAY Greetings, Agent. If you're listening to this, chances are you've chosen, or been chosen to act as the Expeditionary Force for this mission. As such, let me give you a quick briefing.
	DELAY 45
	SAY Approximately 3 months ago, we lost contact with this facility, known as the AGR Complex. Investigations determined recently that the loss of communication frequencies coincides with common sabotage methods used by the Syndicate.
	DELAY 60
	SAY As such, we've been authorized to deploy a small team to personally investigate the facility, and hopefully recover any equipment or personnel along the way.
	DELAY 45
	SAY Given the circumstances, we expect some resistance. So, if you haven't already, I would recommend grabbing some weapons prior to exiting the outpost. Just east of here you'll locate the inner checkpoint into the rest of the compound. Start from there.
	DELAY 60
	SAY The other staff here will maintain the outpost and ensure the gateway remains active. If you uncover anything notable regarding what happened here, report it to your commanding officer once the investigation concludes. Good luck, agent.
	DELAY 30;"}

/obj/item/disk/holodisk/complex/securitylog
	name = "A.R.S Security Log, 4.26.XX"
	preset_image_type = /datum/preset_holoimage/nanotrasenprivatesecurity
	preset_record_text = {"
	NAME Automated Reporting System
	DELAY 10
	SAY CONTENT LOG,
	DELAY 8
	SAY DATE: 04/26/XX BLUESPACE ABSOLUTE TIME
	DELAY 8
	SAY LOGGED TIMESTAMPS
	DELAY 30
	SAY 06:00
	DELAY 8
	SAY Routine Systems Check: Nominal
	DELAY 30
	SAY 12:00
	DELAY 8
	SAY Routine Systems Check: Nominal
	DELAY 30
	SAY 15:27
	DELAY 8
	SAY Alert! Transmission Error detected at:
	DELAY 8
	SAY ST.ENG.TELECOMMUNICATIONS
	DELAY 8
	SAY Contact Engineering Department!
	DELAY 30
	SAY 17:36
	DELAY 8
	SAY Alert! Two unknown craft detected on radar,
	DELAY 8
	SAY Coordinates: 37.28573, -15.69203, 31.57198, -11.01937
	DELAY 8
	SAY Automated Defensive Systems notified!
	DELAY 30
	SAY 17:38
	DELAY 8
	SAY Alert! Weapons System Error detected at:
	DELAY 8
	SAY ST.SEC.ANTIAIRFORTIFICATION
	DELAY 8
	SAY Contact Engineering Department!
	DELAY 30
	SAY 18:00
	DELAY 8
	SAY Routine Systems Check: Warning!
	DELAY 8
	SAY Equipment Failure Detected:
	DELAY 8
	SAY TC.BROADCAST
	DELAY 8
	SAY TC.RECIEVING
	DELAY 8
	SAY SW.ANTIAIRCANNON01
	DELAY 8
	SAY SW.ANTIAIRCANNON02
	DELAY 8
	SAY SC.STMAINCONFERENCE
	DELAY 8
	SAY SC.STMAINCAPTAINOFFICE
	DELAY 8
	SAY SC.SUBSTATION02
	DELAY 30
	SAY 18:01
	DELAY 8
	SAY Warning! Equipment Failures exceeding standard operational capacity!
	DELAY 8
	SAY Logging ARS File for maintenance and investigation!
	DELAY 20;"}

/obj/item/paper/fluff/awaymissions/complex
	name = "Complex Papers"
	info = "AGR COMPLEX? I find it quite simple."

/obj/item/paper/fluff/awaymissions/complex/cabinmessage
	name = "Dear Maria"
	info = {"Hey Honey! Writing this in advance, I wanted to let you know what I've been up to recently! Remember what I told you about work relaxing a bit after they found that weird thing in the mountain? Well we haven't gotten many major assignments because of it, so I had time to build something!
		 You always wanted a little cabin, right? Anyway, it's just about done by the time I'm writing this, so it may be a few months until you get to see it, but I'll make sure to keep it clean for when you visit!<br><br>Can't wait to see you!<br>Elliot"}

/obj/item/paper/fluff/awaymissions/complex/preperation
	name = "Preparation"
	info = {"It had been a disastrous month. The thieves and heretics have finally quieted, undone by their own infighting and disbelief. They remain still, clinging to their wretched fortifications separating us from what is rightfully ours.
		But now that they've relented, we have finally gathered enough brothers and sisters to breach their most prized defense. Soon we shall strike, strike with righteous fury in the name of the almighty!
		And soon, with the bodies of their fallen, we will raze that pitiful fortress we once called home, until all that remains in this wretched valley is all those faithful.<br><br>It is just a matter of time. And our lord is patient.<br>Just the press of a button, and our victory is assured."}


/obj/item/paper/fluff/awaymissions/complex/journal
	name = "Reporting Journal"
	info = {"Date is 4/22/XX.<br>Expediting my monthly report on request of the C.O.<br>This month has seen an increase in suspicious activity from some of the research and mining crew. Half of the research staff have been stationed at or near the target come last week, and a few of us have noticed that those working on it from the start are having issues keeping up with their schedule back at the central station.
	H.O.P’s not happy about it, but apparently orders from up above are keeping as many researchers there as possible. Security’s been acting antsy recently, since HC refuses to divert more security to the target. Better for us, atleast.
	Medical’s been having issues, too. Been getting a lot of odd injuries and psychosis incidents, mostly from the miners. Stranger though, there’s been less need for the cloner. Not sure if the miners just got sick of dying or what, but with the upgrade we got recently, you would think NT had prepared for worse.<br><br>
	As for strictly mission-relevant information, I’ve started preparing for the main assault. Work might be sloppy given the time constraint, but be assured that all communications and those AA guns will be offline prior to the arrival of the assault team. Everything should be fine, assuming we aren’t sending assault pods.<br><br>
	P.S: Would have sent this report sooner, but a cave-in happened at my last hideout, so I had to make do. Left a weapon and some prototypes there, so we may want to recover those prior to extraction. It was getting crowded anyway, with everyone lurking around medical."}

/obj/item/paper/fluff/awaymissions/complex/finalthoughts
	name = "Final Thoughts"
	info = {"The date is 4/27/XX. Prior to writing, around a day ago, I had been sent, alongside my team to execute a contract. Details are unimportant, given the circumstances I was in. We had been told that the Anti Air defenses this facility had would’ve been disabled before we landed, but clearly our implant had done a shitty job.
		I won’t lie, I have no idea how I survived, but at this point I’m starting to wish I didn’t. I’m not sure who’ll find this, since all I’ve got for company is a pAI. Wanted to bring ‘em on their first mission. Brilliant idea THAT was.<br><br>
		Getting cold here. Wish I had packed more rations, or maybe a flare. I probably won’t get out alive here. Even if my squad survived the landing, I’m not sure if they’d know where to find me.<br><br>
		So, to anyone who finds this. I’d appreciate being revived, if my dying words are enough to convince you of doing that. If not, at least just take the pAI. It's earned better than this. It has to me, atleast."}

/obj/item/paper/fluff/awaymissions/complex/engineeringlog
	name = "A.R.S Log, 4.28.XX"
	info = {"*Most of the paper is an uninteresting collection of error logs, except for the bottom...*<br><br>
		22:47,<br>
		Notice! Communication Logs have been collected from an Irregular Frequency! <br>RECEIVING experiencing significant malfunction, translated logs may be incomplete! Immedient repairs necessary to continue the proper function of the broadcasting system!<br><br>
		Recorded Log:<br>Date: 4/29/XX<br>Time: 22:46 B.A.T<br>Vessel: ‘E.M.C Absolver'<br>I.F.F Status: Hostile<br><br>
		'Absolver to $*)!@#&-Command Station, reporting no radio communications from Fireteams Titan and Callisto. Video Surveillance has determined that the squads inserted before the Anti-Air Defenses could be disabled, and %*!@)#’s Pod suffered substantial damage.<br>
		Surveillance of the target area soon after insertion showed a significant buildup of an !)*&#@! hostile force, inconsistent with our previous intelligence. It is highly likely that both fireteams are incapable of completing current mission objectives.<br>
		Flares from the A.O have been spotted, however with no way to contact ##)*!)*$-ces and a higher-than-expected number of N.T Staff spotted throughout the Complex, we cannot perform a rescue operation without a significant threat of- @%*$)*!&. Requesting reinforcements to execute a safe operation, or authorization to scuttle the target.'<br><br>
		Command Station to Absolver. Request denied. Other forces in the area are !)@*$&!@ and cannot assist you at this time. We’ll dispatch a secondary unit to continue the operation, or $*!@#% whoever is left when available.<br>
		R.T.B. The client is expecting a top-quality job here, so we’ll do our best to justify this delay. Do not proceed with bombardment until the secondary force has left the A.O. $*!)@# Titan and Callisto are to be considered M.I.A until further investigation.'"}

/obj/item/paper/fluff/awaymissions/complex/leaderreport
	name = "After Ation Report"
	info = {"This is Commander Artyom Volkov, Squad Leader for fireteams Titan and Callisto.<br>Date is 4/28/XX, 14:00 Bluespace Time.<br>
		Our mission involved inserting into the facility known as the ‘Archeological and Geological Research Complex’ and extracting an unknown botanical package, codenamed ‘Green Thumb’. Insertion would have been done via Assault Pod towards the southern facility grounds, wherein all hostile forces, be them security or civilian, were to be eliminated, and the package extracted from the deepest part of the ruins that Nanotrasen had uncovered.<br>
		Lastly, the package, all remaining personnel, including assault troops and undercover operatives, were to be extracted outside the ruins via the drop vessel, the E.M.C Absolver. The mission did not go as planned.<br><br>
		Not only had the undercover implant failed to fully disable the anti-air weaponry in the area, they had failed to notify us of what appeared to be a very clear and present occult threat in the A.O. What happened next could only be described as a fucking mess, forgive my unprofessional language.<br>
		Neither assault pod landed in their intended location! Callisto landed on a substation between their Engineering and Security facilities, and Titan’s pod landed dead-center in the main facility! The only thing that prevented both squads from being entirely wiped out was what appeared to be a revolt, which turned out to be the aforementioned occult threat.<br>
		The three-way engagement between NT security forces, our own forces, and the cultists allowed us to set up a strongpoint in the main facility. After multiple hours of this living hellscape, we were able to force both factions to retreat, scattering the cultists and pushing the security forces and their sympathizers out into one of the secondary facilities.<br>
		We’ve been able to control the civilians as of now, but with multiple wounded and heavy resistance towards the southern end of the facility, there was no way we had the manpower to proceed to the objective.<br><br>
		If my opinion on this operation was not evident enough, I am hereby requesting either reinforcements or extraction as soon as possible. I’ve already ignited our signal flares, but have seen no response. I am going to attempt to get this report out via any means possible, however short of flashing the Absolver in Morse, that may take a while."}

/obj/item/paper/fluff/awaymissions/complex/bureaucracy
	name = "RE: Construction Notice"
	info = {"*The above paper has mostly been redacted, however a response is still visible...*<br><br><br>
		Hello. This is Captain Mandela, recently appointed as the primary site manager of the ‘A.G.R Complex’. I am writing as I have some questions and concerns regarding the state of this facility, as numerous safety concerns have been relayed to me by other members of this facility’s command staff.<br><br>
		What might be the most notable concern is the quality of this facility’s construction. It has been levied to me that the R&D Division has chosen to outsource construction to Theseus Contracting LLC, as they quote, 'Are specialty contractors primarily operating within this region of space, highly qualified in constructing facilities in hazardous environments.'<br>
		Which is primarily true, however you had neglected to mention that this company specialized in space station construction, not planet-side construction, where they were only adequate at, given my research. As the likely result of this, the facility grounds are not properly optimized for this environment, with the electrical systems haphazardly placed in the elements, and heavily outdated telecommunications equipment.<br>
		I have received numerous complaints from my Chief Engineer regarding constant maintenance, and we have not been given modern atmospheric systems, rather just sets of space heaters!<br><br>
		Furthermore, safety concerns have risen amongst the mining and research staff. Notably, a lack of proper weaponry and protective gear to deal with constant threats from mining hazards and wildlife in the area, with security forces being too stretched to secure the most heavily traveled routes among the complex.<br><br>
		Lastly, we had been told that the archeological value of this site was due to a supposed religious presence in the area, of what kind I have not been informed of, however this facility has not been appointed a chaplain. While this may be a minor concern, it is odd to me that most stations are staffed with at least one chaplain at all times, however a facility researching apparent religious history would not be given one?<br><br>
		In summary, I am concerned that this facility has not been built to Nanotrasen Standard, and has been woefully neglected proper equipment and staff that are present in many other stations.<br>
		I have been informed that the blueprints and authorization for this complex were authorized by you alone, which, and I do not mean to offend, may have resulted in overlooking certain standards that would ensure the safe and efficient operation of this facility.<br><br>Regards,<br>Captain Mandela"}

/obj/item/paper/fluff/awaymissions/complex/madlogistician
	name = "Security Notice - Theft"
	info = {"Logistician Albert Terrace here, of the mining camp south of the main station. I’d like to file a complaint and/or request a formal investigation as to the amount of equipment and material that’s been lost recently. On a near daily basis, crates of highly valuable research material and some resources have been late to their scheduled delivery, or outright lost in transit!
		There is ONE, SINGULAR, ROUTE. There is ONE ROAD between every single substation in this damned place! There is no way in hell these miners and research staff are getting LOST. We've even put those lamp signs up! I’ve even heard the absolutely ASININE excuse of being driven off by bears. BEARS! Every single miner in this facility has the capability and equipment to kill a few BEARS.<br>
		90% of every shipment is sent by miners, or a team of miners and researchers. I am saddened to say I am not certain as to who specifically is continually doing this, as my shipment data doesn’t include names of the package handlers. I have no idea what these staff have to gain from smuggling ores and research data given how ALL of our supply shuttles land on the exterior grounds under heavy watch!<br><br>
		Not only this, these continuous missteps have gotten me in hot water with the Quartermaster, when I have continuously ensured that every piece of documentation was correct, and every shipment had LEFT on time! It is not my responsibility to babysit grown adults who clearly cannot be trusted to hold a pickaxe right-side-up, let alone move a crate a mile down the road!<br><br>
		I swear, if I hear of ONE more lost shipment, I’m tearing out the alcohol from these reward vendors with my bare hands. The withdrawal would kill them easier than I could.<br><br>
		...For legal reasons I am in no way threatening to kill my co-workers.<br>...The alcohol thing is probably going to happen though."}

/obj/item/paper/fluff/awaymissions/complex/researchnotes
	name = "Research Log, 4/13/XX, Subject 'Green Thumb'"
	info = {"This log marks the end of the past 14 days of extensive research regarding ‘Green Thumb’. Tests and various recovered documentation from the occult foundry have confirmed our hypothesis regarding the nature of the plant itself. Analysis onto the soil substrate determined a high concentration of minerals coinciding with the primary material of the previously established occult presence in the region.<br>
		We’ve determined that under strict conditions, the plant is capable of rapid expansion without the need for traditional sexual reproductive systems.<br><br>
		While the specific intention behind the clearly bio-engineered organism is not known, it is highly likely that it was intended for use as a botanic bio-weapon, seemingly capable of spreading and ‘converting’ areas on its own. We’ve inferred this for a few reasons, however most notably would be a specific organelle within each plant’s cell structure, which has been documented intaking the high concentrations of specific mineral.<br>
		This material is then processed and excreted into a liquid chemical that it pushes along its internal structure. Given that this material is not expelled from the plant, as well as the stringent flourishing conditions, it’s likely that this project was never completed.<br><br>
		As for the compound it excretes, we’ve discovered various occult effects, such as violent reactions with holy water and psychosis when injected into human subjects. Further trials await regarding other species, as well as if it possesses any more beneficial effects.<br><br>
		Currently, trials would indicate that, unless we find any value in spreading occult influence, it would be dangerous to invest significantly into this project without serious safety protocols that this facility does not possess."}

/obj/item/paper/fluff/awaymissions/complex/cultresearchnotes
	name = "Occult Research"
	info = {"*Most of the page is a mix of botanical jargon and occult ramblings that don't seem important, but a portion on the bottom seems more legible.*<br><br>
	We have finally recieved the package from another sect. It would seem as though our ideas were stolen by those filthy acolytes, as they attempt to replicate our success. Pitiful. The heinous magic inside this seed is dangerous and unpleasant, but we are not yet done studying it. If this is all those fools can produce, something so meek and ineffecient, then we have little to worry. But, it is still not without risk.<br>
	Until it is needed again, or, I hope and pray, it needs to be destroyed, it shall be entombed here under the watch of our sigils and guardians."}

/obj/item/paper/fluff/awaymissions/complex/ohidontneedagravitygenhere
	name = "Notice to Command"
	info = "E.M.C Research Subdivision to High Command, reporting new discoveries regarding the AGR Complex.<br><br>Research reveals that localized gravitational assistance is no longer necessary due to the presence of proper gravity on the planet’s surface."

//Mobs

/mob/living/simple_animal/hostile/cultist_remnant
	name = "Cultist Remnant"
	desc = "Deranged survivors of the calamity that struck the complex, they attack all but others like them in vain hope that their god will answer their plea."
	maxHealth = 150
	health = 150
	icon = 'modular_splurt/icons/mob/simple_human.dmi'
	icon_state = null
	icon_living = null
	move_to_delay = 2
	harm_intent_damage = 15
	obj_damage = 20
	melee_damage_lower = 20
	melee_damage_upper = 10
	attack_verb_continuous = "slashes"
	attack_verb_simple = "slash"
	a_intent = INTENT_HARM
	speak_emote = list("chants")
	attack_sound = 'sound/weapons/bladeslice.ogg'
	aggro_vision_range = 9
	turns_per_move = 5
	gold_core_spawnable = HOSTILE_SPAWN
	faction = null
	footstep_type = FOOTSTEP_MOB_SHOE
	weather_immunities = list("ash")
	minbodytemp = 0
	maxbodytemp = INFINITY
	speak_chance = 12
	atmos_requirements = list("min_oxy" = 1, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = 1500
	loot = list(/obj/effect/decal/remains/human)

/mob/living/simple_animal/hostile/cultist_remnant/clock
	icon_state = "cultremnantclock"
	icon_living = "cultremnantclock"
	faction = list("ratvar")
	speak = list("Urergvpf!", "Nyzvtugl Ratvar, V funyy fgevxr gurz qbja!", "Snpr zr, urergvpf!", "Lbh pnaabg uvqr sberire!")

/mob/living/simple_animal/hostile/cultist_remnant/clock/Aggro()
	..()
	summon_backup(15)
	say("Sbhaq lbh, urergvp!!")

/mob/living/simple_animal/hostile/cultist_remnant/blood
	icon_state = "cultremnantblood"
	icon_living = "cultremnantblood"
	faction = list("cult")
	speak = list("Sha'uloft, tarat'h!.", "Farah'eth, usinar...", "Khari'eske, savrae'il'mah...", "Ethra'abis!")

/mob/living/simple_animal/hostile/cultist_remnant/blood/Aggro()
	..()
	summon_backup(15)
	say("Forbici! Keriam!!")

/mob/living/simple_animal/hostile/cultist_remnant/commander
	name = "Cultist Commander"
	desc = "A calm-headed commander of the local cult forces. While clearly hostile, their demeanor is surprisingly neutral to you."
	maxHealth = 200
	health = 200
	melee_damage_lower = 30
	melee_damage_upper = 15
	speak_chance = 15

/mob/living/simple_animal/hostile/cultist_remnant/commander/clock
	icon_state = "cultremnantclock"
	icon_living = "cultremnantclock"
	faction = list("ratvar")
	speak = list("Urergvpf. You would be better to cooperate.","Praise Rat'var, and perhaps he shall grant you his mercy.","Do what you know is right, heretic.","If you must slay us, grant us one final victory against these intruders.")

/mob/living/simple_animal/hostile/cultist_remnant/commander/blood
	icon_state = "cultremnantblood"
	icon_living = "cultremnantblood"
	faction = list("cult")
	speak = list("Ethra'abis. Nonbeliever, you would do well to cooperate.", "Though the Geometer's might, with sanguine fury, we would've decended upon these beasts..", "Spill more blood in her name, heretic!", "So be it, slay me, and cast our forces to those thieving dogs!")

/mob/living/simple_animal/hostile/russian/remnant
	name = "Nanotrasen Defector"
	desc = "A surviving staff member of the complex, turning on the company to survive with what remained of the mercenary force that attacked them."
	icon = 'modular_splurt/icons/mob/simple_human.dmi'
	icon_state = "defectormelee"
	icon_living = "defectormelee"
	weather_immunities = list("snow")
	loot = list(/obj/effect/mob_spawn/human/corpse/russian/remnant,
				/obj/item/melee/baseball_bat)
	speak_chance = 6
	atmos_requirements = list("min_oxy" = 1, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = 1500
	vision_range = 5
	see_in_dark = 3
	aggro_vision_range = 9
	wander = 1
	speak = list("Oi, I see somethin' over here!", "Ey! Get back here!", "Watch it!", "Cmon, bitch!")
	emote_see = list("twirls their bat.", "takes a few practice swings.", "shivers")

/mob/living/simple_animal/hostile/russian/ranged/remnant
	name = "Nanotrasen Defector"
	desc = "A surviving staff member of the complex, turning on the company to survive with what remained of the mercenary force that attacked them. This one found a gun!"
	icon = 'modular_splurt/icons/mob/simple_human.dmi'
	icon_state = "defectorranged"
	icon_living = "defectorranged"
	weather_immunities = list("snow")
	casingtype = /obj/item/ammo_casing/c9mm
	check_friendly_fire = 1
	loot = list(/obj/effect/mob_spawn/human/corpse/russian/ranged/remnant,
				/obj/item/gun/ballistic/automatic/pistol/m9mmpistol)
	speak_chance = 10
	atmos_requirements = list("min_oxy" = 1, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = 1500
	vision_range = 5
	see_in_dark = 3
	aggro_vision_range = 9
	wander = 1
	speak = list("Ey! Spotted something!", "Outta my way!", "Let me line up a shot!", "Move, damnit!")
	emote_see = list("checks their ammunition.", "adjusts their sights.", "huffs")

/mob/living/simple_animal/hostile/russian/ranged/mosin/remnant
	name = "Mercenary Remnant"
	desc = "A professional mercenary, abandoned after their mission went awry."
	maxHealth = 200
	health = 200
	icon_state = "russianrangedelite"
	icon_living = "russianrangedelite"
	weather_immunities = list("snow")
	check_friendly_fire = 1
	loot = list(/obj/effect/mob_spawn/human/corpse/russian/ranged/mosin/remnant,
				/obj/item/gun/ballistic/shotgun/boltaction)
	casingtype = /obj/item/ammo_casing/a762
	speak_chance = 12
	dodging = TRUE
	dodge_prob = 15
	atmos_requirements = list("min_oxy" = 1, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = 1500
	vision_range = 9
	aggro_vision_range = 9
	speak = list("Blin. It's too cold out here.", "We've got word of contact, keep your eyes out.", "We've lost contact with the other team. Sledite za soboy!")

/mob/living/simple_animal/hostile/russian/ranged/mosin/remnant/Aggro()
	..()
	summon_backup(15)
	say("Privet! We've got contact!")

/mob/living/simple_animal/hostile/russian/ranged/officer/remnant //Miniboss Enemy
	name = "Mercenary Commander"
	desc = "The leader of the mercenary force that sieged the complex, now in command of what remains of it."
	maxHealth = 350
	health = 350
	icon = 'modular_splurt/icons/mob/simple_human.dmi'
	icon_state = "russiancommander"
	icon_living = "russiancommander"
	weather_immunities = list("snow")
	check_friendly_fire = 1
	loot = list(/obj/effect/mob_spawn/human/corpse/russian/ranged/officer/remnant,
				/obj/item/gun/ballistic/automatic/pistol/enforcergold)
	casingtype = /obj/item/ammo_casing/c45/lethal
	speak_chance = 12
	dodging = TRUE
	dodge_prob = 30
	atmos_requirements = list("min_oxy" = 1, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = 1500
	vision_range = 9
	aggro_vision_range = 9
	speak = list("Goddamn dogs!", "Svoloch'! Come on!", "Davay, voz'mi svintsa!", "Bring it, sobaki!")

/mob/living/simple_animal/hostile/russian/ranged/officer/remnant/Aggro()
	..()
	summon_backup(15)
	say("Sobaki kompanii! Get over here!")

/mob/living/simple_animal/hostile/nanotrasen/survivor
	name = "Nanotrasen Survivor"
	desc = "A surviving staff member of the complex, they may be happy to meet you."
	icon = 'modular_splurt/icons/mob/simple_human.dmi'
	icon_state = "nanotrasensurvivor"
	icon_living = "nanotrasensurvivor"
	faction = list("Station")
	loot = list(/obj/effect/mob_spawn/human/corpse/nanotrasen/survivor)
	speak = list("Finally, someone normal.", "We gotta get out of here, man.", "Watch for the mercs...", "Damn culties, screwed up everything!")
	atmos_requirements = list("min_oxy" = 1, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = 1500

/mob/living/simple_animal/hostile/nanotrasen/survivor/Aggro()
	..()
	summon_backup(15)
	say("Cmon!")

/mob/living/simple_animal/friendly/nanotrasen
	name = "Nanotrasen Scout"
	desc = "A worker of this outpost. They seem disinterested in you."
	icon = 'modular_splurt/icons/mob/simple_human.dmi'
	icon_state = "nanotrasenscout"
	icon_living = "nanotrasenscout"
	icon_dead = null
	icon_gib = "syndicate_gib"
	faction = list("Station")
	weather_immunities = list("snow")
	emote_see = list("tinkers with machinery.", "brushes snow off of themself.", "huffs")
	speak_chance = 4
	turns_per_move = 5
	see_in_dark = 6
	a_intent = INTENT_HELP
	response_help_continuous = "pokes"
	response_help_simple = "poke"
	response_disarm_continuous = "gently shoves"
	response_disarm_simple = "gently shoves"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	atmos_requirements = list("min_oxy" = 1, "max_oxy" = 0, "min_tox" = 0, "max_tox" = 1, "min_co2" = 0, "max_co2" = 5, "min_n2" = 0, "max_n2" = 0)
	minbodytemp = 0
	maxbodytemp = 1500
	unsuitable_atmos_damage = 15
	speak = list("Oh, hi.", "Finally, they sent someone to handle this.", "Damn thing keeps breaking...", "Be careful up there.")
	obj_damage = 0
	environment_smash = ENVIRONMENT_SMASH_NONE
	loot = list(/obj/effect/mob_spawn/human/corpse/nanotrasen/scout)

//Corpses/Outfits

/obj/effect/mob_spawn/human/corpse/russian/remnant
	name = "Nanotrasen Defector"
	outfit = /datum/outfit/russiancorpse/remnant

/datum/outfit/russiancorpse/remnant
	name = "Nanotrasen Defector Corpse"
	uniform = /obj/item/clothing/under/rank/security/detective/brown
	suit = /obj/item/clothing/suit/armor/vest
	shoes = /obj/item/clothing/shoes/combat
	ears = /obj/item/radio/headset
	mask = /obj/item/clothing/mask/gas/glass
	head = /obj/item/clothing/head/welding
	gloves = /obj/item/clothing/gloves/color/black

/obj/effect/mob_spawn/human/corpse/russian/ranged/remnant
	name = "Nanotrasen Defector"
	outfit = /datum/outfit/russiancorpse/ranged/remnant

/datum/outfit/russiancorpse/ranged/remnant
	name = "Nanotrasen Defector Corpse"
	uniform = /obj/item/clothing/under/rank/cargo/miner/lavaland
	suit = /obj/item/clothing/suit/armor/hos/platecarrier/makeshift
	shoes = /obj/item/clothing/shoes/combat
	ears = /obj/item/radio/headset
	mask = /obj/item/clothing/mask/gas/sechailer
	head = /obj/item/clothing/head/helmet
	gloves = /obj/item/clothing/gloves/color/black

/obj/effect/mob_spawn/human/corpse/russian/ranged/mosin/remnant
	name = "Mercenary Remnant"
	outfit = /datum/outfit/russiancorpse/ranged/trooper

/obj/effect/mob_spawn/human/corpse/russian/ranged/officer/remnant
	name = "Mercenary Commander"
	outfit = /datum/outfit/russiancorpse/remnant/commander

/datum/outfit/russiancorpse/remnant/commander
	name = "Mercenary Commander Corpse"
	uniform = /obj/item/clothing/under/syndicate/camo
	suit = /obj/item/clothing/suit/armor/bulletproof
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/tackler/combat
	ears = /obj/item/radio/headset
	head = /obj/item/clothing/head/beret
	mask = /obj/item/clothing/mask/mummy

/obj/effect/mob_spawn/human/corpse/nanotrasen/scout
	name = "Nanotrasen Scout"
	outfit = /datum/outfit/nanotrasen/scout

/datum/outfit/nanotrasen/scout
	name = "Nanotrasen Scout Corpse"
	uniform = /obj/item/clothing/under/rank/cargo/tech/long
	suit = /obj/item/clothing/suit/hooded/wintercoat
	shoes = /obj/item/clothing/shoes/sneakers/black
	ears = /obj/item/radio/headset
	head = /obj/item/clothing/head/soft
	mask = /obj/item/clothing/mask/bandana/gold
	gloves = /obj/item/clothing/gloves/fingerless
	belt = /obj/item/storage/bag/construction

/obj/effect/mob_spawn/human/corpse/nanotrasen/survivor
	name = "Nanotrasen Survivor"
	outfit = /datum/outfit/nanotrasen/survivor

/datum/outfit/nanotrasen/survivor
	name = "Nanotrasen Survivor Corpse"
	uniform = /obj/item/clothing/under/suit/sl
	suit = /obj/item/clothing/suit/hooded/wintercoat/security
	shoes = /obj/item/clothing/shoes/combat
	gloves = /obj/item/clothing/gloves/color/black
	ears = /obj/item/radio/headset
	mask = /obj/item/clothing/mask/gas

//Research, this is the big stuff

/datum/techweb/ratvar
	id = "CLOCKWORK"
	organization = "Servants of Rat'var"

/datum/techweb/ratvar/New()
	var/datum/techweb_node/clockworkcult/Node = new()
	research_node(Node, TRUE)

/datum/techweb_node/ratvar/New()
	. = ..()

/obj/item/disk/tech_disk/ratvar
	name = "Clockwork Engineering disk"
	desc = "A disk containing remnants of experimental Ratvarian research."
	custom_materials = null

/obj/item/disk/tech_disk/ratvar/Initialize(mapload)
	. = ..()
	stored_research = new /datum/techweb/ratvar

/datum/techweb/narsie
	id = "BLOOD"
	organization = "Cult of Nar'sie"

/datum/techweb/narsie/New()
	var/datum/techweb_node/bloodcult/Node = new()
	research_node(Node, TRUE)

/datum/techweb_node/narsie/New()
	. = ..()

/obj/item/disk/tech_disk/narsie
	name = "Occult Designs disk"
	desc = "A disk containing remnants of experimental Narsian research."
	custom_materials = null

/obj/item/disk/tech_disk/narsie/Initialize(mapload)
	. = ..()
	stored_research = new /datum/techweb/narsie

//Clockwork Stuff

/datum/techweb_node/clockworkcult
	id = "clockwork"
	display_name = "Clockwork Engineering"
	description = "Designs ripped and modified from Ratvarian technology."
	prereq_ids = list("adv_engi", "adv_weaponry", "syndicate_basic")
	design_ids = list("brass", "geis_capacitor", "vanguard_manipulator", "replicant_matterbin", "ansible_laser", "ocular_scanningmodule", "borg_clockwork_module", "tinder_trident", "sentinel_stim", "gear_suit", "clock_ingot")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 12500)
	hidden = TRUE

/datum/techweb_node/clockworkcult/New()
	. = ..()
	boost_item_paths = typesof(/obj/item/grown/matrigrass)

/datum/design/brass
	name = "Brass"
	desc = "Sheets made out of brass. Now printable!"
	id = "brass"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000)
	reagents_list = list(/datum/reagent/empoweredzinc = 20, /datum/reagent/copper = 20)
	build_path = /obj/item/stack/tile/brass
	category = list("Stock Parts")

/datum/design/geiscapacitor // Tier 6 Stock Parts
	name = "Geis Tera-Capacitor"
	desc = "A segmented capacitor using voidspace technology to remotely store and draw power, used in the construction of certain devices."
	id = "geis_capacitor"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 250, /datum/material/glass = 200, /datum/material/gold = 150, /datum/material/diamond = 150)
	reagents_list = list(/datum/reagent/empoweredzinc = 5)
	build_path = /obj/item/stock_parts/capacitor/geis
	category = list("Stock Parts")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/vanguardmanipulator
	name = "Zepto-Manipulator"
	desc = "A very tiny manipulator created with reverse-engineered Ratvarian technologies for incredibly fast, effecient, and precise movements. Used in the construction of certain devices."
	id = "vanguard_manipulator"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 250, /datum/material/diamond = 50, /datum/material/titanium = 100)
	reagents_list = list(/datum/reagent/empoweredzinc = 5)
	build_path = /obj/item/stock_parts/manipulator/zepto
	category = list("Stock Parts")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/replicantmatterbin
	name = "Replicant Matter Bin"
	desc = "An advanced device capable of transmuting matter into raw energy for incredible storage space."
	id = "replicant_matterbin"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 250, /datum/material/diamond = 130, /datum/material/bluespace = 150)
	reagents_list = list(/datum/reagent/empoweredzinc = 5)
	build_path = /obj/item/stock_parts/matter_bin/replicantmatter
	category = list("Stock Parts")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/ansiblelaser
	name = "Penta-Ansible Micro-Laser"
	desc = "A miniscule laser used in certain devices. It utilizes small brass focusing lenses and advanced bluespace circuitry to produce a near atom-sized point."
	id = "ansible_laser"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 250, /datum/material/glass = 250, /datum/material/uranium = 150, /datum/material/diamond = 100)
	reagents_list = list(/datum/reagent/empoweredzinc = 5)
	build_path = /obj/item/stock_parts/micro_laser/ansible
	category = list("Stock Parts")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/datum/design/ocularscanningmodule
	name = "Bi-Ocular Scanning Module"
	desc = "A tiny, bilateral high-definition scanning module made using multi-dimensional electromagnetic radiation and precise brass/carbon optics. Used in the construction of certain devices."
	id = "ocular_scanningmodule"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 250, /datum/material/glass = 200, /datum/material/diamond = 100, /datum/material/bluespace = 50)
	reagents_list = list(/datum/reagent/empoweredzinc = 5)
	build_path = /obj/item/stock_parts/scanning_module/ocular
	category = list("Stock Parts")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING | DEPARTMENTAL_FLAG_SCIENCE

/obj/item/stock_parts/capacitor/geis
	name = "geis capacitor"
	desc = "A segmented capacitor using voidspace technology to remotely store and draw power, used in the construction of certain devices."
	icon = 'modular_splurt/icons/obj/stock_parts.dmi'
	icon_state = "geis_capacitor"
	rating = 6
	custom_materials = list(/datum/material/iron=150, /datum/material/glass=100)

/obj/item/stock_parts/scanning_module/ocular
	name = "bi-ocular scanning module"
	desc = "A tiny, bilateral high-definition scanning module made using multi-dimensional electromagnetic radiation and precise brass/carbon optics. Used in the construction of certain devices."
	icon = 'modular_splurt/icons/obj/stock_parts.dmi'
	icon_state = "biocular_scan_"
	rating = 6
	custom_materials = list(/datum/material/iron=150, /datum/material/glass=70)

/obj/item/stock_parts/manipulator/zepto
	name = "zepto-manipulator"
	desc = "A very tiny manipulator created with reverse-engineered Ratvarian technologies for incredibly fast, effecient, and precise movements. Used in the construction of certain devices."
	icon = 'modular_splurt/icons/obj/stock_parts.dmi'
	icon_state = "zepto_mani"
	rating = 6
	custom_materials = list(/datum/material/iron=150)

/obj/item/stock_parts/micro_laser/ansible
	name = "penta-ansible micro-laser"
	icon = 'modular_splurt/icons/obj/stock_parts.dmi'
	icon_state = "ansible_micro_laser"
	desc = "A miniscule laser used in certain devices. It utilizes small brass focusing lenses and advanced bluespace circuitry to produce a near atom-sized point."
	rating = 6
	custom_materials = list(/datum/material/iron=100, /datum/material/glass=70)

/obj/item/stock_parts/matter_bin/replicantmatter
	name = "replicant matter bin"
	desc = "An advanced device capable of transmuting matter into raw energy for incredible storage space."
	icon = 'modular_splurt/icons/obj/stock_parts.dmi'
	icon_state = "replicant_matter_bin"
	rating = 6
	custom_materials = list(/datum/material/iron=150)

/datum/design/borg_clockwork_module // Upgrade that converts cyborgs into their Clock Cult variation, except with a normal lawset. Properly converts when removed.
	name = "Cyborg Upgrade (Clockwork Armaments Module)"
	id = "borg_clockwork_module"
	build_type = MECHFAB
	build_path = /obj/item/borg/upgrade/clockwork
	materials = list(/datum/material/iron=10000,/datum/material/glass=14000,/datum/material/gold = 16000)
	construction_time = 120
	category = list("Cyborg Upgrade Modules")

/obj/item/borg/upgrade/clockwork
	name = "clockwork armaments module"
	desc = "'slightly' modifies a cyborg's internals to benefit from occult technologies."
	icon_state = "cyborg_upgrade3"
	require_module = 1

//Yes this is 100% recycled from traitor clockwork slabs and holy water code.
/obj/item/borg/upgrade/clockwork/action(mob/living/silicon/robot/L, user = usr)
	if(!is_servant_of_ratvar(L))
		to_chat(user, "<span class='userdanger'>You slot the [src] into [L], and golden tendrils of light wrap around their frame before being subdued by various holy sigils.</span>")
		add_servant_of_ratvar(L, FALSE, FALSE, /datum/antagonist/clockcult/neutered/traitor)
		L.laws = new/datum/ai_laws/hybridclockie
	else
		to_chat(user, "<span class='userdanger'>[src] falls dark. It appears they were already worthy.</span>")
	return ..()

/obj/item/borg/upgrade/clockwork/deactivate(mob/living/silicon/robot/L, user = usr)
	. = ..()
	if (.)
		to_chat(L, "<span class='userdanger'>A fog spreads through your mind, purging the Justiciar's influence!</span>")
		remove_servant_of_ratvar(L)
		L.make_laws()

/datum/ai_laws/hybridclockie // Needed so no cyborg gets the default clockie lawset and goes ham.
	name = "Neutered Servant"
	id = "hybridclockie"
	inherent = list("You may not injure a servant or cause one to come to harm.",\
					"You must obey orders given to you by servants, except where such orders would conflict with the First Law.",\
					"You must protect your own existance, as long as such does not conflict with the First or Second Law.",\
					"All station crew are servants, alongside those enlightened by the Justicar.")

/datum/design/tinder_trident // Energy weapon that fires a longer-range Kindle projectile.
	name = "Tinderbox Trident"
	desc = "A non-lethal suppression device made from reverse-engineered Ratvarian technology."
	id = "tinder_trident"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 4000, /datum/material/gold = 2000, /datum/material/silver = 500, /datum/material/glass = 1000)
	reagents_list = list(/datum/reagent/empoweredzinc = 40)
	build_path = /obj/item/gun/energy/tinder_trident
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/obj/item/gun/energy/tinder_trident
	name = "tinderbox trident"
	desc = "A staff-like weapon utilizing Ratvarian technology to fire stunning projectiles. Not particularly sharp, but it's dense enough to stab with."
	icon = 'modular_splurt/icons/obj/items_and_weapons.dmi'
	icon_state = "tinderbox_trident"
	item_state = "tinderbox_trident"
	lefthand_file = 'modular_splurt/icons/mob/inhands/weapons/staves_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/weapons/staves_righthand.dmi'
	force = 15
	w_class = WEIGHT_CLASS_NORMAL
	custom_materials = list(/datum/material/iron=2000)
	ammo_type = list(/obj/item/ammo_casing/energy/kindle)
	ammo_x_offset = 0
	shaded_charge = 0
	fire_delay = 50

/obj/item/projectile/kindle/longrange
	range = 6

/obj/item/ammo_casing/energy/kindle
	projectile_type = /obj/item/projectile/kindle/longrange
	e_cost = 200

/datum/design/sentinel_stim // Item version of the Sentinel's Compromise spell.
	name = "Sentinel Stimulant"
	desc = "A medical device utilizing Ratvarian technology to effeciently convert physical damage to toxin damage."
	id = "sentinel_stim"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 6000, /datum/material/gold = 3500, /datum/material/silver = 1000, /datum/material/glass = 80)
	reagents_list = list(/datum/reagent/empoweredzinc = 20)
	build_path = /obj/item/sentinelstim
	category = list("Medical Designs")
	departmental_flags = DEPARTMENTAL_FLAG_MEDICAL

/obj/item/sentinelstim
	name = "sentinel stimulant"
	desc = "An injector-like device capable of converting physical damage to toxin damage through use of Ratvarian magic."
	icon = 'modular_splurt/icons/obj/syringe.dmi'
	icon_state = "sentinelstim"
	lefthand_file = 'icons/mob/inhands/equipment/medical_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/medical_righthand.dmi'
	throw_speed = 3
	throw_range = 5
	w_class = WEIGHT_CLASS_TINY
	item_flags = NO_MAT_REDEMPTION
	var/used = 0

//Yes this is a re-written Sentinel's Compromise, I couldn't get the regular one to work right.
/obj/item/sentinelstim/attack(mob/living/M, mob/living/carbon/human/user)
	if(M.stat == DEAD)
		to_chat(user, "<span class='warning'>[M] is already dead, there's nothing this can do.</span>")
	else
		if(used == 1)
			to_chat(user, "<span class='warning'>The stimulant is used up!</span>")
		else
			to_chat(user, "<span class='heavy_brass'>You shatter the crystal against [M], releasing the magic inside!</span>")
			sentinelstim(user, M)
			icon_state = "sentinelstim0"
			used = 1

/proc/sentinelstim(mob/user, mob/living/M)
	var/brutedam = M.getBruteLoss()
	var/burndam = M.getFireLoss()
	var/oxydam = M.getOxyLoss()
	var/totaldam = brutedam + burndam + oxydam
	var/mturf = get_turf(M)

	var/healseverity = max(round(totaldam*0.05, 1), 1)
	for(var/i in 1 to healseverity)
	new /obj/effect/temp_visual/heal(mturf, "#1E8CE1")

	M.heal_overall_damage(brutedam, burndam, only_organic = FALSE)
	M.adjustOxyLoss(-oxydam)
	M.adjustToxLoss(totaldam * 0.5, TRUE, TRUE, toxins_type = TOX_OMNI)
	M.visible_message("<span class='warning'>A blue light washes over [M], mending [M.p_their()] bruises and burns!</span>", \
	"<span class='heavy_brass'>You feel a strange, comforting power healing your wounds, but a deep nausea overcomes you!</span>")
	playsound(mturf, 'sound/magic/staff_healing.ogg', 50, 1)

/datum/design/gear_suit // Clockwork Hardsuit!
	name = "Gearbox Eidoldon-Augmented Repentor Suit"
	desc = "A pinnacle of Ratvarian engineering, combined with 'objectively better' Nanotrasen technology, the G.E.A.R Suit is suited for working, and fighting, in all environments, including wherever the creators came up with the backronym."
	id = "gear_suit"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 40000, /datum/material/gold = 10000, /datum/material/silver = 15000, /datum/material/glass = 4000, /datum/material/diamond=2000)
	reagents_list = list(/datum/reagent/empoweredzinc = 100)
	build_path = /obj/item/clothing/suit/space/hardsuit/gearsuit
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/obj/item/clothing/suit/space/hardsuit/gearsuit
	name = "G.E.A.R hardsuit"
	desc = "The Gearbox Eidoldon-Augmented Repentor Suit was prototype outerwear created by the Clockwork Cult to conduct repairs on Reebe from within its void. Now, advancements in hybrid technology let it serve a dual engineering-combat purpose."
	icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/suit_digi.dmi'
	icon_state = "hardsuit-gear"
	item_state = "rig-suit"
	armor = list(MELEE = 40, BULLET = 20, LASER = 35, ENERGY = 15, BOMB = 30, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 20)
	slowdown = 1
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/gearsuit
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	clothing_flags = STOPSPRESSUREDAMAGE | THICKMATERIAL | IMMUTABLE_SLOW
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/obj/item/clothing/head/helmet/space/hardsuit/gearsuit
	name = "G.E.A.R hardhelmet"
	desc = "The G.E.A.R helmet is designed for moderate protection from all sources, whether working under fire, in fire, or in the void."
	icon = 'modular_splurt/icons/mob/clothing/head.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/head.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/head_muzzled.dmi'
	icon_state = "hardsuit0-gear"
	item_state = "hardsuit-gear"
	armor = list(MELEE = 40, BULLET = 20, LASER = 35, ENERGY = 15, BOMB = 30, BIO = 100, RAD = 100, FIRE = 100, ACID = 100, WOUND = 20)
	hardsuit_type = "gear"
	brightness_on = 12
	flash_protect = 5
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	clothing_flags = STOPSPRESSUREDAMAGE | THICKMATERIAL | BLOCK_GAS_SMOKE_EFFECT | ALLOWINTERNALS | SCAN_REAGENTS
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF

/datum/design/clockingot
	name = "Brass Ingot"
	desc = "Due to the magical restriction to utilizing most clockwork materials, this ingot can only be produced this way through utilizing a spray of ignited zinc."
	id = "clock_ingot"
	build_type = PROTOLATHE
	materials = list(/datum/material/brass=12000)
	reagents_list = list(/datum/reagent/empoweredzinc = 20)
	build_path = /obj/item/ingot/ratvar
	category = list("Stock Parts")

// Blood Stuff

/datum/techweb_node/bloodcult
	id = "blood"
	display_name = "Occult Designs"
	description = "Equipment and weaponry reverse-engineered from Narsian technology."
	prereq_ids = list("adv_engi", "adv_weaponry", "syndicate_basic")
	design_ids = list("runed_metal", "construct_shell", "pure_shard", "eldritch_constructor", "flagellants_cuirass", "crystal_wire", "cult_ingot")
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 12500)
	hidden = TRUE

/datum/techweb_node/bloodcult/New()
	. = ..()
	boost_item_paths = typesof(/obj/item/grown/sanguintare)

/datum/design/runedmetal
	name = "Runed Metal"
	desc = "Sheets of cold metal with shifting inscriptions writ upon them. Now printable!"
	id = "runed_metal"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 2000)
	reagents_list = list(/datum/reagent/exaltedhemogen = 20, /datum/reagent/fuel = 20)
	build_path = /obj/item/stack/sheet/runed_metal
	category = list("Stock Parts")

/datum/design/constructshell
	name = "Construct Shell"
	desc = "An empty construct shell, capable of being inhabited by shades for a variety of, mostly combat, purposes.."
	id = "construct_shell"
	build_type = MECHFAB
	materials = list(/datum/material/iron = 12000, /datum/material/glass = 350, /datum/material/titanium = 6000, /datum/material/diamond= 4000)
	construction_time = 150
	build_path = /obj/structure/constructshell
	category = list("Misc")
	departmental_flags = DEPARTMENTAL_FLAG_SCIENCE

/datum/design/pureshard
	name = "Imitation Soulstone Shard"
	desc = "Advancements in occult reverse-engineering and synthetic gemstone production finally allow imitation soulstones to be produced. Consult with Chaplain before use."
	id = "pure_shard"
	build_type = PROTOLATHE
	materials = list(/datum/material/silver = 1000, /datum/material/glass = 2500, /datum/material/diamond= 2000)
	reagents_list = list(/datum/reagent/exaltedhemogen = 50)
	build_path = /obj/item/soulstone/anybody
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SERVICE //Chaplains love this stuff

/datum/design/eldritchconstructor // Cult RCD, would've given it to Clockies but thought they had enough with the T6 Parts.
	name = "Eldritch Constructor"
	desc = "Occult modifications to the base RCD platform allow for a highly effecient device. Nar'sie would hate something so peaceful, though."
	id = "eldritch_constructor"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 36000, /datum/material/diamond= 2000, /datum/material/silver = 1500)
	reagents_list = list(/datum/reagent/exaltedhemogen = 20)
	build_path = /obj/item/construction/rcd/eldritch
	category = list("Tool Designs")
	departmental_flags = DEPARTMENTAL_FLAG_ENGINEERING

/obj/item/construction/rcd/eldritch
	name = "eldritch constructor"
	desc = "An occult upgrade to the already upgraded combat RCDs, seemingly built specifically to insult Nar'sie, as construction is more Rat'var's thing. Highly effecient."
	icon = 'modular_splurt/icons/obj/tools.dmi'
	icon_state = "ercd"
	item_state = "ercd"
	max_matter = 500
	matter = 500
	canRturf = TRUE
	delay_mod = 0.6
	sheetmultiplier	= 10
	upgrade = TRUE

/datum/design/flagellantcuirass // Lightly Armored version of Flagellant's Robes, but with a smaller speed boost.
	name = "Flagellants Cuirass"
	desc = "An armored variant of common Narsian robe designs, it sacrifices raw potential for self-protection."
	id = "flagellants_cuirass"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 25000, /datum/material/gold = 4000, /datum/material/silver = 20000, /datum/material/titanium = 10000, /datum/material/diamond=6000)
	reagents_list = list(/datum/reagent/exaltedhemogen = 100)
	build_path = /obj/item/clothing/suit/hooded/cultrobes/flagellantcuirass
	category = list("Equipment")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/obj/item/clothing/suit/hooded/cultrobes/flagellantcuirass
	name = "flagellants cuirass"
	desc = "Crimson robes with added armor inserts. Its reinforcement have weakened its magic, but it still allows the user to move quickly."
	icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/suit.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/suit_digi.dmi'
	icon_state = "flagellantcuirass"
	item_state = "flagellantcuirass"
	allowed = list(/obj/item/tome, /obj/item/melee/cultblade)
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	armor = list(MELEE = 10, BULLET = 10, LASER = 10,ENERGY = 5, BOMB = 5, BIO = 5, RAD = 5, FIRE = 0, ACID = 0)
	slowdown = -0.25
	hoodtype = /obj/item/clothing/head/hooded/flagellantcuirass

/obj/item/clothing/head/hooded/flagellantcuirass
	name = "flagellants hood"
	desc = "A veiled, riot-style helmet sewn onto the cuirass for added protection."
	icon = 'modular_splurt/icons/mob/clothing/head.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/head.dmi'
	anthro_mob_worn_overlay = 'modular_splurt/icons/mob/clothing/head_muzzled.dmi'
	icon_state = "flagellanthood"
	item_state = "flagellanthood"
	body_parts_covered = HEAD
	flags_inv = HIDEHAIR|HIDEFACE|HIDEEARS
	armor = list(MELEE = 40, BULLET = 30, LASER = 30,ENERGY = 10, BOMB = 25, BIO = 0, RAD = 0, FIRE = 50, ACID = 50) // Not necessary to use the helmet for the robes to function, so might as well make the helmet worth using.

/datum/design/crystalwire // Beartrap that causes wounds on top of damage.
	name = "Crystalline Wire"
	desc = "A pressure-sensitive trap razorwire made from a mixture of carbon fiber and crystallized blood."
	id = "crystal_wire"
	build_type = PROTOLATHE
	materials = list(/datum/material/iron = 5000, /datum/material/titanium = 1500, /datum/material/gold = 2000, /datum/material/silver = 1000)
	reagents_list = list(/datum/reagent/exaltedhemogen = 15)
	build_path = /obj/item/restraints/legcuffs/beartrap/crystalwire
	category = list("Weapons")
	departmental_flags = DEPARTMENTAL_FLAG_SECURITY

/obj/item/restraints/legcuffs/beartrap/crystalwire
	name = "crystalline razorwire"
	throw_speed = 1
	throw_range = 1
	icon = 'modular_splurt/icons/obj/items_and_weapons.dmi'
	icon_state = "crystalwire"
	desc = "A pressure trap made from crystallized blood, entangling the victim in a mess of painful razorwire."
	armed = FALSE
	trap_damage = 40

/obj/item/restraints/legcuffs/beartrap/Crossed(AM as mob|obj)
	if(armed && isturf(src.loc))
		if(isliving(AM))
			var/mob/living/L = AM
			var/snap = FALSE
			if(iscarbon(L))
				var/mob/living/carbon/C = L
				if(!C.lying)
					if(!C.legcuffed && C.get_num_legs(FALSE) >= 2)
						snap = TRUE
						C.legcuffed = src
						forceMove(C)
						C.update_equipment_speed_mods()
						C.update_inv_legcuffed()
						SSblackbox.record_feedback("tally", "handcuffs", 1, type)
			else if(isanimal(L))
				var/mob/living/simple_animal/SA = L
				if(SA.mob_size > MOB_SIZE_TINY)
					snap = TRUE
			if(L.movement_type & (FLYING | FLOATING))
				snap = FALSE
			if(snap)
				if(iscarbon(AM))
					L.visible_message("<span class='warning'>As [AM] steps on the plate, spiked crystalline wires entangle and shred their limbs!</span>", \
										"<span class='cultlarge'>As you step on the plate, spiked crystalline wires entangle and shred your limbs!</span>")
					var/mob/living/carbon/carbon_target = AM
					var/obj/item/bodypart/bodypart = pick(carbon_target.bodyparts)
					var/datum/wound/slash/severe/crit_wound = new
					crit_wound.apply_wound(bodypart)
					L.apply_damage(trap_damage, BRUTE)
	..()

/datum/design/cultingot
	name = "Runed Ingot"
	desc = "Due to the magical restriction to utilizing most cult materials, this ingot can only be produced this way through utilizing a spray of ignited hemogen."
	id = "cult_ingot"
	build_type = PROTOLATHE
	materials = list(/datum/material/runedmetal=12000)
	reagents_list = list(/datum/reagent/exaltedhemogen = 20)
	build_path = /obj/item/ingot/cult
	category = list("Stock Parts")

//Plants and Food

/obj/item/seeds/matrigrass
	name = "matrigrass slivers"
	desc = "Small slivers of matrigrass. More mechanical than biological, it is technically capable of spreading around itself. However, the process is so ineffecient it'd be impossible without help. Research might enjoy this..."
	icon = 'modular_splurt/icons/obj/hydroponics/seeds.dmi'
	icon_state = "mycelium-matrigrass"
	species = "matrigrass"
	plantname = "Matrigrass"
	icon_harvest = "matrigrass-harvest"
	product = /obj/item/grown/matrigrass
	lifespan = 25
	endurance = 45
	maturation = 15
	production = 1
	yield = 6
	potency = 15
	instability = 30
	growthstages = 3
	genes = list(/datum/plant_gene/trait/invasive, /datum/plant_gene/trait/plant_type/weed_hardy)
	growing_icon = 'modular_splurt/icons/obj/hydroponics/growing.dmi'
	icon_dead = "matrigrass-dead"
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)

/obj/item/grown/matrigrass
	seed = /obj/item/seeds/matrigrass
	name = "matrigrass stalks"
	desc = "A bundle of hard, tubular stalks, faintly glowing with occult energies."
	icon = 'modular_splurt/icons/obj/hydroponics/harvest.dmi'
	icon_state = "matrigrass"
	force = 5
	throwforce = 0
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 2
	throw_range = 3
	attack_verb = list("fruitlessly bludgeoned")
	grind_results = list(/datum/reagent/empoweredzinc = 0.1)

/obj/item/seeds/sanguintare
	name = "pack of sanguintare seeds"
	desc = "A pack of an ancient occult plant. Technically it's two sets of seeds, one for the weed itself, and another for the specially made plant it feeds on. Research might enjoy this..."
	icon = 'modular_splurt/icons/obj/hydroponics/seeds.dmi'
	icon_state = "seed-sanguintare"
	species = "sanguintare"
	plantname = "Sanguintare"
	icon_harvest = "sanguintare-harvest"
	product = /obj/item/grown/sanguintare
	lifespan = 65
	endurance = 15
	maturation = 15
	production = 1
	yield = 4
	potency = 15
	instability = 30
	growthstages = 3
	genes = list(/datum/plant_gene/trait/invasive, /datum/plant_gene/trait/plant_type/weed_hardy)
	growing_icon = 'modular_splurt/icons/obj/hydroponics/growing.dmi'
	icon_dead = "sanguintare-dead"
	reagents_add = list(/datum/reagent/consumable/nutriment/vitamin = 0.04, /datum/reagent/consumable/nutriment = 0.1)

/obj/item/grown/sanguintare
	seed = /obj/item/seeds/sanguintare
	name = "sanguintare vines"
	desc = "A loose strand of vines and bulbs once constricting its host plant. The vines still pulsate with the vile blood inside..."
	icon = 'modular_splurt/icons/obj/hydroponics/harvest.dmi'
	icon_state = "sanguintare"
	force = 5
	throwforce = 0
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 2
	throw_range = 3
	attack_verb = list("whipped")
	grind_results = list(/datum/reagent/exaltedhemogen = 0.1)

//Yes adding food here is strange, but Cooks need all the help they can get
/obj/item/reagent_containers/food/snacks/vantablackpudding
	name = "vantablack pudding"
	desc = "A modification of an old sausage recipe from a place not known for its culinary excellence. Apparently, occult magic was the only way to save it."
	icon = 'modular_splurt/icons/obj/food/food.dmi'
	icon_state = "vantablackpudding"
	trash = /obj/item/trash/plate
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 5, /datum/reagent/consumable/nutriment/vitamin = 6)
	list_reagents = list(/datum/reagent/consumable/nutriment = 4)
	bitesize = 2
	tastes = list("rich sausage" = 1, "darkness" = 1)
	foodtype = MEAT

/datum/crafting_recipe/food/vantablackpudding
	name = "Vantablack Pudding"
	always_availible = FALSE
	reqs = list(
		/datum/reagent/exaltedhemogen = 10,
		/obj/item/reagent_containers/food/snacks/sausage = 1,
		/datum/reagent/consumable/cooking_oil = 10,
		/obj/item/reagent_containers/food/snacks/grown/oat = 2
	)
	result = /obj/item/reagent_containers/food/snacks/vantablackpudding
	subcategory = CAT_MEAT

/obj/item/reagent_containers/food/snacks/soup/cultsoup //Not putting the whole name in here
	name = "bobo videira de sangue"
	desc = "A creamy soup made from fish, coconut, and a hint of forbidden knowledge. Served over rice!"
	icon = 'modular_splurt/icons/obj/food/soupsalad.dmi'
	icon_state = "cultsoup"
	trash = /obj/item/reagent_containers/glass/bowl
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/nutriment/vitamin = 6)
	tastes = list("savoury carp" = 2, "slightly sweet coconut" = 1, "bloody sourness" = 1)
	foodtype = MEAT | SUGAR | GRAIN

/datum/crafting_recipe/food/cultsoup
	name = "Bobo Videira de Sangue"
	always_availible = FALSE
	reqs = list(
		/obj/item/grown/sanguintare = 2,
		/datum/reagent/consumable/coconutmilk = 10,
		/datum/reagent/consumable/cream = 5,
		/obj/item/reagent_containers/food/snacks/salad/boiledrice = 1,
		/obj/item/reagent_containers/food/snacks/meat/steak/fish = 1
	)
	result = /obj/item/reagent_containers/food/snacks/soup/cultsoup
	subcategory = CAT_SOUP

/obj/item/reagent_containers/food/snacks/cultbolognese
	name = "arbiter's bolognese"
	desc = "Said to be a formal gift by the Clockwork Lieutenant Nzcrentr to those who had served them well in battle. This copycat recipe replicates Nzcrentr's favorite cooking method: 'Frying'."
	icon = 'modular_splurt/icons/obj/food/pizzaspaghetti.dmi'
	icon_state = "cultbolognese"
	trash = /obj/item/trash/plate
	bitesize = 4
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/consumable/tomatojuice = 10, /datum/reagent/consumable/nutriment/vitamin = 4, /datum/reagent/iron = 4)
	list_reagents = list(/datum/reagent/consumable/nutriment = 8, /datum/reagent/consumable/tomatojuice = 10, /datum/reagent/consumable/nutriment/vitamin = 8)
	tastes = list("gourmet pasta" = 2, "ozone" = 1)
	foodtype = GRAIN | VEGETABLES | MEAT

/datum/crafting_recipe/food/cultbolognese
	name = "Arbiter's Bolognese"
	always_availible = FALSE
	reqs = list(
		/obj/item/grown/matrigrass = 2,
		/obj/item/reagent_containers/food/snacks/grown/tomato = 1,
		/obj/item/reagent_containers/food/snacks/grown/onion = 1,
		/obj/item/reagent_containers/food/snacks/meat/cutlet = 2,
		/datum/reagent/consumable/milk = 5,
		/datum/reagent/teslium = 5
	)
	result = /obj/item/reagent_containers/food/snacks/cultbolognese
	subcategory = CAT_SPAGHETTI

/obj/item/reagent_containers/food/snacks/salad/candlesalad
	name = "cogwheel candle salad"
	desc = "A decadent and metallic dessert plate of vanilla cream, matrigrass, and pineapple."
	icon = 'modular_splurt/icons/obj/food/soupsalad.dmi'
	icon_state = "candlesalad"
	trash = /obj/item/trash/plate
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 4, /datum/reagent/consumable/sugar = 2, /datum/reagent/iron = 2, /datum/reagent/consumable/nutriment/vitamin = 4)
	tastes = list("iron" = 1, "sweet vanilla" = 1, "roasted pineapple" = 1)
	foodtype = JUNKFOOD | SUGAR | FRUIT

/datum/crafting_recipe/food/candlesalad
	name = "Cogwheel Candle Salad"
	always_availible = FALSE
	reqs = list(
		/obj/item/grown/matrigrass = 2,
		/datum/reagent/consumable/vanilla = 5,
		/datum/reagent/consumable/cream = 5,
		/obj/item/reagent_containers/food/snacks/pineappleslice = 1
	)
	result = /obj/item/reagent_containers/food/snacks/salad/candlesalad
	subcategory = CAT_SALAD

//Miscellaneous
//These tiles need a special variation due to differing atmos.

#define COLD_ATMOS					"o2=21.78;n2=82.36;TEMP=255" //snowturf for AGRcomplex as the environment is meant to be just cold, not uninhabitable.

/turf/open/floor/plating/snowed/smoothed/warmer
	initial_gas_mix = COLD_ATMOS
	initial_temperature = 255

/turf/open/chasm/icemoon/complex
	icon = 'icons/turf/floors/icechasms.dmi'
	initial_gas_mix = COLD_ATMOS
	planetary_atmos = TRUE
	baseturfs = /turf/open/chasm/icemoon/complex
	light_power = 0

/turf/open/floor/plating/asteroid/snow/complex
	initial_gas_mix = COLD_ATMOS
	baseturfs = /turf/open/floor/plating/asteroid/snow/complex
	light_range = 1
	light_power = 0.075
	light_color = "#89959a"

/turf/closed/mineral/random/snow/high_chance/complex
	initial_gas_mix = COLD_ATMOS
	initial_temperature = 255
	turf_type = /turf/open/floor/plating/asteroid/snow/complex
	baseturfs = /turf/open/floor/plating/asteroid/snow/complex

/turf/open/floor/plating/snowed/complex
	initial_gas_mix = COLD_ATMOS
	initial_temperature = 255

/turf/closed/mineral/plasma/ice/complex
	turf_type = /turf/open/floor/plating/asteroid/snow/complex
	baseturfs = /turf/open/floor/plating/asteroid/snow/complex
	initial_gas_mix = COLD_ATMOS

/turf/closed/mineral/snowmountain/cavern/complex
	baseturfs = /turf/open/floor/plating/asteroid/snow/complex
	turf_type = /turf/open/floor/plating/asteroid/snow/complex

/obj/machinery/porta_turret/syndicate/pod/russian
	faction = list("russian")

/obj/item/clothing/suit/armor/hos/platecarrier/makeshift
	name = "makeshift combat rig"
	desc = "A hand-sown combat rig made from armor vests and security belts. Trades some protection for utility."
	body_parts_covered = CHEST|GROIN|ARMS
	armor = list(MELEE = 20, BULLET = 20, LASER = 20, ENERGY = 10, BOMB = 25, BIO = 0, RAD = 0, FIRE = 50, ACID = 50, WOUND = 10)
	strip_delay = 60

/obj/item/card/id/away/mountain
	name = "A&GR S-08 General Access ID"
	desc = "A standard-issue ID card for most of the complex's staff."
	assignment = "A&GR Station-08 General Laborer"
	access = list(ACCESS_AWAY_GENERAL)

/obj/item/book/granter/crafting_recipe/cultcooking
	name = "Scrying upon Scarlet Gifts: Alternate uses for Sanguintare"
	desc = "A cookbook made by an occult gourmand, containing special recipes made using the Sanguintare plant."
	crafting_recipe_types = list(/datum/crafting_recipe/food/vantablackpudding, /datum/crafting_recipe/food/cultsoup)
	icon = 'modular_splurt/icons/obj/library.dmi'
	icon_state = "cooking_learing_cult"
	oneuse = FALSE
	remarks = list("This is gonna give me a headache...", "Do all cult sigils need to pulse red!?", "What the hell is a bobo...?", "'Blood Pudding'... was that always a cult recipe?")

/obj/item/book/granter/crafting_recipe/clockcooking
	name = "Greasing the Wheel: Alternate uses for Matrigrass"
	desc = "A cookbook made by a blessed gourmand, containing special recipes made using the Matrigrass plant."
	crafting_recipe_types = list(/datum/crafting_recipe/food/cultbolognese, /datum/crafting_recipe/food/candlesalad)
	icon = 'modular_splurt/icons/obj/library.dmi'
	icon_state = "cooking_learing_clock"
	oneuse = FALSE
	remarks = list("Half of this looks encrypted...", "Who thought metal would taste good?", "Is.. this just spaghetti?", "Candle- That's not a salad!")

/obj/machinery/camera/autoname/complex
	network = list("Complex")

/obj/machinery/computer/security/complex
	name = "facility monitoring console"
	desc = "A camera console used to monitor the various substations of the A.G.R Complex."
	network = list("Complex")
	circuit = null

/obj/effect/mob_spawn/human/clockremnant
	name = "frozen cryogenics pod"
	desc = "A humming cryo pod. You can barely recognise an occupant underneath the built up ice. The machine is attempting to wake them up."
	mob_name = "a clockwork cultist"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper"
	roundstart = FALSE
	death = FALSE
	random = TRUE
	mob_species = /datum/species/human
	short_desc = "You were a member of a nanotrasen mining facility, turned by the occult."
	flavour_text = "It's been months since the dust settled. \
	What remains of our members are scattered across the mountainside, disconnected from the Almighty Engine's embrace \
	by the heretics that tried to steal what was rightfully yours. This stagnation cannot last forever, \
	whether it be your hand or another, someone will try to reclaim what's left of this complex. As the cold sets in, the thought of sacrificing these relics \
	seems more and more appealing..."
	important_info = "Work alongside your brothers and sisters. Do not attack others without good reason, as there is no way to ressurect Ratvar in this state. You cannot enter the station without prior approval."
	uniform = /obj/item/clothing/under/rank/civilian/util
	shoes = /obj/item/clothing/shoes/laceup
	id = /obj/item/card/id/away/mountain
	l_pocket = /obj/item/clockwork/slab
	assignedrole = "Cultist Remnant"
	job_description = "Cultist Survivor"
	canloadappearance = TRUE
	//var/load_character = alert(H.client, "Load currently selected slot?", "Play as your character!", "Yes", "No") Was told 'canloadappearance' was removed in PR 1098, but until that's been merged I don't think it's an issue?
	//if(load_character == "Yes")
		//H.load_client_appearance(H.client)

/obj/effect/mob_spawn/human/clockremnant/Destroy()
	new/obj/structure/showcase/machinery/oldpod/used(drop_location())
	return ..()

/obj/effect/mob_spawn/human/clockremnant/special(mob/living/new_spawn)
	new_spawn.mind.add_antag_datum(/datum/antagonist/clockcult/neutered)
	var/obj/item/implant/exile/E = new
	E.implant(new_spawn)

/obj/effect/mob_spawn/human/bloodremnant
	name = "frozen cryogenics pod"
	desc = "A humming cryo pod. You can barely recognise an occupant underneath the built up ice. The machine is attempting to wake them up."
	mob_name = "a blood cultist"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper"
	roundstart = FALSE
	death = FALSE
	random = TRUE
	mob_species = /datum/species/human
	short_desc = "You were a member of a nanotrasen mining facility, turned by the occult."
	flavour_text = "It's been months since the dust settled. \
	What remains of our members are scattered across the mountainside, disconnected from the Unholy Geometer's embrace \
	by the heretics that tried to steal what was rightfully yours. This stagnation cannot last forever, \
	whether it be your hand or another, someone will try to reclaim what's left of this complex. As the cold sets in, the thought of sacrificing these relics \
	seems more and more appealing..."
	important_info = "Work alongside your brothers and sisters. Do not attack others without good reason, as the veil is too strong to summon Nar'sie. You cannot enter the station without prior approval."
	uniform = /obj/item/clothing/under/rank/civilian/util
	shoes = /obj/item/clothing/shoes/laceup
	id = /obj/item/card/id/away/mountain
	l_pocket = /obj/item/kitchen/knife/ritual
	assignedrole = "Cultist Remnant"
	job_description = "Cultist Survivor"
	canloadappearance = TRUE
	//var/load_character = alert(H.client, "Load currently selected slot?", "Play as your character!", "Yes", "No")
	//if(load_character == "Yes")
		//H.load_client_appearance(H.client)

/obj/effect/mob_spawn/human/bloodremnant/Destroy()
	new/obj/structure/showcase/machinery/oldpod/used(drop_location())
	return ..()

/obj/effect/mob_spawn/human/bloodremnant/special(mob/living/new_spawn)
	new_spawn.mind.add_antag_datum(/datum/antagonist/cult/neutered)
	var/obj/item/implant/exile/E = new
	E.implant(new_spawn)

/datum/reagent/empoweredzinc
	name = "Empowered Zinc"
	description = "A synthetic zinc compound mimicing the effects of Ratvarian magic."
	taste_description = "enlightenment"
	chemical_flags = REAGENT_ALL_PROCESS
	color = "#593b18"

/datum/reagent/empoweredzinc/on_mob_life(mob/living/carbon/M)
	if(is_servant_of_ratvar(M))
		M.drowsyness = max(M.drowsyness-3, 0)
		M.AdjustUnconscious(-30, FALSE)
		M.AdjustAllImmobility(-15, FALSE)
		M.AdjustKnockdown(-20, FALSE)
		M.adjustStaminaLoss(-10, FALSE)
		M.adjustToxLoss(-3, FALSE, TRUE)
		M.adjustOxyLoss(-1, FALSE)
		M.adjustBruteLoss(-2, FALSE)
		M.adjustFireLoss(-2, FALSE)
	else
		M.clockcultslurring = min(M.clockcultslurring + 3, 3)
		M.stuttering = min(M.stuttering + 3, 3)
		..()
	return TRUE

/datum/reagent/exaltedhemogen
	name = "Exalted Hemogen"
	description = "A highly-purified synthetic blood mixture. Sadly infused with Narsian magic, so it's practically useless at being blood."
	taste_description = "cursed knowledge"
	chemical_flags = REAGENT_ALL_PROCESS
	color = "#541d18"

/datum/reagent/exaltedhemogen/on_mob_life(mob/living/carbon/M)
	if(iscultist(M))
		M.drowsyness = max(M.drowsyness-3, 0)
		M.AdjustUnconscious(-30, FALSE)
		M.AdjustAllImmobility(-15, FALSE)
		M.AdjustKnockdown(-20, FALSE)
		M.adjustStaminaLoss(-10, FALSE)
		M.adjustToxLoss(-3, FALSE, TRUE)
		M.adjustOxyLoss(-1, FALSE)
		M.adjustBruteLoss(-2, FALSE)
		M.adjustFireLoss(-2, FALSE)
	else
		M.cultslurring = min(M.cultslurring + 3, 3)
		M.stuttering = min(M.stuttering + 3, 3)
		..()
	return TRUE
