/datum/reagent/fermi/enthrall/proc/SetDataFromBloodData(list/blood_data)
	if(!blood_data)
		return
	if (blood_data["gender"] == "female")
		src.data["creatorGender"] = "Mistress"
		src.creatorGender = "Mistress"
	else
		src.data["creatorGender"] = "Master"
		src.creatorGender = "Master"
	src.data["creatorName"] = blood_data["real_name"]
	src.creatorName = blood_data["real_name"]
	src.data["creatorID"] = blood_data["ckey"]
	src.creatorID = blood_data["ckey"]
	src.creator = blood_data["donor"]
