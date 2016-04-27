//
// Vore management panel for players
//

/mob/living/proc/insidePanel() //mob/user as mob)
	set name = "Inside"
	set category = "Vore"

	var/datum/vore_look/picker_holder = new()
	picker_holder.loop=picker_holder

	var/dat = picker_holder.gen_ui(src)

	picker_holder.popup = new(src, "insidePanel","Inside!", 400, 700, picker_holder)
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

/datum/vore_look/proc/gen_ui(var/mob/living/user, var/datum/belly/selected)
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
		if(inside_belly) //Don't display this part if we couldn't find the belly since could be held in hand.
			dat += "<font color = 'green'>You are currently inside</font> <font color = 'yellow'>[eater]'s</font> <font color = 'red'>[inside_belly]</font>!<br><br>"
			dat += "[inside_belly.inside_flavor]<br><br>"
			if (inside_belly.internal_contents.len > 0)
				dat += "<font color = 'green'>You can see the following around you:</font><br>"
				for (var/atom/movable/M in inside_belly.internal_contents)
					if(M != user) dat += "[M] <a href='?src=\ref[src];look=\ref[M]'>Examine</a> <a href='?src=\ref[src];helpout=\ref[M]'>Help out</a><br>"
			dat += "<br>"
	else
		dat += "You aren't inside anyone."

	dat += "<HR>"

	for(var/K in user.vore_organs) //Fuggin can't iterate over values
		var/datum/belly/B = user.vore_organs[K]
		dat += "<a href='?src=\ref[src];bellypick=\ref[B]'>[B.name]"
		switch(B.digest_mode)
			if(DM_HOLD)
				dat += "<span>"
			if(DM_DIGEST)
				dat += "<span style='color:red;'>"
			if(DM_HEAL)
				dat += "<span style='color:green;'>"
			if(DM_ABSORB)
				dat += "<span style='color:purple;'>"
			else
				dat += "<span>"

		dat += " ([B.internal_contents.len])</span></a>"

	if(user.vore_organs.len < 10)
		dat += "<a href='?src=\ref[src];newbelly=1'>New +</a>"

	dat += "<HR>"


	///
	/// selected belly stuff
	///

	dat += "<HR>"
	dat += "<a href='?src=\ref[src];saveprefs=1'>Save Prefs</a>"
	dat += "<a href='?src=\ref[src];refresh=1'>Refresh</a>"

	return dat


/* Old inside panel
	// List people inside you
	dat += "<HR><font color = 'purple'><b><center>Contents</center></b></font><br>"
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
*/

/datum/vore_look/proc/reload_ui(var/mob/living/user)
	user.insidePanel()
	del(src)

/datum/vore_look/proc/ui_interact(href, href_list)
	log_debug("vore_look.Topic([href])")
	var/mob/living/user = usr

	if(href_list["look"])
		// TODO - This probably should be ATOM not mob/living
		var/mob/living/subj = locate(href_list["look"])
		subj.examine(usr)

	if(href_list["helpout"])
		var/mob/living/subj = locate(href_list["helpout"])
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

	if(href_list["newbelly"])
		if(user.vore_organs.len >= 10) //Nope, too many bellies
			reload_ui(usr)
			return

		var/new_name = html_encode(input(usr,"New belly's name:","New Belly") as text|null)

		if(length(new_name) > 12)
			usr << "<span class='warning'>Entered belly name is too long.</span>"
			return

		var/datum/belly/NB = new(user)
		NB.name = new_name
		user.vore_organs[new_name] = NB
		reload_ui(usr)

	if(href_list["saveprefs"])
		if(user.save_vore_prefs())
			user << "<span class='notice'>Saved belly preferences.</span>"
			return
		else
			user << "<span class='warning'>ERROR: Could not save vore prefs.</span>"
			log_debug("Could not save vore prefs on USER: [user].")

/*
	if(href_list["set_description"])
		var/datum/belly/B = locate(href_list["set_description"])
		B.inside_flavor = input(usr, "Input a new flavor text!", "[B] flavor text", B.inside_flavor) as message
		return 1

	if (href_list["toggle_digestion"])
		var/datum/belly/B = locate(href_list["toggle_digestion"])
		B.toggle_digestion()
		return 1
*/
	reload_ui(usr)

	if (href_list["close"])
		del(src)  // Cleanup