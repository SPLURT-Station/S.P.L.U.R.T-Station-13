/obj/machinery/vending/medical/Initialize()
    var/list/extra_contraband = list(
        /obj/item/storage/pill_bottle/lsdpsych = 3,
        /obj/item/storage/pill_bottle/happinesspsych = 3,
        /obj/item/storage/pill_bottle/paxpsych = 3,
        /obj/item/reagent_containers/hypospray/medipen/bimbo = 3
    )
    LAZYADD(contraband, extra_contraband)
    . = ..()
