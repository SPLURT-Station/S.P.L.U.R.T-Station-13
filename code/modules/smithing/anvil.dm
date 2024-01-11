#define WORKPIECE_PRESENT 1
#define WORKPIECE_INPROGRESS 2
#define WORKPIECE_FINISHED 3
#define WORKPIECE_SLAG 5

#define RECIPE_SMALLPICK "dbp" //draw bend punch
#define RECIPE_LARGEPICK "ddbp" //draw draw bend punch
#define RECIPE_SHOVEL "dfup" //draw fold upset punch
#define RECIPE_HAMMER "sfp" //shrink fold punch


#define RECIPE_SMALLKNIFE "sdd" //shrink draw draw
#define RECIPE_SHORTSWORD "dff" //draw fold fold
#define RECIPE_WAKI "dfsf" //draw  fold shrink fold
#define RECIPE_SCIMITAR "dfb" //draw fold bend
#define RECIPE_SABRE "ddsf" //draw draw shrink fold
#define RECIPE_STUNDIL "dudsd" //draw upset draw shrink draw
#define RECIPE_RAPIER "sdfd" //shrink draw  fold draw
#define RECIPE_BROADSWORD "dfuf" //draw fold upset fold
#define RECIPE_ZWEIHANDER "udfsf" //upset draw fold shrink fold
#define RECIPE_KATANA "fffff" //fold fold fold fold fold


#define RECIPE_SCYTHE "bdf" //bend draw fold
#define RECIPE_COGHEAD "bsf" //bend shrink fold.


#define RECIPE_JAVELIN "dbf" //draw bend fold
#define RECIPE_HALBERD "duffp" //draw upset fold fold punch
#define RECIPE_GLAIVE "usfp" //upset shrink fold punch
#define RECIPE_PIKE "ddbf" //draw draw bend fold

/obj/structure/anvil
	name = "anvil"
	desc = "Base class of anvil. This shouldn't exist, but is useable."
	icon = 'icons/obj/smith.dmi'
	icon_state = "anvil"
	density = TRUE
	anchored = TRUE
	var/busy = FALSE //If someone is already interacting with this anvil
	var/workpiece_state = FALSE
	var/datum/material/workpiece_material
	var/anvilquality = 0
	var/currentquality = 0 //lolman? what the fuck do these vars do?
	var/currentsteps = 0 //even i don't know
	var/outrightfailchance = 1 //todo: document this shit
	var/stepsdone = ""
	var/rng = FALSE
	var/debug = FALSE //vv this if you want an artifact
	var/artifactrolled = FALSE
	var/itemqualitymax = 20
	var/list/smithrecipes = list(RECIPE_HAMMER = /obj/item/smithing/hammerhead,
	RECIPE_SCYTHE = /obj/item/smithing/scytheblade,
	RECIPE_SHOVEL = /obj/item/smithing/shovelhead,
	RECIPE_COGHEAD = /obj/item/smithing/cogheadclubhead,
	RECIPE_JAVELIN = /obj/item/smithing/javelinhead,
	RECIPE_LARGEPICK = /obj/item/smithing/pickaxehead,
	RECIPE_SMALLPICK = /obj/item/smithing/prospectingpickhead,
	RECIPE_SHORTSWORD = /obj/item/smithing/shortswordblade,
	RECIPE_SCIMITAR = /obj/item/smithing/scimitarblade,
	RECIPE_WAKI = /obj/item/smithing/wakiblade,
	RECIPE_RAPIER = /obj/item/smithing/rapierblade,
	RECIPE_SABRE = /obj/item/smithing/sabreblade,
	RECIPE_SMALLKNIFE = /obj/item/smithing/knifeblade,
	RECIPE_BROADSWORD = /obj/item/smithing/broadblade,
	RECIPE_ZWEIHANDER = /obj/item/smithing/zweiblade,
	RECIPE_KATANA = /obj/item/smithing/katanablade,
	RECIPE_HALBERD = /obj/item/smithing/halberdhead,
	RECIPE_GLAIVE = /obj/item/smithing/glaivehead,
	RECIPE_PIKE = /obj/item/smithing/pikehead,
	RECIPE_STUNDIL = /obj/item/smithing/stundild)

/obj/structure/anvil/Initialize(mapload)
	. = ..()
	currentquality = anvilquality

/obj/structure/anvil/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/ingot))
		var/obj/item/ingot/notsword = I
		if(workpiece_state)
			to_chat(user, "There's already a workpiece! Finish it or take it off.")
			return FALSE
		if(notsword.workability == "shapeable")
			workpiece_state = WORKPIECE_PRESENT
			workpiece_material = notsword.custom_materials
			to_chat(user, "You place the [notsword] on the [src].")
			currentquality = anvilquality
			var/skillmod = 0
			if(user.mind.skill_holder)
				skillmod = user.mind.get_skill_level(/datum/skill/level/dwarfy/blacksmithing)/2
			currentquality += skillmod
			qdel(notsword)
		else
			to_chat(user, "The ingot isn't workable yet!")
			return FALSE
		return
	else if(istype(I, /obj/item/melee/smith/hammer))
		var/obj/item/melee/smith/hammer/hammertime = I
		if(!(workpiece_state == WORKPIECE_PRESENT || workpiece_state == WORKPIECE_INPROGRESS))
			to_chat(user, "You can't work an empty anvil!")
			return FALSE
		if(busy)
			to_chat(user, "This anvil is already being worked!")
			return FALSE
		do_shaping(user, hammertime.qualitymod)
		return
	return ..()

/obj/structure/anvil/wrench_act(mob/living/user, obj/item/I)
	..()
	default_unfasten_wrench(user, I, 5)
	return TRUE


/obj/structure/anvil/proc/do_shaping(mob/user, var/qualitychange)
	busy = TRUE
	currentquality += qualitychange
	var/list/shapingsteps = list("weak hit", "strong hit", "heavy hit", "fold", "draw", "shrink", "bend", "punch", "upset") //weak/strong/heavy hit affect strength. All the other steps shape.
	workpiece_state = WORKPIECE_INPROGRESS
	var/stepdone = input(user, "How would you like to work the metal?") in shapingsteps
	var/steptime = 50
	if(user.mind.skill_holder)
		var/skillmod = user.mind.get_skill_level(/datum/skill/level/dwarfy/blacksmithing)/10 + 1
		steptime = 50 / skillmod
	playsound(src, 'sound/effects/clang2.ogg',40, 2)
	if(!do_after(user, steptime, target = src))
		busy = FALSE
		return FALSE
	switch(stepdone)
		if("weak hit")
			currentsteps += 1
			outrightfailchance += 5
			currentquality += 1
		if("strong hit")
			currentsteps += 2
			outrightfailchance += 9.5
			currentquality += 2
		if("heavy hit")
			currentsteps += 3
			outrightfailchance += 12.5
			currentquality += 3
		if("fold")
			stepsdone += "f"
			currentsteps += 1
			currentquality -= 1
		if("draw")
			stepsdone += "d"
			currentsteps += 1
			currentquality -= 1
		if("shrink")
			stepsdone += "s"
			currentsteps += 1
			currentquality -= 1
		if("bend")
			stepsdone += "b"
			currentsteps += 1
			currentquality -= 1
		if("punch")
			stepsdone += "p"
			currentsteps += 1
			currentquality -= 1
		if("upset")
			stepsdone += "u"
			currentsteps += 1
			currentquality -= 1
	user.visible_message("<span class='notice'>[user] works the metal on the anvil with their hammer with a loud clang!</span>", \
						"<span class='notice'>You [stepdone] the metal with a loud clang!</span>")
	playsound(src, 'sound/effects/clang2.ogg',40, 2)
	addtimer(CALLBACK(GLOBAL_PROC, .proc/playsound, src, 'sound/effects/clang2.ogg', 40, 2), 15)
	if(length(stepsdone) >= 3)
		tryfinish(user)
	busy = FALSE

/obj/structure/anvil/proc/tryfinish(mob/user)
	var/artifactchance = 0
	var/combinedqualitymax = user.mind.get_skill_level(/datum/skill/level/dwarfy/blacksmithing)/2 + itemqualitymax //Makes sure that better smiths can make better items, even with a worse anvil. Encourages actually levelling up, instead of meta-rushing antag gear
	if(!artifactrolled)
		artifactchance = (1+(user.mind.get_skill_level(/datum/skill/level/dwarfy/blacksmithing)/4))/1500 //Reduced from 2500 temporarily. Should help that percentage get above 1% on the RAND()
		//artifactrolled = TRUE --Disabled because this is a shitty mechanic.
	var/artifact = max(prob(artifactchance), debug)
	var/finalfailchance = outrightfailchance
	if(user.mind.skill_holder)
		var/skillmod = user.mind.get_skill_level(/datum/skill/level/dwarfy/blacksmithing)/10 + 1
		finalfailchance = max(0, finalfailchance / skillmod) //lv 2 gives 20% less to fail, 3 30%, etc
	if((currentsteps > 10 || (rng && prob(finalfailchance))) && !artifact)
		to_chat(user, "<span class='warning'>You overwork the metal, causing it to turn into useless slag!</span>")
		var/turf/T = get_turf(user)
		workpiece_state = FALSE
		new /obj/item/stack/ore/slag(T)
		currentquality = anvilquality
		stepsdone = ""
		currentsteps = 0
		outrightfailchance = 1
		artifactrolled = FALSE
		if(user.mind.skill_holder)
			user.mind.auto_gain_experience(/datum/skill/level/dwarfy/blacksmithing, 200, 500000, silent = FALSE)
	for(var/i in smithrecipes)
		if(i == stepsdone)
			var/turf/T = get_turf(user)
			var/obj/item/smithing/create = smithrecipes[stepsdone]
			var/obj/item/smithing/finisheditem = new create(T)
			to_chat(user, "You finish your [finisheditem]!")
			if(artifact)
				to_chat(user, "It is an artifact, a creation whose legacy shall live on forevermore.") //todo: SSblackbox
				currentquality = max(currentquality, 2)
				finisheditem.quality = currentquality * 3 //This isn't actually that good due to the nonlinear scale of your armor pen.
				finisheditem.artifact = TRUE
			else
				if(combinedqualitymax >= 0)
					finisheditem.quality = min(currentquality, combinedqualitymax) //Changed so better smiths can make better gear regardless of their anvil. WILL HAVE TO BE TWEAKED, POSSIBLY.
				else
					finisheditem.quality = min(currentquality, itemqualitymax)
			switch(finisheditem.quality)
				if(-1000 to -8)
					finisheditem.desc =  "It looks to be the most awfully made object you've ever seen."
				if(-8)
					finisheditem.desc =  "It looks to be the second most awfully made object you've ever seen."
				if(-8 to 0)
					finisheditem.desc =  "It looks to be barely passable as... whatever it's trying to pass for."
				if(0)
					finisheditem.desc =  "It looks to be totally average."
				if(0 to 5)
					finisheditem.desc =  "It looks to be better than average."
				if(6 to 8)
					finisheditem.desc =  "It looks to be a masterpiece."
				if(9 to INFINITY)
					finisheditem.desc =  "It is positively radiant, a legendary piece."
			var/stepexperience = currentsteps + finisheditem.quality
			var/finalexperience = (150 *(stepexperience + finisheditem.quality))/5 //A total of 16x the amount of EXP at MAX, with a minimum gain of 150, Keep in mind that this is of course only possible with a max-tier anvil and an already insanely high level. Just makes earlier levels faster.
			if(user.mind.skill_holder)
				if(currentquality <= 1)
					user.mind.auto_gain_experience(/datum/skill/level/dwarfy/blacksmithing, 400, 500000, silent = FALSE) //Incentivises not spamming Slag
				else
					user.mind.auto_gain_experience(/datum/skill/level/dwarfy/blacksmithing, finalexperience, 500000, silent = FALSE) //Made more forgiving for lower levels and terrible anvils.


			workpiece_state = FALSE
			finisheditem.set_custom_materials(workpiece_material)
			currentquality = anvilquality
			stepsdone = ""
			currentsteps = 0
			outrightfailchance = 1
			artifactrolled = FALSE
			break

/obj/structure/anvil/debugsuper
	name = "super ultra epic anvil of debugging."
	desc = "WOW. A DEBUG <del>ITEM</DEL> STRUCTURE. EPIC."
	icon_state = "anvil"
	anvilquality = 10
	itemqualitymax = 9001
	outrightfailchance = 0

/obj/structure/anvil/obtainable
	name = "anvil"
	desc = "Base class of anvil. This shouldn't exist, but is useable."
	anvilquality = 0
	outrightfailchance = 5
	rng = TRUE

/obj/structure/anvil/obtainable/table
	name = "table anvil"
	desc = "A slightly reinforced table. Good luck."
	icon_state = "tablevil"
	anvilquality = -2
	itemqualitymax = 0


/obj/structure/anvil/obtainable/table/do_shaping(mob/user, var/qualitychange)
	if(prob(5))
		to_chat(user, "The [src] breaks under the strain!")
		take_damage(max_integrity)
		return FALSE
	else
		..()

/obj/structure/anvil/obtainable/bronze
	name = "slab of bronze"
	desc = "A big block of bronze. Useable as an anvil."
	custom_materials = list(/datum/material/bronze=8000)
	icon_state = "ratvaranvil"
	anvilquality = -0.5
	itemqualitymax = 2

/obj/structure/anvil/obtainable/sandstone
	name = "sandstone brick anvil"
	desc = "A big block of sandstone. Useable as an anvil."
	custom_materials = list(/datum/material/sandstone=8000)
	icon_state = "sandvil"
	anvilquality = -1
	itemqualitymax = 2

/obj/structure/anvil/obtainable/basalt
	name = "basalt brick anvil"
	desc = "A big block of basalt. Useable as an anvil, better than sandstone. Igneous!"
	icon_state = "sandvilnoir"
	anvilquality = -0.5
	itemqualitymax = 4

/obj/structure/anvil/obtainable/basic
	name = "anvil"
	desc = "An anvil. It's got wheels bolted to the bottom."
	anvilquality = 0
	itemqualitymax = 6

/obj/structure/anvil/obtainable/bone
	name = "bone anvil"
	desc = "An anvil. It's made of goliath bones and hide and held together by watcher sinews."
	icon_state = "bonevil"
	anvilquality = 0
	itemqualitymax = 6

/obj/structure/anvil/obtainable/ratvar
	name = "brass anvil"
	desc = "A big block of what appears to be brass. Useable as an anvil, if whatever's holding the brass together lets you."
	custom_materials = list(/datum/material/bronze=8000)
	icon_state = "ratvaranvil"
	anvilquality = 1
	itemqualitymax = 8

/obj/structure/anvil/obtainable/ratvar/attackby(obj/item/I, mob/user)
	if(is_servant_of_ratvar(user))
		return ..()
	else
		to_chat(user, "<span class='neovgre'>KNPXWN, QNJCQNW!</span>") //rot13 then rot22 if anyone wants to decode

/obj/structure/anvil/obtainable/narsie
	name = "runic anvil"
	desc = "An anvil made of a strange, runic metal."
	custom_materials = list(/datum/material/runedmetal=8000)
	icon = 'icons/obj/smith.dmi'
	icon_state = "evil"
	anvilquality = 1
	itemqualitymax = 8

/obj/structure/anvil/obtainable/narsie/attackby(obj/item/I, mob/user)
	if(iscultist(user))
		return ..()
	else
		to_chat(user, "<span class='narsiesmall'>That is not yours to use!</span>")

#undef WORKPIECE_PRESENT
#undef WORKPIECE_INPROGRESS
#undef WORKPIECE_FINISHED
#undef WORKPIECE_SLAG
