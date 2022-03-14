//WOODEN COMPONENTS. honestly i need to move some shit around to allow for easier material swapping, but that's for a later date.

/obj/item/processed/wood
	name = "Wooden Processed Item"
	desc = "You shouldn't see this!"
	icon = 'modular_splurt/icons/obj/cargo/sweatshop/wooden.dmi'
	sharpness = FALSE
	attack_verb = list("slapped", "thunked")
	var/sawobj = /obj/item/genital_equipment/condom
	var/glueobj = /obj/item/dildo
	var/sandobj = /obj/item/carpentry/sandpaper
	var/boreobj = /obj/item/carpentry/borer

/obj/item/processed/wood/plank
	name = "processable wooden plank"
	desc = "A somewhat sturdy refined plank. This can be used in various applications."
	icon_state = "plank"
	force = 3
	w_class = WEIGHT_CLASS_HUGE
	sawobj = /obj/item/processed/wood/platform

/obj/item/processed/wood/platform
	name = "wood platform"
	desc = "A somewhat sturdy cropping of a plank. This one is an alright foundation for chairs and stools."
	icon_state = "platform"
	force = 3
	w_class = WEIGHT_CLASS_NORMAL
	sawobj = /obj/item/processed/wood/block
	boreobj = /obj/item/processed/wood/seat

/obj/item/processed/wood/block
	name = "wood block"
	desc = "A chopped platform into a wooden block. This one can be used for sanded into pegs, or used as a base on it's own."
	icon_state = "block"
	force = 2
	w_class = WEIGHT_CLASS_SMALL
	sandobj = /obj/item/processed/wood/peg
	glueobj = /obj/item/processed/wood/glueblock

/obj/item/processed/wood/peg
	name = "wood peg"
	desc = "A wooden peg. Useful for fitting into holes."
	icon_state = "peg"
	force = 1
	w_class = WEIGHT_CLASS_TINY
	attack_verb = list("donked", "thunked")
	glueobj = /obj/item/processed/wood/gluepeg

//glue

/obj/item/processed/wood/gluepeg
	name = "glued wood peg"
	desc = "A wooden peg. With a bunch of glue used for securing."
	icon_state = "gluepeg"
	force = 1
	w_class = WEIGHT_CLASS_TINY
	attack_verb = list("pegged", "thunked")

/obj/item/processed/wood/glueblock
	name = "glued wood block"
	desc = "A wooden block. With a bunch of glue used for securing."
	icon_state = "glueblock"
	force = 2
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("blocked", "thunked")

//seat
/obj/item/processed/wood/seat
	name = "wood seat"
	desc = "A baseline for crafting seats. Not exactly that comfortable to sit on..."
	icon_state = "seat"
	force = 2
	w_class = WEIGHT_CLASS_SMALL
	attack_verb = list("slapped", "thunked")


//Stool steps. There's probably an easier way to do this, but I cannot be assed rn, I'll refine after PR
/obj/item/processed/wood/stool1
	name = "stool base"
	desc = "A haphazardly made base for a stool. It's not even secured with any nails."
	icon_state = "stool1"
	force = 4
	w_class = WEIGHT_CLASS_BULKY

/obj/item/processed/wood/stool2
	name = "nailed stool base"
	desc = "Nails are in position"
	icon_state = "stool2"
	force = 4
	w_class = WEIGHT_CLASS_BULKY

/obj/item/processed/wood/stool3
	name = "hammered stool base"
	desc = "A vaguely stool-shaped... Thing. Could use some sandpaper."
	icon_state = "stool3"
	force = 4
	w_class = WEIGHT_CLASS_BULKY

/obj/item/processed/wood/stool4
	name = "bland stool"
	desc = "A rather bland stool."
	icon_state = "stool4"
	force = 4
	w_class = WEIGHT_CLASS_BULKY

//The finished product
/obj/item/processed/wood/stool
	name = "custom stool"
	desc = "An intricite, custom stool."
	icon_state = "stool"
	force = 10
	w_class = WEIGHT_CLASS_BULKY

//Let's make it soft and more expensive

/obj/item/processed/wood/stoolcloth
	name = "cloth-cushioned stool"
	desc = "A custom stool with a cloth cushion."
	icon_state = "stoolcloth"
	force = 10
	w_class = WEIGHT_CLASS_BULKY

/obj/item/processed/wood/stoolsilk
	name = "cloth-cushioned stool"
	desc = "A custom stool with a silk cushion."
	icon_state = "stoolsilk"
	force = 11 //lol
	w_class = WEIGHT_CLASS_BULKY
