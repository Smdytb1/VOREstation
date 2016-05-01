//Cat
/mob/living/simple_animal/cat
	name = "cat"
	desc = "A domesticated, feline pet. Has a tendency to adopt crewmembers."
	icon_state = "cat2"
	icon_living = "cat2"
	icon_dead = "cat2_dead"
	speak = list("Meow!","Esp!","Purr!","HSSSSS")
	speak_emote = list("purrs", "meows")
	emote_hear = list("meows","mews")
	emote_see = list("shakes their head", "shivers")
	speak_chance = 1
	turns_per_move = 5
	see_in_dark = 6
	meat_type = /obj/item/weapon/reagent_containers/food/snacks/meat
	response_help  = "pets"
	response_disarm = "gently pushes aside"
	response_harm   = "kicks"
	var/turns_since_scan = 0
	var/mob/living/simple_animal/mouse/movement_target
	var/mob/flee_target
	min_oxy = 16 //Require atleast 16kPA oxygen
	minbodytemp = 223		//Below -50 Degrees Celcius
	maxbodytemp = 323	//Above 50 Degrees Celcius
	holder_type = /obj/item/weapon/holder/cat
	mob_size = 5


/mob/living/simple_animal/cat/New()
	..()

// I can't think of cat messages. I am a fox. Please put some in and remove this comment. :( -Aro

/mob/living/simple_animal/cat/Life()
	//MICE!
	if((loc) && isturf(loc))
		if(!stat && !resting && !buckled)
			for(var/mob/living/simple_animal/mouse/M in loc)
				if(isPredator) //If the cat is a predator,
					movement_target = null
					custom_emote(1, "greedily stuffs [M] into their gaping maw!")
					if(M in oview(1, src))
						animal_nom(M)
					else
						M << "You just manage to slip away from [src]'s jaws before you can be sent to a fleshy prison!"
					break
				else
					if(!M.stat)
						M.splat()
						visible_emote(pick("bites \the [M]!","toys with \the [M].","chomps on \the [M]!"))
						movement_target = null
						stop_automated_movement = 0
						break

	..()

	for(var/mob/living/simple_animal/mouse/snack in oview(src,5))
		if(snack.stat < DEAD && prob(15))
			audible_emote(pick("hisses and spits!","mrowls fiercely!","eyes [snack] hungrily."))
		break

	if(!stat && !resting && !buckled) //SEE A MICRO AND ARE A PREDATOR, EAT IT!
		for(var/mob/living/carbon/human/food in oview(src, 5))

			if(food.playerscale <= RESIZE_A_SMALLTINY)
				if(prob(10))
					custom_emote(1, pick("eyes [food] hungrily!","licks their lips and turns towards [food] a little!","purrs as they imagine [food] being in their belly."))
					break
				else
					if(prob(5))
						movement_target = food
						break

		for(var/mob/living/carbon/human/bellyfiller in oview(1, src))
			if(bellyfiller in src.prey_excludes)
				continue

			if(bellyfiller.playerscale <= RESIZE_A_SMALLTINY && isPredator)
				movement_target = null
				custom_emote(1, pick("slurps [bellyfiller] with their sandpapery tongue.","looms over [bellyfiller] with their maw agape.","sniffs at [bellyfiller], their belly grumbling hungrily."))
				sleep(10)
				custom_emote(1, "starts to scoop [bellyfiller] into their maw!")
				if(bellyfiller in oview(1, src))
					animal_nom(bellyfiller)
				else
					bellyfiller << "You just manage to slip away from [src]'s jaws before you can be sent to a fleshy prison!"
				break

	if(!stat && !resting && !buckled)
		turns_since_scan++
		if (turns_since_scan > 5)
			walk_to(src,0)
			turns_since_scan = 0

			if (flee_target) //fleeing takes precendence
				handle_flee_target()
			else
				handle_movement_target()

/mob/living/simple_animal/cat/proc/handle_movement_target()
	//if our target is neither inside a turf or inside a human(???), stop
	if((movement_target) && !(isturf(movement_target.loc) || ishuman(movement_target.loc) ))
		movement_target = null
		stop_automated_movement = 0
	//if we have no target or our current one is out of sight/too far away
	if( !movement_target || !(movement_target.loc in oview(src, 4)) )
		movement_target = null
		stop_automated_movement = 0
		for(var/mob/living/simple_animal/mouse/snack in oview(src)) //search for a new target
			if(isturf(snack.loc) && !snack.stat)
				movement_target = snack
				break

	if(movement_target)
		stop_automated_movement = 1
		walk_to(src,movement_target,0,10)

/mob/living/simple_animal/cat/proc/handle_flee_target()
	//see if we should stop fleeing
	if (flee_target && !(flee_target.loc in view(src)))
		flee_target = null
		stop_automated_movement = 0

	if (flee_target)
		if(prob(25)) say("HSSSSS")
		stop_automated_movement = 1
		walk_away(src, flee_target, 7, 2)

/mob/living/simple_animal/cat/proc/set_flee_target(atom/A)
	if(A)
		flee_target = A
		turns_since_scan = 5

/mob/living/simple_animal/cat/attackby(var/obj/item/O, var/mob/user)
	. = ..()
	if(O.force)
		set_flee_target(user? user : src.loc)

/mob/living/simple_animal/cat/attack_hand(mob/living/carbon/human/M as mob)
	. = ..()
	if(M.a_intent == "hurt")
		set_flee_target(M)

/mob/living/simple_animal/cat/ex_act()
	. = ..()
	set_flee_target(src.loc)

/mob/living/simple_animal/cat/bullet_act(var/obj/item/projectile/proj)
	. = ..()
	set_flee_target(proj.firer? proj.firer : src.loc)

/mob/living/simple_animal/cat/hitby(atom/movable/AM)
	. = ..()
	set_flee_target(AM.thrower? AM.thrower : src.loc)

/mob/living/simple_animal/cat/MouseDrop(atom/over_object)

	var/mob/living/carbon/H = over_object
	if(!istype(H) || !Adjacent(H)) return ..()

	if(H.a_intent == "help")
		get_scooped(H)
		return
	else
		return ..()

/mob/living/simple_animal/cat/get_scooped(var/mob/living/carbon/grabber)
	if (stat >= DEAD)
		return //since the holder icon looks like a living cat
	..()

//Basic friend AI
/mob/living/simple_animal/cat/fluff
	var/mob/living/carbon/human/friend
	var/befriend_job = null

/mob/living/simple_animal/cat/fluff/handle_movement_target()
	if (friend)
		var/follow_dist = 5
		if (friend.stat >= DEAD || friend.health <= config.health_threshold_softcrit) //danger
			follow_dist = 1
		else if (friend.stat || friend.health <= 50) //danger or just sleeping
			follow_dist = 2
		var/near_dist = max(follow_dist - 2, 1)
		var/current_dist = get_dist(src, friend)

		if (movement_target != friend)
			if (current_dist > follow_dist && !istype(movement_target, /mob/living/simple_animal/mouse) && (friend in oview(src)))
				//stop existing movement
				walk_to(src,0)
				turns_since_scan = 0

				//walk to friend
				stop_automated_movement = 1
				movement_target = friend
				walk_to(src, movement_target, near_dist, 4)

		//already following and close enough, stop
		else if (current_dist <= near_dist)
			walk_to(src,0)
			movement_target = null
			stop_automated_movement = 0
			if (prob(10))
				say("Meow!")

	if (!friend || movement_target != friend)
		..()

/mob/living/simple_animal/cat/fluff/Life()
	..()
	if (stat || !friend)
		return
	if (get_dist(src, friend) <= 1)
		if (friend.stat >= DEAD || friend.health <= config.health_threshold_softcrit)
			if (prob((friend.stat < DEAD)? 50 : 15))
				var/verb = pick("meows", "mews", "mrowls")
				audible_emote(pick("[verb] in distress.", "[verb] anxiously."))
		else
			if (prob(5))
				visible_emote(pick("nuzzles [friend].",
								   "brushes against [friend].",
								   "rubs against [friend].",
								   "purrs."))
	else if (friend.health <= 50)
		if (prob(10))
			var/verb = pick("meows", "mews", "mrowls")
			audible_emote("[verb] anxiously.")

/mob/living/simple_animal/cat/fluff/verb/friend()
	set name = "Become Friends"
	set category = "IC"
	set src in view(1)

	if(friend && usr == friend)
		set_dir(get_dir(src, friend))
		say("Meow!")
		return

	if (!(ishuman(usr) && befriend_job && usr.job == befriend_job))
		usr << "<span class='notice'>[src] ignores you.</span>"
		return

	friend = usr

	set_dir(get_dir(src, friend))
	say("Meow!")

//RUNTIME IS ALIVE! SQUEEEEEEEE~
/mob/living/simple_animal/cat/fluff/Runtime
	name = "Runtime"
	desc = "Her fur has the look and feel of velvet, and her tail quivers occasionally."
	gender = FEMALE
	icon_state = "cat"
	icon_living = "cat"
	icon_dead = "cat_dead"
	befriend_job = "Chief Medical Officer"
	isPredator = 1

/mob/living/simple_animal/cat/fluff/Runtime/New()

	if(!vore_organs.len)
		var/datum/belly/B = new /datum/belly(src)
		B.immutable = 1
		B.name = "Stomach"
		B.inside_flavor = "The slimy wet insides of Runtime! Not quite as clean as the cat on the outside."
		B.human_prey_swallow_time = swallowTime
		B.nonhuman_prey_swallow_time = swallowTime
		vore_organs[B.name] = B
		vore_selected = B.name

		B.emote_lists[DM_HOLD] = list(
			"Runtime's stomach kneads gently on you and you're fairly sure you can hear her start purring.",
			"Most of what you can hear are slick noises, Runtime breathing, and distant purring.",
			"Runtime seems perfectly happy to have you in there. She lays down for a moment to groom and squishes you against the walls.",
			"The CMO's pet seems to have found a patient of her own, and is treating them with warm, wet kneading walls.",
			"Runtime mostly just lazes about, and you're left to simmer in the hot, slick guts unharmed.",
			"Runtime's master might let you out of this fleshy prison, eventually. Maybe.")

		B.emote_lists[DM_DIGEST] = list(
			"Runtime's stomach is treating you rather like a mouse, kneading acids into you with vigor.",
			"A thick dollop of bellyslime drips from above while the CMO's pet's gut works on churning you up.",
			"Runtime seems to have decided you're food, based on the acrid air in her guts and the pooling fluids.",
			"Runtime's stomach tries to claim you, kneading and pressing inwards again and again against your form.",
			"Runtime flops onto their side for a minute, spilling acids over your form as you remain trapped in them.",
			"The CMO's pet doesn't seem to think you're any different from any other meal. At least, their stomach doesn't.")

	..()

/mob/living/simple_animal/cat/kitten
	name = "kitten"
	desc = "D'aaawwww"
	icon_state = "kitten"
	icon_living = "kitten"
	icon_dead = "kitten_dead"
	gender = NEUTER

/mob/living/simple_animal/cat/kitten/New()
	gender = pick(MALE, FEMALE)
	..()

