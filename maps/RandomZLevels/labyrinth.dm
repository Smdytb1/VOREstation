/area/awaymission/labyrinth
	icon_state = "blank"
	requires_power = 0

/area/awaymission/labyrinth/arrival
	icon_state = "away"
	requires_power = 1
	lighting_use_dynamic = 0

/area/awaymission/labyrinth/cave
	icon_state = "blue"

/area/awaymission/labyrinth/temple
	icon_state = "yellow"
	lighting_use_dynamic = 1
	luminosity = 0
	ambience = list('sound/music/TheClownChild.ogg')

/area/awaymission/labyrinth/boss
	icon_state = "red"
	lighting_use_dynamic = 1
	luminosity = 0

/turf/unsimulated/wall/exterior
	opacity = 0
	// For the outside of a building, or a massive wall.

/turf/unsimulated/floor/lava
	name = "lava"
	icon_state = "lava"
	density = 1

/obj/structure/HonkMother
	name = "The Honk Mother"
	desc = "A monolithic effigy of the legendary Honk Mother, adorned with dazzling rainbow bananium."
	icon = 'icons/effects/160x160.dmi'
	pixel_x = -64

/obj/structure/HonkMother/Apex
	icon_state = "HonkMotherApex"

/obj/structure/HonkMother/Base
	icon_state = "HonkMotherBase"

/obj/effect/decal/mecha_wreckage/honker/cluwne
	name = "cluwne mech wreckage"
	icon_state = "cluwne-broken"

/obj/mecha/combat/honker/cluwne // What have I done?
	desc = "Mechanized Assault Device for Juggernaughting Against Clown Killers. You've only heard legends about this exosuit..."
	name = "M.A.D. J.A.C.K."
	icon_state = "cluwne"
	initial_icon = "cluwne"
	step_in = 2
	health = 200
	deflect_chance = 60
	internal_damage_threshold = 60
	damage_absorption = list("brute"=1.2,"fire"=1.5,"bullet"=1,"laser"=1,"energy"=1,"bomb"=1)
	max_temperature = 25000
	infra_luminosity = 5
	operation_req_access = list(access_clown)
	wreckage = /obj/effect/decal/mecha_wreckage/honker/cluwne
	max_equip = 4
	var/obj/item/weapon/cell/infinite


/obj/mecha/combat/honker/cluwne/New()
	..()
	var/obj/item/mecha_parts/mecha_equipment/ME = new /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/scattershot
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/weapon/energy/pulse
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/weapon/ballistic/missile_rack/banana_mortar
	ME.attach(src)
	ME = new /obj/item/mecha_parts/mecha_equipment/weapon/honker
	ME.attach(src)
	return

/obj/effect/landmark/mobcorpse/tunnelclown
	name = "dead tunnel clown"
	corpseuniform = /obj/item/clothing/under/rank/clown
	corpseshoes = /obj/item/clothing/shoes/clown_shoes
	corpsesuit = /obj/item/clothing/suit/chaplain_hoodie
	corpsegloves = /obj/item/clothing/gloves/black
	corpsehelmet = /obj/item/clothing/head/chaplain_hood
	corpsemask = /obj/item/clothing/mask/gas/clown_hat
	corpsepocket1 = /obj/item/weapon/bikehorn

/obj/effect/landmark/mobcorpse/tunnelclown/sentinel
	name = "dead clown sentinel"
	corpsesuit = /obj/item/clothing/suit/cultrobes
	corpsehelmet = /obj/item/clothing/head/culthood


/mob/living/simple_animal/hostile/tunnelclown
	name = "tunnel clown"
	desc = "A clown driven to madness in the depths of the Honk Mother's Catacombs."
	faction = "tunnelclown"
	icon_state = "tunnelclown"
	icon_living = "tunnelclown"
	icon_dead = "clown_dead"
	icon_gib = "clown_gib"
	turns_per_move = 5
	response_help = "pokes"
	response_disarm = "gently pushes aside"
	response_harm = "hits"
	speak = list("HONK", "Honk!")
	emote_hear = list("honks")
	speak_chance = 1
	a_intent = "harm"
	var/corpse = /obj/effect/landmark/mobcorpse/tunnelclown
	var/weapon1 = /obj/item/weapon/twohanded/fireaxe
	stop_automated_movement_when_pulled = 0
	maxHealth = 100
	health = 100
	speed = 4
	harm_intent_damage = 8
	melee_damage_lower = 30
	melee_damage_upper = 40
	attacktext = "cleaved"
	attack_sound = 'sound/weapons/bladeslice.ogg'
	min_oxy = 5
	max_oxy = 0
	min_tox = 0
	max_tox = 1
	min_co2 = 0
	max_co2 = 5
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 270
	maxbodytemp = 370
	heat_damage_per_tick = 15
	cold_damage_per_tick = 10
	unsuitable_atoms_damage = 10

/mob/living/simple_animal/hostile/tunnelclown/sentinel
	name = "tunnel clown sentinel"
	desc = "A clown warrior tasked with guarding the Honk Mother's Catacombs."
	faction = "tunnelclown"
	icon_state = "sentinelclown"
	icon_living = "sentinelclown"
	icon_dead = "clown_dead"
	corpse = /obj/effect/landmark/mobcorpse/tunnelclown/sentinel
	weapon1 = /obj/item/weapon/twohanded/spear
	maxHealth = 150
	health = 150
	melee_damage_lower = 15
	melee_damage_upper = 20

/mob/living/simple_animal/hostile/tunnelclown/death()
	..()
	if(corpse)
		new corpse (src.loc)
	if(weapon1)
		new weapon1 (src.loc)
	del src
	return

/mob/living/simple_animal/hostile/cluwne
	name = "cluwne"
	desc = "A mutated clown alleged to have been cursed by the Honk Mother and permanently banished to these catacombs for once being an unfunny shitter who brought grief instead of laughter."
	faction = "tunnelclown"
	icon_state = "cluwne"
	icon_living = "cluwne"
	icon_dead = "cluwne_dead"
	icon_gib = "clown_gib"
	speak_chance = 5
	turns_per_move = 5
	response_help = "pokes"
	response_disarm = "gently pushes aside"
	response_harm = "euthanizes"
	speak = list("HONK!", "Honk!", "H-Honk...", "Honk... Please...","Kill me... Honk.", "It hurts to live... Honk...","The pain... HONK!")
	emote_hear = list("honks", "wheeps","sobs","whimpers","honks uncontrollably")
	a_intent = "harm"
	stop_automated_movement_when_pulled = 0
	maxHealth = 10
	health = 10
	speed = 1
	harm_intent_damage = 8
	melee_damage_lower = 1 // Pathetic creatures.
	melee_damage_upper = 1
	attacktext = "honked"
	attack_sound = 'sound/items/bikehorn.ogg'
	status_flags = CANPUSH
	min_oxy = 5
	max_oxy = 0
	min_tox = 0
	max_tox = 1
	min_co2 = 0
	max_co2 = 5
	min_n2 = 0
	max_n2 = 0
	minbodytemp = 270
	maxbodytemp = 370
	heat_damage_per_tick = 15
	cold_damage_per_tick = 10
	unsuitable_atoms_damage = 10

/obj/random/mob/clown
	name = "Random Clown Mob"
	desc = "This is a random clown spawn. You aren't supposed to see this. Call an admin because reality has broken into the meta."
	icon = 'icons/mob/animal.dmi'
	icon_state = "clown"
	spawn_nothing_percentage = 50
	item_to_spawn()
		return pick(prob(3);/mob/living/simple_animal/hostile/cluwne,
					prob(2);/mob/living/simple_animal/hostile/tunnelclown/sentinel,
					prob(1);/mob/living/simple_animal/hostile/tunnelclown)