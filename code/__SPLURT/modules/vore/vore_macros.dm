// Vore System Macros

// Vore states
#define VORE_STATE_DEFAULT 0
// Prey is being swallowed
#define VORE_STATE_SWALLOWING 1
// Prey is inside belly
#define VORE_STATE_DIGESTING 2
// Prey is released
#define VORE_STATE_RELEASED 3

// Digestion types
#define VORE_DIGEST_NONE 0
#define VORE_DIGEST_PARTIAL 1
#define VORE_DIGEST_FULL 2

// Vore preferences
#define VORE_PREF_HUNGRY 1
#define VORE_PREF_GROW 2
#define VORE_PREF_BRUTE 3
#define VORE_PREF_DEATH 4

// Body parts that can be vored
#define VORE_PART_HEAD 1
#define VORE_PART_CHEST 2
#define VORE_PART_GROIN 3
#define VORE_PART_LEG 4
#define VORE_PART_ARM 5
#define VORE_PART_BUTT 6

// Genital preferences
#define GENITAL_PREF_NONE 0
#define GENITAL_PREF_MOUTH 1
#define GENITAL_PREF_ANUS 2
#define GENITAL_PREF_BREASTS 3
#define GENITAL_PREF_NIPPLES 4
#define GENITAL_PREF_PENIS 5
#define GENITAL_PREF_VAGINA 6

// Vore interactions
#define VORE_INTERACTION_NONE 0
#define VORE_INTERACTION_KISS 1
#define VORE_INTERACTION_LICK 2
#define VORE_INTERACTION_SUCK 3
#define VORE_INTERACTION_BITE 4

/mob/proc/can_vore()
	return TRUE