/*
 * # INIT_ORDER_INTERACTIONS
 * Used by the Interactions subsystems, used to set it's own position in the queue.
 * This puts this last on priority, very far from other subsystems,
 * if citadel ever manages to get this far, push it ever lower.
*/
#define INIT_ORDER_INTERACTIONS		-150
