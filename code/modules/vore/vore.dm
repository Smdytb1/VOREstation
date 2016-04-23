
// Cross-defined vars to keep vore code isolated.

/mob/living
	var/digestable = 1					// Can the mob be digested inside a belly?
	var/datum/belly/vore_selected		// Default to no vore capability.
	var/list/vore_organs = list()		// List of vore containers inside a mob

/mob/living/simple_animal
	var/isPredator = 0 					//Are they capable of performing and pre-defined vore actions for their species?
	var/swallowTime = 30 				//How long it takes to eat its prey in 1/10 of a second. The default is 3 seconds.
	var/backoffTime = 50 				//How long to exclude an escaped mob from being re-eaten.
	var/gurgleTime = 600				//How long between stomach emotes at prey
	var/datum/belly/insides				//The place where food goes. Just one on mobs.
	var/list/prey_excludes = list()		//For excluding people from being eaten.

	//We have some default emotes for mobs to do to their prey.
	var/list/stomach_emotes = list(
									"The insides knead at you gently for a moment.",
									"The guts glorp wetly around you as some air shifts.",
									"Your predator takes a deep breath and sighs, shifting you somewhat.",
									"The stomach squeezes you tight for a moment, then relaxes.",
									"During a moment of quiet, breathing becomes the most audible thing.",
									"The warm slickness surrounds and kneads on you.")
	var/list/stomach_emotes_d = list(
									"The caustic acids eat away at your form.",
									"The acrid air burns at your lungs.",
									"Without a thought for you, the stomach grinds inwards painfully.",
									"The guts treat you like food, squeezing to press more acids against you.",
									"The onslaught against your body doesn't seem to be letting up; you're food now.",
									"The insides work on you like they would any other food.")
	var/list/digest_emotes = list()		//To send when digestion finishes

/mob/living/simple_animal/verb/toggle_digestion()
	set name = "Toggle Animal's Digestion"
	set desc = "Enables digestion on this mob for 20 minutes."
	set category = "Vore"
	set src in oview(1)

	if(insides.digest_mode == "Hold")
		var/confirm = alert(usr, "Enabling digestion on [name] will cause it to digest all stomach contents. Using this to break OOC prefs is against the rules. Digestion will disable itself after 20 minutes.", "Enabling [name]'s Digestion", "Enable", "Cancel")
		if(confirm == "Enable")
			insides.digest_mode = "Digest"
			spawn(12000) //12000=20 minutes
				if(src)	insides.digest_mode = "Hold"
	else
		var/confirm = alert(usr, "This mob is currently set to digest all stomach contents. Do you want to disable this?", "Disabling [name]'s Digestion", "Disable", "Cancel")
		if(confirm == "Disable")
			insides.digest_mode = "Hold"

//	This is an "interface" type.  No instances of this type will exist, but any type which is supposed
//  to be vore capable should implement the vars and procs defined here to be vore-compatible!
/vore/pred_capable
	var/list/vore_organs
	var/datum/voretype/vorifice

//
//	Check if an object is capable of eating things.
//	For now this is just simple_animals and carbons
//
/proc/is_vore_predator(var/mob/living/O)
	return (O != null && O.vore_selected)

//
//	Verb for toggling which orifice you eat people with!
//
/mob/living/proc/belly_select()
	set name = "Choose Belly"
	set category = "Vore"

	vore_selected = input("Choose Belly") in vore_organs
	src << "<span class='notice'>[vore_selected] selected.</span>"

//
//	Verb for toggling which orifice you eat people with!
// VTODO: Make this part of the inside panel (or whatever) instead
/mob/living/proc/vore_release()
	set name = "Release"
	set category = "Vore"
	var/release_organ = input("Choose Belly") in vore_organs

	if(release_organ) //Sanity
		var/datum/belly/belly = vore_organs[release_organ]
		if (belly.release_all_contents())
			visible_message("<font color='green'><b>[src] releases the contents of their [lowertext(belly)]!</b></font>")
			playsound(loc, 'sound/effects/splat.ogg', 50, 1)

	/*Sacrificed for generic message but also generic customizable bellies.
	switch(releaseorifice)
		if("Stomach (by Mouth)")
			var/datum/belly/belly = vore_organs["Stomach"]
			if (belly.release_all_contents())
				visible_message("<font color='green'><b>[src] hurls out the contents of their stomach!</b></font>")
				playsound(loc, 'sound/effects/splat.ogg', 50, 1)

		if("Stomach (by Anus)")
			var/datum/belly/belly = vore_organs["Stomach"]
			if (belly.release_all_contents())
				visible_message("<font color='green'><b>[src] releases their stomach contents out of their rear!</b></font>")
				playsound(loc, 'sound/effects/splat.ogg', 50, 1)

		if("Womb")
			var/datum/belly/belly = vore_organs["Womb"]
			if (belly.release_all_contents())
				visible_message("<font color='green'><b>[src] gushes out the contents of their womb!</b></font>")
				playsound(loc, 'sound/effects/splat.ogg', 50, 1)
			else if (belly.is_full)
				belly.is_full = 0
				visible_message("<span class='danger'>[src] gushes out a puddle of liquid from their folds!</span>")
				playsound(loc, 'sound/effects/splat.ogg', 50, 1)

		if("Cock")
			var/datum/belly/belly = vore_organs["Cock"]
			if (belly.release_all_contents())
				visible_message("<font color='green'><b>[src] splurts out the contents of their cock!</b></font>")
				playsound(loc, 'sound/effects/splat.ogg', 50, 1)
			else if (belly.is_full)
				belly.is_full = 0
				visible_message("<span class='danger'>[src] gushes out a puddle of cum from their cock!</span>")
				playsound(loc, 'sound/effects/splat.ogg', 50, 1)

		if("Breasts")
			var/datum/belly/belly = vore_organs["Boob"]
			if (belly.release_all_contents())
				visible_message("<font color='green'><b>[src] squirts out the contents of their breasts!</b></font>")
				playsound(loc, 'sound/effects/splat.ogg', 50, 1)
			else if(belly.is_full)
				belly.is_full = 0
				visible_message("<span class='danger'>[src] squirts out a puddle of milk from their breasts!</span>")
				playsound(loc, 'sound/effects/splat.ogg', 50, 1)
		if("Tail")
			var/datum/belly/belly = vore_organs["Tail"]
			if (belly.release_all_contents())
				visible_message("<font color='green'><b>[src] releases a few things from their tail!</b></font>")
				playsound(loc, 'sound/effects/splat.ogg', 50, 1)
			else if (belly.is_full)
				belly.is_full = 0
				visible_message("<span class='danger'>[src] releases a few things from their tail!</span>")
				playsound(loc, 'sound/effects/splat.ogg', 50, 1)

		if("Absorbed")
			var/datum/belly/belly = vore_organs["Absorbed"]
			if (belly.release_all_contents())
				visible_message("<font color='green'><b>[src] releases something from ther body!</b></font>")
				playsound(loc, 'sound/effects/splat.ogg', 50, 1)
			else if (belly.is_full)
				belly.is_full = 0
				visible_message("<span class='danger'>[src] releases something from their body!</span>") //They should never see this. Can't digest someone in you.
				playsound(loc, 'sound/effects/splat.ogg', 50, 1)
	*/

/////////////////////////////
////   OOC Escape Code	 ////
/////////////////////////////

/mob/living/proc/escapeOOC()
	set name = "OOC escape"
	set category = "Vore"

	//You're in an animal!
	if(istype(src.loc,/mob/living/simple_animal))
		var/mob/living/simple_animal/pred = src.loc
		var/confirm = alert(src, "You're in a mob. Don't use this as a trick to get out of hostile animals. This is for escaping from preference-breaking and if you're otherwise unable to escape from endo. If you are in more than one pred, use this more than once.", "Confirmation", "Okay", "Cancel")
		if(confirm == "Okay")
			pred.prey_excludes += src
			spawn(pred.backoffTime)
				if(pred)	pred.prey_excludes -= src
			pred.insides.release_specific_contents(src)
			message_admins("[key_name(src)] used the OOC escape button to get out of [key_name(pred)] (MOB) ([pred ? "<a href='?_src_=holder;adminplayerobservecoodjump=1;X=[pred.x];Y=[pred.y];Z=[pred.z]'>JMP</a>" : "null"])")

	//You're in a PC!
	else if(istype(src.loc,/mob/living/carbon))
		var/mob/living/carbon/pred = src.loc
		var/confirm = alert(src, "You're in a player-character. This is for escaping from preference-breaking and if your predator disconnects/AFKs. If you are in more than one pred, use this more than once. If your preferences were being broken, please admin-help as well.", "Confirmation", "Okay", "Cancel")
		if(confirm == "Okay")
			for(var/O in pred.vore_organs)
				var/datum/belly/CB = pred.vore_organs[O]
				CB.release_specific_contents(src)
			message_admins("[key_name(src)] used the OOC escape button to get out of [key_name(pred)] (PC) ([pred ? "<a href='?_src_=holder;adminplayerobservecoodjump=1;X=[pred.x];Y=[pred.y];Z=[pred.z]'>JMP</a>" : "null"])")

	//You're in a dogborg!
	else if(istype(src.loc, /obj/item/device/dogborg/sleeper))
		var/mob/living/silicon/pred = src.loc.loc //Thing holding the belly!
		var/obj/item/device/dogborg/sleeper/belly = src.loc //The belly!

		var/confirm = alert(src, "You're in a player-character cyborg. This is for escaping from preference-breaking and if your predator disconnects/AFKs. If your preferences were being broken, please admin-help as well.", "Confirmation", "Okay", "Cancel")
		if(confirm == "Okay")
			message_admins("[key_name(src)] used the OOC escape button to get out of [key_name(pred)] (BORG) ([pred ? "<a href='?_src_=holder;adminplayerobservecoodjump=1;X=[pred.x];Y=[pred.y];Z=[pred.z]'>JMP</a>" : "null"])")
			belly.go_out() //Just force-ejects from the borg as if they'd clicked the eject button.

			/* Use native code to avoid leaving vars all set wrong on the borg
			forceMove(get_turf(src)) //Since they're not in a vore organ, you can't eject them "normally"
			reset_view() //This will kick them out of the borg's stomach sleeper in case the borg goes AFK or whatnot.
			message_admins("[key_name(src)] used the OOC escape button to get out of a cyborg..") //Not much information,
			*/
	else
		src << "<span class='alert'>You aren't inside anyone, you clod.</span>"

/////////////////////////
/// NW's Inside Panel ///
/////////////////////////

/mob/living/carbon/human/proc/insidePanel() //mob/user as mob)
	set name = "Inside"
	set category = "Vore"

	var/datum/vore_look/picker_holder = new()
	picker_holder.loop=picker_holder

	var/dat = picker_holder.gen_ui(src)

	picker_holder.popup = new(src, "insidePanel","Inside!", 700, 400, picker_holder)
	picker_holder.popup.set_content(dat)
	picker_holder.popup.open()

//
// Callback Handler for the Inside form
//
/datum/vore_look
	var/datum/browser/popup
	var/loop = null;  // Magic self-reference to stop the handler from being GC'd before user takes action.
/datum/vore_look/Topic(href,href_list[])
	if (ui_interact(href, href_list))
		popup.set_content(gen_ui(usr))
		usr << output(popup.get_content(), "insidePanel.browser")

/datum/vore_look/proc/gen_ui(var/mob/living/carbon/human/user)
	var/dat
	if (is_vore_predator(user.loc))
		var/vore/pred_capable/eater = user.loc
		var/datum/belly/inside_belly		// Which of predator's bellies are we inside?

		//This big block here figures out where the prey is
		for (var/bellytype in eater.vore_organs)
			var/datum/belly/B = eater.vore_organs[bellytype]
			for (var/mob/living/M in B.internal_contents)
				if (M == user)
					inside_belly = B
					break
		// ASSERT(inside_belly != null) // Make sure we actually found ourselves.

		dat += "<font color = 'green'>You are currently inside</font> <font color = 'yellow'>[eater]'s</font> <font color = 'red'>[inside_belly]</font>!<br><br>"
		dat += "[inside_belly.inside_flavor]<br><br>"
		if (inside_belly.internal_contents.len > 0)
			dat += "<font color = 'green'>You can see the following around you:</font><br>"
			for (var/atom/movable/M in inside_belly.internal_contents)
				if(M != user) dat += "[M] <a href='?src=\ref[src];look=\ref[M]'>Examine</a> <a href='?src=\ref[src];helpout=\ref[M]'>Help out</a><br>"
		dat += "<br>"
	else
		dat += "You aren't inside anyone.<br><br>"

	// List people inside you
	dat += "<font color = 'purple'><b><center>Contents</center></b></font><br>"
	for (var/bellytype in user.vore_organs)
		var/datum/belly/belly = user.vore_organs[bellytype]
		var/inside_count = 0
		dat += "<font color = 'green'>[belly] </font> <a href='?src=\ref[src];toggle_digestion=\ref[belly]'>Digestion: [belly.digest_mode]</a><br>"
		for (var/atom/movable/M in belly.internal_contents)
			dat += "[M] <a href='?src=\ref[src];look=\ref[M]'>Examine</a> <br>"
			inside_count += 1
		if (inside_count == 0)
			dat += "You have not consumed anything<br>"

	// Offer flavor text customization options
	dat += "<font color = 'purple'><b><center>Customisation options</center></b></font><br><br>"
	for (var/bellytype in user.vore_organs)
		var/datum/belly/belly = user.vore_organs[bellytype]
		dat += "<b>[belly]</b><br>[belly.inside_flavor] <a href='?src=\ref[src];set_description=\ref[belly]'>Change text</a><br>"

	return dat;

/datum/vore_look/proc/ui_interact(href, href_list)
	log_debug("vore_look.Topic([href])")
	if(href_list["look"])
		// TODO - This probably should be ATOM not mob/living
		var/mob/living/subj=locate(href_list["look"])
		subj.examine(usr)

	if(href_list["helpout"])
		var/mob/living/subj=locate(href_list["helpout"])
		var/mob/living/eater = usr.loc
		usr << "<font color='green'>You begin to push [subj] to freedom!</font>"
		subj << "[usr] begins to push you to freedom!"
		eater << "<span class='warning'>Someone is trying to escape from inside you!<span>"
		sleep(50)
		if(prob(33))
			// TODO - Properly escape with updating internal_contents
			subj.loc = eater.loc
			usr << "<font color='green'>You manage to help [subj] to safety!</font>"
			subj << "<font color='green'>[usr] pushes you free!</font>"
			eater << "<span class='alert'>[subj] forces free of the confines of your body!</span>"
		else
			usr << "<span class='alert'>[subj] slips back down inside despite your efforts.</span>"
			subj << "<span class='alert'> Even with [usr]'s help, you slip back inside again.</span>"
			eater << "<font color='green'>Your body efficiently shoves [subj] back where they belong.</font>"

	if(href_list["set_description"])
		var/datum/belly/B = locate(href_list["set_description"])
		B.inside_flavor = input(usr, "Input a new flavor text!", "[B] flavor text", B.inside_flavor) as message
		return 1 // TODO Will this make it refresh the ui?

	if (href_list["toggle_digestion"])
		var/datum/belly/B = locate(href_list["toggle_digestion"])
		B.toggle_digestion()
		return 1 // TODO Will this make it refresh the ui?

	if (href_list["close"])
		del(src)  // Cleanup

/mob/living/carbon/human/proc/toggle_digestability()
	set name = "Toggle digestability"
	set category = "Vore"

	if(alert(src, "This button is for those who don't like being digested. It will make you undigestable. Don't abuse this button by toggling it back and forth to extend a scene or whatever, or you'll make the admins cry. Note that this cannot be toggled inside someone's belly.", "", "Okay", "Cancel") == "Okay")
		digestable = !digestable
		usr << "<span class='alert'>You are [digestable ?  "now" : "no longer"] digestable.</span>"
		message_admins("[key_name(src)] toggled their digestability to [digestable] ([loc ? "<a href='?_src_=holder;adminplayerobservecoodjump=1;X=[loc.x];Y=[loc.y];Z=[loc.z]'>JMP</a>" : "null"])")

///
/// Actual eating procs
///

/mob/living/proc/feed_grabbed_to_self(var/mob/living/user, var/mob/living/prey)
	var/belly = user.vore_selected
	return perform_the_nom(user, prey, user, belly)

/mob/living/proc/eat_held_mob(var/mob/living/user, var/mob/living/prey, var/mob/living/pred)
	var/belly
	if(user != pred)
		belly = input("Choose Belly") in pred.vore_organs
	else
		belly = pred.vore_selected
	return perform_the_nom(user, prey, pred, belly)

/mob/living/proc/feed_self_to_grabbed(var/mob/living/user, var/mob/living/pred)
	var/belly = input("Choose Belly") in pred.vore_organs
	return perform_the_nom(user, user, pred, belly)

/mob/living/proc/feed_grabbed_to_other(var/mob/living/user, var/mob/living/prey, var/mob/living/pred)
	var/belly = input("Choose Belly") in pred.vore_organs
	return perform_the_nom(user, prey, pred, belly)

/mob/living/proc/perform_the_nom(var/mob/living/user, var/mob/living/prey, var/mob/living/pred, var/belly)
	//Sanity
	if(!user || !prey || !pred || !belly || !(belly in pred.vore_organs))
		log_debug("[user] attempted to feed [prey] to [pred], via [belly] but it went wrong.")
		return

	// The belly selected at the time of noms
	var/datum/belly/belly_target = pred.vore_organs[belly]
	var/attempt_msg = "ERROR: Vore message couldn't be created. Notify a dev. (at)"
	var/success_msg = "ERROR: Vore message couldn't be created. Notify a dev. (sc)"

	// Prepare messages
	if(user == pred) //Feeding someone to yourself
		attempt_msg = text("<span class='warning'>[] is attemping to [] [] into their []!</span>",pred,belly_target.vore_verb,prey,lowertext(belly_target))
		success_msg = text("<span class='warning'>[] manages to [] [] into their []!</span>",pred,belly_target.vore_verb,prey,lowertext(belly_target))
	else //Feeding someone to another person
		attempt_msg = text("<span class='warning'>[] is attempting to make [] [] [] into their []!</span>",user,pred,belly_target.vore_verb,prey,lowertext(belly_target))
		success_msg = text("<span class='warning'>[] manages to make [] [] [] into their []!</span>",user,pred,belly_target.vore_verb,prey,lowertext(belly_target))

	// Announce that we start the attempt!
	for (var/mob/O in get_mobs_in_view(world.view,user))
		O.show_message(attempt_msg)

	// Now give the prey time to escape... return if they did
	var/swallow_time = istype(prey, /mob/living/carbon/human) ? belly_target.human_prey_swallow_time : belly_target.nonhuman_prey_swallow_time
	if (!do_mob(user, prey))
		return 0; // User is not able to act upon prey
	if(!do_after(user, swallow_time))
		return 0 // Prey escpaed (or user disabled) before timer expired.

	// If we got this far, nom successful! Announce it!
	for (var/mob/O in get_mobs_in_view(world.view,user))
		O.show_message(success_msg)

	playsound(user, belly_target.vore_sound, 100, 1)

	// Actually shove prey into the belly.
	belly_target.nom_mob(prey, user)

	// Inform Admins
	if (pred == user)
		msg_admin_attack("[key_name(pred)] ate [key_name(prey)]. ([pred ? "<a href='?_src_=holder;adminplayerobservecoodjump=1;X=[pred.x];Y=[pred.y];Z=[pred.z]'>JMP</a>" : "null"])")
	else
		msg_admin_attack("[key_name(user)] forced [key_name(pred)] to eat [key_name(prey)]. ([pred ? "<a href='?_src_=holder;adminplayerobservecoodjump=1;X=[pred.x];Y=[pred.y];Z=[pred.z]'>JMP</a>" : "null"])")
	return 1