// Defib vest, because I think an actual defib is beyond most medical staff...
// So here's the AED-in-a-vest version


///////////////////////////// Object /////////////////////////////
/obj/item/clothing/under/aed_vest
	name = "aed vest"
	desc = "Automated external defibrillator. In a vest! Turn on, apply to patient."
	icon_state = "aedvest"
	item_state = "bl_suit"
	item_color = "aedvest"

	var/obj/item/weapon/cell/power_supply
	var/cell_type = /obj/item/weapon/cell

	var/charge_req = 1000 		//Charge required per shock
	var/max_charge = 3000		//Starting max powercell charge
	var/state = 0 				//The current state. 0=off, 1=on, 2=working
	var/work_time = 100			//How long to perform an EKG
	var/high_chance_time = 1800	//Good chance of working, after this, low.
	var/low_chance_time = 3600	//Lower chance of working. After this, no.

//////////////////////////// New Proc ////////////////////////////
/obj/item/clothing/under/aed_vest/New()
	..()
	power_supply = new cell_type(src)
	power_supply.maxcharge = max_charge
	power_supply.give(power_supply.maxcharge)

///////////////////////////// Click /////////////////////////////
/obj/item/clothing/under/aed_vest/attack_self()
	..()
	if(!power_supply || !power_supply.charge)
		usr << "The vest seems to lack power. Check the battery?"
		state = 0
		return
	switch(state)
		if(0) //Off to on
			if(!power_supply.check_charge(charge_req))
				talk("Battery level insufficient. Replace battery.")
				state = 0
				return
			state = 1
			talk("AED online. Remove patient clothes, then fit vest to patient.",1)
			icon_state = "[initial(icon_state)]1"
			item_color = "[initial(item_color)]1"
			processing_objects.Add(src)
			idle_timeout()
		if(1,2) //On/Working to off
			state = 0
			process() //Rightnao!
	return

//////////////////////////// Process ////////////////////////////
/obj/item/clothing/under/aed_vest/process()
	if(!power_supply)
		talk("Critical components missing.")
		state = 0

	switch(state)
		if(0) //We're off but running process anyway. Clean it up.
			talk("Powering off.[power_supply.charge < power_supply.maxcharge ? " Please recharge battery." : null]")
			icon_state = initial(icon_state)
			item_color = initial(item_color)
			processing_objects.Remove(src)
		if(1) //We're looking for a valid patient to wear us.
			if(istype(loc,/mob/living/carbon/human)) //We're on/held by a person
				var/mob/living/carbon/human/H = loc
				if(H.w_uniform == src) //We're being worn by someone
					state = 2
					do_work(H)
		if(2) //We're in use on a patient.
			return //Let do_work do it

//////////////////////////// Worker ////////////////////////////
/obj/item/clothing/under/aed_vest/proc/do_work(var/mob/living/carbon/human/P)
	ASSERT(P.w_uniform == src) //Sanity

	talk("Performing EKG. Do not move patient!",1,P)

	sleep(30) //We'll give them some time to realize they should stop moving.

	var/countdown = work_time
	var/original_loc = P.loc

	while(countdown) //"Doing" an EKG
		countdown--
		if(!(P.loc == original_loc) || !(P.w_uniform == src))
			talk("Lost patient signal. Restarting!")
			state = 1
			return
		sleep(1)

	if(P.stat == 0 || P.stat == 1)
		talk("<span style='color:green;'>Patient has a pulse!</span>",1,P)
		state = 0
		process()
		P.regenerate_icons()
		return

	if(!power_supply.check_charge(charge_req))
		state = 0
		process()
		P.regenerate_icons()
		return

	if(P.stat == DEAD) //Uhoh.
		var/timedead = world.time - P.timeofdeath

		if(timedead > low_chance_time)
			talk("Patient has cardiac decay, unable to revive.")
			state = 0
		if((timedead > high_chance_time) && (timedead < low_chance_time))
			talk("<span style='color:red'>Patient has flatlined! Administering shock!</span>",1,P)
			shock(P,10)
		if(timedead < high_chance_time)
			talk("<span style='color:red'>Patient in v-fib! Administering shock!</span>",1,P)
			shock(P,25)


//////////////////////////// SHOCK ////////////////////////////
/obj/item/clothing/under/aed_vest/proc/shock(var/mob/living/carbon/human/P, var/chance = 0)
	sleep(20) //For dramatic effect, of course

	if(!P || !(P.w_uniform == src) || !power_supply.check_charge(charge_req)) //How did we get here?
		state = 1
		return

	for(var/mob/M in range(4,P))
		M << sound('sound/effects/sparks2.ogg',volume=120)

	P.visible_message("<B>[P]</B> convulses!")

	if(prob(chance))
		P.adjustBruteLoss(-10)
		P.adjustFireLoss(-10)
		P.adjustOxyLoss(-25)
		P.stat = 0
		P.tod = null
		P.timeofdeath = 0
		dead_mob_list -= P
		living_mob_list += P

		BITSET(P.hud_updateflag, HEALTH_HUD)
		BITSET(P.hud_updateflag, STATUS_HUD)

		P.regenerate_icons()

	//TODO Some sound
	power_supply.use(charge_req)
	sleep(20)
	do_work(P)

///////////////////////////// Voice /////////////////////////////
/obj/item/clothing/under/aed_vest/proc/talk(var/message,var/beep = 0,var/atom/movable/source = src)

	source.audible_message("<B>[src] buzzes</B>: <I>[message]</I>")

	if(beep)
		for(var/mob/M in range(4,source))
			M << sound('sound/machines/twobeep.ogg',volume=15)


//////////////////////////// Timeout ////////////////////////////
/obj/item/clothing/under/aed_vest/proc/idle_timeout()
	spawn(300)
		if(!istype(loc,/mob/living/carbon/human) && state)
			talk("[src] turning off due to idle timeout.")
			state = 0
		else
			idle_timeout()

///////////////////////////// Maint /////////////////////////////
/obj/item/clothing/under/aed_vest/attackby(obj/item/W, mob/user)
	if (istype(W, /obj/item/weapon/screwdriver))
		if(state)
			user << "Not while it's turned on!"
		if(power_supply)
			playsound(user.loc, 'sound/items/screwdriver.ogg', 60, 1)
			power_supply.loc = user.loc
			power_supply = null
			user << "You remove the power cell from the AED vest."
		else
			user << "The power cell is missing!"

	if (istype(W, /obj/item/weapon/cell))
		if(power_supply)
			user << "There's already a power cell inside!"
		else
			user.drop_item()
			W.loc = src
			power_supply = W
			user << "You insert the power cell."

	src.add_fingerprint(user)