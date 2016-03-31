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
		if(do_after(user, target = target))
			user << "<span class='notice'>You finish licking off \the [target.name].</span>"
			del(target)
			var/mob/living/silicon/robot.R = user
			R.cell.charge = R.cell.charge + 50
	else if(istype(target,/obj/item))
		if(istype(target,/obj/item/trash))
			user.visible_message("[user] nibbles away at \the [target.name].", "<span class='warning'>You begin to nibble away at \the [target.name]...</span>")
			if(do_after(user, target = target))
				user << "<span class='notice'>You finish off \the [target.name].</span>"
				del(target)
				var/mob/living/silicon/robot.R = user
				R.cell.charge = R.cell.charge + 250
			return
		if(istype(target,/obj/item/weapon/cell))
			user.visible_message("[user] begins cramming \the [target.name] down its throat.", "<span class='warning'>You begin cramming \the [target.name] down your throat...</span>")
			if(do_after(user, 50, target = target))
				user << "<span class='notice'>You finish off \the [target.name].</span>"
				var/mob/living/silicon/robot.R = user
				var/obj/item/weapon/cell.C = target
				R.cell.charge = R.cell.charge + (C.maxcharge / 3)
				del(target)
			return
		var/obj/item/I = target
		if(!I.anchored && src.emagged)
			user.visible_message("[user] begins chewing up \the [target.name]. Looks like it's trying to loophole around its diet restriction!", "<span class='warning'>You begin chewing up \the [target.name]...</span>")
			if(do_after(user, 100, target = I))
				visible_message("<span class='warning'>[user] chews up \the [target.name] and cleans off the debris!</span>")
				user << "<span class='notice'>You finish off \the [target.name].</span>"
				del(I)
				var/mob/living/silicon/robot.R = user
				R.cell.charge = R.cell.charge + 500
			return
		user.visible_message("[user] begins to lick \the [target.name] clean...", "<span class='notice'>You begin to lick \the [target.name] clean...</span>")
		if(do_after(user, target = target))
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
			user.visible_message("<span class='warning'>\the [user] affectionally licks \the [target]'s face!</span>", "<span class='notice'>You affectionally lick \the [target]'s face!</span>")
			playsound(src.loc, 'sound/effects/attackblob.ogg', 50, 1)
			return
	else if(istype(target, /obj/structure/window))
		user.visible_message("[user] begins to lick \the [target.name] clean...", "<span class='notice'>You begin to lick \the [target.name] clean...</span>")
		if(do_after(user, target = target))
			user << "<span class='notice'>You clean \the [target.name].</span>"
			target.color = initial(target.color)
			target.SetOpacity(initial(target.opacity))
	else
		user.visible_message("[user] begins to lick \the [target.name] clean...", "<span class='notice'>You begin to lick \the [target.name] clean...</span>")
		if(do_after(user, target = target))
			user << "<span class='notice'>You clean \the [target.name].</span>"
			var/obj/effect/decal/cleanable/C = locate() in target
			del(C)
			target.clean_blood()
	return

//Sleeper

/obj/item/weapon/dogborg/sleeper
	name = "mounted sleeper"
	desc = "Equipment for medical hound. A mounted sleeper that stabilizes patients and can inject reagents in the borg's reserves."
	icon = 'icons/mob/dogborg.dmi'
	icon_state = "sleeper"
	var/mob/living/carbon/patient = null
	var/mob/living/silicon/hound = null
	var/inject_amount = 10
	var/min_health = -100
	var/occupied = 0
	var/list/injection_chems = list("dexalin", "bicaridine", "kelotane","antitoxin")

/obj/item/weapon/dogborg/sleeper/Exit(atom/movable/O)
	return 0

/obj/item/weapon/dogborg/sleeper/afterattack(mob/living/carbon/target, mob/living/silicon/user, proximity)
	if(!proximity)
		return
	if(!ishuman(target))
		return
	if(!patient_insertion_check(target))
		return
	user.visible_message("<span class='warning'>[user] starts putting [target] into \the [src].</span>", "<span class='notice'>You start putting [target] into [src]...</span>")
	if(do_after(user, 50, target = target))
		if(!patient_insertion_check(target))
			return
		target.forceMove(src)
		patient = target
		hound = user
		target.reset_view(src)
		user << "<span class='notice'>[target] successfully loaded into [src]. Life support functions engaged.</span>"
		user.visible_message("<span class='warning'>[user] loads [target] into [src].</span>")
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
		//SSobj.processing |= src //This is causing problems

/obj/item/weapon/dogborg/sleeper/proc/patient_insertion_check(mob/living/carbon/target, mob/user)
	if(target.buckled)
		user << "<span class='warning'>[target] will not fit into the sleeper because they are buckled to [target.buckled]!</span>"
		return
	if(patient)
		user << "<span class='warning'>The sleeper is already occupied!</span>"
		return
	return 1

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
			if(patient.reagents.get_reagent_amount(chem) + 10 <= 20) //No overdoses for you
				patient.reagents.add_reagent(chem, 10)
				var/mob/living/silicon/robot.R = user
				R.cell.charge = R.cell.charge - 250 //-250 charge per injection
			var/units = round(patient.reagents.get_reagent_amount(chem))
			user << "<span class='notice'>Occupant now has [units] unit\s of [chemical_reagents_list[chem]] in their bloodstream.</span>"

/obj/item/weapon/dogborg/sleeper/process()
	//if(src.occupied == 0) //This is also causing problems.
		//SSobj.processing.Remove(src)
		//return
	if(patient.health > 0)
		patient.adjustOxyLoss(-1) //Heal some oxygen damage if they're in critical condition
		patient.updatehealth()
	patient.AdjustStunned(-4)
	patient.AdjustWeakened(-4)
	src.drain()
	if(patient.reagents.get_reagent_amount("inaprovaline") < 5)
		patient.reagents.add_reagent("inaprovaline", 5)

// Pounce stuff for K-9

/obj/item/weapon/dogborg/pounce
	name = "pounce"
	icon = 'icons/mob/dogborg.dmi'
	icon_state = "pounce"
	desc = "Leap at your target to momentarily stun them."
	force = 0
	throwforce = 0

/mob/living/silicon/robot
	var/leaping = 0
	var/pounce_cooldown = 0
	var/pounce_cooldown_time = 40
	var/leap_at
	var/disabler
	var/laser
	var/sleeper_g
	var/sleeper_r

#define MAX_K9_LEAP_DIST 3

/obj/item/weapon/dogborg/pounce/afterattack(atom/A, mob/user)
	var/mob/living/silicon/robot.R = user
	R.leap_at(A)

/mob/living/silicon/robot/proc/leap_at(atom/A)
	if(pounce_cooldown)
		src << "<span class='danger'>Your leg actuators are still recharging!</span>"
		return

	if(leaping) //Leap while you leap, so you can leap while you leap
		return

	if(cell.charge <= 500)
		return

	else
		leaping = 1
		pixel_y = 10
		throw_at(A,MAX_K9_LEAP_DIST,1, spin=0, diagonals_first = 1)
		leaping = 0
		pixel_y = initial(pixel_y)
		cell.charge = cell.charge - 500 //Large energy consumption.
		pounce_cooldown = !pounce_cooldown
		spawn(pounce_cooldown_time)
			pounce_cooldown = !pounce_cooldown

/mob/living/silicon/robot/throw_impact(atom/A, params)

	if(!leaping)
		return ..()

	if(A)
		if(istype(A, /mob/living))
			var/mob/living/L = A
			var/blocked = 0
			if(ishuman(A))
				var/mob/living/carbon/human/H = A
				if(H.check_shields(90, "the [name]", src, 1))
					blocked = 1
			if(!blocked)
				L.visible_message("<span class ='danger'>[src] pounces on [L]!</span>", "<span class ='userdanger'>[src] pounces on you!</span>")
				L.Weaken(2)// Not enough time to cuff a criminal.
				sleep(2)//Runtime prevention (infinite bump() calls on hulks)
				step_towards(src,L)

		else if(A.density && !A.CanPass(src))
			visible_message("<span class ='danger'>[src] smashes into [A]!</span>")
			weakened = 2

		if(leaping)
			leaping = 0
			update_canmove()
