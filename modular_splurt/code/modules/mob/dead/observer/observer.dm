/mob/dead/observer/view_manifest()
	if(!client)
		return
	if(world.time < client.crew_manifest_delay)
		return
	client.crew_manifest_delay = world.time + (1 SECONDS)

	if(!GLOB.crew_manifest_tgui)
		GLOB.crew_manifest_tgui = new /datum/crew_manifest(src)

	GLOB.crew_manifest_tgui.ui_interact(src)

/mob/dead/observer/Initialize(mapload, mob/body)
	. = ..()

	// Check for body
	if(!body)
		return

	// Check if body is 'human'
	if(!ishuman(body))
		return

	// Define body
	var/mob/living/carbon/human/body_human = body

	// Check for quirk One Shot
	if(HAS_TRAIT(body_human, TRAIT_PERMADEATH))
		// Update description
		desc += span_boldnotice("\nThis one is cursed to roam the afterlife forever!")
