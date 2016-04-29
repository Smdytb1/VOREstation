//
//	Implementation of Unbirthing Vore via the "womb" belly type
//

/datum/belly/womb
	belly_type = "Womb"
	belly_name = "womb"
	inside_flavor = "Generic womb description"

// @Override
/datum/belly/womb/get_examine_msg(t_He, t_his, t_him, t_has, t_is)
	if(internal_contents.len || is_full == 1)
		return "[t_He] [t_has] something in [t_his] lower belly!\n"

// @Override
/datum/belly/womb/toggle_digestion()
	digest_mode = input("Womb Mode") in list("Hold", "Heal", "Transform (Male)", "Transform (Female)", "Transform (Keep Gender)", "Transform (Change Species)", "Digest", "Transform (Change Species) (EGG)", "Transform (Keep Gender) (EGG)", "Transform (Male) (EGG)", "Transform (Female) (EGG)", "Absorb")
	switch (digest_mode)
		if("Heal")
			owner << "<span class='notice'>You will now heal people you've unbirthed.</span>"
		if("Digest")
			owner << "<span class='notice'>You will now digest people you've unbirthed.</span>"
		if("Hold")
			owner << "<span class='notice'>You will now harmlessly hold people you've unbirthed.</span>"
		if("Transform (Male)")
			owner << "<span class='notice'>You will now transform people you've unbirthed into your son.</span>"
		if("Transform (Female)")
			owner << "<span class='notice'>You will now transform people you've unbirthed into your daughter.</span>"
		if("Transform (Keep Gender)")
			owner << "<span class='notice'>You will now transform people you've unbirthed, but they will keep their gender.</span>"
		if("Transform (Change Species)")
			owner << "<span class='notice'>You will now transform people you've unbirthed to look similar to your species.</span>"
		if("Transform (Change Species) (EGG)")
			owner << "<span class='notice'>You will now transform people you've unbirthed to look similar to your species, and surround them with an egg.</span>"
		if("Transform (Keep Gender) (EGG)")
			owner << "<span class='notice'>You will now transform people you've unbirthed to look similar to you and surround them with an egg, but they will keep their gender.</span>"
		if("Transform (Male) (EGG)")
			owner << "<span class='notice'>You will now transform people you've unbirthed into your son, and will surround them with an egg.</span>"
		if("Transform (Female) (EGG)")
			owner << "<span class='notice'>You will now transform people you've unbirthed into your daughter.</span>"
		if("Absorb")
			owner << "<span class='notice'>You will now absorb people and make them part of you..</span>"
// @Override
/datum/belly/womb/process_Life()
	for(var/mob/living/M in internal_contents)
		//WOMB HEAL
		if(iscarbon(M) && owner.stat != DEAD && digest_mode == DM_HEAL && M.stat != DEAD)
			if(air_master.current_cycle%3==1)
				if(!(M.status_flags & GODMODE))
					if(owner.nutrition > 90)
						M.adjustBruteLoss(-5)
						M.adjustFireLoss(-5)
						owner.nutrition -= 2
						if(M.nutrition <= 400)
							M.nutrition += 1

		//WOMB DIGEST
		if(iscarbon(M) && owner.stat != DEAD && digest_mode == DM_DIGEST)
			if(istype(M, /mob/living/carbon/human))
				var/mob/living/carbon/human/R = M
				if(R.digestable == 0)
					continue

			if(M.stat == DEAD)
				owner << "<span class='notice'>You feel [M] dissolve into nothing but warm fluids inside your womb.</span>"
				M << "<span class='notice'>You dissolve into nothing but warm fluids inside [owner]'s womb.</span>"
				digestion_death(M)
				continue

			if(air_master.current_cycle%3==1)
				if(!(M.status_flags & GODMODE))
					M.adjustBruteLoss(2)
					M.adjustFireLoss(3)

		//WOMB TRANSFORM (FEM)
		if(ishuman(M) && ishuman(owner) && owner.stat != DEAD && digest_mode == "Transform (Female)" && M.stat != DEAD)
			var/mob/living/carbon/human/P = M
			var/mob/living/carbon/human/O = owner

			if(air_master.current_cycle%3==1)
				if(!(M.status_flags & GODMODE))

					var/TFchance = prob(10)
					if(TFchance == 1)
						var/TFmodify = rand(1,3)
						if(TFmodify == 1 && P.r_eyes != O.r_eyes || P.g_eyes != O.g_eyes || P.b_eyes != O.b_eyes)
							P.r_eyes = O.r_eyes
							P.g_eyes = O.g_eyes
							P.b_eyes = O.b_eyes
							P << "<span class='notice'>You feel lightheaded and drowsy...</span>"
							owner << "<span class='notice'>Your belly feels warm as your womb makes subtle changes to your captive's body.</span>"
							P.update_body()

						if(TFmodify == 2 && P.r_hair != O.r_hair || P.g_hair != O.g_hair || P.b_hair != O.b_hair || P.r_skin != O.r_skin || P.g_skin != O.g_skin || P.b_skin != O.b_skin)
							P.r_hair = O.r_hair
							P.g_hair = O.g_hair
							P.b_hair = O.b_hair
							P.r_skin = O.r_skin
							P.g_skin = O.g_skin
							P.b_skin = O.b_skin
							P.h_style = "Bedhead"
							P << "<span class='notice'>Your body tingles all over...</span>"
							owner << "<span class='notice'>Your belly tingles as your womb makes noticeable changes to your captive's body.</span>"
							P.update_hair()
							P.update_body()

						if(TFmodify == 3 && P.gender != FEMALE)
							P.f_style = "Shaved"
							P.gender = FEMALE
							P << "<span class='notice'>Your body feels very strange...</span>"
							owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
							P.update_body()

					M.adjustBruteLoss(-1)
					M.adjustFireLoss(-1)

					if(O.nutrition > 0)
						O.nutrition -= 2
					if(P.nutrition < 400)
						P.nutrition += 1

		//WOMB TRANSFORM (MALE)
		if(ishuman(M) && ishuman(owner) && owner.stat != DEAD && digest_mode == "Transform (Male)" && M.stat != DEAD)
			var/mob/living/carbon/human/P = M
			var/mob/living/carbon/human/O = owner

			if(air_master.current_cycle%3==1)
				if(!(M.status_flags & GODMODE))

					var/TFchance = prob(10)
					if(TFchance == 1)

						var/TFmodify = rand(1,3)
						if(TFmodify == 1 && P.r_eyes != O.r_eyes || P.g_eyes != O.g_eyes || P.b_eyes != O.b_eyes)
							P.r_eyes = O.r_eyes
							P.g_eyes = O.g_eyes
							P.b_eyes = O.b_eyes
							P << "<span class='notice'>You feel lightheaded and drowsy...</span>"
							owner << "<span class='notice'>Your belly feels warm as your womb makes subtle changes to your captive's body.</span>"
							P.update_body()

						if(TFmodify == 2 && P.r_hair != O.r_hair || P.g_hair != O.g_hair || P.b_hair != O.b_hair || P.r_skin != O.r_skin || P.g_skin != O.g_skin || P.b_skin != O.b_skin)
							P.r_hair = O.r_hair
							P.r_facial = O.r_hair
							P.g_hair = O.g_hair
							P.g_facial = O.g_hair
							P.b_hair = O.b_hair
							P.b_facial = O.b_hair
							P.r_skin = O.r_skin
							P.g_skin = O.g_skin
							P.b_skin = O.b_skin
							P.h_style = "Bedhead"
							P << "<span class='notice'>Your body tingles all over...</span>"
							owner << "<span class='notice'>Your belly tingles as your womb makes noticeable changes to your captive's body.</span>"
							P.update_hair()
							P.update_body()

						if(TFmodify == 3 && P.gender != MALE)
							P.gender = MALE
							P << "<span class='notice'>Your body feels very strange...</span>"
							owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
							P.update_body()

					M.adjustBruteLoss(-1)
					M.adjustFireLoss(-1)

					if(O.nutrition > 0)
						O.nutrition -= 2
					if(P.nutrition < 400)
						P.nutrition += 1

		//WOMB TRANSFORM (KEEP GENDER)
		if(ishuman(M) && ishuman(owner) && owner.stat != DEAD && digest_mode == "Transform (Keep Gender)" && M.stat != DEAD)
			var/mob/living/carbon/human/P = M
			var/mob/living/carbon/human/O = owner

			if(air_master.current_cycle%3==1)
				if(!(M.status_flags & GODMODE))

					var/TFchance = prob(10)
					if(TFchance == 1)

						var/TFmodify = rand(1,2)
						if(TFmodify == 1 && P.r_eyes != O.r_eyes || P.g_eyes != O.g_eyes || P.b_eyes != O.b_eyes)
							P.r_eyes = O.r_eyes
							P.g_eyes = O.g_eyes
							P.b_eyes = O.b_eyes
							P << "<span class='notice'>You feel lightheaded and drowsy...</span>"
							owner << "<span class='notice'>Your belly feels warm as your womb makes subtle changes to your captive's body.</span>"
							P.update_body()

						if(TFmodify == 2 && P.r_hair != O.r_hair || P.g_hair != O.g_hair || P.b_hair != O.b_hair || P.r_skin != O.r_skin || P.g_skin != O.g_skin || P.b_skin != O.b_skin)
							P.r_hair = O.r_hair
							P.r_facial = O.r_hair
							P.g_hair = O.g_hair
							P.g_facial = O.g_hair
							P.b_hair = O.b_hair
							P.b_facial = O.b_hair
							P.r_skin = O.r_skin
							P.g_skin = O.g_skin
							P.b_skin = O.b_skin
							P.h_style = "Bedhead"
							P << "<span class='notice'>Your body tingles all over...</span>"
							owner << "<span class='notice'>Your belly tingles as your womb makes noticeable changes to your captive's body.</span>"
							P.update_hair()
							P.update_body()

					M.adjustBruteLoss(-1)
					M.adjustFireLoss(-1)

					if(O.nutrition > 0)
						O.nutrition -= 2
					if(P.nutrition < 400)
						P.nutrition += 1

		//WOMB TRANSFORM (CHANGE SPECIES)
		if(ishuman(M) && ishuman(owner) && owner.stat != DEAD && digest_mode == "Transform (Change Species)" && M.stat != DEAD)
			var/mob/living/carbon/human/P = M
			var/mob/living/carbon/human/O = owner

			if(air_master.current_cycle%3==1)
				if(!(M.status_flags & GODMODE))

					var/TFchance = prob(10)
					if(TFchance == 1)
						var/TFmodify = rand(1,3)
						if(TFmodify == 1 && P.r_eyes != O.r_eyes || P.g_eyes != O.g_eyes || P.b_eyes != O.b_eyes)
							P.r_eyes = O.r_eyes
							P.g_eyes = O.g_eyes
							P.b_eyes = O.b_eyes
							P << "<span class='notice'>You feel lightheaded and drowsy...</span>"
							owner << "<span class='notice'>Your belly feels warm as your womb makes subtle changes to your captive's body.</span>"
							P.update_body()

						if(TFmodify == 2 && P.r_hair != O.r_hair || P.g_hair != O.g_hair || P.b_hair != O.b_hair || P.r_skin != O.r_skin || P.g_skin != O.g_skin || P.b_skin != O.b_skin)
							P.r_hair = O.r_hair
							P.r_facial = O.r_hair
							P.g_hair = O.g_hair
							P.g_facial = O.g_hair
							P.b_hair = O.b_hair
							P.b_facial = O.b_hair
							P.r_skin = O.r_skin
							P.g_skin = O.g_skin
							P.b_skin = O.b_skin
							P.h_style = "Bedhead"
							P << "<span class='notice'>Your body tingles all over...</span>"
							owner << "<span class='notice'>Your belly tingles as your womb makes noticeable changes to your captive's body.</span>"
							P.update_hair()
							P.update_body()
							//Omitted clause : P.race_icon != O.race_icon
							//No idea how to work with that one, species system got changed a lot
							//Also this makes it similar to the previous one until fixed

						if(TFmodify == 3 && P.r_hair != O.r_hair || P.g_hair != O.g_hair || P.b_hair != O.b_hair || P.r_skin != O.r_skin || P.g_skin != O.g_skin || P.b_skin != O.b_skin || P.taur != O.taur || P.r_taur != O.r_taur || P.g_taur != O.g_taur || P.b_taur != O.b_taur)
							P.r_hair = O.r_hair
							P.r_facial = O.r_hair
							P.g_hair = O.g_hair
							P.g_facial = O.g_hair
							P.b_hair = O.b_hair
							P.b_facial = O.b_hair
							P.r_skin = O.r_skin
							P.g_skin = O.g_skin
							P.b_skin = O.b_skin
							P.taur = O.taur
							P.r_taur = O.r_taur
							P.g_taur = O.g_taur
							P.b_taur = O.b_taur
							P.h_style = "Bedhead"
							P.species = O.species
							P << "<span class='notice'>You lose sensation of your body, feeling only the warmth of the womb... </span>"
							owner << "<span class='notice'>Your belly shifts as your womb makes dramatic changes to your captive's body.</span>"
							P.update_hair()
							P.update_body()
							P.update_tail_showing()

					M.adjustBruteLoss(-1)
					M.adjustFireLoss(-1)

					if(O.nutrition > 0)
						O.nutrition -= 2
					if(P.nutrition < 400)
						P.nutrition += 1


		//WOMB TRANSFORM (EGG) Credit to Vorrakul with helping me out, and credit to Nightwing! Also, additional credit to Ace for providing support and suggestions, and helping me persevere through coding this masterpeice (see: Horrid mess) mess! ~CK (Note: I totally forgot to accredite someone important. Whoops!)
		if(ishuman(M) && ishuman(owner) && owner.stat != DEAD && digest_mode == "Transform (Change Species) (EGG)" && M.stat != DEAD)
			var/mob/living/carbon/human/P = M
			var/mob/living/carbon/human/O = owner

			if(O.species.name == "Unathi")
				var/obj/structure/closet/secure_closet/egg/unathi/J = new /obj/structure/closet/secure_closet/egg/unathi(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.taur = O.taur
					P.r_taur = O.r_taur
					P.g_taur = O.g_taur
					P.b_taur = O.b_taur
					P.h_style = "Bedhead"
					P.species = O.species
					P.custom_species = O.custom_species
					P << "<span class='notice'>You lose sensation of your body, feeling only the warmth of the womb as you're encased in an egg. </span>"
					owner << "<span class='notice'>Your belly shifts as your womb makes dramatic changes to your captive's body as you encase them in an egg.</span>"
					P.update_hair()
					P.update_body()
					P.update_tail_showing()
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.taur = O.taur
					P.r_taur = O.r_taur
					P.g_taur = O.g_taur
					P.b_taur = O.b_taur
					P.h_style = "Bedhead"
					P.species = O.species
					P.custom_species = O.custom_species
					P << "<span class='notice'>You lose sensation of your body, feeling only the warmth of the womb as you're encased in an egg. </span>"
					owner << "<span class='notice'>Your belly shifts as your womb makes dramatic changes to your captive's body as you encase them in an egg.</span>"
					P.update_hair()
					P.update_body()
					P.update_tail_showing()
					P.loc = J
					J.name = "[defined_species] egg"

			if(O.species.name == "Tajara")
				var/obj/structure/closet/secure_closet/egg/tajaran/J = new /obj/structure/closet/secure_closet/egg/tajaran(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.taur = O.taur
					P.r_taur = O.r_taur
					P.g_taur = O.g_taur
					P.b_taur = O.b_taur
					P.h_style = "Bedhead"
					P.species = O.species
					P.custom_species = O.custom_species
					P << "<span class='notice'>You lose sensation of your body, feeling only the warmth of the womb as you're encased in an egg. </span>"
					owner << "<span class='notice'>Your belly shifts as your womb makes dramatic changes to your captive's body as you encase them in an egg.</span>"
					P.update_hair()
					P.update_body()
					P.update_tail_showing()
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.taur = O.taur
					P.r_taur = O.r_taur
					P.g_taur = O.g_taur
					P.b_taur = O.b_taur
					P.h_style = "Bedhead"
					P.species = O.species
					P.custom_species = O.custom_species
					P << "<span class='notice'>You lose sensation of your body, feeling only the warmth of the womb as you're encased in an egg. </span>"
					owner << "<span class='notice'>Your belly shifts as your womb makes dramatic changes to your captive's body as you encase them in an egg.</span>"
					P.update_hair()
					P.update_body()
					P.update_tail_showing()
					P.loc = J
					J.name = "[defined_species] egg"

			if(O.species.name == "Skrell")
				var/obj/structure/closet/secure_closet/egg/skrell/J = new /obj/structure/closet/secure_closet/egg/skrell(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.taur = O.taur
					P.r_taur = O.r_taur
					P.g_taur = O.g_taur
					P.b_taur = O.b_taur
					P.h_style = "Bedhead"
					P.species = O.species
					P.custom_species = O.custom_species
					P << "<span class='notice'>You lose sensation of your body, feeling only the warmth of the womb as you're encased in an egg. </span>"
					owner << "<span class='notice'>Your belly shifts as your womb makes dramatic changes to your captive's body as you encase them in an egg.</span>"
					P.update_hair()
					P.update_body()
					P.update_tail_showing()
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.taur = O.taur
					P.r_taur = O.r_taur
					P.g_taur = O.g_taur
					P.b_taur = O.b_taur
					P.h_style = "Bedhead"
					P.species = O.species
					P.custom_species = O.custom_species
					P << "<span class='notice'>You lose sensation of your body, feeling only the warmth of the womb as you're encased in an egg. </span>"
					owner << "<span class='notice'>Your belly shifts as your womb makes dramatic changes to your captive's body as you encase them in an egg.</span>"
					P.update_hair()
					P.update_body()
					P.update_tail_showing()
					P.loc = J
					J.name = "[defined_species] egg"

			if(O.species.name == "Sergal")
				var/obj/structure/closet/secure_closet/egg/sergal/J = new /obj/structure/closet/secure_closet/egg/sergal(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.taur = O.taur
					P.r_taur = O.r_taur
					P.g_taur = O.g_taur
					P.b_taur = O.b_taur
					P.h_style = "Bedhead"
					P.species = O.species
					P.custom_species = O.custom_species
					P << "<span class='notice'>You lose sensation of your body, feeling only the warmth of the womb as you're encased in an egg. </span>"
					owner << "<span class='notice'>Your belly shifts as your womb makes dramatic changes to your captive's body as you encase them in an egg.</span>"
					P.update_hair()
					P.update_body()
					P.update_tail_showing()
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."

				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.taur = O.taur
					P.r_taur = O.r_taur
					P.g_taur = O.g_taur
					P.b_taur = O.b_taur
					P.h_style = "Bedhead"
					P.species = O.species
					P.custom_species = O.custom_species
					P << "<span class='notice'>You lose sensation of your body, feeling only the warmth of the womb as you're encased in an egg. </span>"
					owner << "<span class='notice'>Your belly shifts as your womb makes dramatic changes to your captive's body as you encase them in an egg.</span>"
					P.update_hair()
					P.update_body()
					P.update_tail_showing()
					P.loc = J
					J.name = "[defined_species] egg"

			if(O.species.name == "Akula")
				var/obj/structure/closet/secure_closet/egg/shark/J = new /obj/structure/closet/secure_closet/egg/shark(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.taur = O.taur
					P.r_taur = O.r_taur
					P.g_taur = O.g_taur
					P.b_taur = O.b_taur
					P.h_style = "Bedhead"
					P.species = O.species
					P.custom_species = O.custom_species
					P << "<span class='notice'>You lose sensation of your body, feeling only the warmth of the womb as you're encased in an egg. </span>"
					owner << "<span class='notice'>Your belly shifts as your womb makes dramatic changes to your captive's body as you encase them in an egg.</span>"
					P.update_hair()
					P.update_body()
					P.update_tail_showing()
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.taur = O.taur
					P.r_taur = O.r_taur
					P.g_taur = O.g_taur
					P.b_taur = O.b_taur
					P.h_style = "Bedhead"
					P.species = O.species
					P.custom_species = O.custom_species
					P << "<span class='notice'>You lose sensation of your body, feeling only the warmth of the womb as you're encased in an egg. </span>"
					owner << "<span class='notice'>Your belly shifts as your womb makes dramatic changes to your captive's body as you encase them in an egg.</span>"
					P.update_hair()
					P.update_body()
					P.update_tail_showing()
					P.loc = J
					J.name = "[defined_species] egg"

			if(O.species.name == "Nevrean")
				var/obj/structure/closet/secure_closet/egg/nevrean/J = new /obj/structure/closet/secure_closet/egg/nevrean(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.taur = O.taur
					P.r_taur = O.r_taur
					P.g_taur = O.g_taur
					P.b_taur = O.b_taur
					P.h_style = "Bedhead"
					P.species = O.species
					P.custom_species = O.custom_species
					P << "<span class='notice'>You lose sensation of your body, feeling only the warmth of the womb as you're encased in an egg. </span>"
					owner << "<span class='notice'>Your belly shifts as your womb makes dramatic changes to your captive's body as you encase them in an egg.</span>"
					P.update_hair()
					P.update_body()
					P.update_tail_showing()
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.taur = O.taur
					P.r_taur = O.r_taur
					P.g_taur = O.g_taur
					P.b_taur = O.b_taur
					P.h_style = "Bedhead"
					P.species = O.species
					P.custom_species = O.custom_species
					P << "<span class='notice'>You lose sensation of your body, feeling only the warmth of the womb as you're encased in an egg. </span>"
					owner << "<span class='notice'>Your belly shifts as your womb makes dramatic changes to your captive's body as you encase them in an egg.</span>"
					P.update_hair()
					P.update_body()
					P.update_tail_showing()
					P.loc = J
					J.name = "[defined_species] egg"

			if(O.species.name == "Human")
				var/obj/structure/closet/secure_closet/egg/human/J = new /obj/structure/closet/secure_closet/egg/human(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.taur = O.taur
					P.r_taur = O.r_taur
					P.g_taur = O.g_taur
					P.b_taur = O.b_taur
					P.h_style = "Bedhead"
					P.species = O.species
					P.custom_species = O.custom_species
					P << "<span class='notice'>You lose sensation of your body, feeling only the warmth of the womb as you're encased in an egg. </span>"
					owner << "<span class='notice'>Your belly shifts as your womb makes dramatic changes to your captive's body as you encase them in an egg.</span>"
					P.update_hair()
					P.update_body()
					P.update_tail_showing()
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."

				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.taur = O.taur
					P.r_taur = O.r_taur
					P.g_taur = O.g_taur
					P.b_taur = O.b_taur
					P.h_style = "Bedhead"
					P.species = O.species
					P.custom_species = O.custom_species
					P << "<span class='notice'>You lose sensation of your body, feeling only the warmth of the womb as you're encased in an egg. </span>"
					owner << "<span class='notice'>Your belly shifts as your womb makes dramatic changes to your captive's body as you encase them in an egg.</span>"
					P.update_hair()
					P.update_body()
					P.update_tail_showing()
					P.loc = J
					J.name = "[defined_species] egg"

			if(O.species.name == "Slime Person")
				var/obj/structure/closet/secure_closet/egg/slime/J = new /obj/structure/closet/secure_closet/egg/slime(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.taur = O.taur
					P.r_taur = O.r_taur
					P.g_taur = O.g_taur
					P.b_taur = O.b_taur
					P.h_style = "Bedhead"
					P.species = O.species
					P.custom_species = O.custom_species
					P << "<span class='notice'>You lose sensation of your body, feeling only the warmth of the womb as you're encased in an egg. </span>"
					owner << "<span class='notice'>Your belly shifts as your womb makes dramatic changes to your captive's body as you encase them in an egg.</span>"
					P.update_hair()
					P.update_body()
					P.update_tail_showing()
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.taur = O.taur
					P.r_taur = O.r_taur
					P.g_taur = O.g_taur
					P.b_taur = O.b_taur
					P.h_style = "Bedhead"
					P.species = O.species
					P.custom_species = O.custom_species
					P << "<span class='notice'>You lose sensation of your body, feeling only the warmth of the womb as you're encased in an egg. </span>"
					owner << "<span class='notice'>Your belly shifts as your womb makes dramatic changes to your captive's body as you encase them in an egg.</span>"
					P.update_hair()
					P.update_body()
					P.update_tail_showing()
					P.loc = J
					J.name = "[defined_species] egg"


		if(ishuman(M) && ishuman(owner) && owner.stat != DEAD && digest_mode == "Transform (Keep Gender) (EGG)" && M.stat != DEAD)
			var/mob/living/carbon/human/P = M
			var/mob/living/carbon/human/O = owner

			if(O.species.name == "Unathi")
				var/obj/structure/closet/secure_closet/egg/unathi/J = new /obj/structure/closet/secure_closet/egg/unathi(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P << "<span class='notice'>Your body tingles all over...</span>"
					owner << "<span class='notice'>Your belly tingles as your womb makes noticeable changes to your captive's body.</span>"
					P.update_hair()
					P.update_body()
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."

				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P << "<span class='notice'>Your body tingles all over...</span>"
					owner << "<span class='notice'>Your belly tingles as your womb makes noticeable changes to your captive's body.</span>"
					P.update_hair()
					P.update_body()
					P.loc = J
					J.name = "[defined_species] egg"

			if(O.species.name == "Tajara")
				var/obj/structure/closet/secure_closet/egg/tajaran/J = new /obj/structure/closet/secure_closet/egg/tajaran(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P << "<span class='notice'>Your body tingles all over...</span>"
					owner << "<span class='notice'>Your belly tingles as your womb makes noticeable changes to your captive's body.</span>"
					P.update_hair()
					P.update_body()
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P << "<span class='notice'>Your body tingles all over...</span>"
					owner << "<span class='notice'>Your belly tingles as your womb makes noticeable changes to your captive's body.</span>"
					P.update_hair()
					P.update_body()
					P.loc = J
					J.name = "[defined_species] egg"

			if(O.species.name == "Skrell")
				var/obj/structure/closet/secure_closet/egg/skrell/J = new /obj/structure/closet/secure_closet/egg/skrell(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P << "<span class='notice'>Your body tingles all over...</span>"
					owner << "<span class='notice'>Your belly tingles as your womb makes noticeable changes to your captive's body.</span>"
					P.update_hair()
					P.update_body()
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P << "<span class='notice'>Your body tingles all over...</span>"
					owner << "<span class='notice'>Your belly tingles as your womb makes noticeable changes to your captive's body.</span>"
					P.update_hair()
					P.update_body()
					P.loc = J
					J.name = "[defined_species] egg"

			if(O.species.name == "Sergal")
				var/obj/structure/closet/secure_closet/egg/sergal/J = new /obj/structure/closet/secure_closet/egg/sergal(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P << "<span class='notice'>Your body tingles all over...</span>"
					owner << "<span class='notice'>Your belly tingles as your womb makes noticeable changes to your captive's body.</span>"
					P.update_hair()
					P.update_body()
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P << "<span class='notice'>Your body tingles all over...</span>"
					owner << "<span class='notice'>Your belly tingles as your womb makes noticeable changes to your captive's body.</span>"
					P.update_hair()
					P.update_body()
					P.loc = J
					J.name = "[defined_species] egg"

			if(O.species.name == "Akula")
				var/obj/structure/closet/secure_closet/egg/shark/J = new /obj/structure/closet/secure_closet/egg/shark(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P << "<span class='notice'>Your body tingles all over...</span>"
					owner << "<span class='notice'>Your belly tingles as your womb makes noticeable changes to your captive's body.</span>"
					P.update_hair()
					P.update_body()
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P << "<span class='notice'>Your body tingles all over...</span>"
					owner << "<span class='notice'>Your belly tingles as your womb makes noticeable changes to your captive's body.</span>"
					P.update_hair()
					P.update_body()
					P.loc = J
					J.name = "[defined_species] egg"

			if(O.species.name == "Nevrean")
				var/obj/structure/closet/secure_closet/egg/nevrean/J = new /obj/structure/closet/secure_closet/egg/nevrean(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P << "<span class='notice'>Your body tingles all over...</span>"
					owner << "<span class='notice'>Your belly tingles as your womb makes noticeable changes to your captive's body.</span>"
					P.update_hair()
					P.update_body()
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P << "<span class='notice'>Your body tingles all over...</span>"
					owner << "<span class='notice'>Your belly tingles as your womb makes noticeable changes to your captive's body.</span>"
					P.update_hair()
					P.update_body()
					P.loc = J
					J.name = "[defined_species] egg"

			if(O.species.name == "Human")
				var/obj/structure/closet/secure_closet/egg/human/J = new /obj/structure/closet/secure_closet/egg/human(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P << "<span class='notice'>Your body tingles all over...</span>"
					owner << "<span class='notice'>Your belly tingles as your womb makes noticeable changes to your captive's body.</span>"
					P.update_hair()
					P.update_body()
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P << "<span class='notice'>Your body tingles all over...</span>"
					owner << "<span class='notice'>Your belly tingles as your womb makes noticeable changes to your captive's body.</span>"
					P.update_hair()
					P.update_body()
					P.loc = J
					J.name = "[defined_species] egg"

			if(O.species.name == "Slime Person")
				var/obj/structure/closet/secure_closet/egg/slime/J = new /obj/structure/closet/secure_closet/egg/slime(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P << "<span class='notice'>Your body tingles all over...</span>"
					owner << "<span class='notice'>Your belly tingles as your womb makes noticeable changes to your captive's body.</span>"
					P.update_hair()
					P.update_body()
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P << "<span class='notice'>Your body tingles all over...</span>"
					owner << "<span class='notice'>Your belly tingles as your womb makes noticeable changes to your captive's body.</span>"
					P.update_hair()
					P.update_body()
					P.loc = J
					J.name = "[defined_species] egg"


		if(ishuman(M) && ishuman(owner) && owner.stat != DEAD && digest_mode == "Transform (Male) (EGG)" && M.stat != DEAD)
			var/mob/living/carbon/human/P = M
			var/mob/living/carbon/human/O = owner

			if(O.species.name == "Unathi")
				var/obj/structure/closet/secure_closet/egg/unathi/J = new /obj/structure/closet/secure_closet/egg/unathi(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = MALE
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = MALE
					P.loc = J
					J.name = "[defined_species] egg"
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()

			if(O.species.name == "Tajara")
				var/obj/structure/closet/secure_closet/egg/tajaran/J = new /obj/structure/closet/secure_closet/egg/tajaran(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = MALE
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = MALE
					P.loc = J
					J.name = "[defined_species] egg"
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()

			if(O.species.name == "Skrell")
				var/obj/structure/closet/secure_closet/egg/skrell/J = new /obj/structure/closet/secure_closet/egg/skrell(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = MALE
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = MALE
					P.loc = J
					J.name = "[defined_species] egg"
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()

			if(O.species.name == "Sergal")
				var/obj/structure/closet/secure_closet/egg/sergal/J = new /obj/structure/closet/secure_closet/egg/sergal(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = MALE
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = MALE
					P.loc = J
					J.name = "[defined_species] egg"
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()

			if(O.species.name == "Akula")
				var/obj/structure/closet/secure_closet/egg/shark/J = new /obj/structure/closet/secure_closet/egg/shark(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = MALE
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = MALE
					P.loc = J
					J.name = "[defined_species] egg"
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()

			if(O.species.name == "Nevrean")
				var/obj/structure/closet/secure_closet/egg/nevrean/J = new /obj/structure/closet/secure_closet/egg/nevrean(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = MALE
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = MALE
					P.loc = J
					J.name = "[defined_species] egg"
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()

			if(O.species.name == "Human")
				var/obj/structure/closet/secure_closet/egg/human/J = new /obj/structure/closet/secure_closet/egg/human(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = MALE
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = MALE
					P.loc = J
					J.name = "[defined_species] egg"
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()

			if(O.species.name == "Slime Person")
				var/obj/structure/closet/secure_closet/egg/slime/J = new /obj/structure/closet/secure_closet/egg/slime(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = MALE
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = MALE
					P.loc = J
					J.name = "[defined_species] egg"
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()


		if(ishuman(M) && ishuman(owner) && owner.stat != DEAD && digest_mode == "Transform (Female) (EGG)" && M.stat != DEAD)
			var/mob/living/carbon/human/P = M
			var/mob/living/carbon/human/O = owner

			if(O.species.name == "Unathi")
				var/obj/structure/closet/secure_closet/egg/unathi/J = new /obj/structure/closet/secure_closet/egg/unathi(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = FEMALE
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = FEMALE
					P.loc = J
					J.name = "[defined_species] egg"
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()

			if(O.species.name == "Tajara")
				var/obj/structure/closet/secure_closet/egg/tajaran/J = new /obj/structure/closet/secure_closet/egg/tajaran(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = FEMALE
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = FEMALE
					P.loc = J
					J.name = "[defined_species] egg"
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()

			if(O.species.name == "Skrell")
				var/obj/structure/closet/secure_closet/egg/skrell/J = new /obj/structure/closet/secure_closet/egg/skrell(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = FEMALE
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = FEMALE
					P.loc = J
					J.name = "[defined_species] egg"
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()

			if(O.species.name == "Sergal")
				var/obj/structure/closet/secure_closet/egg/sergal/J = new /obj/structure/closet/secure_closet/egg/sergal(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = FEMALE
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = FEMALE
					P.loc = J
					J.name = "[defined_species] egg"
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()

			if(O.species.name == "Akula")
				var/obj/structure/closet/secure_closet/egg/shark/J = new /obj/structure/closet/secure_closet/egg/shark(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = FEMALE
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = FEMALE
					P.loc = J
					J.name = "[defined_species] egg"
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()

			if(O.species.name == "Nevrean")
				var/obj/structure/closet/secure_closet/egg/nevrean/J = new /obj/structure/closet/secure_closet/egg/nevrean(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = FEMALE
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = FEMALE
					P.loc = J
					J.name = "[defined_species] egg"
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()

			if(O.species.name == "Human")
				var/obj/structure/closet/secure_closet/egg/human/J = new /obj/structure/closet/secure_closet/egg/human(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = FEMALE
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = FEMALE
					P.loc = J
					J.name = "[defined_species] egg"
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()

			if(O.species.name == "Slime Person")
				var/obj/structure/closet/secure_closet/egg/slime/J = new /obj/structure/closet/secure_closet/egg/slime(O.loc)
				if (O.custom_species)
					var/defined_species = O.custom_species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = FEMALE
					P.loc = J
					J.name = "[defined_species] egg"
					J.desc = "This egg has a very unique look to it."
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()
				else
					var/defined_species = O.species
					P.r_hair = O.r_hair
					P.r_facial = O.r_hair
					P.g_hair = O.g_hair
					P.g_facial = O.g_hair
					P.b_hair = O.b_hair
					P.b_facial = O.b_hair
					P.r_skin = O.r_skin
					P.g_skin = O.g_skin
					P.b_skin = O.b_skin
					P.h_style = "Bedhead"
					P.gender = FEMALE
					P.loc = J
					J.name = "[defined_species] egg"
					P << "<span class='notice'>Your body feels very strange...</span>"
					owner << "<span class='notice'>Your belly feels strange as your womb alters your captive's gender.</span>"
					P.update_hair()
					P.update_body()

		if(iscarbon(M) && owner.stat != DEAD && digest_mode == DM_ABSORB && M.stat != DEAD)
			if(M.nutrition > 2) //Drain them until there's no nutrients left. Slowly "absorb" them.
				M.nutrition -= 2
				owner.nutrition += 2
			else if(M.nutrition < 2) //When they're finally drained.
				var/mob/living/O = owner
				var/datum/belly/B = O.vore_organs["Absorbed"]
				M << "<span class='notice'>[owner]'s womb absorbs your body, making you part of them.</span>"
				owner << "<span class='notice'>Your womb absorbs [M]'s body, making them part of you.</span>"
				src.internal_contents -= M //Removes them from vore organ when absorbed.
				B.internal_contents   += M
				M.loc = owner //Moves them.