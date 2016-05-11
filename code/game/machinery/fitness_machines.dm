/obj/machinery/workout
	name = "fitness lifter"
	icon = 'icons/obj/objects.dmi'
	icon_state = "fitnesslifter" //Sprites ripped from goon.
	desc = "A utility often used to lose weight."
	anchored = 1
	use_power = 0
	idle_power_usage = 0
	active_power_usage = 0

/obj/machinery/workout/attackby(obj/item/W as obj, mob/user as mob)
	if(istype(W, /obj/item/weapon/wrench))
		src.add_fingerprint(user)
		user.visible_message("<span class='warning'>[user] has [anchored ? "un" : ""]secured \the [src].</span>", "<span class='notice'>You [anchored ? "un" : ""]secure \the [src].</span>")
		anchored = !anchored
		playsound(src.loc, 'sound/items/Ratchet.ogg', 50, 1)
		return

/obj/machinery/workout/attack_hand(var/mob/user as mob)
	if(!anchored)
		usr << "<span class='notice'>For safety reasons, you are required to have this equipment wrenched down before using it!</span>"
		return
	if(usr.loc != src.loc)
		usr << "<span class='notice'>For safety reasons, you need to be sitting in the fitness lifter for it to work!</span>"
		return
	if(usr.nutrition > 70 && usr.weight > 70) //If they have enough nutrition and body weight, they can exercise.
		usr.dir = src.dir
		usr.nutrition = usr.nutrition - 20 //Working out burns a lot of calories!
		usr.weight = usr.weight - 0.05 //Burn a bit of weight. Not much, but quite a bit. This can't be spammed, as they'll need nutrition to be able to work out.
		icon_state = "fitnesslifter2"
		usr << "<span class='notice'>You lift some weights.</span>"
		sleep(50)
		icon_state = "fitnesslifter"


	else if(usr.nutrition < 70)
		usr << "<span class='notice'>You need more energy to workout on the mat!</span>"

	else if(usr.weight < 70)
		usr << "<span class='notice'>You're too skinny to risk losing any more weight!</span>"

	else
		usr << "<span class='notice'>You're unable to use the fitness lifter.</span>"
		return //Something went wrong. They shouldn't see this.

/obj/machinery/workout/shipped
	anchored = 0 // For cargo.


/obj/machinery/punching_bag
	name = "punching bag"
	icon = 'icons/obj/objects.dmi'
	icon_state = "punchingbag"
	desc = "A bag often used to releive stress and burn fat."
	anchored = 1
	density = 1
	use_power = 0
	idle_power_usage = 0
	active_power_usage = 0

/obj/machinery/punching_bag/attack_hand(var/mob/user as mob)

	if(usr.nutrition > 35 && usr.weight > 70) //If they have enough nutrition and body weight, they can exercise.
		var/workout = rand(1,2)
		usr.nutrition = usr.nutrition - 10 //A punching bag uses less calories.
		usr.weight = usr.weight - 0.025 //And burns less weight.
		icon_state = "punchingbag2"
		switch(workout)
			if(1)
				usr << "<span class='notice'>You slam your fist into the punching bag.</span>"
			if(2)
				usr << "<span class='notice'>You jab the punching bag with your elbow.</span>"
		playsound(src.loc, "punch", 50, 1)
		sleep(50)
		icon_state = "punchingbag"


	else if(usr.nutrition < 35)
		usr << "<span class='notice'>You need more energy to workout on the mat!</span>"

	else if(usr.weight < 70)
		usr << "<span class='notice'>You're too skinny to risk losing any more weight!</span>"

	else
		usr << "<span class='notice'>You're unable to use the punching bag.</span>"
		return //Something went wrong. They shouldn't see this.


/obj/machinery/punching_clown
	name = "clown punching bag"
	icon = 'icons/obj/objects.dmi'
	icon_state = "bopbag"
	desc = "A bag often used to releive stress and burn fat. It has a clown on the front of it."
	anchored = 0
	density = 1
	use_power = 0
	idle_power_usage = 0
	active_power_usage = 0

/obj/machinery/punching_clown/attack_hand(var/mob/user as mob)

	if(usr.nutrition > 35 && usr.weight > 70) //If they have enough nutrition and body weight, they can exercise.
		var/workout = rand(1,4)
		usr.nutrition = usr.nutrition - 10
		usr.weight = usr.weight - 0.025
		icon_state = "bopbag2"
		switch(workout)
			if(1)
				usr << "<span class='notice'>You slam your fist into the punching bag.</span>"
			if(2)
				usr << "<span class='notice'>You jab the punching bag with your elbow.</span>"
			if(3)
				usr << "<span class='notice'>You hammer the clown right in it's face with your fist.</span>"
			if(4)
				usr << "<span class='notice'>A honk emits from the punching bag as you hit it.</span>"
		playsound(src.loc, "punch", 50, 1)
		playsound(src.loc, "clownstep", 50, 1)
		playsound(src.loc, 'sound/items/bikehorn.ogg', 50, 1)
		sleep(50)
		icon_state = "bopbag"


	else if(usr.nutrition < 35)
		usr << "<span class='notice'>You need more energy to workout on the mat!</span>"

	else if(usr.weight < 70)
		usr << "<span class='notice'>You're too skinny to risk losing any more weight!</span>"

	else
		usr << "<span class='notice'>You're unable to use the punching bag.</span>"
		return //Something went wrong. They shouldn't see this.




/obj/machinery/scale
	name = "scale"
	icon = 'icons/obj/objects.dmi'
	icon_state = "scale"
	desc = "A scale used to measure ones weight relative to their size and species."
	anchored = 1 // Set to 0 when we can construct or dismantle these.
	use_power = 0
	idle_power_usage = 0
	active_power_usage = 0
	var/kilograms

/obj/machinery/scale/attack_hand(var/mob/user as mob)
	if(usr.loc != src.loc)
		usr << "<span class='notice'>You need to be standing on top of the scale for it to work!</span>"
		return
	if(usr.weight) //Just in case.
		kilograms = round(text2num(usr.weight),4) / 2.20463
		usr << "<span class='notice'>Your relative weight is [usr.weight]lb / [kilograms]kg.</span>"
		usr.visible_message("<span class='warning'>[usr]'s relative weight is [usr.weight]lb / [kilograms]kg.</span>")
