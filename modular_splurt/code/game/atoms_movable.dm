/atom/movable/Initialize(mapload)
	. = ..()
	RegisterSignal(src, COMSIG_MOVABLE_BARK, PROC_REF(handle_special_bark)) //There must be a better way to do this

/atom/movable/Destroy()
	UnregisterSignal(src, COMSIG_MOVABLE_BARK)
	. = ..()

/atom/movable/proc/handle_special_bark(atom/movable/source, list/hearers, distance, volume, pitch)
	SIGNAL_HANDLER

	if(!CONFIG_GET(flag/enable_global_barks))
		return //No need to run if there are no barks to begin with

	var/list/soundpaths
	switch(GLOB.bark_list[source.vocal_bark_id])
		if(/datum/bark/gaster)
			soundpaths = list(
				'modular_splurt/sound/voice/barks/undertale/voice_gaster_1.ogg',
				'modular_splurt/sound/voice/barks/undertale/voice_gaster_2.ogg',
				'modular_splurt/sound/voice/barks/undertale/voice_gaster_3.ogg',
				'modular_splurt/sound/voice/barks/undertale/voice_gaster_4.ogg',
				'modular_splurt/sound/voice/barks/undertale/voice_gaster_5.ogg',
				'modular_splurt/sound/voice/barks/undertale/voice_gaster_6.ogg',
				'modular_splurt/sound/voice/barks/undertale/voice_gaster_7.ogg'
			)
		else
			return //No change needed

	source.vocal_bark = sound(pick(soundpaths))
