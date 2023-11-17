/client/proc/clear_export()
	var/savefile/S = new()
	S["deleted"] << 1
	Export(S)
