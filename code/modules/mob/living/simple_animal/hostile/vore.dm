/mob/living/simple_animal/hostile/vore
//	name = ""
//	icon_dead = "snake-dead"
//	icon_living = "snake"
//	icon_state = "snake"
	icon = 'icons/mob/vore.dmi'
	var/capacity = 1 // Zero is infinite. Do not set higher than you have icons to update.
	var/max_size = 1 // Max: 2
	var/min_size = 0.25 // Min: 0.25
	var/picky = 1 // Won't eat undigestable prey by default
	var/fullness = 0

/*
--------------
NOTES FOR DEVS
--------------

If your predator has a limited capacity, it should have sprites for every interval of its size, rounded to the nearest whole number.
Example: If I have a snake predator who has a capacity of 3, I need sprites for snake-1, snake-2, and snake-3.

Capacity should always be a whole number.

Also max_size and min_size should never exceed capacity or the icon will break.

Don't use ranged mobs for vore mobs.
*/

/mob/living/simple_animal/hostile/vore/update_icons()
	if(capacity)
		fullness = 0
		for(var/I in vore_organs)
			var/datum/belly/B = vore_organs[I]
			for(var/mob/living/M in B.internal_contents)
				fullness += M.playerscale
				fullness = round(fullness, 1) // Because intervals of 0.25 are going to make sprite artists cry.
		if(fullness)
			icon_state = "[initial(icon_state)]-[fullness]"
		else
			icon_state = initial(icon_state)
	..()

/mob/living/simple_animal/hostile/vore/New()
	..()
	//Create the 'stomach' immediately.
	var/datum/belly/B = new /datum/belly(src)
	B.immutable = 1
	B.name = "Stomach"
	B.inside_flavor = "It appears to be rather warm and wet. Makes sense, considering it's inside \the [name]."
	B.digest_mode = "Digest"
	vore_organs[B.name] = B
	vore_selected = "Stomach"

/mob/living/simple_animal/hostile/vore/AttackingTarget()
	if(picky && !target_mob.digestable)
		..()
		return
	if(target_mob.lying && target_mob.playerscale >= min_size && target_mob.playerscale <= max_size)
		if(!capacity)
			animal_nom(target_mob)
		if(capacity)
			var/check_size = target_mob.playerscale + fullness
			if(check_size < capacity)
				animal_nom(target_mob)
				update_icons()
	..()

/mob/living/simple_animal/hostile/vore/death()
	for(var/I in vore_organs)
		var/datum/belly/B = vore_organs[I]
		B.release_all_contents() // When your stomach is empty
	..() // then you have my permission to die.


// ------- Big Preds ------- //

/mob/living/simple_animal/hostile/vore/large
	name = "giant snake"
	desc = "Snakes. Why did it have to be snakes?"
	icon = 'icons/mob/vore64x64.dmi'
	icon_dead = "snake-dead"
	icon_living = "snake"
	icon_state = "snake"
	pixel_x = -16