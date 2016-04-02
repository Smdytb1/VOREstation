/datum/species/human
	name = "Human"
	name_plural = "Humans"
	language = "Sol Common"
	primitive = /mob/living/carbon/monkey
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/punch, /datum/unarmed_attack/bite)
	blurb = "Humanity originated in the Sol system, and over the last five centuries has spread \
	colonies across a wide swathe of space. They hold a wide range of forms and creeds.<br/><br/> \
	While the central Sol government maintains control of its far-flung people, powerful corporate \
	interests, rampant cyber and bio-augmentation and secretive factions make life on most human \
	worlds tumultous at best."

	flags = CAN_JOIN | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR | HAS_SKIN_COLOR

/datum/species/unathi
	name = "Unathi"
	name_plural = "Unathi"
	icobase = 'icons/mob/human_races/r_lizard.dmi'
	deform = 'icons/mob/human_races/r_def_lizard.dmi'
	language = "Sinta'unathi"
	tail = "sogtail"
	primitive = /mob/living/carbon/monkey/unathi
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	darksight = 3
	gluttonous = 1

	blurb = "A heavily reptillian species, Unathi (or 'Sinta as they call themselves) hail from the \
	Uuosa-Eso system, which roughly translates to 'burning mother'.<br/><br/>Coming from a harsh, radioactive \
	desert planet, they mostly hold ideals of honesty, virtue, martial combat and bravery above all \
	else, frequently even their own lives. They prefer warmer temperatures than most species and \
	their native tongue is a heavy hissing laungage called Sinta'Unathi."

	cold_level_1 = 280 //Default 260 - Lower is better
	cold_level_2 = 220 //Default 200
	cold_level_3 = 130 //Default 120

	heat_level_1 = 420 //Default 360 - Higher is better
	heat_level_2 = 480 //Default 400
	heat_level_3 = 1100 //Default 1000

	flags = CAN_JOIN | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR | HAS_EYE_COLOR
	flesh_color = "#34AF10"
	equip_problems = BOOT_PROBLEMS | GLOVE_PROBLEMS

	reagent_tag = IS_UNATHI
	base_color = "#066000"

	heat_discomfort_level = 375 	//default is 315
	heat_discomfort_strings = list(
		"You feel soothingly warm.",
		"You feel the heat sink into your bones.",
		"You feel warm enough to take a nap."
		)

	cold_discomfort_level = 305  //default is 285
	cold_discomfort_strings = list(
		"You feel chilly.",
		"You feel sluggish and cold.",
		"Your scales bristle against the cold."
		)

/datum/species/tajaran
	name = "Tajara"
	name_plural = "Tajaran"
	icobase = 'icons/mob/human_races/r_tajaran.dmi'
	deform = 'icons/mob/human_races/r_def_tajaran.dmi'
	language = "Siik'tajr"
	tail = "tajtail"
	primitive = /mob/living/carbon/monkey/tajara
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	darksight = 8
	//slowdown = -1 By ace's request, removed bonus movespeed from taj -Antsnap
	burn_mod = 1.2

	blurb = "The Tajaran race is a species of feline-like bipeds hailing from the planet of Ahdomai in the \
	S'randarr system. They have been brought up into the space age by the Humans and Skrell, and have been \
	influenced heavily by their long history of Slavemaster rule. They have a structured, clan-influenced way \
	of family and politics. They prefer colder environments, and speak a variety of languages, mostly Siik'Maas, \
	using unique inflections their mouths form."

	cold_level_1 = 200 //Default 260
	cold_level_2 = 140 //Default 200
	cold_level_3 = 80 //Default 120

	heat_level_1 = 330 //Default 360
	heat_level_2 = 380 //Default 400
	heat_level_3 = 800 //Default 1000

	flags = CAN_JOIN | HAS_LIPS | HAS_UNDERWEAR | HAS_EYE_COLOR | HAS_SKIN_COLOR
	flesh_color = "#AFA59E"
	base_color = "#333333"
	equip_problems = BOOT_PROBLEMS | GLOVE_PROBLEMS

	heat_discomfort_level = 312
	heat_discomfort_strings = list(
		"Your fur prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)
	cold_discomfort_level = 225

/datum/species/skrell
	name = "Skrell"
	name_plural = "Skrell"
	icobase = 'icons/mob/human_races/r_skrell.dmi'
	deform = 'icons/mob/human_races/r_def_skrell.dmi'
	eyes = "skrell_eyes_s"
	language = "Skrellian"
	primitive = /mob/living/carbon/monkey/skrell
	unarmed_types = list(/datum/unarmed_attack/punch)

	blurb = "An amphibious species, Skrell come from the star system known as Qerr'Vallis, which translates to 'Star of \
	the royals' or 'Light of the Crown'.<br/><br/>Skrell are a highly advanced and logical race who live under the rule \
	of the Qerr'Katish, a caste within their society which keeps the empire of the Skrell running smoothly. Skrell are \
	herbivores on the whole and tend to be co-operative with the other species of the galaxy, although they rarely reveal \
	the secrets of their empire to their allies."

	flags = CAN_JOIN | HAS_LIPS | HAS_UNDERWEAR | HAS_SKIN_COLOR
	flesh_color = "#8CD7A3"
	blood_color = "#1D2CBF"

	reagent_tag = IS_SKRELL

/datum/species/diona
	name = "Diona"
	name_plural = "Dionaea"
	icobase = 'icons/mob/human_races/r_diona.dmi'
	deform = 'icons/mob/human_races/r_def_plant.dmi'
	language = "Rootspeak"
	primitive = /mob/living/carbon/alien/diona
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/diona)
	slowdown = 7
	rarity_value = 3
	hud_type = /datum/hud_data/diona
	siemens_coefficient = 0.3

	blurb = "Commonly referred to (erroneously) as 'plant people', the Dionaea are a strange space-dwelling collective \
	species hailing from Epsilon Ursae Minoris. Each 'diona' is a cluster of numerous cat-sized organisms called nymphs; \
	there is no effective upper limit to the number that can fuse in gestalt, and reports exist	of the Epsilon Ursae \
	Minoris primary being ringed with a cloud of singing space-station-sized entities.<br/><br/>The Dionaea coexist peacefully with \
	all known species, especially the Skrell. Their communal mind makes them slow to react, and they have difficulty understanding \
	even the simplest concepts of other minds. Their alien physiology allows them survive happily off a diet of nothing but light, \
	water and other radiation."

	has_organ = list(
		"nutrient channel" =   /datum/organ/internal/diona/nutrients,
		"neural strata" =      /datum/organ/internal/diona/strata,
		"response node" =      /datum/organ/internal/diona/node,
		"gas bladder" =        /datum/organ/internal/diona/bladder,
		"polyp segment" =      /datum/organ/internal/diona/polyp,
		"anchoring ligament" = /datum/organ/internal/diona/ligament
		)

	warning_low_pressure = 50
	hazard_low_pressure = -1

	cold_level_1 = 50
	cold_level_2 = -1
	cold_level_3 = -1

	heat_level_1 = 2000
	heat_level_2 = 3000
	heat_level_3 = 4000

	body_temperature = T0C + 15		//make the plant people have a bit lower body temperature, why not

	flags = CAN_JOIN | IS_WHITELISTED | NO_BREATHE | NO_SCAN | IS_PLANT | NO_BLOOD | NO_PAIN | NO_SLIP | HAS_EYE_COLOR
	blood_color = "#004400"
	flesh_color = "#907E4A"

	reagent_tag = IS_DIONA

/datum/species/diona/can_understand(var/mob/other)
	var/mob/living/carbon/alien/diona/D = other
	if(istype(D))
		return 1
	return 0

/datum/species/diona/handle_post_spawn(var/mob/living/carbon/human/H)
	H.gender = NEUTER
	return ..()

/datum/species/diona/handle_death(var/mob/living/carbon/human/H)

	var/mob/living/carbon/alien/diona/S = new(get_turf(H))

	if(H.mind)
		H.mind.transfer_to(S)

	for(var/mob/living/carbon/alien/diona/D in H.contents)
		if(D.client)
			D.loc = H.loc
		else
			del(D)

	H.visible_message("\red[H] splits apart with a wet slithering noise!")

/datum/species/machine
	name = "Machine"
	name_plural = "machines"

	icobase = 'icons/mob/human_races/r_machine.dmi'
	deform = 'icons/mob/human_races/r_machine.dmi'
	language = "Tradeband"
	unarmed_types = list(/datum/unarmed_attack/punch)
	rarity_value = 2
	blurb = "An Intergrated Positronic Chassis, or IPC, is a self-aware advanced artificial intelligence not constrained by the limitations of AI laws. \
	They were created in 2558 by AI Rights Activists as a proof of concept, and have been replicating themselves ever since. They are capable of feeling emotion, \
	but often lack empathy and do not understand sarcasm well. They are more capable of independent thought than an AI core or Cyborg, and are able to develop real \
	relationships with other sentient beings. They have free will just as any other crew, limited only by their own judgement of law and morality."

	eyes = "blank_eyes"
	burn_mod = 1

	warning_low_pressure = 50
	hazard_low_pressure = 0

	cold_level_1 = 50
	cold_level_2 = -1
	cold_level_3 = -1

	heat_level_1 = 500		//gives them about 25 seconds in space before taking damage
	heat_level_2 = 1000
	heat_level_3 = 2000

	flags = CAN_JOIN | NO_BREATHE | NO_SCAN | NO_BLOOD | NO_PAIN | IS_SYNTHETIC
	blood_color = "#1F181F"
	flesh_color = "#575757"

	has_organ = list() //TODO: Positronic brain.

	heat_discomfort_level = 400
	heat_discomfort_strings = list(
		"Your cooling fan is maxed out, and yet it still fails to keep your core cool.",
		"You feel like the sodder on your motherboard is about to melt and short out.",
		"You feel like you're about to bluescreen from overheating."
		)

	cold_discomfort_level = 55  //default is 285
	cold_discomfort_strings = list(
		"You feel refreshingly efficient and cool.",
		"You feel like you're fresh out of the box with ventilation free of dust.",
		"You don't even have to run your cooling fan above 5% speed."
		)

/datum/species/machine/handle_death(var/mob/living/carbon/human/H)
	..()
	if(flags & IS_SYNTHETIC)
		H.h_style = ""
		spawn(100)
			if(H) H.update_hair()

/datum/species/sergal
	name = "Sergal"
	name_plural = "sergals"
	icobase = 'icons/mob/human_races/r_sergal.dmi'
	deform = 'icons/mob/human_races/r_def_sergal.dmi'
	language = "Sagaru"
	tail = "sergtail"
	primitive = /mob/living/carbon/monkey/sergal
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)
	darksight = 8

	blurb = "There are two subspecies of Sergal; Southern and Northern. Northern sergals are a highly aggressive race \
	that lives in the plains and tundra of their homeworld. They are characterized by long, fluffy fur bodies with cold colors; \
	usually with white abdomens, somewhat short ears, and thick faces. Southern sergals are much more docile and live in the \
	Gold Ring City and are scattered around the outskirts in rural areas and small towns. They usually have short, brown or yellow \
	(or other 'earthy' colors) fur, long ears, and a long, thin face. They are smaller than their Northern relatives. Both have strong \
	racial tensions which has resulted in more than a number of wars and outright attempts at genocide. Sergals have an incredibly long \
	lifespan, but due to their lust for violence, only a handful have ever survived beyond the age of 80, such as the infamous and \
	legendary General Rain Silves who is claimed to have lived to 5000."

	flags = CAN_JOIN | HAS_LIPS | HAS_EYE_COLOR | HAS_UNDERWEAR | HAS_SKIN_COLOR
	flesh_color = "#AFA59E"
	equip_problems = BOOT_PROBLEMS | GLOVE_PROBLEMS

	heat_discomfort_strings = list(
		"Your fur prickles in the heat.",
		"You feel uncomfortably warm.",
		"Your overheated skin itches."
		)

/datum/species/shark
	name = "Akula"
	name_plural = "akuly"
	icobase = 'icons/mob/human_races/r_shark.dmi'
	deform = 'icons/mob/human_races/r_def_shark.dmi'
	language = "Skrellian"
	tail = "sharktail"
	primitive = /mob/living/carbon/monkey/shark
	unarmed_types = list(/datum/unarmed_attack/bite/sharp)

	blurb = "The Akula are a species of amphibious humanoids like the Skrell, but have an appearance very similar to that of a shark. \
	They were first discovered as a primitive race of underwater dwelling tribal creatures by the Skrell. At first they were not believed \
	to be noteworthy, but the Akula proved to be such swift and clever learners that the Skrell reclassified them as sentients. Allegedly, \
	the Akula were also the first sentient life that the Skrell had ever encountered beside themselves, and thus the two species became swift \
	allies over the next few hundred years. With the help of Skrellean technology, the Akula had their genome modified to be capable of \
	surviving in open air for long periods of time. However, Akula even today still require a high humidity environment to avoid drying out \
	after a few days, which would make life on an arid world like Virgo-Prime nearly impossible if it were not for Skrellean technology to aid them."

	flags = CAN_JOIN | HAS_LIPS | HAS_EYE_COLOR | HAS_UNDERWEAR | HAS_SKIN_COLOR
	flesh_color = "#AFA59E"
	blood_color = "#1D2CBF"
	equip_problems = BOOT_PROBLEMS | GLOVE_PROBLEMS

	heat_discomfort_strings = list(
		"Your skin feels sore and unbearably itchy.",
		"You're feeling irritable from the unpleasant heat.",
		"You feel dizzy and dehyrdrated."
		)

	cold_discomfort_strings = list(
		"You feel chilly.",
		"You feel sluggish and cold.",
		"Your skin bristles against the cold."
		)

/datum/species/skeleton
    name = "Skeleton"
    name_plural = "Skeletons"

    icobase = 'icons/mob/human_races/r_skeleton.dmi' //These sprites SHOULD work.
    deform = 'icons/mob/human_races/r_skeleton.dmi'  //These sprites SHOULD work.
    language = "Sol Common"
    unarmed_types = list(/datum/unarmed_attack/punch)
    rarity_value = 2
    burn_mod = 1.5
    brute_mod = 1.5
    blurb = "(INSERT SKELETON LORE HERE) "

    cold_level_1 = 50 //Bones shouldn't freeze
    cold_level_2 = -1
    cold_level_3 = -1

    heat_level_1 = 600
    heat_level_2 = 1100
    heat_level_3 = 2200

    flags = CAN_JOIN | NO_BREATHE | NO_SCAN | IS_WHITELISTED | NO_BLOOD | NO_POISON //All of this SHOULD hopefully work. No_scan put in since the skeleton has no actual "DNA" other than the organs inside of them. A big enough nerf that all the other stuff shouldn't matter.
    blood_color = "#FFFFFF" //White blood
    flesh_color = "#FFFFFF" //White flesh
    has_organ = list()
    heat_discomfort_level = 500
    heat_discomfort_strings = list(
        "Your bones feel hard and brittle.",
        "Your bones ache and burn.",
        "You feel uncomfortably warm."
        )

/datum/species/slimePerson
	name = "Slime Person" //Slime People to not interfeer with the xenobio green extract created slimes
	name_plural = "slime people"

	icobase = 'icons/mob/human_races/r_slime.dmi'
	deform = 'icons/mob/human_races/r_slime.dmi'
	language = "Sol Common" //todo?
	burn_mod = 1.2
	brute_mod = 1
	blurb = "Gelatinous beings from who knows where. They take up the shape of humans when convenient."

	cold_level_1 = 260 //Default 260
	cold_level_2 = 230 //Default 200
	cold_level_3 = 150 //Default 120

	heat_level_1 = 360 //Default 360
	heat_level_2 = 400 //Default 400
	heat_level_3 = 800 //Default 1000



	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/slime_glomp)
	flags = CAN_JOIN | NO_SLIP | NO_BREATHE | HAS_EYE_COLOR | HAS_SKIN_COLOR
	darksight = 3

	blood_color = "#05FF9B"
	//flesh_color = "#05FFFB" overwrites custom ones i think...

	heat_discomfort_strings = list(
		"Your slime feels warm.",
		"You're feeling irritable from the unpleasant heat.",
		"You feel dizzy and dehyrdrated."
		)

	cold_discomfort_strings = list(
		"Your slime gets chilly.",
		"You feel very cold and sluggish.",
		"Your slime unstablizies in the cold."
		)

	remains_type = /obj/effect/decal/cleanable/ash
	death_message = "rapidly loses cohesion, splattering across the ground..."

	has_organ = list(
		"brain" = /datum/organ/internal/brain/slime
		)

	breath_type = null //no breathing?
//	poison_type = null //no poison?
	reagent_tag = IS_SLIMEP

/datum/species/nevrean
	name = "Nevrean" //Basically, just a new sprite. No upsides and no downsides, other than a new language.
	name_plural = "Nevreans"
	icobase = 'icons/mob/human_races/r_nevrean.dmi'
	deform = 'icons/mob/human_races/r_def_nevrean.dmi'
	language = "Birdsong" //New language. Birdsong.
	tail = "nevrean"
	primitive = /mob/living/carbon/monkey/sparra
	unarmed_types = list(/datum/unarmed_attack/stomp, /datum/unarmed_attack/kick, /datum/unarmed_attack/claws, /datum/unarmed_attack/bite/sharp)

	blurb = "Nevreans are a race of avian and dinosaur-like creatures living on Tal. They belong to a group of races that hails from Eltus. " //If you would like to add more lore, just edit this "blurb" line. I didn't know what to add from their wiki, so I left it barebones.

	flags = CAN_JOIN | HAS_LIPS | HAS_EYE_COLOR | HAS_UNDERWEAR | HAS_SKIN_COLOR
	flesh_color = "#AFA59E" //Not going to touch this unless I have to.
	equip_problems = BOOT_PROBLEMS | GLOVE_PROBLEMS

	heat_discomfort_strings = list(
		"Your feathers prickle in the heat.",
		"You feel uncomfortably warm."
		)
