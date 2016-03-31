// This code is all super inefficient but I can't get it to work correctly otherwise.

//------ Base code ------//

/obj/item/clothing/head/accessory // Stolen from kitty ears code. Yet still doesn't work.
	name = "accessory"
	desc = "A class object for special snowflek ears. This isn't supposed to appear in game."
	icon_state = "kitty" // placeholder
	w_class = 1
	var/hasinner = 1
	var/icon/mob
	var/icon/mob2
	//siemens_coefficient = 1.5 // Because fuck furries apparently? ... I'm not touching this until I know why it's here. -Ace // I will, because no, not fuck furries. -Aro

	update_icon(var/mob/living/carbon/human/user) // Code needed in human/inventory.dm:291 and human/update_icons.dm:691 for this to work.
		if(!istype(user)) return
		mob = new/icon("icon" = 'icons/mob/head.dmi', "icon_state" = "[icon_state]")
		mob2 = new/icon("icon" = 'icons/mob/head.dmi', "icon_state" = "[icon_state]")
		mob.Blend(rgb(user.r_hair, user.g_hair, user.b_hair), ICON_ADD)
		mob2.Blend(rgb(user.r_hair, user.g_hair, user.b_hair), ICON_ADD)

		if(hasinner)
			var/icon/earbit = new/icon("icon" = 'icons/mob/head.dmi', "icon_state" = "[icon_state]inner")
			var/icon/earbit2 = new/icon("icon" = 'icons/mob/head.dmi', "icon_state" = "[icon_state]inner2")
			mob.Blend(earbit, ICON_OVERLAY)
			mob2.Blend(earbit2, ICON_OVERLAY)

/*
==================================================
==   STOP   STOP   STOP   STOP   STOP   STOP
==
==         DO NOT ADD MORE THINGS HERE!!!
==        ADD THEM TO sprite_accessories.dm
==
==   STOP   STOP   STOP   STOP   STOP   STOP
==================================================
*/

//------ Actual items ------//

/obj/item/clothing/head/accessory/kitty
	name = "kitty ears"
	desc = "A pair of kitty ears. Meow!"
	icon_state = "kitty"

/obj/item/clothing/head/accessory/bunny
	name = "bunny ears"
	desc = "Wearing these makes you looks useless, and only good for your sex appeal."
	icon_state = "bunny"
	hasinner = 0

/obj/item/clothing/head/accessory/wolf
	name = "wolf ears"
	desc = "Damn it, Moon Moon!"
	icon_state = "wolf"
	hasinner = 0

/obj/item/clothing/head/accessory/fox
	name = "fox ears"
	desc = "In Space, the fox says nothing."
	icon_state = "wolf"

/obj/item/clothing/head/accessory/bear
	name = "bear ears"
	desc = "Only you can prevent plasma fires."
	icon_state = "bear"
	hasinner = 0

/obj/item/clothing/head/accessory/mouse
	name = "Mouse Ears"
	desc = "The early bird gets the worm, but the second mouse gets the cheese."
	icon_state = "mouse"

/obj/item/clothing/head/accessory/squirrel
	name = "squirrel ears"
	desc = "A pair of squirrel ears. NUTS!"
	icon_state = "squirrel"
	hasinner = 0

// So ears are lightweight.
/obj/item/clothing/head/fluff
	icon = 'icons/obj/custom_items.dmi'
	w_class = 1

/obj/item/clothing/head/fluff/succubus
	name = "succubus accessories"
	desc = "A head accessory that looks like something a seductive demoness from your fantasies might wear."
	icon_state = "succubus"

/obj/item/clothing/head/fluff/succubus/dark
	name = "succubus accessories (Dark)"
	desc = "A head accessory that looks like something a seductive demoness from your fantasies might wear."
	icon_state = "succubus-dark"

/obj/item/clothing/head/fluff/succubus/crimson
	name = "succubus accessories (Crimson)"
	desc = "A head accessory that looks like something a seductive demoness from your fantasies might wear."
	icon_state = "succubus-crimson"

/obj/item/clothing/head/fluff/succubus/red
	name = "red bat wings"
	desc = "Flappy flappy."
	icon_state = "redbat"

/obj/item/clothing/head/fluff/succubus/black
	name = "black bat wings"
	desc = "Flappy flappy."
	icon_state = "blackbat"

/obj/item/clothing/head/fluff/succubus/black/kerena // Somekindofpony, Kerena Wile
	name = "black bat wings and wolf ears"
	desc = "Fuzzy and flappy!"
	icon_state = "kerena"

/obj/item/clothing/head/fluff/wisewolf
	name = "Wisewolf ears"
	desc = "In this station... when the ripened ears of wheat sway in Hydrotrays... it is said that a wolf runs through them."
	icon_state = "holo"

/obj/item/clothing/head/fluff/runac // rebcom1807, Runac
	name = "twintailed fennec ears"
	desc = "These ears seem to have a slight buzz of energy about them, but something seems.. Wrong. Like they really shouldn't be laying around."
	icon_state = "runac"

/obj/item/clothing/head/fluff/bee
	name = "bee accessories"
	desc = "What's this? A station devoid of <i>BEES?!</i> A large influx of <b>BEES</b> ought to put a stop to that!"
	icon_state = "bee"

/obj/item/clothing/head/fluff/squirrel/redsquirrel
	name = "red squirrel ears"
	desc = "A pair of RED squirrel ears. NUTS!"
	icon_state = "redsquirrel"

/obj/item/clothing/head/fluff/threetail
	name = "Rosey's three tails"
	desc = "Three fox tails. They shouldn't be detached from Rosey..."
	icon_state = "threetail"

/obj/item/clothing/head/fluff/molenar // Molenar, Uya Kohakuren
	name = "Quintail"
	desc = "Set of ears and five fluffy tails in silver and gold fur."
	icon_state = "Molenar"

/obj/item/clothing/head/fluff/molenar2 // Molenar, Giliana Gamish
	name = "Deathclaw Accessories"
	desc = "Everything you need to look like a radioactive chameleon, Camouflage not included."
	icon_state = "molenar2"

/obj/machinery/vending/fluffstuff // Moved this here from vending.dm so it's easier to keep track of.
	name = "Demi Accessories"
	desc = "You feel like this machine shouldn't actually exist. (( This machine is OOC. It dispenses items for you to wear as actual body parts until we update the code to intergrate it with character setup. ))"
	icon_state = "MagiVend"
	product_slogans = "Mary Sue approved! Get your neko ears here!;Be a furry without being hated like one!;If slogans offend you, you're a Mary Sue!"
	products = list(/obj/item/clothing/head/collectable/kitty = 10,
					/obj/item/clothing/head/accessory/kitty = 10,
					/obj/item/clothing/head/accessory/mouse = 10,
					/obj/item/clothing/head/accessory/bunny = 10,
					/obj/item/clothing/head/fluff/succubus = 10,
					/obj/item/clothing/head/fluff/succubus/crimson = 10,
					/obj/item/clothing/head/fluff/succubus/dark = 10,
					/obj/item/clothing/head/fluff/succubus/black = 10,
					/obj/item/clothing/head/fluff/succubus/red = 10,
					/obj/item/clothing/head/fluff/wisewolf = 10,
					/obj/item/clothing/head/accessory/wolf = 10,
					/obj/item/clothing/head/accessory/fox = 10,
					/obj/item/clothing/head/accessory/bear = 10,
					/obj/item/clothing/head/fluff/bee = 10,
					/obj/item/clothing/head/accessory/squirrel = 10,
					/obj/item/clothing/head/fluff/squirrel/redsquirrel = 10)
/*	contraband = list(/obj/item/clothing/head/fluff/caso = 3,
					/obj/item/clothing/head/fluff/runac = 3,
					/obj/item/clothing/head/fluff/succubus/black/kerena = 3)*/
//	premium = list(/obj/item/clothing/head/fluff/xeno = 3)
