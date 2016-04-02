// Special tools and items for "Borgi" and "K-9 Unit"
// PASTA SPAGHETTI FEST WOOHOOO!!! var/regrets = null

/obj/item/weapon/dogborg/jaws/big
	name = "combat jaws"
	icon = 'icons/mob/dogborg.dmi'
	icon_state = "jaws"
	desc = "The jaws of the law."
	flags = CONDUCT
	force = 10
	throwforce = 0
	hitsound = 'sound/weapons/bite.ogg'
	attack_verb = list("chomped", "bit", "ripped", "mauled", "enforced")
	w_class = 3

/obj/item/weapon/dogborg/jaws/small
	name = "puppy jaws"
	icon = 'icons/mob/dogborg.dmi'
	icon_state = "smalljaws"
	desc = "The jaws of a small dog."
	flags = CONDUCT
	force = 5
	throwforce = 0
	hitsound = 'sound/weapons/bite.ogg'
	attack_verb = list("nibbled", "bit", "gnawed", "chomped", "nommed")
	w_class = 3
	var/emagged = 0

/obj/item/weapon/dogborg/jaws/small/attack_self(mob/user)
	var/mob/living/silicon/robot.R = user
	if(R.emagged)
		emagged = !emagged
		if(emagged)
			name = "combat jaws"
			icon = 'icons/mob/dogborg.dmi'
			icon_state = "jaws"
			desc = "The jaws of the law."
			flags = CONDUCT
			force = 10
			throwforce = 0
			hitsound = 'sound/weapons/bite.ogg'
			attack_verb = list("chomped", "bit", "ripped", "mauled", "enforced")
			w_class = 3
		else
			name = "puppy jaws"
			icon = 'icons/mob/dogborg.dmi'
			icon_state = "smalljaws"
			desc = "The jaws of a small dog."
			flags = CONDUCT
			force = 5
			throwforce = 0
			hitsound = 'sound/weapons/bite.ogg'
			attack_verb = list("nibbled", "bit", "gnawed", "chomped", "nommed")
			w_class = 3
		update_icon()


//Boop

/obj/item/weapon/boop_module
	name = "boop module"
	icon = 'icons/mob/dogborg.dmi'
	icon_state = "nose"
	desc = "The BOOP module"
	flags = CONDUCT
	force = 0
	throwforce = 0
	attack_verb = list("nuzzled", "nosed", "booped")
	w_class = 1


//Delivery
/*
/obj/item/weapon/storage/bag/borgdelivery
	name = "fetching storage"
	desc = "Fetch the thing!"
	icon = 'icons/mob/dogborg.dmi'
	icon_state = "dbag"
	w_class = 5
	max_w_class = 2
	max_combined_w_class = 2
	storage_slots = 1
	collection_mode = 0
	can_hold = list() // any
	cant_hold = list(/obj/item/weapon/disk/nuclear)
*/

//Tongue stuff

/obj/item/weapon/soap/tongue
	name = "synthetic tongue"
	desc = "Useful for slurping mess off the floor before affectionally licking the crew members in the face."
	icon = 'icons/mob/dogborg.dmi'
	icon_state = "synthtongue"
	hitsound = 'sound/effects/attackblob.ogg'
	var/emagged = 0

/obj/item/weapon/soap/tongue/attack_self(mob/user)
	var/mob/living/silicon/robot.R = user
	if(R.emagged)
		emagged = !emagged
		if(emagged)
			name = "hacked tongue of doom"
			desc = "Your tongue has been upgraded successfully. Congratulations."
			icon = 'icons/mob/dogborg.dmi'
			icon_state = "syndietongue"
		else
			name = "synthetic tongue"
			desc = "Useful for slurping mess off the floor before affectionally licking the crew members in the face."
			icon = 'icons/mob/dogborg.dmi'
			icon_state = "synthtongue"
		update_icon()

/obj/item/weapon/soap/tongue/afterattack(atom/target, mob/user, proximity)
	if(!proximity)
		return
	if(user.client && (target in user.client.screen))
		user << "<span class='warning'>You need to take that [target.name] off before cleaning it!</span>"
	else if(istype(target,/obj/effect/decal/cleanable))
		user.visible_message("[user] begins to lick off \the [target.name].", "<span class='warning'>You begin to lick off \the [target.name]...</span>")
		if(do_after (user, 50))
			user << "<span class='notice'>You finish licking off \the [target.name].</span>"
			del(target)
			var/mob/living/silicon/robot.R = user
			R.cell.charge = R.cell.charge + 50
	else if(istype(target,/obj/item))
		if(istype(target,/obj/item/trash))
			user.visible_message("[user] nibbles away at \the [target.name].", "<span class='warning'>You begin to nibble away at \the [target.name]...</span>")
			if(do_after (user, 50))
				user << "<span class='notice'>You finish off \the [target.name].</span>"
				del(target)
				var/mob/living/silicon/robot.R = user
				R.cell.charge = R.cell.charge + 250
			return
		if(istype(target,/obj/item/weapon/cell))
			user.visible_message("[user] begins cramming \the [target.name] down its throat.", "<span class='warning'>You begin cramming \the [target.name] down your throat...</span>")
			if(do_after (user, 50))
				user << "<span class='notice'>You finish off \the [target.name].</span>"
				var/mob/living/silicon/robot.R = user
				var/obj/item/weapon/cell.C = target
				R.cell.charge = R.cell.charge + (C.maxcharge / 3)
				del(target)
			return
		user.visible_message("[user] begins to lick \the [target.name] clean...", "<span class='notice'>You begin to lick \the [target.name] clean...</span>")
		if(do_after (user, 50))
			user << "<span class='notice'>You clean \the [target.name].</span>"
			var/obj/effect/decal/cleanable/C = locate() in target
			del(C)
			target.clean_blood()
	else if(ishuman(target))
		if(src.emagged)
			var/mob/living/silicon/robot.R = user
			var/mob/living/L = target
			if(R.cell.charge <= 666)
				return
			L.Stun(4) // normal stunbaton is force 7 gimme a break good sir!
			L.Weaken(4)
			L.apply_effect(STUTTER, 4)
			L.visible_message("<span class='danger'>[user] has shocked [L] with its tongue!</span>", \
								"<span class='userdanger'>[user] has shocked you with its tongue! You can feel the betrayal.</span>")
			playsound(loc, 'sound/weapons/Egloves.ogg', 50, 1, -1)
			R.cell.charge = R.cell.charge - 666
		else
			user.visible_message("<span class='warning'>\the [user] affectionally licks all over \the [target]'s face!</span>", "<span class='notice'>You affectionally lick all over \the [target]'s face!</span>")
			playsound(src.loc, 'sound/effects/attackblob.ogg', 50, 1)
			return
	else if(istype(target, /obj/structure/window))
		user.visible_message("[user] begins to lick \the [target.name] clean...", "<span class='notice'>You begin to lick \the [target.name] clean...</span>")
		if(do_after (user, 50))
			user << "<span class='notice'>You clean \the [target.name].</span>"
			target.color = initial(target.color)
			target.SetOpacity(initial(target.opacity))
	else
		user.visible_message("[user] begins to lick \the [target.name] clean...", "<span class='notice'>You begin to lick \the [target.name] clean...</span>")
		if(do_after (user, 50))
			user << "<span class='notice'>You clean \the [target.name].</span>"
			var/obj/effect/decal/cleanable/C = locate() in target
			del(C)
			target.clean_blood()
	return

//Sleeper

/obj/item/weapon/dogborg/sleeper
	name = "Medbelly"
	desc = "Equipment for medical hound. A mounted sleeper that stabilizes patients and can inject reagents in the borg's reserves."
	icon = 'icons/mob/dogborg.dmi'
	icon_state = "sleeper"
	var/mob/living/carbon/patient = null
	var/mob/living/silicon/hound = null
	var/inject_amount = 10
	var/min_health = -100
	var/occupied = 0
	var/list/injection_chems = list("dexalin", "bicaridine", "kelotane","anti_toxin", "alkysine", "imidazoline", "spaceacillin", "paracetamol", "digestive_enzymes") //The borg is able to heal every damage type. As a nerf, they use 750 charge per injection.

/obj/item/weapon/dogborg/sleeper/Exit(atom/movable/O)
	return 0

/obj/item/weapon/dogborg/sleeper/afterattack(mob/living/carbon/target, mob/living/silicon/user, proximity)
	if(!proximity)
		return
	if(!ishuman(target))
		return
	if(target.buckled)
		user << "\red The user is buckled and can not be put into your [src]."
		return
	if(patient)
		user << "\red Your [src] is already occupied."
		return
	user.visible_message("<span class='warning'>[user] is ingesting [target] into their [src].</span>", "<span class='notice'>You start ingesting [target] into your [src]...</span>")
	if(!patient && ishuman(target) && !target.buckled && do_after (user, 50))
		target.forceMove(src)
		patient = target
		hound = user
		target.reset_view(src)
		user << "<span class='notice'>Your medical pod lights up as [target] slips into your [src]. Life support functions engaged.</span>"
		user.visible_message("<span class='warning'>[user]'s medical pod lights up as [target] slips inside into their [src].</span>")
		user.visible_message("[target] loaded. Life support functions engaged.")
		src.occupied = 1
		var/mob/living/silicon/robot.R = user
		if(patient.stat < 2)
			R.sleeper_r = 0
			R.sleeper_g = 1
			R.update_icons()
		else
			R.sleeper_g = 0
			R.sleeper_r = 1
			R.update_icons()
		processing_objects |= src

/obj/item/weapon/dogborg/sleeper/proc/go_out()
	if(src.occupied == 0)
		return
	var/mob/living/silicon/robot.R = hound
	hound << "<span class='notice'>[patient] ejected. Life support functions disabled.</span>"
	R.sleeper_r = 0
	R.sleeper_g = 0
	R.update_icons()
	patient.forceMove(get_turf(src))
	patient.reset_view()
	patient = null
	src.occupied = 0
	src.occupied = 0 //double check just in case

/obj/item/weapon/dogborg/sleeper/proc/drain()
	var/mob/living/silicon/robot.R = hound
	R.cell.charge = R.cell.charge - 10

/obj/item/weapon/dogborg/sleeper/attack_self(mob/user)
	if(..())
		return
	sleeperUI(user)

/obj/item/weapon/dogborg/sleeper/proc/sleeperUI(mob/user)
	var/dat
	dat += "<h3>Injector</h3>"
	if(patient)
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
				var/mob/living/silicon/robot.R = user
				R.sleeper_r = 0
				R.sleeper_g = 1 //Green, as they're alive.
				R.update_icons()
			if(1)
				dat += "<span class='average'>Unconscious</span>"
				var/mob/living/silicon/robot.R = user
				R.sleeper_r = 0
				R.sleeper_g = 1 //Green, as they're still alive, just KO'd.
				R.update_icons()
			else
				dat += "<span class='bad'>DEAD</span>"
				var/mob/living/silicon/robot.R = user
				R.sleeper_g = 0
				R.sleeper_r = 1 //Red, as they're dead.
				R.update_icons()
		dat += text("[]\t-Pulse, bpm: []</FONT><BR>", (patient.pulse == PULSE_NONE || patient.pulse == PULSE_THREADY ? "<font color='red'>" : "<font color='blue'>"), patient.get_pulse(GETPULSE_TOOL))
		dat += text("[]\t-Brute Damage %: []</FONT><BR>", (patient.getBruteLoss() < 60 ? "<font color='blue'>" : "<font color='red'>"), patient.getBruteLoss())
		dat += text("[]\t-Respiratory Damage %: []</FONT><BR>", (patient.getOxyLoss() < 60 ? "<font color='blue'>" : "<font color='red'>"), patient.getOxyLoss())
		dat += text("[]\t-Toxin Content %: []</FONT><BR>", (patient.getToxLoss() < 60 ? "<font color='blue'>" : "<font color='red'>"), patient.getToxLoss())
		dat += text("[]\t-Burn Severity %: []</FONT><BR>", (patient.getFireLoss() < 60 ? "<font color='blue'>" : "<font color='red'>"), patient.getFireLoss())
		dat += text("<HR>Paralysis Summary %: [] ([] seconds left!)<BR>", patient.paralysis, round(patient.paralysis / 4))
		dat += "<div class='line'><span class='average'>Subject appears to have cellular damage.</span></div><br>"

		if(patient.getBrainLoss())
			dat += "<div class='line'><span class='average'>Significant brain damage detected.</span></div><br>"
		if(patient.reagents.reagent_list.len)
			for(var/datum/reagent/R in patient.reagents.reagent_list)
				dat += "<div class='line'><div style='width: 170px;' class='statusLabel'>[R.name]:</div><div class='statusValue'>[round(R.volume, 0.1)] units</div></div><br>"
	dat += "</div>"

	var/datum/browser/popup = new(user, "sleeper", "Sleeper Console", 520, 540)	//Set up the popup browser window
	popup.set_title_image(user.browse_rsc_icon(icon, icon_state))
	popup.set_content(dat)
	popup.open()

/obj/item/weapon/dogborg/sleeper/Topic(href, href_list)
	if(..() || usr == patient)
		return
	usr.set_machine(src)
	if(href_list["refresh"])
		updateUsrDialog()
		return
	if(href_list["eject"])
		go_out()
		return
	if(patient && patient.stat != DEAD)
		if(href_list["inject"] == "inaprovaline" || patient.health > min_health)
			inject_chem(usr, href_list["inject"])
		else
			usr << "<span class='notice'>ERROR: Subject is not in stable condition for auto-injection.</span>"
	else
		usr << "<span class='notice'>ERROR: Subject cannot metabolise chemicals.</span>"
	updateUsrDialog()

/obj/item/weapon/dogborg/sleeper/proc/inject_chem(mob/user, chem)
	if(patient && patient.reagents)
		if(chem in injection_chems + "inaprovaline")
			var/mob/living/silicon/robot.R = user
			if(R.cell.charge < 750) //This is so borgs don't kill theirselves with it.
				R << "<span class='notice'>You don't have enough power to synthesise fluids.</span>"
				return
			else if(patient.reagents.get_reagent_amount(chem) + 10 >= 20) //Preventing people from accidentally killing theirselves by trying to inject too many chemicals!
				R << "<span class='notice'>Your stomach is currently too full of fluids to secrete more fluids of this kind.</span>"
			else if(patient.reagents.get_reagent_amount(chem) + 10 <= 20) //No overdoses for you
				patient.reagents.add_reagent(chem, inject_amount)
				R.cell.charge = R.cell.charge - 750 //-750 charge per injection
			var/units = round(patient.reagents.get_reagent_amount(chem))
			R << "<span class='notice'>Occupant is currently immersed in [units] unit\s of [chemical_reagents_list[chem]].</span>"
	if(patient && patient.stat == DEAD)
		var/confirm = alert(src, "Your patient is currently dead! You can digest them to charge your battery, or leave them alive. Do not digest them unless you have their consent, please!", "Confirmation", "Okay", "Cancel")
		if(confirm == "Okay")
			var/mob/living/silicon/robot.R = user
			R << "<span class='notice'>You feel your stomach slowly churn around [patient], breaking them down into a soft slurry to be used as power for your systems.</span>"
			patient << "<span class='notice'>You feel [R]'s stomach slowly churn around your form, breaking you down into a soft slurry to be used as power for [R]'s systems.</span>"
			del(patient)
			message_admins("[key_name(R)] digested [patient]([R ? "<a href='?_src_=holder;adminplayerobservecoodjump=1;X=[R.x];Y=[R.y];Z=[R.z]'>JMP</a>" : "null"])")
			R.cell.charge = R.cell.charge + 30000 //As much as a hyper battery. You /are/ digesting an entire person, after all!
			
/obj/item/weapon/dogborg/sleeper/process()
	if(src.occupied == 0)
		processing_objects.Remove(src)
		return
	if(patient.health > 0)
		patient.adjustOxyLoss(-1) //Heal some oxygen damage if they're in critical condition
		patient.updatehealth()
	patient.AdjustStunned(-4)
	patient.AdjustWeakened(-4)
	src.drain()
	if(patient.reagents.get_reagent_amount("inaprovaline") < 5)
		patient.reagents.add_reagent("inaprovaline", 5)
/mob/living/silicon/robot
	var/sleeper_g
	var/sleeper_r




/obj/item/weapon/dogborg/sleeper/K9 //The K9 portabrig
	name = "Brig-Belly"
	desc = "Equipment for a K9 unit. A mounted portable-brig that holds criminals."
	icon = 'icons/mob/dogborg.dmi'
	icon_state = "sleeper"
	inject_amount = 10
	min_health = -100
	occupied = 0
	injection_chems = list("digestive_enzymes") //So they don't have all the same chems as the medihound!
