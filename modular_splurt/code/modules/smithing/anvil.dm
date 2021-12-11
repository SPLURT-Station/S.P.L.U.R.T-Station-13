//Manly anvil stuff
/obj/structure/anvil/obtainable/dwarfvil
	name = "manly anvil"
	desc = "someone reinforced an ordinary anvil with a wooden barrel and stained it with booze. You see a skull embedded in it. Its eye sockets are encrusted with legion cores."
	icon = 'modular_splurt/icons/obj/smith.dmi'
	icon_state = "dwarfvil"
	anvilquality = 1
	itemqualitymax = 8

/obj/structure/anvil/obtainable/dwarfvil/attackby(obj/item/I, mob/user)
	if(isdwarf(user))
		return ..()
	else
		to_chat(user, "<span class='warning'>Ugh! This anvil smells of mushroom beer, and the design is weird. It is inconvenient to use it!</span>")
