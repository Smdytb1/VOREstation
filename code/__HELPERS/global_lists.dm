var/list/clients = list()							//list of all clients
var/list/admins = list()							//list of all clients whom are admins
var/list/directory = list()							//list of all ckeys with associated client

//Since it didn't really belong in any other category, I'm putting this here
//This is for procs to replace all the goddamn 'in world's that are chilling around the code

var/global/list/player_list = list()				//List of all mobs **with clients attached**. Excludes /mob/new_player
var/global/list/mob_list = list()					//List of all mobs, including clientless
var/global/list/living_mob_list = list()			//List of all alive mobs, including clientless. Excludes /mob/new_player
var/global/list/dead_mob_list = list()				//List of all dead mobs, including clientless. Excludes /mob/new_player

var/global/list/cable_list = list()					//Index for all cables, so that powernets don't have to look through the entire world all the time
var/global/list/chemical_reactions_list				//list of all /datum/chemical_reaction datums. Used during chemical reactions
var/global/list/chemical_reagents_list				//list of all /datum/reagent datums indexed by reagent id. Used by chemistry stuff
var/global/list/landmarks_list = list()				//list of all landmarks created
var/global/list/surgery_steps = list()				//list of all surgery steps  |BS12
var/global/list/side_effects = list()				//list of all medical sideeffects types by thier names |BS12
var/global/list/mechas_list = list()				//list of all mechs. Used by hostile mobs target tracking.
var/global/list/joblist = list()					//list of all jobstypes, minus borg and AI

var/global/list/important_items = list()			//list of items to preserve through cryo/digestion/etc
var/global/list/digestion_sounds = list()			//list of sounds for gurgles
var/global/list/death_sounds = list()				//list of sounds for gurgle death

//Languages/species/whitelist.
var/global/list/all_species[0]
var/global/list/all_languages[0]
var/global/list/language_keys[0]					// Table of say codes for all languages
var/global/list/whitelisted_species = list("Human") // Species that require a whitelist check.
var/global/list/playable_species = list("Human")    // A list of ALL playable species, whitelisted, latejoin or otherwise.

// Posters
var/global/list/poster_designs = list()

// Uplinks
var/list/obj/item/device/uplink/world_uplinks = list()

//Preferences stuff
	// Taur body type
var/global/list/taur_styles_list = list()
	//Hairstyles
var/global/list/hair_styles_list = list()			//stores /datum/sprite_accessory/hair indexed by name
var/global/list/hair_styles_male_list = list()
var/global/list/hair_styles_female_list = list()
var/global/list/facial_hair_styles_list = list()	//stores /datum/sprite_accessory/facial_hair indexed by name
var/global/list/facial_hair_styles_male_list = list()
var/global/list/facial_hair_styles_female_list = list()
var/global/list/skin_styles_female_list = list()		//unused
var/global/list/ear_styles_list = list()
var/global/list/tail_styles_list = list()
var/global/list/player_sizes_list = list()

	//Underwear
var/global/list/underwear_m = list("Male, White" = "m1", "Male, Grey" = "m2", "Male, Green" = "m3", "Male, Blue" = "m4", "Male, Black" = "m5", "Male, Kinky white" = "m6", "Male, Kinky Red" = "m7", "Male, Boxer Hearts" = "m8", "Male, Boxer Black" = "m9", "Male, Boxer Grey" = "m10", "Male, Boxer Green" = "m11", "None") //Curse whoever made male/female underwear diffrent colours
var/global/list/underwear_f = list("Female, Red" = "f1", "Female, White" = "f2", "Female, Yellow" = "f3", "Female, Blue" = "f4", "Female, Black" = "f5", "Female, Black & Red Lace" = "f6", "Female, Black Sports" = "f7","Female, White Sports" = "f8", "Female, Black Training" = "f9", "Female, White Thong" = "f10", "Female, Black Thong" = "f11", "Female, Pink Thong" = "f12", "Female, Green Thong" = "f13", "Female, Transparent Babydoll" = "f14", "Female, Blue Babydoll" = "f15","Female, Pink Babydoll" = "f16", "None")
var/global/list/underwear_t = list("Male, White" = "m1", "Male, Grey" = "m2", "Male, Green" = "m3", "Male, Blue" = "m4", "Male, Black" = "m5", "Male, Kinky white" = "m6", "Male, Kinky Red" = "m7", "Male, Boxer Hearts" = "m8", "Male, Boxer Black" = "m9", "Male, Boxer Grey" = "m10", "Male, Boxer Green" = "m11", "Female, Red" = "f1", "Female, White" = "f2", "Female, Yellow" = "f3", "Female, Blue" = "f4", "Female, Black" = "f5", "Female, Black & Red Lace" = "f6", "Female, Black Sports" = "f7","Female, White Sports" = "f8", "Female, Black Training" = "f9", "Female, White Thong" = "f10", "Female, Black Thong" = "f11", "Female, Pink Thong" = "f12", "Female, Green Thong" = "f13", "Female, Transparent Babydoll" = "f14", "Female, Blue Babydoll" = "f15","Female, Pink Babydoll" = "f16", "None") //made this one becouse I didn't want to properly fix the Underwear machine. Orbis
	//undershirt
var/global/list/undershirt_t = list("White Tank top" = "u1", "Black Tank top" = "u2", "Black shirt" = "u3", "White shirt" = "u4", "None")
	//socks
var/global/list/undersocks_t = list("White, normal" = "white_nom_s", "White, short" = "white_short_s", "White, knee" = "white_knee_s", "White, thigh" = "white_thigh_s","Black, normal" = "black_nom_s", "Black, short" = "black_short_s", "Black, knee" = "black_knee_s", "Black, thigh" = "black_thigh_s","Thin, knee" = "thin_knee_s", "Thin, thigh" = "thin_thigh_s","Pantyhose" = "pantyhose_s","Rainbow, knee" = "rainbow_knee_s", "Rainbow, thigh" = "rainbow_thigh_s","Striped, knee" = "striped_knee_s", "Striped, thigh" = "striped_thigh_s", "None")
	//Backpacks
var/global/list/backbaglist = list("Nothing", "Backpack", "Satchel", "Satchel Alt")

//////////////////////////
/////Initial Building/////
//////////////////////////

/proc/makeDatumRefLists()
	var/list/paths

	// Taurs - Initialise all /datum/sprite_accessory/taur into an list indexed by taur type name
	paths = typesof(/datum/sprite_accessory/taur) - /datum/sprite_accessory/taur
	for(var/path in paths)
		var/datum/sprite_accessory/taur/H = new path()
		taur_styles_list[H.name] = H

	//Hair - Initialise all /datum/sprite_accessory/hair into an list indexed by hair-style name
	paths = typesof(/datum/sprite_accessory/hair) - /datum/sprite_accessory/hair
	for(var/path in paths)
		var/datum/sprite_accessory/hair/H = new path()
		hair_styles_list[H.name] = H
		switch(H.gender)
			if(MALE)	hair_styles_male_list += H.name
			if(FEMALE)	hair_styles_female_list += H.name
			else
				hair_styles_male_list += H.name
				hair_styles_female_list += H.name

	//Facial Hair - Initialise all /datum/sprite_accessory/facial_hair into an list indexed by facialhair-style name
	paths = typesof(/datum/sprite_accessory/facial_hair) - /datum/sprite_accessory/facial_hair
	for(var/path in paths)
		var/datum/sprite_accessory/facial_hair/H = new path()
		facial_hair_styles_list[H.name] = H
		switch(H.gender)
			if(MALE)	facial_hair_styles_male_list += H.name
			if(FEMALE)	facial_hair_styles_female_list += H.name
			else
				facial_hair_styles_male_list += H.name
				facial_hair_styles_female_list += H.name

	//Custom Ears
	paths = typesof(/datum/sprite_accessory/ears) - /datum/sprite_accessory/ears
	for(var/path in paths)
		var/obj/item/clothing/head/instance = new path()
		ear_styles_list[path] = instance

	//Custom Tails
	paths = typesof(/datum/sprite_accessory/tail) - /datum/sprite_accessory/tail
	for(var/path in paths)
		var/datum/sprite_accessory/tail/instance = new path()
		tail_styles_list[path] = instance

	//Standard sizes
	player_sizes_list = list("Macro" = RESIZE_HUGE, "Big" = RESIZE_BIG, "Normal" = RESIZE_NORMAL, "Small" = RESIZE_SMALL, "Tiny" = RESIZE_TINY)

	//Surgery Steps - Initialize all /datum/surgery_step into a list
	paths = typesof(/datum/surgery_step)-/datum/surgery_step
	for(var/T in paths)
		var/datum/surgery_step/S = new T
		surgery_steps += S
	sort_surgeries()

	//List of job. I can't believe this was calculated multiple times per tick!
	paths = typesof(/datum/job) -list(/datum/job,/datum/job/ai,/datum/job/cyborg)
	for(var/T in paths)
		var/datum/job/J = new T
		joblist[J.title] = J

	//Languages and species.
	paths = typesof(/datum/language)-/datum/language
	for(var/T in paths)
		var/datum/language/L = new T
		all_languages[L.name] = L

	for (var/language_name in all_languages)
		var/datum/language/L = all_languages[language_name]
		if(!(L.flags & NONGLOBAL))
			language_keys[":[lowertext(L.key)]"] = L
			language_keys[".[lowertext(L.key)]"] = L
			language_keys["#[lowertext(L.key)]"] = L

	var/rkey = 0
	paths = typesof(/datum/species)-/datum/species
	for(var/T in paths)
		rkey++
		var/datum/species/S = new T
		S.race_key = rkey //Used in mob icon caching.
		all_species[S.name] = S

		if(!(S.flags & IS_RESTRICTED))
			playable_species += S.name
		if(S.flags & IS_WHITELISTED)
			whitelisted_species += S.name

	//Important items
	important_items += list(
		/obj/item/weapon/hand_tele,
		/obj/item/weapon/card/id/captains_spare,
		/obj/item/device/aicard,
		/obj/item/device/mmi,
		/obj/item/device/paicard,
		/obj/item/weapon/gun,
		/obj/item/weapon/pinpointer,
		/obj/item/clothing/suit,
		/obj/item/clothing/shoes/magboots,
		/obj/item/blueprints,
		/obj/item/clothing/head/helmet/space,
		/obj/item/weapon/storage/internal,
		/obj/item/weapon/disk/nuclear,
		/obj/item/weapon/card/id/digested
	)

	digestion_sounds = list(
		'sound/vore/digest1.ogg',
		'sound/vore/digest2.ogg',
		'sound/vore/digest3.ogg',
		'sound/vore/digest4.ogg',
		'sound/vore/digest5.ogg',
		'sound/vore/digest6.ogg',
		'sound/vore/digest7.ogg',
		'sound/vore/digest8.ogg',
		'sound/vore/digest9.ogg',
		'sound/vore/digest10.ogg',
		'sound/vore/digest11.ogg',
		'sound/vore/digest12.ogg')

	death_sounds = list(
		'sound/vore/death1.ogg',
		'sound/vore/death2.ogg',
		'sound/vore/death3.ogg',
		'sound/vore/death4.ogg',
		'sound/vore/death5.ogg',
		'sound/vore/death6.ogg',
		'sound/vore/death7.ogg',
		'sound/vore/death8.ogg',
		'sound/vore/death9.ogg',
		'sound/vore/death10.ogg')

	//Posters
	paths = typesof(/datum/poster) - /datum/poster
	for(var/T in paths)
		var/datum/poster/P = new T
		poster_designs += P

	return 1

/* // Uncomment to debug chemical reaction list.
/client/verb/debug_chemical_list()

	for (var/reaction in chemical_reactions_list)
		. += "chemical_reactions_list\[\"[reaction]\"\] = \"[chemical_reactions_list[reaction]]\"\n"
		if(islist(chemical_reactions_list[reaction]))
			var/list/L = chemical_reactions_list[reaction]
			for(var/t in L)
				. += "    has: [t]\n"
	world << .
*/
