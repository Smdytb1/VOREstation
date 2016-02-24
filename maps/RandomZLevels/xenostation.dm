// XENOSTATION AREAS //

/area/awaymission/xenostation
	icon_state = "white"

/area/awaymission/xenostation/science
	name = "Science Lab"
	icon_state = "anolab"

/area/awaymission/xenostation/science/gateroom // RD's office.
	name = "Research Director's Office"
	icon_state = "away1"

/area/awaymission/xenostation/science/chemistry
	name = "Chemistry"
	icon_state = "chem"

/area/awaymission/xenostation/medbay
	name = "Medbay"
	icon_state = "medbay2"

/area/awaymission/xenostation/medbay/surgery
	name = "Surgery"
	icon_state = "surgery"

/area/awaymission/xenostation/medbay/morgue
	name = "Morgue"
	icon_state = "morgue"

/area/awaymission/xenostation/bridge
	name = "Bridge"
	icon_state = "bridge"

/area/awaymission/xenostation/security
	name = "Security"
	icon_state = "security"

/area/awaymission/xenostation/security/armory
	name = "Armory"
	icon_state = "armory"

/area/awaymission/xenostation/security/brig
	name = "Brig"
	icon_state = "brig"

/area/awaymission/xenostation/cargo // Sort of done anyway.
	name = "Cargo"
	icon_state = "quartoffice"

/area/awaymission/xenostation/cargo/hangar // Put empress in here.
	name = "Cargo Hangar"
	icon_state = "purple"

/area/awaymission/xenostation/cargo/mechbay
	name = "Cargo Mechbay"
	icon_state = "mechbay"

/area/awaymission/xenostation/cargo/warehouse // The prize for the boss battle.
	name = "Cargo Warehouse"
	icon_state = "primarystorage"

/area/awaymission/xenostation/engineering
	name = "Engineering"
	icon_state = "engine"

/area/awaymission/xenostation/engineering/eva
	name = "EVA"
	icon_state = "eva"

/area/awaymission/xenostation/engineering/storage
	name = "Hard Storage"
	icon_state = "engine_storage"

/area/awaymission/xenostation/engineering/power
	name = "Power Plant"
	icon_state = "engine_smes"

/area/awaymission/xenostation/engineering/atmos
	name = "Atmospherics"
	icon_state = "atmos"

/area/awaymission/xenostation/crew/dorms
	name = "Crew Dorms"
	icon_state = "crew_quarters"

/area/awaymission/xenostation/crew/cafe
	name = "Cafeteria"
	icon_state = "cafeteria"

/area/awaymission/xenostation/crew/kitchen
	name = "Kitchen"
	icon_state = "kitchen"

/area/awaymission/xenostation/crew/hydro
	name = "Hydroponics"
	icon_state = "hydro"

/area/awaymission/xenostation/crew/restroom
	name = "Bathrooms"
	icon_state = "restrooms"

/area/awaymission/xenostation/hallway
	name = "Central Corridor"
	icon_state = "hallC"

// Mobs

/obj/random/mob/xeno
	name = "Random Xeno Mob"
	desc = "This is a random xeno spawn. You aren't supposed to see this. Call an admin because reality has broken into the meta."
	icon = 'icons/mob/alien.dmi'
	icon_state = "Hunter Front Half"
	spawn_nothing_percentage = 40
	item_to_spawn()
		return pick(/mob/living/simple_animal/hostile/alien/drone,\
					/mob/living/simple_animal/hostile/alien/drone,\
					/mob/living/simple_animal/hostile/alien/drone,\
					/mob/living/simple_animal/hostile/alien,\
					/mob/living/simple_animal/hostile/alien,\
					/mob/living/simple_animal/hostile/alien/sentinel,\
					/obj/item/clothing/mask/facehugger/xenostation)

/obj/item/clothing/mask/facehugger/xenostation/New() // To prevent deleting it if aliens are disabled globally.
	return // This way the map is still threatening but no one can make more facehumpers if they become a xeno.

// Corpses

/obj/effect/landmark/corpse/xenostation/soldier
	name = "marine"
	corpseuniform = /obj/item/clothing/under/tactical/bdu
	corpsesuit = /obj/item/clothing/suit/armor/tactical/m3
	corpseshoes = /obj/item/clothing/shoes/combat
	corpseradio = /obj/item/device/radio/headset
	corpsehelmet = /obj/item/weapon/storage/helmet/m10
	corpsebelt = /obj/item/weapon/storage/belt/security/tactical/uscm
	corpsepocket1 = /obj/item/ammo_magazine/a10mmc
	corpsepocket2 = /obj/item/ammo_magazine/a10mmc
	corpseback = /obj/item/weapon/storage/backpack
	corpseid = 1
	corpseidjob = "USCM Private"
	corpseidicon = "guest"

/obj/effect/landmark/corpse/xenostation/soldier/nco
	corpseuniform = /obj/item/clothing/under/tactical/bdu/camo
	corpsesuit = /obj/item/clothing/suit/armor/tactical/m3/nco
	corpsemask = /obj/item/clothing/mask/smokable/cigarette/cigar/cohiba
	corpsehelmet = /obj/item/weapon/storage/helmet/m10/camo
	corpsepocket1 = /obj/item/clothing/mask/smokable/cigarette
	corpsepocket2 = /obj/item/weapon/flame/lighter/zippo
	corpseidjob = "USCM Sargeant"

/obj/effect/landmark/corpse/xenostation/soldier/medic
	corpsesuit = /obj/item/clothing/suit/armor/tactical/m3/medic
	corpseback = /obj/item/weapon/storage/backpack/medic/full
	corpsepocket1 = /obj/item/weapon/reagent_containers/hypospray/autoinjector
	corpseidjob = "USCM Medic"

/obj/effect/landmark/corpse/xenostation/soldier/engineer
	corpsesuit = /obj/item/clothing/suit/armor/tactical/m3/engineer
	corpsebelt = /obj/item/weapon/storage/belt/utility/full
	corpseidjob = "USCM Combat Engineer"

/obj/effect/landmark/corpse/xenostation/testsubject
	name = "Unfortunate Test Subject"
	corpsehelmet = /obj/item/clothing/head/fluff/xeno


// Items and objects for Xenostation

/obj/item/weapon/storage/belt/security/tactical/uscm
	name = "\improper USCM tactical belt"
	New()
		..()
		new /obj/item/ammo_magazine/a10mmc(src)
		new /obj/item/ammo_magazine/a10mmc(src)
		new /obj/item/ammo_magazine/a10mmc(src)
		new /obj/item/weapon/gun/projectile/colt(src)
		new /obj/item/ammo_magazine/c45m(src)
		new /obj/item/ammo_magazine/c45m(src)
		new /obj/item/device/flashlight(src)

// Old shit do not use. It's only here in case I miss anything.

/*
/obj/item/ammo_casing/a10mmc
	desc = "A 10mm bullet encased in solid propellant."
	caliber = "10mmCaseless"
	projectile_type = "/obj/item/projectile/bullet/midbullet2"

/obj/item/ammo_magazine/a10mmc
	name = "magazine (10mm caseless)"
	icon_state = "M41A_Mag-0"
	origin_tech = "combat=2"
	ammo_type = "/obj/item/ammo_casing/a10mmc"
	max_ammo = 40

/obj/item/ammo_magazine/a10mmc/empty
	name = "magazine (10mm caseless)"
	icon_state = "M41A_Mag-0"
	ammo_type = "/obj/item/ammo_casing/a10mmc"
	max_ammo = 0

/obj/item/weapon/gun/projectile/automatic/m41a
	name = "\improper M41A Pulse Rifle Mk2"
	desc = "Mid-ranged assault rifle with an electronic pulse action; the MK2 has a lower ammo capacity than previous models, but offers significantly increased stopping power. Uses caseless 10x24mm ammunition."
	icon_state = "M41A_Olive"
	item_state = "M41A_Full"
	w_class = 4
	max_shells = 40
	caliber = "10mmCaseless"
	origin_tech = "combat=5;materials=2;syndicate=8"
	ammo_type = "/obj/item/ammo_casing/a10mmc"
	fire_sound = 'sound/weapons/m41a.ogg'
	load_method = 2
	caseless = 1
	slot_flags = SLOT_BACK


	New()
		..()
		empty_mag = new /obj/item/ammo_magazine/a10mmc/empty(src)
		update_icon()
		return


	afterattack(atom/target as mob|obj|turf|area, mob/living/user as mob|obj, flag)
		..()
		if(!loaded.len && empty_mag)
			empty_mag.loc = get_turf(src.loc)
			empty_mag = null
			playsound(user, 'sound/weapons/smg_empty_alarm.ogg', 40, 1)
			update_icon()
		return


	update_icon()
		..()
		if(empty_mag)
			icon_state = "M41A_Olive"
			item_state = "M41A_Full"
		else
			icon_state = "M41A_Olive_Empty"
			item_state = "M41A_Empty"
		return

/obj/item/clothing/under/tactical/bdu
	name = "battle dress uniform (green)"
	desc = "A camouflaged battle dress uniform."
	icon_state = "bdu_olive"
	item_color = "bdu_olive"

	verb/toggle_sleeves()
		set name = "Roll sleeves"
		set category = "Object"
		set src in usr

		if(!usr.canmove || usr.stat || usr.restrained())
			return 0

		switch(icon_state)
			if("bdu_olive_rolled")
				src.icon_state = "bdu_olive"
				src.item_color = "bdu_olive"
				usr << "You roll down your sleeves."
			if("bdu_olive")
				src.icon_state = "bdu_olive_rolled"
				src.item_color = "bdu_olive_rolled"
				usr << "You roll up your sleeves."
			if("bdu_d_camo_rolled")
				src.icon_state = "bdu_d_camo"
				src.item_color = "bdu_d_camo"
				usr << "You roll down your sleeves."
			if("bdu_d_camo")
				src.icon_state = "bdu_d_camo_rolled"
				src.item_color = "bdu_d_camo_rolled"
				usr << "You roll up your sleeves."
		usr.update_inv_w_uniform() // So our uniform updates on our character.

/obj/item/clothing/under/tactical/bdu/camo
	name = "battle dress uniform (tan)"
	item_color = "bdu_d_camo"
	icon_state = "bdu_d_camo"
	item_state = "johnny"

/obj/item/clothing/suit/armor/tactical/m3
	name = "\improper M3 Personal Armor"
	desc = "The standard ballistic protective armor system employed by the United States Colonial Marine Corps in the 22nd century."
	icon_state = "m3_ppa"

/obj/item/clothing/suit/armor/tactical/m3/nco
	name = "\improper M3 Personal Armor"
	desc = "The standard ballistic protective armor system employed by the United States Colonial Marine Corps in the 22nd century. This variant is worn by a non-commissioned officer such as a sargeant."
	icon_state = "m3_ppa_nco"

/obj/item/clothing/suit/armor/tactical/m3/medic
	name = "\improper Medic M3 Personal Armor"
	desc = "The standard ballistic protective armor system employed by the United States Colonial Marine Corps in the 22nd century. This variant is worn by a medic."
	icon_state = "m3_ppa_medic"

/obj/item/clothing/suit/armor/tactical/m3/engineer
	name = "\improper Combat Engineer M3 Personal Armor"
	desc = "The standard ballistic protective armor system employed by the United States Colonial Marine Corps in the 22nd century. This variant is worn by a combat engineer."
	icon_state = "m3_ppa_enge"

/obj/item/weapon/storage/helmet/m10 // I had to put it in this directory because otherwise it's a lot of code.
	name = "\improper M10 Ballistic Helmet"
	desc = "A ballistic helmet used primarily by the United States Colonial Marine Corps."
	icon = 'icons/obj/clothing/hats.dmi'
	item_color = "m10_pbh"
	icon_state = "m10_pbh"
	item_state = "helmet"
	body_parts_covered = HEAD
	slot_flags = SLOT_HEAD
	storage_slots = 1
	flags = FPRINT|TABLEPASS
	armor = list(melee = 50, bullet = 50, laser = 50, energy = 35, bomb = 10, bio = 2, rad = 0)
	flags_inv = HIDEEARS
	siemens_coefficient = 0.7
	can_hold = list("/obj/item/weapon/storage/fancy/cigarettes")
	var/obj/machinery/camera/camera

	attack_self(mob/user)
		if(camera)
			..(user)
		else
			camera = new /obj/machinery/camera(src)
			camera.network = list("SS13")
			cameranet.removeCamera(camera)
			camera.c_tag = "TacCam M10 - [user.name]"
			user << "\blue User scanned as [camera.c_tag]. Camera activated."

	update_icon()
		if(contents.len)
			if (icon_state == "m10_pbh")
				icon_state = "m10_pbh_cig"
			if (icon_state == "m10_pbh_d_camo")
				icon_state = "m10_pbh_d_camo_cig"
		else
			if (icon_state == "m10_pbh_cig")
				icon_state = "m10_pbh"
			if (icon_state == "m10_pbh_d_camo_cig")
				icon_state = "m10_pbh_d_camo"
		usr.update_inv_head()


/obj/item/weapon/storage/helmet/m10/camo
	item_color = "m10_pbh_d_camo"
	icon_state = "m10_pbh_d_camo"

/obj/item/weapon/gun/projectile/detective/semiauto/colt
	desc = "An officially licensed Colt M1911. Uses live .45 rounds. Can fire rubber rounds."
	ammo_type = "/obj/item/ammo_casing/c45"

/obj/item/weapon/storage/backpack/medic/full
	New()
		..()
		new /obj/item/weapon/storage/firstaid/regular(src)
		new /obj/item/weapon/storage/firstaid/adv(src)
		new /obj/item/weapon/storage/firstaid/toxin(src)
		new /obj/item/weapon/storage/firstaid/o2(src)
		new /obj/item/weapon/storage/box/survival(src)
		new /obj/item/ammo_magazine/c45m(src)
		new /obj/item/roller(src)

// ------- MODKITS ------- //

/obj/item/device/modkit_single/uscm/helmet
	name = "M10 helmet paint kit (green)"
	desc = "A kit used to paint an M10 helmet olive green."
	from_object = /obj/item/weapon/storage/helmet/m10
	to_object = /obj/item/weapon/storage/helmet/m10

/obj/item/device/modkit_single/uscm/helmet/camo
	name = "M10 helmet paint kit (camo)"
	desc = "A kit used to paint an M10 helmet with desert camo."
	from_object = /obj/item/weapon/storage/helmet/m10
	to_object = /obj/item/weapon/storage/helmet/m10/camo

/obj/item/device/modkit_single/uscm/m3
	name = "M3 armor paint removal kit"
	desc = "A paint kit used to restore a suit of M3 armor and helmet to standard olive green."
	from_object = /obj/item/clothing/suit/armor/tactical/m3
	to_object = /obj/item/clothing/suit/armor/tactical/m3

/obj/item/device/modkit_single/uscm/m3/nco
	name = "M3 armor paint kit (NCO)"
	desc = "A paint kit for the markings of a non-commissioned officer on a suit of M3 armor."
	from_object = /obj/item/clothing/suit/armor/tactical/m3
	to_object = /obj/item/clothing/suit/armor/tactical/m3/nco

/obj/item/device/modkit_single/uscm/m3/medic
	name = "M3 armor paint kit (medic)"
	desc = "A paint kit for the markings of a medic on a suit of M3 armor."
	from_object = /obj/item/clothing/suit/armor/tactical/m3
	to_object = /obj/item/clothing/suit/armor/tactical/m3/medic

/obj/item/device/modkit_single/uscm/m3/engineer
	name = "M3 armor paint kit (engineer)"
	desc = "A paint kit for the markings of a combat engineer on a suit of M3 armor."
	from_object = /obj/item/clothing/suit/armor/tactical/m3
	to_object = /obj/item/clothing/suit/armor/tactical/m3/engineer

// ----- END MODKITS ------ //
*/