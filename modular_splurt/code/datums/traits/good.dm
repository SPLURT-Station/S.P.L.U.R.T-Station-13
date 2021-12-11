/datum/quirk/tough
	name = "Tough"
	desc = "Your body is abnormally enduring and can take 10% more damage."
	value = 4
	medical_record_text = "Patient has an abnormally high capacity for injury."
	gain_text = "<span class='notice'>You feel very sturdy.</span>"
	lose_text = "<span class='notice'>You feel less sturdy.</span>"

/datum/quirk/tough/add()
	quirk_holder.maxHealth *= 1.1

/datum/quirk/tough/remove()
	if(!quirk_holder)
		return
	quirk_holder.maxHealth *= 0.909 //close enough
