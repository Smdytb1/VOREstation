// Defib vest, because I think an actual defib is beyond most medical staff...
// So here's the AED-in-a-vest version


///////////////////////////// Object /////////////////////////////
/obj/item/clothing/under/aed_vest
	name = "aed vest"
	desc = "Automated external defibrillator. In a vest! Turn on, apply to patient."
	//icon = '' //TODO
	//icon_state = "" //TODO

	var/obj/item/weapon/cell/power_supply
	var/obj/item/weapon/cell/capacitor
	var/cell_type = /obj/item/weapon/cell

	var/charge_req = 500 		//Charge required per shock
	var/state = 0 				//The current state. 0=off, 1=on, 2=working
	var/work_time = 50 			//How long to perform an EKG
	var/charge_speed = 5 		//Deciseconds between charge pulses
	var/charge_amt = 100 		//Amount to charge per pulse
	var/high_chance_time = 1200	//Good chance of working, after this, low.
	var/low_chance_time = 3600	//Lower chance of working. After this, no.

//////////////////////////// New Proc ////////////////////////////
/obj/item/clothing/under/aed_vest/New()
	..()
	power_supply = new cell_type(src)
	capacitor = new cell_type(src)
	power_supply.give(power_supply.maxcharge)
	capacitor.charge = 0

///////////////////////////// Click /////////////////////////////
/obj/item/clothing/under/aed_vest/attack_self()
	..()
	usr << "Attack_self called"
	if(!power_supply || !power_supply.charge || !capacitor)
		usr << "The vest seems to lack power. Check the battery?"
		state = 0
		return

	switch(state)

		if(0) //Off to on
			state = 1
			visible_message("[src] buzzes: <I>[src] online. Remove patient clothes, then fit vest to patient.</I>")
			processing_objects.Add(src)
			idle_timeout()
			if(power_supply.charge < (charge_req - capacitor.charge))
				visible_message("[src] buzzes: <I>Battery level insufficient. Replace battery. Powering off.</I>")
				state = 0

		if(1) //On to off
			state = 0
			processing_objects.Remove(src)

		if(2) //Working to off
			state = 0
			processing_objects.Remove(src)

//////////////////////////// Process ////////////////////////////
/obj/item/clothing/under/aed_vest/process()
	..()
	if(!power_supply || !capacitor)
		visible_message("[src] buzzes: <I>Critical components missing. Powering off.</I>")
		state = 0

	if(power_supply.charge < charge_amt)
		visible_message("[src] buzzes: <I>Battery charge too low. Replace battery. Powering off.</I>")
		state = 0

	switch(state)
		if(0) //We're off but running process anyway. Clean it up.
			processing_objects.Remove(src)
			return
		if(1) //We're looking for a valid patient to wear us.
			if(istype(loc,/mob/living/carbon/human)) //We're on/held by a person
				var/mob/living/carbon/human/H = loc
				if(H.w_uniform == src) //We're being worn by someone
					visible_message("[src] buzzes: <I>Found patient. Vest is [capacitor.charge < charge_req ? "charging now." : "fully charged."]</I>")
					state = 2
					do_work(H)
		if(2) //We're in use on a patient.
			return //Let do_work do it


//////////////////////////// Worker ////////////////////////////
/obj/item/clothing/under/aed_vest/proc/do_work(var/mob/living/carbon/human/P)
	ASSERT(P.w_uniform == src) //Sanity

	if(capacitor.charge < charge_req)
		spawn() //Sneaky multithreaded charging.
			charge()

	visible_message("[src] buzzes: <I>Performing EKG. <B>DO NOT MOVE PATIENT!</B></I>")

	sleep(30) //We'll give them some time to realize they should stop moving.

	var/countdown = work_time
	var/original_loc = P.loc

	while(countdown) //"Doing" an EKG
		countdown--
		if(!P.loc == original_loc || !P.w_uniform == src)
			visible_message("[src] buzzes: <I>Lost patient signal. Restarting!</I>")
			state = 1
			return
		sleep(1)

	if(P.stat == 0 || P.stat == 1)
		visible_message("[src] buzzes: <I>Patient does not need defib. Powering off.</I>")
		state = 0
		return

	if(P.stat == DEAD) //Uhoh.
		var/timedead = world.time - P.timeofdeath

		//No chance
		if(timedead > low_chance_time)
			visible_message("[src] buzzes: <I>Patient has cardiac decay, unable to revive. Powering off.</I>")
			state = 0
			return

		//Low chance
		if(timedead < low_chance_time && timedead > high_chance_time)
			visible_message("[src] buzzes: <I><span style='color:red'>Patient has flatlined! Administering shock!</span></I>")
			shock(P,30)

		//Good chance
		if(timedead < high_chance_time)
			visible_message("[src] buzzes: <I><span style='color:red'>Patient in v-fib! Administering shock!</span></I>")
			shock(P,60)

/////////////////////////// Charging ///////////////////////////
/obj/item/clothing/under/aed_vest/proc/charge()
	while((capacitor.charge < charge_req) && state)
		power_supply.charge -= charge_amt
		capacitor.charge += charge_amt
		sleep(charge_speed)

//////////////////////////// SHOCK ////////////////////////////
/obj/item/clothing/under/aed_vest/proc/shock(var/mob/living/carbon/human/P, var/chance)
	sleep(20) //For dramatic effect, of course

	if(!P || !P.w_uniform == src) //How did we get here?
		state = 1
		return

	//TODO Some sound



//////////////////////////// Timeout ////////////////////////////
/obj/item/clothing/under/aed_vest/proc/idle_timeout()
	spawn(300)
		if(!istype(loc,/mob/living/carbon/human) && state)
			visible_message("[src] buzzes: <I>[src] turning off due to idle timeout.</I>")
			state = 0
		else
			idle_timeout()