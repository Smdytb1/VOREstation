//
// Implementation of Cock vore via "cock" belly type
//

/datum/belly/cock
	belly_type = "Cock"
	belly_name = "balls"
	inside_flavor = "Generic sac description"

// @Override
/datum/belly/cock/get_examine_msg(t_He, t_his, t_him, t_has, t_is)
	if(internal_contents.len || is_full == 1)
		return "[t_He] has a throbbing large sack below [t_his] hips!\n"

// @Override
/datum/belly/cock/toggle_digestion()
	digest_mode = input("Stomach Mode") in list("Hold", "Digest", "Absorb")
	switch (digest_mode)
		if("Digest")
			owner << "<span class='notice'>You will now digest people.</span>"
		if("Hold")
			owner << "<span class='notice'>You will now harmlessly hold people.</span>"
		if("Absorb")
			owner << "<span class='notice'>You will now absorb people and make them part of you..</span>"

// @Override
/datum/belly/cock/process_Life()
	for(var/mob/living/M in internal_contents)
		if(istype(M, /mob/living/carbon/human))
			var/mob/living/carbon/human/R = M
			if(!R.digestable)
				continue

		if(owner.stat != DEAD && digest_mode == DM_DIGEST) // For some reason this can't be checked in the if statement below.
			if(iscarbon(M) || isanimal(M)) // If human or simple mob and you're set to digest.
				if(M.stat == DEAD)
					owner << "<span class='notice'>You feel [M] dissolve into hot cum in your throbbing, swollen groin.</span>"
					M << "<span class='notice'>You dissolve into hot cum in [owner]'s throbbing, swollen groin.</span>"
					digestion_death(M)
					continue

				// Deal digestion damage
				if(air_master.current_cycle%3==1)
					if(!(M.status_flags & GODMODE))
						M.adjustBruteLoss(2)
						M.adjustFireLoss(3)

		if(iscarbon(M) && owner.stat != DEAD && digest_mode == DM_ABSORB && M.stat != DEAD)
			if(M.nutrition > 2) //Drain them until there's no nutrients left. Slowly "absorb" them.
				M.nutrition -= 2
				owner.nutrition += 2
			else if(M.nutrition < 2) //When they're finally drained.
				var/mob/living/O = owner
				var/datum/belly/B = O.vore_organs["Absorbed"]
				M << "<span class='notice'>[owner]'s balls absorbs your body, making you part of them.</span>"
				owner << "<span class='notice'>Your balls absorbs [M]'s body, making them part of you.</span>"
				src.internal_contents -= M //Removes them from vore organ when absorbed.
				B.internal_contents   += M
				M.loc = owner //Moves them.
