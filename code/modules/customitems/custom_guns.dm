#define SINGLE_CASING 	1	//The gun only accepts ammo_casings. ammo_magazines should never have this as their mag_type.
#define SPEEDLOADER 	2	//Transfers casings from the mag to the gun when used.
#define MAGAZINE 		4	//The magazine item itself goes inside the gun

// The M41A from the Xeno station mission is not yet here. Need to include ASAP.
// Caseless ammo is now handled by ammunition.dm

/obj/item/weapon/gun/projectile/automatic/battlerifle
	name = "\improper BR55 Service Rifle"
	desc = "You had your chance to be afraid before you joined my beloved Corps! But, to guide you back to the true path, I brought this motivational device! Uses unique 9.5x40mm ammo."
	icon_state = "battlerifle"
	item_state = "battlerifle"
	w_class = 4
	recoil = 2 // The battlerifle was known for its nasty recoil.
	max_shells = 36
	caliber = "9.5x40mm"
	origin_tech = "combat=2;materials=2;"
	ammo_type = /obj/item/ammo_casing/a95mm
	magazine_type = /obj/item/ammo_magazine/battlerifle
	fire_sound = 'sound/weapons/battlerifle.ogg'
	load_method = MAGAZINE
	slot_flags = SLOT_BACK

/obj/item/weapon/gun/projectile/shotgun/pump/unsc
	name = "\improper M45E Tactical Shotgun"
	desc = "All you greenhorns who wanted to see Xenomorphs up close... this is your lucky day."
	icon_state = "haloshotgun"
	item_state = "haloshotgun"
	ammo_type = /obj/item/ammo_casing/shotgun
	max_shells = 12

// jertheace : Jeremiah 'Ace' Acacius
/obj/item/weapon/gun/projectile/shotgun/pump/unsc/fluff/ace
	name = "Ace's M45D Tactical Shotgun" // D-model holds half as many shells as the normal version so as not to be OP as shit. Better than shotgun, worse than combat shotgun.
	desc = "Owned by the respected (or feared?) veteran Captain of VORE Station. Inscribed on the barrel are the words \"Speak softly, and carry a big stick.\" It has a folding stock so it can fit into bags."
	w_class = 3 // Because collapsable stock so it fits in backpacks.
	ammo_type = /obj/item/ammo_casing/shotgun/stunshell
	max_shells = 6

// roaper : Callum Leamas
/obj/item/weapon/gun/projectile/revolver/detective/fluff/callum_leamas
	name = "Deckard .38"
	desc = "A custom built revolver, based off the semi-popular Detective Special model."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "leamas-empty"
	ammo_type = /obj/item/ammo_magazine/c38/rubber

/obj/item/weapon/gun/projectile/revolver/detective/fluff/callum_leamas/update_icon()
	..()
	if(loaded.len)
		icon_state = "leamas-loaded"
	else
		icon_state = "leamas-empty"

/obj/item/weapon/gun/projectile/revolver/detective/fluff/callum_leamas/load_ammo(var/obj/item/A, mob/user)
	if(istype(A, /obj/item/ammo_magazine))
		flick("leamas-reloading",src)
	..()

// wankersonofjerkin : Ryan Winz
/obj/item/weapon/gun/projectile/revolver/fluff/ryan_winz_revolver
	name = "Ryan's 'Devilgun'"
	desc = "You notice the serial number on the revolver is 666. The word 'Sin' is engraved on the blood-red rosewood grip. Uses .357 ammo."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "ryan_winz"

/obj/item/weapon/gun/projectile/revolver/fluff/ryan_winz_revolver/redemption
	name = "Ryan's 'Redeemer'"
	desc = "You notice the serial number on the revolver is 667. The word 'Redemption' is engraved on dark rosewood grip. Uses .357 ammo."

// sasoperative : Joseph Skinner
/obj/item/weapon/gun/projectile/revolver/shotgun/fluff/sasoperative
	name = "\"The Jury\""
	desc = "A customized variant of the \"The Judge\" revolver sold by Cybersun Industries, built specifically for Joseph Skinner."
	icon_state = "jury"
	accuracy = 0 // Because I know you're not an idiot who needs to be nerfed. -Ace
	ammo_type = /obj/item/ammo_casing/shotgun/beanbag


/obj/item/weapon/gun/projectile/automatic/stg
	name = "\improper StG-650"
	desc = "Experience the terror of the Siegfried line, redone for the 26th century! With a fire rate of over 1,400 rounds per minute, the Kaiser would be proud. Uses unique 7.92x33mm Kurz ammo."
	icon_state = "stg60"
	w_class = 4
	max_shells = 30
	caliber = "kurz"
	origin_tech = "combat=5;materials=2;syndicate=8"
	ammo_type = /obj/item/ammo_casing/stg
	magazine_type = /obj/item/ammo_magazine/stg
	load_method = MAGAZINE

/obj/item/weapon/gun/projectile/luger
	name = "\improper Luger P08"
	desc = "This gun looks like it belongs in a museum. Still popular among Space Nazis and collectors. Uses 9mm ammo."
	icon_state = "p08"
	w_class = 3
	max_shells = 8
	caliber = "9mm"
	origin_tech = "combat=2;materials=2;syndicate=2"
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/mc9mm
	allowed_magazines = list(/obj/item/ammo_magazine/mc9mm)

/obj/item/weapon/gun/projectile/automatic/m14/fluff/gallian
	name = "\improper Gallian 4 Rifle"
	desc = "The ever reliable Gallian 4 Rifle. Produced by the National Armory on the Planet of Gaia located in Gallia, the Gallian 4 Rifle offers high accuracy and is widely used in the United Federation's Military. Uses 7.62mm ammo."

/obj/item/weapon/gun/projectile/shotgun/pump/rifle/zmkar //For fluff
	name = "\improper ZM Kar 1"
	desc = "A reproduction of an old ZM Kar 1 Rifle from the Autocratic East Europan Imperial Alliance of Gaia. Popular among imperials and collectors within the Federation and its allies. Uses 7.62mm ammo."


/obj/item/weapon/gun/projectile/shotgun/pump/rifle/wicked
	name = "'Wicked Butterfly' ZM Kar S1"
	desc = "A customized bolt-action sniper rifle that was carried by some of the most revered snipers in the Federation. The stock has a small butterfly engraved on it. Uses 7.62mm ammo."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "wickedbutterfly"
	recoil = 2 //extra kickback
	accuracy = -1
	scoped_accuracy = 2
	load_method = SINGLE_CASING

/obj/item/weapon/gun/projectile/shotgun/pump/rifle/wicked/verb/scope()
	set category = "Object"
	set name = "Use Scope"
	set popup_menu = 1

	toggle_scope(2.0)

/*
/obj/item/weapon/gun/projectile/automatic/crestrose
	name = "Crescent Rose"
	desc = "Can you match my resolve? If so then you will succeed. I believe that the human spirit is indomitable. Keep Moving Forward."
	origin_tech = "materials=7"
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "crestrose"
	item_state = null // So it inherits the icon_state.
	w_class = 4
	fire_sound = 'sound/weapons/rifleshot.ogg'
	force = 40
	throwforce = 10
	max_shells = 10
	magazine_type = /obj/item/ammo_magazine/m14
	allowed_magazines = list(magazine_type = /obj/item/ammo_magazine/m14)
	load_method = MAGAZINE
	caliber = "a762"

	attack_verb = list("attacked", "slashed", "stabbed", "sliced", "torn", "ripped", "diced", "cut")
	var/modifystate = "crestrose"
	var/mode = 0 //0 = unfolded, 1 = folded

/obj/item/weapon/gun/projectile/automatic/crestrose/attack_self(mob/living/user as mob)
	switch(mode)
		if(0)
			mode = 1
			user.visible_message("\red [src.name] folds up into a cool looking rifle.")
			force = 5
			throwforce = 2
			modifystate = crestrose_fold
		if(1)
			mode = 0 // I feel like this mode should prevent it from shooting. Otherwise, what's the point? -Spades ||Probably need assistance in that. Original design of Crescent Rose is to shoot no matter what form it was in. Perhaps lowering accuracy will provide a con buffer here. -- Joan
			user.visible_message("\red [src.name] changes into a very intimidating looking weapon.")
			force = 40
			throwforce = 10
			modifystate = crestrose
	update_icon()
	update_held_icon()
*/

// Energy Weapons
// -------------- KIN-H21 -------------
// QUAD LASER. THERE IS NO AVOIDING IT. JUMPING, IS USELESS.
/obj/item/weapon/gun/energy/gun/fluff/aro
	name = "KIN-H21"
	desc = "The Kitsuhana Heavy Industries standard Imperial Navy energy sidearm, commonly called the KIN21. This one appears to have been modified to have additional features at the cost of battery life."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "kinh21off"
	item_state = null // So it inherits the icon_state.

	modifystate = "kinh21stun"
	stunstate = "kinh21stun"
	killstate = "kinh21kill"
	var/shrinkstate = "kinh21shrink"
	var/growstate = "kinh21grow"

	charge_cost = INFINITY //Starts safed
	var/turnedoff = 1
	var/mode_name = "<font color=\"#0000FF\">STUN</font>" //It's the default


// Four way switch for stun, kill, shrink, grow
/obj/item/weapon/gun/energy/gun/fluff/aro/attack_self(mob/living/user as mob)
	switch(mode)
		if(0)
			mode = 1
			fire_sound = 'sound/weapons/blaster_pistol.ogg'
			mode_name = "<font color=\"#FF0000\">KILL</font>"
			//user << "<span class='warning'>[src.name] is now set to kill.</span>"
			projectile_type = /obj/item/projectile/beam
			modifystate = killstate
		if(1)
			mode = 2
			fire_sound = 'sound/weapons/wave.ogg'
			mode_name = "<font color=\"#FF00FF\">SHRINK</font>"
			//user << "<span class='warning'>[src.name] is now set to shrink.</span>"
			projectile_type = /obj/item/projectile/beam/shrinklaser
			modifystate = shrinkstate
		if(2)
			mode = 3
			fire_sound = 'sound/weapons/pulse3.ogg'
			mode_name = "<font color=\"#BBBB00\">GROW</font>"
			//user << "<span class='warning'>[src.name] is now set to grow.</span>"
			projectile_type = /obj/item/projectile/beam/growlaser
			modifystate = growstate
		if(3)
			mode = 0 // This is the default mode, as defined in energy.dm for the egun
			fire_sound = 'sound/weapons/Taser.ogg'
			mode_name = "<font color=\"#0000FF\">STUN</font>"
			//user << "<span class='warning'>[src.name] is now set to stun.</span>"
			projectile_type = /obj/item/projectile/beam/stun
			modifystate = stunstate
	update_icon()
	update_held_icon()
	user << "<span class='warning'>[src.name] is now set to [src.mode_name]"

/obj/item/weapon/gun/energy/gun/fluff/aro/verb/togglepower()
	set name = "Toggle KIN-H21"
	set desc = "Turn the KIN-H21 power on or off."
	set category = "Object"
	switch(turnedoff)
		if(0)
			turnedoff = 1
			charge_cost = INFINITY
			icon_state = "kinh21off"
			usr << "<span class='warning'>[src.name] powered off.</span>"
		if(1)
			turnedoff = 0
			charge_cost = 125
			update_icon()
			update_held_icon()
			usr << "<span class='warning'>[src.name] powered on.</span>"

/obj/item/weapon/gun/energy/gun/fluff/aro/update_icon()
	if(charge_meter && !turnedoff)
		var/ratio = power_supply.charge / power_supply.maxcharge

		//make sure that rounding down will not give us the empty state even if we have charge for a shot left.
		if(power_supply.charge < charge_cost)
			ratio = 0
		else
			ratio = max(round(ratio, 0.25) * 100, 25)

		if(modifystate)
			icon_state = "[modifystate][ratio]"
		else
			icon_state = "[initial(icon_state)][ratio]"


// -------------- Dominator -------------
/obj/item/weapon/gun/energy/gun/fluff/dominator
	name = "MWPSB Dominator"
	desc = "A MWPSB's Dominator from the Federation. Like the basic Energy Gun, this gun has two settings. It is used by the United Federation Public Safety Bureau's Criminal Investigation Division."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "dominatorstun100"
	item_state = null // So it inherits the icon_state.
	fire_sound = 'sound/weapons/Taser.ogg'
	projectile_type = /obj/item/projectile/beam/stun
	origin_tech = "combat=3;magnets=2"
	modifystate = "dominatorstun"

/obj/item/weapon/gun/energy/gun/fluff/dominator/attack_self(mob/living/user as mob) // Uses some custom sounds and custom projectiles, so we need this.
	switch(mode)
		if(0)
			mode = 1
			charge_cost = 100
			fire_sound = 'sound/weapons/gauss_shoot.ogg'
			user << "\red [src.name] is now in Eliminator Mode. Target will be harmed. Please aim carefully."
			user.visible_message("\red [src.name] changes into a very intimidating looking energy gun.")
			projectile_type = /obj/item/projectile/beam/dominator
			modifystate = "dominatorkill"
		if(1)
			mode = 0
			charge_cost = 125 //Changed to match new egun value
			fire_sound = 'sound/weapons/Taser.ogg'
			user << "\red [src.name] is now set to Paralyzer Mode. Target will be stunned"
			user.visible_message("\red [src.name] is set to Paralyzer Mode.")
			projectile_type = /obj/item/projectile/beam/stun
			modifystate = "dominatorstun"
	update_icon()
	update_held_icon()

// ------------ Energy Luger ------------
/obj/item/weapon/gun/energy/gun/eluger
	name = "energy Luger"
	desc = "The finest sidearm produced by RauMauser, this pistol can punch a hole through inch thick steel plating. This ain't your great-grand-daddy's Luger! Can switch between stun and kill."
	icon_state = "elugerstun100"
	fire_sound = 'sound/weapons/Taser.ogg'
	item_state = "gun"
	charge_cost = 100 //How much energy is needed to fire.
	projectile_type = /obj/item/projectile/beam/stun
	modifystate = "elugerstun"

/obj/item/weapon/gun/energy/gun/eluger/attack_self(mob/living/user as mob) // Uses some custom sounds and custom projectiles, so we need this.
	switch(mode)
		if(0)
			mode = 1
			charge_cost = 100
			fire_sound = 'sound/weapons/eluger.ogg'
			user << "<span class='warning'>[src.name] is now set to kill.</span>"
			projectile_type = /obj/item/projectile/beam/eluger
			modifystate = "elugerkill"
		if(1)
			mode = 0
			charge_cost = 200
			fire_sound = 'sound/weapons/Taser.ogg'
			user << "<span class='warning'>[src.name] is now set to stun.</span>"
			projectile_type = /obj/item/projectile/beam/stun
			modifystate = "elugerstun"
	update_icon()
	update_held_icon()

//Custom Ammo//

//---------------- Beams ----------------
/obj/item/projectile/beam/eluger
	name = "laser beam"
	icon_state = "emitter"

/obj/item/projectile/beam/dominator
	name = "dominator lethal beam"
	icon_state = "omnilaser" // looks cool

//--------------- StG-60 ----------------
/obj/item/ammo_casing/stg
	desc = "A 7.92×33mm Kurz casing."
	icon_state = "762-casing"
	caliber = "kurz"
	projectile_type = /obj/item/projectile/bullet/rifle/a762

/obj/item/ammo_magazine/stg
	name = "box mag (7.92x33mm Kurz)"
	icon_state = "stg_30rnd"
	caliber = "kurz"
	ammo_type = /obj/item/ammo_casing/stg
	max_ammo = 30
	mag_type = MAGAZINE

/obj/item/ammo_magazine/stg/empty
	initial_ammo = 0

//------------- Battlerifle -------------
/obj/item/ammo_magazine/battlerifle
	name = "box mag (9.5x40mm)"
	icon_state = "battlerifle"
	caliber = "9.5x40mm"
	ammo_type = /obj/item/ammo_casing/a95mm
	max_ammo = 36
	mag_type = MAGAZINE
	multiple_sprites = 1

/obj/item/ammo_casing/a95mm
	desc = "A 9.5x40mm bullet casing."
	icon_state = "762-casing"
	caliber = "9.5x40mm"
	projectile_type = /obj/item/projectile/bullet/rifle/a95mm

/obj/item/projectile/bullet/rifle/a95mm
	damage = 40
	penetrating = 2 // Better penetration than the 7.62mm

/obj/item/ammo_magazine/battlerifle/empty
	initial_ammo = 0

//------------- Clockwork Rifle -------------
/obj/item/weapon/gun/projectile/shotgun/pump/rifle/clockwork
	name = "Clockwork Rifle"
	desc = "Brass, copper, and lots of gears. Well lubricated for fluid movement as each round is loaded, locked, and fired. Just like clockwork."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "clockworkrifle"
	item_state = "clockworkrifle"
