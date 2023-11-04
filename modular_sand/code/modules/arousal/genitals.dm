/obj/item/organ/genital
	/// Controls whenever a genital is always accessible
	var/always_accessible = FALSE

/// Toggles whether such genital can always be accessed
/obj/item/organ/genital/proc/toggle_accessibility(accessibility)
	always_accessible = isnull(accessibility) ? !always_accessible : accessibility
