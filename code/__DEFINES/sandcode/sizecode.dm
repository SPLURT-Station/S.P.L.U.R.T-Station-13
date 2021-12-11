//I am not a coder. Please fucking tear apart my code, and insult me for how awful I am at coding. Please and thank you. -Dahlular
//alright bet -BoxBoy
#define RESIZE_MACRO 6
#define RESIZE_HUGE 4
#define RESIZE_BIG 2
#define RESIZE_NORMAL 1
#define RESIZE_SMALL 0.75
#define RESIZE_TINY 0.50
#define RESIZE_MICRO 0.25

//averages
#define RESIZE_A_MACROHUGE (RESIZE_MACRO + RESIZE_HUGE) / 2
#define RESIZE_A_HUGEBIG (RESIZE_HUGE + RESIZE_BIG) / 2
#define RESIZE_A_BIGNORMAL (RESIZE_BIG + RESIZE_NORMAL) / 2
#define RESIZE_A_NORMALSMALL (RESIZE_NORMAL + RESIZE_SMALL) / 2
#define RESIZE_A_SMALLTINY (RESIZE_SMALL + RESIZE_TINY) / 2
#define RESIZE_A_TINYMICRO (RESIZE_TINY + RESIZE_MICRO) / 2

/proc/get_size(mob/living/target)
	if(!target || !istype(target))
		CRASH("get_size(NULL) was called")
	var/datum/dna/has_dna = target.has_dna()
	if(ishuman(target) && has_dna)
		return has_dna.features["body_size"]
	else
		return target.size_multiplier
