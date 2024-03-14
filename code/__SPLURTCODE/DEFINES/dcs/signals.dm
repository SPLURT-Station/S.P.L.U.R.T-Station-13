#define COMSIG_MOB_EMOTE "mob_emote" // from /mob/emote(): (proc args list)
	// used to access COMSIG_MOB_SAY argslist
	#define EMOTE_ACT 1
	#define EMOTE_MTYPE 2
	#define EMOTE_MESSAGE 3
	#define EMOTE_INTENTIONAL 4

/*
 * # COMSIG_MOB_UPDATE_GENITALS
 * From modular_splurt\code\modules\arousal\genitals.dm
 * Used by signals for determining when genitals have been updated
*/
#define COMSIG_MOB_UPDATE_GENITALS "mob_genitals_updated"

///called on [/obj/item] AFTER unequip from base of [mob/proc/doUnEquip]: (force, atom/newloc, no_move, invdrop, silent)
#define COMSIG_ITEM_POST_UNEQUIP "item_post_unequip"
