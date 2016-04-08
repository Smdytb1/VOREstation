/obj/machinery/button/workout
	name = "fitness lifter"
	icon = 'icons/obj/objects.dmi'
	icon_state = "fitnesslifter" //Sprites ripped from goon.
	desc = "A utility often used to lose weight."
	anchored = 1.0
	use_power = 0
	idle_power_usage = 0
	active_power_usage = 0

/obj/machinery/button/workout/attack_hand(var/mob/user as mob)

	if(usr.nutrition > 70 && usr.weight > 70) //If they have enough nutrition and body weight, they can exercise.
		usr.nutrition = usr.nutrition - 70 //Working out burns a lot of calories!
		usr.weight = usr.weight - 0.1 //Burn a bit of weight. Not much, but quite a bit. This can't be spammed, as they'll need nutrition to be able to work out.
		icon_state = "fitnesslifter2"
		usr << "<span class='notice'>You lift some weights.</span>"
		sleep(50)
		icon_state = "fitnesslifter"


	else if(usr.nutrition < 70)
		usr << "<span class='notice'>You need more energy to workout on the mat!</span>"

	else if(usr.weight < 70)
		usr << "<span class='notice'>You're too skinny to risk losing any more weight!</span>"

	else
		return //Something went wrong. They shouldn't see this.


/obj/machinery/button/punching
	name = "punching bag"
	icon = 'icons/obj/objects.dmi'
	icon_state = "punchingbag"
	desc = "A bag often used to releive stress and burn fat."
	anchored = 1.0
	use_power = 0
	idle_power_usage = 0
	active_power_usage = 0

/obj/machinery/button/punching/attack_hand(var/mob/user as mob)

	if(usr.nutrition > 35 && usr.weight > 70) //If they have enough nutrition and body weight, they can exercise.
		var/workout = rand(1,2)
		usr.nutrition = usr.nutrition - 35 //A punching bag uses less calories.
		usr.weight = usr.weight - 0.05 //And burns less weight.
		icon_state = "punchingbag2"
		switch(workout)
			if(1)
				usr << "<span class='notice'>You slam your fist into the punching bag.</span>"
			if(2)
				usr << "<span class='notice'>You jab the punching bag with your elbow.</span>"
		sleep(50)
		icon_state = "punchingbag"


	else if(usr.nutrition < 35)
		usr << "<span class='notice'>You need more energy to workout on the mat!</span>"

	else if(usr.weight < 70)
		usr << "<span class='notice'>You're too skinny to risk losing any more weight!</span>"

	else
		return //Something went wrong. They shouldn't see this.


/obj/machinery/button/punching_clown
	name = "clown punching bag"
	icon = 'icons/obj/objects.dmi'
	icon_state = "bopbag"
	desc = "A bag often used to releive stress and burn fat. It has a clown on the front of it."
	anchored = 1.0
	use_power = 0
	idle_power_usage = 0
	active_power_usage = 0

/obj/machinery/button/punching_clown/attack_hand(var/mob/user as mob)

	if(usr.nutrition > 35 && usr.weight > 70) //If they have enough nutrition and body weight, they can exercise.
		var/workout = rand(1,4)
		usr.nutrition = usr.nutrition - 35 //A punching bag uses less calories.
		usr.weight = usr.weight - 0.1 //The hatred of the clown causes you to burn more weight.
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
		sleep(50)
		icon_state = "bopbag"


	else if(usr.nutrition < 35)
		usr << "<span class='notice'>You need more energy to workout on the mat!</span>"

	else if(usr.weight < 70)
		usr << "<span class='notice'>You're too skinny to risk losing any more weight!</span>"

	else
		return //Something went wrong. They shouldn't see this.