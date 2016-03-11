/obj/structure/closet/secure_closet/egg
	name = "egg"
	desc = "It's an egg; it's smooth to the touch." //This is the default egg.
	icon = 'icons/obj/closet.dmi'
	icon_state = "egg"
	density = 0 //Just in case there's a lot of eggs, so it doesn't block hallways/areas.
	icon_closed = "egg"
	icon_opened = "egg_open" //Need a sprite of a broken egg.
	open_sound = 'sound/vore/schlorp.ogg'
	close_sound = 'sound/vore/schlorp.ogg'
	opened = 0
	welded = 0 //If it is welded, people can't escape. DON'T WELD IT
	health = 100
	
	
//Sprites and extra coding needed for these to work with transformation. For now, a regular egg should suffice.
/*

/obj/structure/closet/secure_closet/egg/unathi
	name = "unathi egg"
	desc = "Some species of Unathi apparently lay soft-shelled eggs!"
	icon = 'icons/obj/closet.dmi'
	icon_state = "egg_unathi"
	icon_closed = "egg_unathi"
	icon_opened = "egg_unathi_open" 
	
/obj/structure/closet/secure_closet/egg/nevarean
	name = "nevarean egg"
	desc = "Most Nevareans lay hard-shelled eggs!"
	icon = 'icons/obj/closet.dmi'
	icon_state = "egg_nevarean"
	icon_closed = "egg_nevarean"
	icon_opened = "egg_nevarean_open" 
	
/obj/structure/closet/secure_closet/egg/human
	name = "human egg"
	desc = "Some humans--wait, what?"
	icon = 'icons/obj/closet.dmi'
	icon_state = "egg_human"
	icon_closed = "egg_human"
	icon_opened = "egg_human_open" 
	
/obj/structure/closet/secure_closet/egg/tajaran
	name = "tajaran egg"
	desc = "Apparently that's what a Tajaran egg looks like. Weird." 
	icon = 'icons/obj/closet.dmi'
	icon_state = "egg_tajaran"
	icon_closed = "egg_tajaran"
	icon_opened = "egg_tajaran_open" 
	
/obj/structure/closet/secure_closet/egg/skrell
	name = "skrell egg"
	desc = "It's soft and squishy"
	icon = 'icons/obj/closet.dmi'
	icon_state = "egg_skrell"
	icon_closed = "egg_skrell"
	icon_opened = "egg_skrell_open" 
*/

/obj/structure/closet/proc/mob_breakout(var/mob/living/escapee)
	var/breakout_time = 2 //2 minutes by default

	if(!req_breakout())
		return

	//okay, so the closet is either welded or locked... resist!!!
	escapee.next_move = world.time + 100
	escapee.last_special = world.time + 100
	escapee << "<span class='warning'>You lean on the back of \the [src] and start pushing the door open. (this will take about [breakout_time] minutes)</span>"
	
	visible_message("<span class='danger'>The [src] begins to shake violently!</span>")

	breakout = 1 //can't think of a better way to do this right now.
	for(var/i in 1 to (6*breakout_time * 2)) //minutes * 6 * 5seconds * 2
		playsound(src.loc, 'sound/vore/schlorp.ogg', 100, 1)
		animate_shake()
		
		if(!do_after(escapee, 50)) //5 seconds
			breakout = 0
			return
		if(!escapee || escapee.stat || escapee.loc != src) 
			breakout = 0
			return //closet/user destroyed OR user dead/unconcious OR user no longer in closet OR closet opened
		//Perform the same set of checks as above for weld and lock status to determine if there is even still a point in 'resisting'...
		if(!req_breakout())
			breakout = 0
			return
	
	//Well then break it!
	breakout = 0
	escapee << "<span class='warning'>You successfully break out!</span>"
	visible_message("<span class='danger'>\the [escapee] successfully broke out of \the [src]!</span>")
	playsound(src.loc, 'sound/effects/grillehit.ogg', 100, 1)
	break_open()
	animate_shake()
