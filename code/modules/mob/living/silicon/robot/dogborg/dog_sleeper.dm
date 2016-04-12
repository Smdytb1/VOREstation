//Sleeper
/obj/item/device/dogborg/sleeper
	name = "Medbelly"
	desc = "Equipment for medical hound. A mounted sleeper that stabilizes patients and can inject reagents in the borg's reserves."
	icon = 'icons/mob/dogborg.dmi'
	icon_state = "sleeper"
	w_class = 1
	var/mob/living/carbon/patient = null
	var/mob/living/silicon/robot/hound = null
	var/inject_amount = 10
	var/min_health = -100
	var/occupied = 0
	var/cleaning = 0
	var/patient_laststat = null
	var/mob_energy = 30000 //Energy gained from digesting mobs (including PCs)
	var/list/injection_chems = list("dexalin", "bicaridine", "kelotane","anti_toxin", "alkysine", "imidazoline", "spaceacillin", "paracetamol") //The borg is able to heal every damage type. As a nerf, they use 750 charge per injection.
	var/list/vore_chems = list("digestive_enzymes")
	var/eject_port = "ingestion port"

/obj/item/device/dogborg/sleeper/New()
	..()
	flags |= NOBLUDGEON //No more attack messages
	hound = loc

/obj/item/device/dogborg/sleeper/Exit(atom/movable/O)
	return 0

/obj/item/device/dogborg/sleeper/afterattack(mob/living/carbon/target, mob/living/silicon/user, proximity)
	if(!proximity)
		return
	if(!ishuman(target))
		return
	if(target.buckled)
		user << "\red The user is buckled and can not be put into your [src.name]."
		return
	if(patient)
		user << "\red Your [src.name] is already occupied."
		return
	user.visible_message("<span class='warning'>[hound.name] is ingesting [target.name] into their [src.name].</span>", "<span class='notice'>You start ingesting [target] into your [src]...</span>")
	if(!patient && ishuman(target) && !target.buckled && do_after (user, 50))

		if(!proximity) return //If they moved away, you can't eat them.

		if(occupied == 1) return //If you try to eat two people at once, you can only eat one.

		else if(occupied == 0) //If you don't have someone in you, proceed.
			target.forceMove(src)
			target.reset_view(src)
			update_patient()
			processing_objects.Add(src)
			user.visible_message("<span class='warning'>[hound.name]'s medical pod lights up as [target.name] slips inside into their [src.name].</span>", "<span class='notice'>Your medical pod lights up as [target] slips into your [src]. Life support functions engaged.</span>")
			message_admins("[key_name(hound)] has eaten [key_name(patient)] as a dogborg. ([hound ? "<a href='?_src_=holder;adminplayerobservecoodjump=1;X=[hound.x];Y=[hound.y];Z=[hound.z]'>JMP</a>" : "null"])")

/obj/item/device/dogborg/sleeper/proc/go_out()
	if(src.occupied == 0)
		return
	hound << "<span class='notice'>[patient] ejected. Life support functions disabled.</span>"
	patient.forceMove(get_turf(src))
	patient.reset_view()
	update_patient()

/obj/item/device/dogborg/sleeper/proc/drain(var/amt = 3) //Slightly reduced cost (before, it was always injecting inaprov)
	hound.cell.charge = hound.cell.charge - amt

/obj/item/device/dogborg/sleeper/attack_self(mob/user)
	if(..())
		return
	sleeperUI(user)

/obj/item/device/dogborg/sleeper/proc/sleeperUI(mob/user)
	var/dat
	dat += "<h3>Injector</h3>"

	if(patient && !(patient.stat & DEAD)) //Why inject dead people with innaprov? Dundonuffin in Bay.
		dat += "<A href='?src=\ref[src];inject=inaprovaline'>Inject Inaprovaline</A>"
	else
		dat += "<span class='linkOff'>Inject Inaprovaline</span>"
	if(patient && patient.health > min_health)
		for(var/re in injection_chems)
			var/datum/reagent/C = chemical_reagents_list[re]
			if(C)
				dat += "<BR><A href='?src=\ref[src];inject=[C.id]'>Inject [C.name]</A>"
	else
		for(var/re in injection_chems)
			var/datum/reagent/C = chemical_reagents_list[re]
			if(C)
				dat += "<BR><span class='linkOff'>Inject [C.name]</span>"

	if(patient && patient.digestable && !(patient.stat & DEAD)) //Respect digestion toggle.
		for(var/re in vore_chems)
			var/datum/reagent/C = chemical_reagents_list[re]
			if(C)
				dat += "<BR><A href='?src=\ref[src];inject=[C.id]'>Inject [C.name]</A>"
	else
		for(var/re in vore_chems)
			var/datum/reagent/C = chemical_reagents_list[re]
			if(C)
				dat += "<BR><span class='linkOff'>Inject [C.name]</span>"

	dat += "<h3>Sleeper Status</h3>"
	dat += "<A href='?src=\ref[src];refresh=1'>Scan</A>"
	dat += "<A href='?src=\ref[src];eject=1'>Eject</A>"

	dat += "<div class='statusDisplay'>"
	if(!patient)
		dat += "Sleeper Unoccupied"
	else
		dat += "[patient.name] => "

		switch(patient.stat)
			if(0)
				dat += "<span class='good'>Conscious</span>"
			if(1)
				dat += "<span class='average'>Unconscious</span>"
			else
				dat += "<span class='bad'>DEAD</span>"

		dat += text("[]\t-Pulse, bpm: []</FONT><BR>", (patient.pulse == PULSE_NONE || patient.pulse == PULSE_THREADY ? "<font color='red'>" : "<font color='white'>"), patient.get_pulse(GETPULSE_TOOL))
		dat += text("[]\t-Overall Health %: []</FONT><BR>", (patient.health > 0 ? "<font color='white'>" : "<font color='red'>"), patient.health)
		dat += text("[]\t-Brute Damage %: []</FONT><BR>", (patient.getBruteLoss() < 60 ? "<font color='gray'>" : "<font color='red'>"), patient.getBruteLoss())
		dat += text("[]\t-Respiratory Damage %: []</FONT><BR>", (patient.getOxyLoss() < 60 ? "<font color='gray'>" : "<font color='red'>"), patient.getOxyLoss())
		dat += text("[]\t-Toxin Content %: []</FONT><BR>", (patient.getToxLoss() < 60 ? "<font color='gray'>" : "<font color='red'>"), patient.getToxLoss())
		dat += text("[]\t-Burn Severity %: []</FONT><BR>", (patient.getFireLoss() < 60 ? "<font color='gray'>" : "<font color='red'>"), patient.getFireLoss())
		dat += text("<HR>Paralysis: []<BR>", round(patient.paralysis / 4) >= 1 ? "[round(patient.paralysis / 4)] seconds" : "None")

		if(patient.getBrainLoss())
			dat += "<div class='line'><span class='average'>Significant brain damage detected.</span></div><br>"
		if(patient.getCloneLoss())
			dat += "<div class='line'><span class='average'>Patient may be improperly cloned.</span></div><br>"
		if(patient.reagents.reagent_list.len)
			for(var/datum/reagent/R in patient.reagents.reagent_list)
				dat += "<div class='line'><div style='width: 170px;' class='statusLabel'>[R.name]:</div><div class='statusValue'>[round(R.volume, 0.1)] units</div></div><br>"
	dat += "</div>"

	var/datum/browser/popup = new(user, "sleeper", "Sleeper Console", 520, 540)	//Set up the popup browser window
	popup.set_title_image(user.browse_rsc_icon(icon, icon_state))
	popup.set_content(dat)
	popup.open()
	return

/obj/item/device/dogborg/sleeper/Topic(href, href_list)
	if(..() || usr == patient)
		return
	usr.set_machine(src)
	if(href_list["refresh"])
		src.updateUsrDialog()
		sleeperUI(usr)
		return
	if(href_list["eject"])
		go_out()
		sleeperUI(usr)
		return
	if(patient && !(patient.stat & DEAD)) //What is bitwise NOT? ... Thought it was tilde.
		if(href_list["inject"] == "inaprovaline" || patient.health > min_health)
			inject_chem(usr, href_list["inject"])
		else
			usr << "<span class='notice'>ERROR: Subject is not in stable condition for injections.</span>"
	else
		usr << "<span class='notice'>ERROR: Subject cannot metabolise chemicals.</span>"

	src.updateUsrDialog()
	sleeperUI(usr) //Needs a callback to boop the page to refresh.
	return

/obj/item/device/dogborg/sleeper/proc/inject_chem(mob/user, chem)
	if(patient && patient.reagents)
		if(chem in injection_chems + vore_chems + "inaprovaline")
			if(hound.cell.charge < 800) //This is so borgs don't kill themselves with it.
				hound << "<span class='notice'>You don't have enough power to synthesize fluids.</span>"
				return
			else if(patient.reagents.get_reagent_amount(chem) + 10 >= 20) //Preventing people from accidentally killing themselves by trying to inject too many chemicals!
				hound << "<span class='notice'>Your stomach is currently too full of fluids to secrete more fluids of this kind.</span>"
			else if(patient.reagents.get_reagent_amount(chem) + 10 <= 20) //No overdoses for you
				patient.reagents.add_reagent(chem, inject_amount)
				drain(750) //-750 charge per injection
			var/units = round(patient.reagents.get_reagent_amount(chem))
			hound << "<span class='notice'>Injecting [units] unit\s of [chemical_reagents_list[chem]] into occupant.</span>" //If they were immersed, the reagents wouldn't leave with them.

/*
//TODO Remove this when done with clean_cycle
/obj/item/device/dogborg/sleeper/proc/absorb()
	var/confirm = alert(usr, "Your patient is currently dead! You can digest them to charge your battery, or leave them as-is.", "Confirmation", "Okay", "Cancel")
	if(confirm == "Okay" && patient && patient.digestable && ((patient.stat & DEAD))) //Sanity
		var/mob/living/silicon/robot.R = usr
		message_admins("[key_name(R)] has digested [key_name(patient)] as a dogborg. ([R ? "<a href='?_src_=holder;adminplayerobservecoodjump=1;X=[R.x];Y=[R.y];Z=[R.z]'>JMP</a>" : "null"])")
		R << "<span class='notice'>You feel your stomach slowly churn around [patient], breaking them down into a soft slurry to be used as power for your systems.</span>"
		patient << "<span class='notice'>You feel [R]'s stomach slowly churn around your form, breaking you down into a soft slurry to be used as power for [R]'s systems.</span>"
		R.sleeper_r = 0 //Reset the sprite!
		R.sleeper_g = 0 //Since they're just power by now.
		src.occupied = 0 //Allow them to take more people in!
		R.update_icons()
		sleeperUI(usr)
		del(patient)
		drain(-30000) //As much as a hyper battery. You /are/ digesting an entire person, after all!
		return
*/

//For if the dogborg's existing patient uh, doesn't make it.
/obj/item/device/dogborg/sleeper/proc/update_patient()

	for(var/C in contents)
		if(istype(C,/mob/living/carbon/human))
			patient = C
			occupied = 1
			if(patient.stat & DEAD)
				hound.sleeper_r = 1
				hound.sleeper_g = 0
				patient_laststat = patient.stat
			else
				hound.sleeper_r = 0
				hound.sleeper_g = 1
				patient_laststat = patient.stat
		hound.updateicon()
		return(C)

	//Couldn't find anyone.
	patient = null
	patient_laststat = null
	occupied = 0
	hound.sleeper_r = 0
	hound.sleeper_g = 0
	hound.updateicon()
	return 0

//Gurgleborg process
/obj/item/device/dogborg/sleeper/proc/clean_cycle()

	//Belly is empty but cleaning is still on
	if(length(contents) == 0)
		hound << "<span class='notice'>Your sleeper is now clean. Ending self-cleaning cycle.</span>"
		cleaning = 0
		update_patient()
		return

	//Stomach has contents, going forward
	if(air_master.current_cycle%3==1) //This is how the vore code times it, so I'm using that
		var/atom/target = pick(contents)
		hound << "DEBUG: Now targeting [target.name]"

		//Handle the target being a /mob/living/carbon/human
		if(istype(target, /mob/living/carbon/human))
			var/mob/living/carbon/human/T = target

			//Mob can't be digested (godmode or prefs)
			if((T.status_flags & GODMODE) || !T.digestable)
				T.loc = hound.loc
				playsound(loc, 'sound/effects/splat.ogg', 50, 1)
				hound.visible_message("<span class='notice'>[T.name] spills out of [hound.name]'s [eject_port].</span>", "<span class='notice'>[T.name] spills out of your [eject_port].</span>")
				update_patient()

			//Mob is now dead
			if(T.stat & DEAD)
				hound << "DEBUG: [T.name] is dead, cleaning up."
				message_admins("[key_name(hound)] has digested [key_name(T)] as a dogborg. ([hound ? "<a href='?_src_=holder;adminplayerobservecoodjump=1;X=[hound.x];Y=[hound.y];Z=[hound.z]'>JMP</a>" : "null"])")
				hound << "<span class='notice'>You feel your belly slowly churn around [T], breaking them down into a soft slurry to be used as power for your systems.</span>"
				T << "<span class='notice'>You feel [hound]'s belly slowly churn around your form, breaking you down into a soft slurry to be used as power for [hound]'s systems.</span>"
				drain(-30000) //Fueeeeellll
				hound << "DEBUG: [T] had [Spill(T)] items"
				T.Del()
				return

			//Do digestion damage
			hound << "DEBUG: Doing damage to [T.name]"
			T.adjustBruteLoss(3)
			T.adjustFireLoss(3)
			update_patient()
			return

		//Handle the target being anything but a /mob/living/carbon/human
		else
			var/obj/T = target
			hound << "DEBUG: Deleting [T.name]"
			if(T in important_items) //Preserved item
				hound << "DEBUG: Wait, no I'm not, it's important!"
				T.loc = hound.loc
				playsound(loc, 'sound/effects/splat.ogg', 50, 1)
				hound.visible_message("<span class='notice'>\The [T.name] spills out of [hound.name]'s [eject_port].</span>", "<span class='notice'>\The [T.name] spills out of your [eject_port].</span>")
			else //Normal item
				hound << "DEBUG: [T] had [Spill(T)] items"
				T.Del()
			//R.cell.charge += 100 //Ace says no charge from digested items
			return
	return

/obj/item/device/dogborg/sleeper/process()
	if(!src.occupied && !src.cleaning)
		if(!update_patient()) //One last try to find someone
			processing_objects.Remove(src)
			return
	if(src.cleaning)
		clean_cycle()
	if(patient.health < 0)
		patient.adjustOxyLoss(-1) //Heal some oxygen damage if they're in critical condition
		patient.updatehealth()
	patient.AdjustStunned(-4)
	patient.AdjustWeakened(-4)
	src.drain()
	if((patient.reagents.get_reagent_amount("inaprovaline") < 5) && (patient.health < patient.maxHealth) && !cleaning) //Stop pumping full HP people full of drugs. Don't heal people you're digesting, meanie.
		patient.reagents.add_reagent("inaprovaline", 5)
	if(patient_laststat != patient.stat)
		update_patient()


/mob/living/silicon/robot
	var/sleeper_g
	var/sleeper_r

/obj/item/device/dogborg/sleeper/K9 //The K9 portabrig
	name = "Brig-Belly"
	desc = "Equipment for a K9 unit. A mounted portable-brig that holds criminals."
	icon = 'icons/mob/dogborg.dmi'
	icon_state = "sleeper"
	inject_amount = 10
	min_health = -100
	occupied = 0
	injection_chems = null //So they don't have all the same chems as the medihound!
	vore_chems = list("digestive_enzymes")