// ---------------------------------------------
// -!-!-!-!-!-!-!-!- READ ME -!-!-!-!-!-!-!-!-!-
// ---------------------------------------------

//Beep beep hello
//
//Use this file to define the exclusive abilities of the spidertaur folk
//
//ahuhuhuhu
//-Antsnap

obj/item/clothing/suit/web_bindings
	icon = 'icons/obj/clothing/suits.dmi'
	name = "web bindings"
	desc = "A webbed cocoon that completely restrains the wearer."
	icon_state = "web_bindings"
	item_state = "web_bindings"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT|HIDETAIL

mob/proc/weaveWeb()
	set name = "Weave Web"
	set category = "Species Powers"
	if(nutrition >= 30) //BUGS!
		src.visible_message("\blue \the [src] weaves a web from their spinneret silk.")
		nutrition -= 30 //Squash the bugs!
		spawn(30) //3 seconds to form
		new /obj/effect/spider/stickyweb(src.loc)
	else
		src << "You do not have enough nutrition to create webbing!"

mob/proc/weaveWebBindings()
	set name = "Weave Web Bindings"
	set category = "Species Powers"
	if(nutrition >= 30) //Due to the restrictions of this being a direct proc, I can't put on a time delay.
		src.visible_message("\blue \the [src] pulls silk from their spinneret and delicately weaves it into bindings.")
		nutrition -= 30 //So don't abuse this or you'll make the coders cry and raise the nutirition needed.
		spawn(30) //5 seconds to weave the bindings~
			var/obj/item/clothing/suit/web_bindings/bindings = new() //This sprite is amazing, I must say.
			src.put_in_hands(bindings)
	else
		src << "You do not have enough nutrition to create webbing!" //CK~
