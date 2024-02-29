#define MOB_LAYER_SHIFT_INCREMENT	0.01
#define MOB_LAYER_SHIFT_MIN 		3.74 // SPLURT Adjusted for -26 (from 3.95)
//#define MOB_LAYER 				4   // This is a byond standard define
#define MOB_LAYER_SHIFT_MAX   		4.26 // SPLURT Adjusted for +26 (from 4.05)

/mob/living/verb/layershift_up()
	set name = "Shift Layer Upwards"
	set category = "IC"

	if(incapacitated())
		to_chat(src, span_warning("You can't do that right now!"))
		return

	if(layer >= MOB_LAYER_SHIFT_MAX)
		to_chat(src, span_warning("You cannot increase your layer priority any further."))
		return

	layer = clamp(layer, MOB_LAYER_SHIFT_MIN, MOB_LAYER_SHIFT_MAX)
	layer += MOB_LAYER_SHIFT_INCREMENT
	var/layer_priority = FLOOR((layer - MOB_LAYER) * 100, 1) // Just for text feedback
	to_chat(src, span_notice("Your layer priority is now [layer_priority]."))

/mob/living/verb/layershift_down()
	set name = "Shift Layer Downwards"
	set category = "IC"

	if(incapacitated())
		to_chat(src, span_warning("You can't do that right now!"))
		return

	if(layer <= MOB_LAYER_SHIFT_MIN)
		to_chat(src, span_warning("You cannot decrease your layer priority any further."))
		return

	layer = clamp(layer, MOB_LAYER_SHIFT_MIN, MOB_LAYER_SHIFT_MAX)
	layer -= MOB_LAYER_SHIFT_INCREMENT
	var/layer_priority = FLOOR((layer - MOB_LAYER) * 100, 1)// Just for text feedback
	to_chat(src, span_notice("Your layer priority is now [layer_priority]."))

/mob/living/verb/layershift_reset() //SPLURT ADDITION
	set name = "Reset Layer Priority"
	set category = "IC"

	if(incapacitated())
		to_chat(src, span_warning("You can't do that right now!"))
		return

	if(lying)
		layer = LYING_MOB_LAYER //so mob lying always appears behind standing mobs
	else
		layer = initial(layer)
	var/layer_priority = FLOOR((layer - MOB_LAYER) * 100, 1) // Just for text feedback
	to_chat(src, span_notice("Your layer priority is now [layer_priority]."))
