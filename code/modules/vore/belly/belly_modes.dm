// Process the predator's effects upon the contents of its belly (i.e digestion/transformation etc)
// Called from /mob/living/Life() proc.
/datum/belly/proc/process_Life()

///////////////////////////// TIMER /////////////////////////////
	if(!internal_contents.len || air_master.current_cycle%3 != 1 || owner.stat == DEAD)
		return

//////////////////////// Absorbed Handling ////////////////////////
	if(internal_contents.len)
		for(var/mob/living/M in internal_contents)
			if(M.absorbed)
				M.Weaken(5)

///////////////////////////// DM_HOLD /////////////////////////////
	if(digest_mode == DM_HOLD)
		return //Pretty boring, huh


//////////////////////////// DM_DIGEST ////////////////////////////
	if(digest_mode == DM_DIGEST)

		if(prob(50)) //Was SO OFTEN. AAAA.
			var/churnsound = pick(digestion_sounds)
			for(var/mob/hearer in range(1,owner))
				hearer << sound(churnsound,volume=80)

		for (var/mob/living/M in internal_contents)
			//Pref protection!
			if (!M.digestable)
				continue

			//Person just died in guts!
			if(M.stat == DEAD)
				var/digest_alert_owner = pick(digest_messages_owner)
				var/digest_alert_prey = pick(digest_messages_prey)

				//Replace placeholder vars
				digest_alert_owner = bayreplacetext(digest_alert_owner,"%pred",owner)
				digest_alert_owner = bayreplacetext(digest_alert_owner,"%prey",M)
				digest_alert_owner = bayreplacetext(digest_alert_owner,"%belly",name)

				digest_alert_prey = bayreplacetext(digest_alert_prey,"%pred",owner)
				digest_alert_prey = bayreplacetext(digest_alert_prey,"%prey",M)
				digest_alert_prey = bayreplacetext(digest_alert_prey,"%belly",name)

				//Send messages
				owner << "<span class='notice'>" + digest_alert_owner + "</span>"
				M << "<span class='notice'>" + digest_alert_prey + "</span>"

				owner.nutrition += 20 // so eating dead mobs gives you *something*.
				var/deathsound = pick(death_sounds)
				for(var/mob/hearer in range(1,owner))
					hearer << deathsound
				digestion_death(M)
				continue

			// Deal digestion damage (and feed the pred)
			if(!(M.status_flags & GODMODE))
				M.adjustBruteLoss(2)
				M.adjustFireLoss(3)
				var/offset
				if (M.weight > 137)
					offset = 1 + ((M.weight - 137) / 137)
				if (M.weight < 137)
					offset = (137 - M.weight) / 137
				var/difference = owner.playerscale / M.playerscale
				if(offset) // If any different than default weight, multiply the % of offset.
					owner.nutrition += offset*(10/difference)
				else
					owner.nutrition += (10/difference)
		return


//////////////////////////// DM_ABSORB ////////////////////////////
	if(digest_mode == DM_ABSORB)

		for (var/mob/living/M in internal_contents)

			if(prob(10)) //Less often than gurgles. People might leave this on forever.
				var/absorbsound = pick(digestion_sounds)
				M << sound(absorbsound,volume=80)
				owner << sound(absorbsound,volume=80)

			if(M.absorbed)
				continue

			if(M.nutrition >= 4) //Drain them until there's no nutrients left. Slowly "absorb" them.
				M.nutrition -= 3
				owner.nutrition += 3
			else if(M.nutrition < 4) //When they're finally drained.
				absorb_living(M)

		return

///////////////////////////// DM_HEAL /////////////////////////////
	if(digest_mode == DM_HEAL)
		if(prob(50)) //Wet heals!
			var/healsound = pick(digestion_sounds)
			for(var/mob/hearer in range(1,owner))
				hearer << sound(healsound,volume=80)

		for (var/mob/living/M in internal_contents)
			if(M.stat != DEAD)
				if(owner.nutrition > 90 && (M.health < M.maxHealth))
					M.adjustBruteLoss(-5)
					M.adjustFireLoss(-5)
					owner.nutrition -= 2
					if(M.nutrition <= 400)
						M.nutrition += 1
		return


// @Override
/datum/belly/relay_struggle(var/mob/user, var/direction)
	if (!(user in internal_contents) || recent_struggle)
		return  // User is not in this belly, or struggle too soon.

	recent_struggle = 1
	spawn(25)
		recent_struggle = 0

	//if(prob(80)) //Using the cooldown above to prevent spam instead
	var/struggle_outer_message = pick(struggle_messages_outside)
	var/struggle_user_message = pick(struggle_messages_inside)

	struggle_outer_message = bayreplacetext(struggle_outer_message,"%pred",owner)
	struggle_outer_message = bayreplacetext(struggle_outer_message,"%prey",user)
	struggle_outer_message = bayreplacetext(struggle_outer_message,"%belly",name)

	struggle_user_message = bayreplacetext(struggle_user_message,"%pred",owner)
	struggle_user_message = bayreplacetext(struggle_user_message,"%prey",user)
	struggle_user_message = bayreplacetext(struggle_user_message,"%belly",name)

	struggle_outer_message = "<span class='alert'>" + struggle_outer_message + "</span>"
	struggle_user_message = "<span class='alert'>" + struggle_user_message + "</span>"

	for(var/mob/M in hearers(4, owner))
		M.show_message(struggle_outer_message, 2) // hearable
	user << struggle_user_message

	switch(rand(1,4))
		if(1)
			playsound(user.loc, 'sound/vore/squish1.ogg', 50, 1)
		if(2)
			playsound(user.loc, 'sound/vore/squish2.ogg', 50, 1)
		if(3)
			playsound(user.loc, 'sound/vore/squish3.ogg', 50, 1)
		if(4)
			playsound(user.loc, 'sound/vore/squish4.ogg', 50, 1)
