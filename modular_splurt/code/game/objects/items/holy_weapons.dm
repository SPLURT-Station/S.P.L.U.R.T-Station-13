/obj/item/nullrod/holy_mace
	name = "Holy Mace"
	desc = "Fit for a cleric!"
	icon = 'modular_splurt/icons/obj/items_and_weapons.dmi'
	icon_state = "holy_mace"
	item_state = "holy_mace"
	lefthand_file = 'modular_splurt/icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/weapons/melee_righthand.dmi'
	slot_flags = ITEM_SLOT_BELT
	w_class = WEIGHT_CLASS_BULKY
	attack_verb = list("smacked", "struck", "cracked", "beaten")

/obj/item/nullrod/papal_staff
	name = "papal staff"
	desc = "A staff used by traditional bishops and popes."
	icon = 'modular_splurt/icons/obj/items_and_weapons.dmi'
	icon_state = "papal_staff"
	item_state = "papal_staff"
	lefthand_file = 'modular_splurt/icons/mob/inhands/weapons/melee_lefthand.dmi'
	righthand_file = 'modular_splurt/icons/mob/inhands/weapons/melee_righthand.dmi'
	w_class = WEIGHT_CLASS_BULKY
	attack_verb = list("smacked", "struck", "cracked", "beaten", "purified")

/obj/item/clothing/head/mitre
	name = "papal mitre"
	desc = "A traditional headdress, worn by bishops and popes in traditional Christianity"
	icon = 'modular_splurt/icons/obj/clothing/hats.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mob/clothing/32x48_head.dmi'
	icon_state = "mitre"
	flags_inv = HIDEHAIR | HIDEFACIALHAIR

/obj/item/clothing/suit/chaplain/papal
	name = "papal robe"
	desc = "A short cape over a cassock, worn by bishops and popes in traditional Christianity"
	icon = 'modular_splurt/icons/obj/clothing/suits.dmi'
	mob_overlay_icon = 'modular_splurt/icons/mobs/suits.dmi'
	icon_state = "papalrobe"
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	mutantrace_variation = STYLE_DIGITIGRADE|STYLE_NO_ANTHRO_ICON

/obj/item/storage/box/holy/papal
	name = "Papal Kit"

/obj/item/storage/box/holy/papal/PopulateContents()
	new /obj/item/clothing/head/mitre(src)
	new /obj/item/clothing/suit/chaplain/papal(src)
