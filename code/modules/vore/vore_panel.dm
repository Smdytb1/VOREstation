//
// Vore management panel for players
//

/mob/living/proc/insidePanel()
	set name = "Inside"
	set category = "Vore"

	var/datum/vore_look/picker_holder = new()
	picker_holder.loop = picker_holder
	picker_holder.selected = vore_organs[vore_selected]

	var/dat = picker_holder.gen_ui(src)

	picker_holder.popup = new(src, "insidePanel","Inside!", 400, 650, picker_holder)
	picker_holder.popup.set_content(dat)
	picker_holder.popup.open()

//
// Callback Handler for the Inside form
//
/datum/vore_look
	var/datum/belly/selected
	var/datum/browser/popup
	var/loop = null;  // Magic self-reference to stop the handler from being GC'd before user takes action.

/datum/vore_look/Topic(href,href_list[])
	if (ui_interact(href, href_list))
		popup.set_content(gen_ui(usr))
		usr << output(popup.get_content(), "insidePanel.browser")

/datum/vore_look/proc/gen_ui(var/mob/living/user)
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
		if(B == selected)
			dat += "<a href='?src=\ref[src];bellypick=\ref[B]'><b>[B.name]</b>"
		else
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

	if(!selected)
		dat += "No belly selected. Click one to select it."
	else
		if(selected.internal_contents.len > 0)
			dat += "<b>Contents:</b> "
			for(var/O in selected.internal_contents)
				dat += "[O], "

		//Belly Name Button
		dat += "<a href='?src=\ref[src];b_name=\ref[selected]'>Name:</a>"
		dat += " '[selected.name]'"

		//Digest Mode Button
		dat += "<br><a href='?src=\ref[src];b_mode=\ref[selected]'>Belly Mode:</a>"
		dat += " [selected.digest_mode]"

		//Inside flavortext
		dat += "<br><a href='?src=\ref[src];b_desc=\ref[selected]'>Flavor Text:</a>"
		dat += " '[selected.inside_flavor]'"

		//Belly sound
		dat += "<br><a href='?src=\ref[src];b_sound=\ref[selected]'>Set Vore Sound</a>"
		dat += "<a href='?src=\ref[src];b_soundtest=\ref[selected]'>Test</a>"

		//Belly verb
		dat += "<br><a href='?src=\ref[src];b_verb=\ref[selected]'>Vore Verb:</a>"
		dat += " '[selected.vore_verb]'"

		//Delete button
		dat += "<br><a href='?src=\ref[src];b_del=\ref[selected]'>Delete Belly</a>"

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

/datum/vore_look/proc/ui_interact(href, href_list)
	var/mob/living/user = usr
	for(var/H in href_list)

	if(href_list["close"])
		del(src)  // Cleanup
		return

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
		if(user.vore_organs.len >= 10)
			return 1

		var/new_name = html_encode(input(usr,"New belly's name:","New Belly") as text|null)

		if(length(new_name) > 12 || length(new_name) < 2)
			usr << "<span class='warning'>Entered belly name is too long.</span>"
			return 0
		if(new_name in user.vore_organs)
			usr << "<span class='warning'>No duplicate belly names, please.</span>"
			return 0

		var/datum/belly/NB = new(user)
		NB.name = new_name
		user.vore_organs[new_name] = NB
		selected = NB

		var/healing = alert(user, "Can this belly heal?", "Confirmation", "Yes", "No")
		var/absorbing = alert(user, "Can this belly absorb?", "Confirmation", "Yes", "No")

		if(healing)
			selected.digest_modes += DM_HEAL
		if(absorbing)
			selected.digest_modes += DM_ABSORB

	if(href_list["bellypick"])
		user << "href_list'bellypick'= [href_list["bellypick"]]"
		selected = locate(href_list["bellypick"])
		user << "selected now [selected]"

	if(href_list["b_name"])
		var/new_name = html_encode(input(usr,"Belly's new name:","New Name") as text|null)

		if(length(new_name) > 12 || length(new_name) < 2)
			usr << "<span class='warning'>Entered belly name length invalid (must be longer than 2, shorter than 12).</span>"
			return 0
		if(new_name in user.vore_organs)
			usr << "<span class='warning'>No duplicate belly names, please.</span>"
			return 0

		user.vore_organs[new_name] = selected
		user.vore_organs -= selected.name
		selected.name = new_name

	if(href_list["b_mode"])
		selected.digest_mode = input("Choose Mode (currently [selected.digest_mode]") in selected.digest_modes

	if(href_list["b_desc"])
		var/new_desc = html_encode(input(usr,"Belly Description (1024 char limit):","New Description") as message|null)

		if(length(new_desc) > 1023)
			usr << "<span class='warning'>Entered belly desc too long. 1024 character limit.</span>"
			return 0

		selected.inside_flavor = new_desc

	if(href_list["b_verb"])
		var/new_verb = html_encode(input(usr,"New verb when eating (infinitive tense, e.g. nom or swallow):","New Verb") as text|null)

		if(length(new_verb) > 12 || length(new_verb) < 2)
			usr << "<span class='warning'>Entered verb length invalid (must be longer than 2, shorter than 12).</span>"
			return 0

		selected.vore_verb = new_verb

	if(href_list["b_sound"])
		return 1

	if(href_list["b_soundtest"])
		user << selected.vore_sound

	if(href_list["b_del"])
		if(selected.internal_contents.len > 0)
			usr << "<span class='warning'>Can't delete bellies with contents!</span>"
		else if(selected.immutable)
			usr << "<span class='warning'>This belly cannot be deleted!</span>"
		else
			user.vore_organs -= selected.name
			user.vore_organs.Remove(selected)
			selected = null

	if(href_list["saveprefs"])
		if(user.save_vore_prefs())
			user << "<span class='notice'>Saved belly preferences.</span>"
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
	//Refresh when interacted with
	return 1