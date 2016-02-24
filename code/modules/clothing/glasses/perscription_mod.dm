/obj/item/device/glasses_upgrade
	name = "prescription lense upgrade kit"
	desc = "You can use this to upgrade the lense on any set of eyewear to aid near-sighted persons."
	icon = 'icons/obj/storage.dmi'
	icon_state = "glasses" // TODO: Better icons

/obj/item/device/glasses_upgrade/afterattack(obj/item/clothing/glasses/O, mob/user as mob)

	if(istype(O,/obj/item/clothing/glasses/fluff) || istype(O,/obj/item/clothing/glasses/welding))
		user << "<span class='warning'>You can't upgrade this eyewear with a prescription lense.</span>"
		return
	if(istype(O,/obj/item/clothing/glasses/eyepatch))
		user << "<span class='warning'>That is an eyepatch, dumbass. Its purpose is the opposite of seeing.</span>"
		return
	if(istype(O,/obj/item/clothing/glasses/sunglasses/blindfold))
		user << "<span class='warning'>That is a blindfold, dumbass. Its purpose is the opposite of seeing.</span>"
		return
	if(istype(O,/obj/item/clothing/glasses) && O.prescription == 1)
		user << "<span class='warning'>This already has a prescription lense set.</span>"
		return
	if(istype(O,/obj/item/clothing/glasses))
		O.prescription = 1
		O.name = "prescription [initial(O.name)]"
		playsound(user.loc, 'sound/items/Deconstruct.ogg', 100, 1)
		user.visible_message("\red [user] replaces \the [O] lense with a new prescription lense.")
		del(src)