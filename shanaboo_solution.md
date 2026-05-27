```diff
--- a/modular_splurt/code/modules/vore/eating/belly_obj.dm
+++ b/modular_splurt/code/modules/vore/eating/belly_obj.dm
@@ -1,6 +1,8 @@
 // This is the vore belly object, which handles the actual vore mechanics.
 // It's attached to a mob (the predator) and contains prey mobs.
 
+#define BELLY_FULLNESS_MAX 6
+
 /obj/belly
 	name = "belly"
 	desc = "A belly. You shouldn't see this."
@@ -24,6 +26,12 @@
 	var/digest_mode = DM_HOLD
 	var/list/digest_modes = list()
 	
+	// Liquid belly system
+	var/liquid_fullness = 0				// Current liquid fullness (0-100)
+	var/liquid_max = 100				// Maximum liquid capacity
+	var/liquid_type = "water"			// Type of liquid inside
+	var/list/liquid_types = list("water", "acid", "slime", "digestive", "femcum", "malecum")
+	
 	// Visual settings
 	var/belly_fullscreen = "belly1"		// Which fullscreen overlay to use
 	var/belly_fullscreen_color = "#ffffff"
@@ -32,6 +40,10 @@
 	var/escape_stun = 0					// Stun time after escape
 	var/can_taste = FALSE				// Can the pred taste the prey?
 	
+	// Genital linking
+	var/linked_genital					// Type of genital linked to this belly
+	var/linked_genital_id				// ID of the linked genital
+	
 	// Sounds
 	var/sound_digest = 'sound/vore/digest.ogg'
 	var/sound_death = 'sound/vore/death.ogg'
@@ -48,6 +60,9 @@
 	var/list/immutable_bellys = list()	// Bellys that cannot be deleted
 	var/list/escapable_bellys = list()	// Bellys that can be escaped from
 	
+	// Ripple animation
+	var/ripple_count = 0				// Number of active ripples
+	
 /obj/belly/Initialize(mapload)
 	. = ..()
 	// Set up default digest modes
@@ -56,6 +71,8 @@
 	// Set up owner if we have one
 	if(istype(owner, /mob/living/carbon/human))
 		owner = owner
+	// Initialize liquid system
+	START_PROCESSING(SSobj, src)
 
 /obj/belly/Destroy()
 	// Clean up contents
@@ -63,6 +80,8 @@
 		var/mob/living/L = prey
 		L.forceMove(get_turf(owner))
 		L.exit_belly(src)
+	STOP_PROCESSING(SSobj, src)
+	clear_ripples()
 	return ..()
 
 /obj/belly/proc/transfer_mob(mob/living/prey, obj/belly/target)
@@ -73,6 +92,9 @@
 	if(!istype(prey) || prey.buckled)
 		return FALSE
 	
+	// Update linked genital size if applicable
+	update_linked_genital(TRUE)
+	
 	// Move prey into belly
 	prey.forceMove(src)
 	prey.belly = src
@@ -82,6 +104,9 @@
 	// Update belly appearance
 	update_fullness()
 	
+	// Add ripple effect
+	add_ripple()
+	
 	// Send messages
 	if(prey.client)
 		to_chat(prey, "<span class='warning'>You slide into [owner]'s [name]!</span>")
@@ -97,6 +122,9 @@
 	if(!istype(prey) || !(prey in contents))
 		return FALSE
 	
+	// Update linked genital size if applicable
+	update_linked_genital(FALSE)
+	
 	// Move prey out
 	prey.forceMove(get_turf(owner))
 	prey.belly = null
@@ -105,6 +133,9 @@
 	// Update belly appearance
 	update_fullness()
 	
+	// Remove a ripple
+	remove_ripple()
+	
 	return TRUE
 
 /obj/belly/proc/digest_mob(mob/living/prey)
@@ -116,6 +147,9 @@
 	// Handle digestion based on mode
 	switch(digest_mode)
 		if(DM_DIGEST)
+			// Add to liquid fullness
+			adjust_liquid(5)
+			
 			// Deal damage
 			prey.adjustBruteLoss(digest_brute)
 			prey.adjustFireLoss(digest_burn)
@@ -126,6 +160,9 @@
 				// Prey is fully digested
 				full_digest(prey)
 		if(DM_ABSORB)
+			// Add to liquid fullness
+			adjust_liquid(3)
+			
 			// Absorb prey into predator
 			prey.adjustBruteLoss(5)
 			if(prey.health <= 0)
@@ -140,6 +177,9 @@
 	// Remove from contents
 	contents -= prey
 	
+	// Update linked genital (permanent size increase)
+	update_linked_genital(TRUE, TRUE)
+	
 	// Handle items
 	for(var/obj/item/I in prey)
 		prey.dropItemToGround(I)
@@ -157,6 +197,9 @@
 	// Remove from contents
 	contents -= prey
 	
+	// Update linked genital (permanent size increase)
+	update_linked_genital(TRUE, TRUE)
+	
 	// Handle items
 	for(var/obj/item/I in prey)
 		prey.dropItemToGround(I)
@@ -172,6 +215,9 @@
 	// Remove from contents
 	contents -= prey
 	
+	// Update linked genital (permanent size increase)
+	update_linked_genital(TRUE, TRUE)
+	
 	// Handle items
 	for(var/obj/item/I in prey)
 		prey.dropItemToGround(I)
@@ -181,6 +227,9 @@
 	// Remove from contents
 	contents -= prey
 	
+	// Update linked genital (permanent size increase)
+	update_linked_genital(TRUE, TRUE)
+	
 	// Handle items
 	for(var/obj/item/I in prey)
 		prey.dropItemToGround(I)
@@ -196,6 +245,9 @@
 	// Remove from contents
 	contents -= prey
 	
+	// Update linked genital (permanent size increase)
+	update_linked_genital(TRUE, TRUE)
+	
 	// Handle items
 	for(var/obj/item/I in prey)
 		prey.dropItemToGround(I)
@@ -205,6 +257,9 @@
 	// Remove from contents
 	contents -= prey
