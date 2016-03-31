/mob/living/carbon/human/Logout()
	..()
	if(species) species.handle_logout_special(src)
	src.disconnect_time = world.realtime
	return