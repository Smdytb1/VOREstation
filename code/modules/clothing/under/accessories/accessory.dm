/obj/item/clothing/accessory
	name = "tie"
	desc = "A neosilk clip-on tie."
	icon = 'icons/obj/clothing/ties.dmi'
	icon_state = "bluetie"
	item_state = ""	//no inhands
	item_color = "bluetie"
	slot_flags = SLOT_TIE
	w_class = 2.0
	icon_override = 'icons/mob/ties.dmi'
	var/slot = "decor"
	var/obj/item/clothing/under/has_suit = null		//the suit the tie may be attached to
	var/image/inv_overlay = null	//overlay used when attached to clothing.

/obj/item/clothing/accessory/New()
	..()
	inv_overlay = image("icon" = 'icons/obj/clothing/ties_overlay.dmi', "icon_state" = item_color ? item_color : icon_state)

//when user attached an accessory to S
/obj/item/clothing/accessory/proc/on_attached(obj/item/clothing/under/S, mob/user as mob)
	if(!istype(S))
		return
	has_suit = S
	loc = has_suit
	has_suit.overlays += inv_overlay

	user << "<span class='notice'>You attach [src] to [has_suit].</span>"
	src.add_fingerprint(user)

/obj/item/clothing/accessory/proc/on_removed(mob/user as mob)
	if(!has_suit)
		return
	has_suit.overlays -= inv_overlay
	has_suit = null
	usr.put_in_hands(src)
	src.add_fingerprint(user)

//default attackby behaviour
/obj/item/clothing/accessory/attackby(obj/item/I, mob/user)
	..()

//default attack_hand behaviour
/obj/item/clothing/accessory/attack_hand(mob/user as mob)
	if(has_suit)
		return	//we aren't an object on the ground so don't call parent
	..()

/obj/item/clothing/accessory/blue
	name = "blue tie"
	icon_state = "bluetie"
	item_color = "bluetie"

/obj/item/clothing/accessory/red
	name = "red tie"
	icon_state = "redtie"
	item_color = "redtie"

/obj/item/clothing/accessory/horrible
	name = "horrible tie"
	desc = "A neosilk clip-on tie. This one is disgusting."
	icon_state = "horribletie"
	item_color = "horribletie"

/obj/item/clothing/accessory/stethoscope
	name = "stethoscope"
	desc = "An outdated medical apparatus for listening to the sounds of the human body. It also makes you look like you know what you're doing."
	icon_state = "stethoscope"
	item_color = "stethoscope"

/obj/item/clothing/accessory/stethoscope/attack(mob/living/carbon/human/M, mob/living/user)
	if(ishuman(M) && isliving(user))
		if(user.a_intent == "help")
			var/body_part = parse_zone(user.zone_sel.selecting)
			if(body_part)
				var/their = "their"
				switch(M.gender)
					if(MALE)	their = "his"
					if(FEMALE)	their = "her"

				var/sound = "pulse"
				var/sound_strength

				if(M.stat == DEAD || (M.status_flags&FAKEDEATH))
					sound_strength = "cannot hear"
					sound = "anything"
				else
					sound_strength = "hear a weak"
					switch(body_part)
						if("chest")
							if(M.oxyloss < 50)
								sound_strength = "hear a healthy"
							sound = "pulse and respiration"
						if("eyes","mouth")
							sound_strength = "cannot hear"
							sound = "anything"
						else
							sound_strength = "hear a weak"

				user.visible_message("[user] places [src] against [M]'s [body_part] and listens attentively.", "You place [src] against [their] [body_part]. You [sound_strength] [sound].")
				return
	return ..(M,user)

/*
	Holobadges are worn on the belt or neck, and can be used to show that the holder is an authorized
	Security agent - the user details can be imprinted on the badge with a Security-access ID card,
	or they can be emagged to accept any ID for use in disguises.
*/

/obj/item/clothing/accessory/holobadge
	name = "holobadge"
	desc = "This glowing blue badge marks the holder as THE LAW."
	icon_state = "holobadge"
	item_color = "holobadge"
	slot_flags = SLOT_BELT | SLOT_TIE

	var/emagged = 0 //Emagging removes Sec check.
	var/stored_name = null

/obj/item/clothing/accessory/holobadge/cord
	icon_state = "holobadge-cord"
	item_color = "holobadge-cord"
	slot_flags = SLOT_MASK | SLOT_TIE

/obj/item/clothing/accessory/holobadge/attack_self(mob/user as mob)
	if(!stored_name)
		user << "Waving around a badge before swiping an ID would be pretty pointless."
		return
	if(isliving(user))
		user.visible_message("\red [user] displays their NanoTrasen Internal Security Legal Authorization Badge.\nIt reads: [stored_name], NT Security.","\red You display your NanoTrasen Internal Security Legal Authorization Badge.\nIt reads: [stored_name], NT Security.")

/obj/item/clothing/accessory/holobadge/attackby(var/obj/item/O as obj, var/mob/user as mob)

	if (istype(O, /obj/item/weapon/card/emag))
		if (emagged)
			user << "\red [src] is already cracked."
			return
		else
			emagged = 1
			user << "\red You swipe [O] and crack the holobadge security checks."
			return

	else if(istype(O, /obj/item/weapon/card/id) || istype(O, /obj/item/device/pda))

		var/obj/item/weapon/card/id/id_card = null

		if(istype(O, /obj/item/weapon/card/id))
			id_card = O
		else
			var/obj/item/device/pda/pda = O
			id_card = pda.id

		if(access_security in id_card.access || emagged)
			user << "You imprint your ID details onto the badge."
			stored_name = id_card.registered_name
			name = "holobadge ([stored_name])"
			desc = "This glowing blue badge marks [stored_name] as THE LAW."
		else
			user << "[src] rejects your insufficient access rights."
		return
	..()

/obj/item/clothing/accessory/holobadge/attack(mob/living/carbon/human/M, mob/living/user)
	if(isliving(user))
		user.visible_message("\red [user] invades [M]'s personal space, thrusting [src] into their face insistently.","\red You invade [M]'s personal space, thrusting [src] into their face insistently. You are the law.")

/obj/item/weapon/storage/box/holobadge
	name = "holobadge box"
	desc = "A box claiming to contain holobadges."
	New()
		new /obj/item/clothing/accessory/holobadge(src)
		new /obj/item/clothing/accessory/holobadge(src)
		new /obj/item/clothing/accessory/holobadge(src)
		new /obj/item/clothing/accessory/holobadge(src)
		new /obj/item/clothing/accessory/holobadge/cord(src)
		new /obj/item/clothing/accessory/holobadge/cord(src)
		..()
		return

/obj/item/clothing/accessory/black
	name = "Black tie"
	slot_flags = SLOT_TIE
	icon_state = "blacktie"
	item_color = "blacktie"

/obj/item/clothing/accessory/scarf
	name = "Scarf"
	desc = "A black and grey scarf. Looks comfy."
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	icon_state = "scarf"
	item_color = "scarf"
	item_state = "scarf"

/obj/item/clothing/accessory/collar_blk
	name = "Silver tag collar"
	desc = "A collar for your little pets... or the big ones."
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	icon_state = "collar_blk"
	item_state = "collar_blk"
	item_color = "collar_blk"

/obj/item/clothing/accessory/collar_gld
	name = "Golden tag collar"
	desc = "A collar for your little pets... or the big ones."
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	icon_state = "collar_gld"
	item_state = "collar_gld"
	item_color = "collar_gld"

/obj/item/clothing/accessory/collar_bell
	name = "Bell collar"
	desc = "A collar with a tiny bell hanging from it, purrfect furr kitties."
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	icon_state = "collar_bell"
	item_state = "collar_bell"
	item_color = "collar_bell"

/obj/item/clothing/accessory/shock_collar
	name = "Shock collar"
	desc = "A collar used to ease hungry predators."
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	icon_state = "collar_shk"
	item_color = "collar_shk"
	item_state = "collar_shk"

/obj/item/clothing/accessory/collar_spike
	name = "Spiked collar"
	desc = "A collar with spikes that look as sharp as your teeth."
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	icon_state = "collar_spik"
	item_color = "collar_spik"
	item_state = "collar_spik"

/obj/item/clothing/accessory/collar_pink
	name = "Pink collar"
	desc = "This collar will make your pets look FA-BU-LOUS."
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	icon_state = "collar_pnk"
	item_color = "collar_pnk"
	item_state = "collar_pnk"

/obj/item/clothing/accessory/collar_holo
	name = "Holo-collar"
	desc = "An expensive holo-collar for the modern day pet."
	slot_flags = SLOT_TIE | SLOT_OCLOTHING
	icon_state = "collar_holo"
	item_color = "collar_holo"
	item_state = "collar_holo"

/obj/item/clothing/accessory/collar_holo/attack_self(mob/user as mob)
	user << "<span class='notice'>[name]'s interface is projected onto your hand.</span>"

	var/str = copytext(reject_bad_text(input(user,"Tag text?","Set tag","")),1,MAX_NAME_LEN)

	if(!str || !length(str))
		user << "<span class='notice'>[name]'s tag set to be blank.</span>"
		name = initial(name)
		desc = initial(desc)
	else
		user << "<span class='notice'>You set the [name]'s tag to '[str]'.</span>"
		name = initial(name) + " ([str])"
		desc = initial(desc) + " The tag says \"[str]\"."