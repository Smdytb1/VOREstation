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
	src.visible_message("\blue \the [src] weaves a web from their spinneret silk.")
	spawn(30) //3 seconds to form
		new /obj/effect/spider/stickyweb(src.loc)

mob/proc/weaveWebBindings()
	set name = "Weave Web Bindings"
	set category = "Species Powers"
	src.visible_message("\blue \the [src] pulls silk from their spinneret and delicately weaves it into bindings.")
	spawn(30) //5 seconds to weave the bindings~
		var/obj/item/clothing/suit/web_bindings/bindings = new()
		src.put_in_hands(bindings)