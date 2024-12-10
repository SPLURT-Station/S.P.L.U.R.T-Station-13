/datum/disease/sns
    name = "Sudden Nyanification Syndrome (SNS)"
    max_stages = 4
    spread_text = "Airborne, Skin & Fluid Contact"
    spread_flags = DISEASE_SPREAD_AIRBORNE | DISEASE_SPREAD_CONTACT_SKIN | DISEASE_SPREAD_CONTACT_FLUIDS | DISEASE_SPREAD_BLOOD
    cure_text = "WARNING: DATABASE HACK DETECTED! She dances above and guides the waves, he sweetens your tongue and brightens your day. Only their marriage will lift this curse! :3" //It's moonsugar, Meow - Lucky >:3
    cures = list(/datum/reagent/moonsugar) //If I was any more sadistic I woulda made the cure felinid mutation toxin >:3 - Lucky
    cure_chance = 16
    agent = "Genomophage UWU-13"
    viable_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey, /mob/living/carbon/alien)
    infectivity = 70
    permeability_mod = 0.8
    stage_prob = 3
    desc = "If left untreated the subject will develop feline attributes and a strong urge to consume milk. Highly infectious, Ensure an SAD is constructed to treat victims."
    severity = DISEASE_SEVERITY_MEDIUM

/datum/disease/sns/stage_act()
    ..()
    switch(stage)
        if(1)
            if(prob(12))
                to_chat(affected_mob, "<span class='warning'>" + pick(
                    "You feel extra silly today.",
                    "You can't stop thinking about milk.",
                    "You'd like to take a long nap.",
                    "Mmmmm, fish.") + "</span>")

        if(2)
            if(prob(10))
                to_chat(affected_mob, "<span class='warning'>" + pick(
                    "Your ears feel oddly sensitive.",
                    "You have an overwhelming urge to chase a laser pointer..",
                    "You'd like to take a long nap in a sunny window.",
                    "Hmm, maybe you deserve more.") + "</span>")

        if(3)
            if(prob(16))
                affected_mob.Stun(9)
                playsound(get_turf(affected_mob), 'sound/effects/splat.ogg', 20, TRUE)
                affected_mob.emote("cough")
                new /obj/item/toy/plush/hairball(affected_mob.loc)
                to_chat(affected_mob, "<span class='warning'>" + pick(
                    "You hack up a hairball! Gross.",
                    "You cough up a hairball! Icky.",
                    "You spit up a hairball! Eugh.") + "</span>")

        if(4)
            if(prob(25))
                affected_mob.emote("mrrp")
                to_chat(affected_mob, "<span class='warning'>" + pick(
                    "You feel purrrfect.",
                    "You've become a god.",
                    "You're the most important person on this station.",
                    "You should annoy CC.") + "</span>")

                purrbation_apply(affected_mob)
				var/mob/living/carbon/human/L = affected_mob
				var/obj/item/organ/tongue/tongue = L.getorgan(/obj/item/organ/tongue)
				tongue.Remove(L)
				var/obj/item/organ/tongue/fluffy/newtongue = new
				newtongue.Insert(L)
				cure(TRUE)

    return

/obj/item/reagent_containers/glass/bottle/sns
    name = "SNS culture bottle"
    desc = "A small bottle. Contains genomophage UWU-13 culture in synthblood medium."
    spawned_disease = /datum/disease/sns
