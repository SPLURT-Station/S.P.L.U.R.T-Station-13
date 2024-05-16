//For small players and such
/datum/element/smalltalk
	element_flags = ELEMENT_DETACH

/datum/element/smalltalk/Attach(datum/target, force = FALSE)
	. = ..()
	if(!(isliving(target) || (force && istype(target, /atom/movable))))
		return ELEMENT_INCOMPATIBLE

	RegisterSignal(target, COMSIG_MOB_SAY, PROC_REF(handle_speech))

/datum/element/smalltalk/Detach(datum/source, force)
	. = ..()
	UnregisterSignal(source, COMSIG_MOB_SAY)

/datum/element/smalltalk/proc/handle_speech(datum/source, list/speech_args)
	SIGNAL_HANDLER
	
	speech_args[SPEECH_SPANS] |= SPAN_SMALL
