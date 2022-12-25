/obj/effect/mob_spawn/human/ash_walker
	var/gender_bias

/obj/effect/mob_spawn/human/ash_walker/equip(mob/living/carbon/human/H)
	if(!isnull(gender_bias) && prob(90))
		H.gender = gender_bias
	return ..()

/obj/effect/mob_spawn/human/ash_walker/western
	job_description = "Восточные пеплоходы."
	short_desc = "Вы магмовый скиталец. Ваше племя поклоняется материнскому Дендрилу."
	flavour_text = "Ваш прошлый дом и материнский Дендрил были разрушены чужаками с Холодных Звёзд и те из ваших сородичей, кто остались \
	в живых, покинули южные моря на поиски нового дома. Эти земли хороши для вашего нового дома, ибо обилие Дендрилов дарует этим землям \
	изобилие пищи и материалов для выживания, а также восстановления утерянных знаний и взращивание нового потомства. Однако вы здесь не \
	одни, туземные сородичи обеспокоены вашим присутствием, а особенно знаниями, которыми вы обладаете. Может есть возможность с ними \
	договорится? При этом всём чужаки с Небесных Крепостей добрались и до этих земель. \n\n\
	Будьте на чеку, не дайте трудам потомков, отдавших свои жизни ради вас, пасть Пеплом за зря. Цикл должен продолжаться!"
	mob_species = /datum/species/lizard/ashwalker/western
	gender_bias = FEMALE

/obj/effect/mob_spawn/human/ash_walker/eastern
	job_description = "Западные пеплоходы."
	short_desc = "Вы магмовый скиталец. Ваше племя поклоняется материнскому Дендрилу."
	flavour_text = "Ваше племя поклоняется матери Некрополю, как вашей Спасительнице и Наставнице. Священные стены дворца Некрополя \
	дали вашему Дендрилу и вашему Роду защиту. Испокон веков, ваша священная обитель дарует вам Дар Перерождения, из цикла в цикл за \
	жертвоприношения матери Некрополю, ради продолжения Великой Охоты. Однако не так давно на ваши земли вторглось Чужеродное Племя. \
	Несмотря на ваше кровное родство в поклонении Великой Матери, не дайте иноземцам осквернить ваше святилище их изуверскими традициями. \
	Сверх этого, с небесных крепостей из Холодного Камня, на ваши земли спустились скитальцы с далёких Звёзд. Их рудокопы накладывают \
	священные пальцы на Некрополь, свои грязные лапы. Не дайте им украсть дары великой матери и лишить вас пищи. \n\n\
	Охота должна быть здравой, цикл должен продолжаться, грядущие поколения должны жить!"
	mob_species = /datum/species/lizard/ashwalker/eastern
	gender_bias = MALE

//Portable dangerous-environment sleepers: Spawns in exposed to ash storms shelter.
//Characters in this role could have been conscious for a long time, surviving on the planet. They may also know Draconic language by contacting with ashwalkers.
/obj/effect/mob_spawn/human/wandering_hermit
	name = "portable dangerous-environment sleeper"
	desc = "The glass is slightly cracked, but there is still air inside. You can see somebody inside. They seems to be sleeping deeply."
	job_description = "Wandering Hermit"
	icon = 'icons/obj/lavaland/spawners.dmi'
	icon_state = "cryostasis_sleeper"
	roundstart = FALSE
	death = FALSE
	random = TRUE
	mob_species = /datum/species/human
	mob_name = "a wandering hermit"
	short_desc = "You are a hermit abandoned by fate."
	flavour_text = "You've survived weeks in this hellish place. Maybe you want to live here with ash tribe or return to civilisation. \
	Only you know how you got to this planetoid, whether this place in which you woke up was one of your shelters, or you just stumbled upon it."
	canloadappearance = TRUE

/obj/effect/mob_spawn/human/wandering_hermit/Destroy()
	var/obj/structure/fluff/empty_sleeper/S = new(drop_location())
	S.setDir(dir)
	return ..()

/obj/effect/mob_spawn/human/wandering_hermit/special(mob/living/carbon/human/new_spawn)
	ADD_TRAIT(new_spawn,TRAIT_EXEMPT_HEALTH_EVENTS,GHOSTROLE_TRAIT)
	new_spawn.language_holder.understood_languages += /datum/language/draconic
	new_spawn.language_holder.spoken_languages += /datum/language/draconic

//Splurt-Specific Space Hotel Staff
/obj/effect/mob_spawn/human/hotel_staff/splurt //not free antag u little shits
	name = "staff sleeper"
	desc = "A sleeper designed for long-term stasis between guest visits."
	mob_name = "hotel staff member"
	job_description = "Hotel Staff"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper_s"
	objectives = "Cater to visiting guests with your fellow staff. Don't abandon the hotel - you can advertise and link up with potential guests, but always remember who signs your cheques! The customer is always right!"
	short_desc = "You are a staff member of a top-of-the-line space hotel!"
	flavour_text = "You are a staff member of a top-of-the-line space hotel! Cater to guests and make sure the manager doesn't fire you."
	important_info = "DON'T abandon the hotel"
	assignedrole = "Hotel Staff"
	death = FALSE
	roundstart = FALSE
	random = TRUE
	canloadappearance = TRUE
	id_job = "Hotel Staff"
	id = /obj/item/card/id/away/hotel/splurt
	uniform = /obj/item/clothing/under/suit/red
	shoes = /obj/item/clothing/shoes/laceup
	head = /obj/item/clothing/head/hotel
	r_pocket = /obj/item/pda
	back = /obj/item/storage/backpack/satchel
	ears = /obj/item/radio/headset

/obj/effect/mob_spawn/human/hotel_staff/splurt/security
	name = "hotel security sleeper"
	mob_name = "hotel security member"
	job_description = "Hotel Security"
	short_desc = "You are a peacekeeper."
	flavour_text = "You have been assigned to this hotel to protect the interests of the company while keeping the peace between \
		guests and the staff."
	important_info = "Do NOT abandon the hotel, as that is grounds for contract termination."
	objectives = "Do not abandon your assigned hotel. Try and keep the peace between staff and guests, non-lethal force heavily advised if possible."
	id_job = "Hotel Security"
	uniform = /obj/item/clothing/under/rank/security/officer/blueshirt
	shoes = /obj/item/clothing/shoes/jackboots
	suit = /obj/item/clothing/suit/armor/vest/blueshirt
	head = /obj/item/clothing/head/helmet/blueshirt
	back = /obj/item/storage/backpack/satchel/sec
	belt = /obj/item/storage/belt/security/full
	id = /obj/item/card/id/away/hotel/splurt/security

/obj/effect/mob_spawn/human/hotel_staff/splurt/manager
	name = "hotel manager sleeper"
	mob_name = "hotel manager"
	job_description = "Hotel Manager"
	short_desc = "You are the manager of a space hotel"
	flavour_text = "You manage one site of a successful chain of space hotels. Your parent company has recently been bought out by Nanotrasen and tasked with servicing some of their stations; you have recieved a selection of fancy tech as a result! Protect the interests of your parent company, ensure your staff are performing to standard and make sure to keep your guests happy!"
	important_info = "Staff, including you, are NOT to abandon the hotel."
	objectives = "Don't abandon your assigned hotel. Cater to visiting guests. Maintain good corporate relations and remember: The customer is always right!"
	id_job = "Hotel Manager"
	uniform = /obj/item/clothing/under/suit/black
	suit = /obj/item/clothing/suit/toggle/lawyer/black
	head = /obj/item/clothing/head/beret/black
	id = /obj/item/card/id/away/hotel/manager

