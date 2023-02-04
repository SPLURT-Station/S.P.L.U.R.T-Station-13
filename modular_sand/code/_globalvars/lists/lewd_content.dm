/*
 * List of clothes with possible peeking under,
 * It is prefilled with clothes that cannot be caught
 * by the automatic system (has no skirt in path)
*/
GLOBAL_LIST_INIT(skirt_peekable, list(
	/obj/item/clothing/under/rank/civilian/janitor/maid = TRUE,
	/obj/item/clothing/under/costume/loincloth = TRUE,
	/obj/item/clothing/under/costume/loincloth/cloth = TRUE,
	/obj/item/clothing/under/costume/loincloth/cloth/sensor = TRUE,
	))

/*
 * List of clothes you can't say a pair of.
 * Ex:
 * A pair of jockstrap?
*/
GLOBAL_LIST_INIT(pairless_panties, list(
	/obj/item/clothing/underwear/briefs/jockstrap = TRUE,
	/obj/item/clothing/underwear/briefs/panties/thong = TRUE,
	/obj/item/clothing/underwear/briefs/panties/thong/babydoll = TRUE,
	/obj/item/clothing/underwear/briefs/mankini = TRUE
))
