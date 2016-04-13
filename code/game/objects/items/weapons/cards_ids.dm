/* Cards
 * Contains:
 *		DATA CARD
 *		ID CARD
 *		FINGERPRINT CARD HOLDER
 *		FINGERPRINT CARD
 */



/*
 * DATA CARDS - Used for the teleporter
 */
/obj/item/weapon/card
	name = "card"
	desc = "Does card things."
	icon = 'icons/obj/card.dmi'
	w_class = 1.0

	var/primary_color = rgb(0,0,0)		//This is generally the stripe color on the card
	var/secondary_color = rgb(0,0,0)	//This is generally the oval/circle in the corner

	var/associated_account_number = 0

	var/list/files = list(  )

/obj/item/weapon/card/data
	name = "data disk"
	desc = "A disk of data."
	icon_state = "data"
	var/function = "storage"
	var/data = "null"
	var/special = null
	item_state = "card-id"

/obj/item/weapon/card/data/verb/label(t as text)
	set name = "Label Disk"
	set category = "Object"
	set src in usr

	if (t)
		src.name = text("data disk- '[]'", t)
	else
		src.name = "data disk"
	src.add_fingerprint(usr)
	return

/obj/item/weapon/card/data/clown
	name = "\proper the coordinates to clown planet"
	icon_state = "data"
	item_state = "card-id"
	layer = 3
	level = 2
	desc = "This card contains coordinates to the fabled Clown Planet. Handle with care."
	function = "teleporter"
	data = "Clown Land"

/*
 * ID CARDS
 */

/obj/item/weapon/card/emag_broken
	desc = "It's a card with a magnetic strip attached to some circuitry. It looks too busted to be used for anything but salvage."
	name = "broken cryptographic sequencer"
	icon_state = "emag"
	item_state = "card-id"
	origin_tech = "magnets=2;syndicate=2"

/obj/item/weapon/card/emag
	desc = "It's a card with a magnetic strip attached to some circuitry."
	name = "cryptographic sequencer"
	icon_state = "emag"
	item_state = "card-id"
	origin_tech = "magnets=2;syndicate=2"
	var/uses = 10
	// List of devices that cost a use to emag.
	var/list/devices = list(
		/obj/item/robot_parts,
		/obj/item/weapon/storage/lockbox,
		/obj/item/weapon/storage/secure,
		/obj/item/weapon/circuitboard,
		/obj/item/weapon/rig,
		/obj/item/device/eftpos,
		/obj/item/device/lightreplacer,
		/obj/item/device/taperecorder,
		/obj/item/device/hailer,
		/obj/item/device/megaphone,
		/obj/item/clothing/accessory/holobadge,
		/obj/structure/closet/crate/secure,
		/obj/structure/closet/secure_closet,
		/obj/machinery/librarycomp,
		/obj/machinery/computer,
		/obj/machinery/power,
		/obj/machinery/suspension_gen,
		/obj/machinery/shield_capacitor,
		/obj/machinery/shield_gen,
		/obj/machinery/clonepod,
		/obj/machinery/deployable,
		/obj/machinery/door_control,
		/obj/machinery/porta_turret,
		/obj/machinery/shieldgen,
		/obj/machinery/turretid,
		/obj/machinery/vending,
		/obj/machinery/bot,
		/obj/machinery/door,
		/obj/machinery/telecomms,
		/obj/machinery/mecha_part_fabricator,
		/obj/machinery/gibber,
		/obj/vehicle
		)


/obj/item/weapon/card/emag/afterattack(var/obj/item/weapon/O as obj, mob/user as mob)

	for(var/type in devices)
		if(istype(O,type))
			uses--
			break

	if(uses<1)
		user.visible_message("[src] fizzles and sparks - it seems it's been used once too often, and is now broken.")
		user.drop_item()
		var/obj/item/weapon/card/emag_broken/junk = new(user.loc)
		junk.add_fingerprint(user)
		del(src)
		return

	..()

/obj/item/weapon/card/id
	name = "identification card"
	desc = "A card used to provide ID, determine access across the station, and potentially decide food status."
	icon_state = "id"
	item_state = "card-id"
	var/access = list()
	var/registered_name = "Unknown" // The name registered_name on the card
	slot_flags = SLOT_ID

	var/blood_type = "\[UNSET\]"
	var/dna_hash = "\[UNSET\]"
	var/fingerprint_hash = "\[UNSET\]"

	//alt titles are handled a bit weirdly in order to unobtrusively integrate into existing ID system
	var/assignment = null	//can be alt title or the actual job
	var/rank = null			//actual job
	var/dorm = 0		// determines if this ID has claimed a dorm already

/obj/item/weapon/card/id/New()
	..()
	spawn(30)
	if(istype(loc, /mob/living/carbon/human))
		blood_type = loc:dna:b_type
		dna_hash = loc:dna:unique_enzymes
		fingerprint_hash = md5(loc:dna:uni_identity)

/obj/item/weapon/card/id/proc/digest()
	var/obj/item/weapon/card/id/digested/N = new()
	N.name = src.name
	N.registered_name = src.registered_name
	N.blood_type = src.blood_type
	N.dna_hash = src.dna_hash
	N.fingerprint_hash = src.fingerprint_hash
	N.assignment = src.assignment
	N.dorm = src.dorm
	N.loc = src.loc
	src.Del()
	return N

/obj/item/weapon/card/id/attack_self(mob/user as mob)
	for(var/mob/O in viewers(user, null))
		O.show_message(text("[] shows you: \icon[] []: assignment: []", user, src, src.name, src.assignment), 1)

	src.add_fingerprint(user)
	return

/obj/item/weapon/card/id/GetAccess()
	return access

/obj/item/weapon/card/id/GetID()
	return src

/obj/item/weapon/card/id/attackby(obj/item/weapon/W as obj, mob/user as mob)
	..()
	if(istype(W,/obj/item/weapon/id_wallet))
		user << "You slip [src] into [W]."
		src.name = "[src.registered_name]'s [W.name] ([src.assignment])"
		src.desc = W.desc
		src.icon = W.icon
		src.icon_state = W.icon_state
		del(W)
		return

/obj/item/weapon/card/id/verb/read()
	set name = "Read ID Card"
	set category = "Object"
	set src in usr

	usr << text("\icon[] []: The current assignment on the card is [].", src, src.name, src.assignment)
	usr << "The blood type on the card is [blood_type]."
	usr << "The DNA hash on the card is [dna_hash]."
	usr << "The fingerprint hash on the card is [fingerprint_hash]."
	return

/obj/item/weapon/card/id/syndicate
	name = "agent card"
	access = list(access_maint_tunnels, access_syndicate, access_external_airlocks)
	origin_tech = "syndicate=3"
	var/registered_user=null

/obj/item/weapon/card/id/syndicate/New(mob/user as mob)
	..()
	if(!isnull(user)) // Runtime prevention on laggy starts or where users log out because of lag at round start.
		registered_name = ishuman(user) ? user.real_name : user.name
	else
		registered_name = "Agent Card"
	assignment = "Agent"
	name = "[registered_name]'s ID Card ([assignment])"

/obj/item/weapon/card/id/syndicate/afterattack(var/obj/item/weapon/O as obj, mob/user as mob, proximity)
	if(!proximity) return
	if(istype(O, /obj/item/weapon/card/id))
		var/obj/item/weapon/card/id/I = O
		src.access |= I.access
		if(istype(user, /mob/living) && user.mind)
			if(user.mind.special_role)
				usr << "\blue The card's microscanners activate as you pass it over the ID, copying its access."

/obj/item/weapon/card/id/syndicate/attack_self(mob/user as mob)
	if(!src.registered_name)
		//Stop giving the players unsanitized unputs! You are giving ways for players to intentionally crash clients! -Nodrak
		var t = reject_bad_name(input(user, "What name would you like to put on this card?", "Agent card name", ishuman(user) ? user.real_name : user.name))
		if(!t) //Same as mob/new_player/prefrences.dm
			alert("Invalid name.")
			return
		src.registered_name = t

		var u = sanitize(copytext(input(user, "What occupation would you like to put on this card?\nNote: This will not grant any access levels other than Maintenance.", "Agent card job assignment", "Agent"),1,MAX_MESSAGE_LEN))
		if(!u)
			alert("Invalid assignment.")
			src.registered_name = ""
			return
		src.assignment = u
		src.name = "[src.registered_name]'s ID Card ([src.assignment])"
		user << "\blue You successfully forge the ID card."
		registered_user = user
	else if(!registered_user || registered_user == user)

		if(!registered_user) registered_user = user  //

		switch(alert("Would you like to display the ID, or retitle it?","Choose.","Rename","Show"))
			if("Rename")
				var t = sanitize(copytext(input(user, "What name would you like to put on this card?", "Agent card name", ishuman(user) ? user.real_name : user.name),1,26))
				if(!t || t == "Unknown" || t == "floor" || t == "wall" || t == "r-wall") //Same as mob/new_player/prefrences.dm
					alert("Invalid name.")
					return
				src.registered_name = t

				var u = sanitize(copytext(input(user, "What occupation would you like to put on this card?\nNote: This will not grant any access levels other than Maintenance.", "Agent card job assignment", "Assistant"),1,MAX_MESSAGE_LEN))
				if(!u)
					alert("Invalid assignment.")
					return
				src.assignment = u
				src.name = "[src.registered_name]'s ID Card ([src.assignment])"
				user << "\blue You successfully forge the ID card."
				return
			if("Show")
				..()
	else
		..()


/obj/item/weapon/card/id/syndicate_command
	name = "syndicate ID card"
	item_state = "syndie"
	desc = "An ID straight from the Syndicate."
	registered_name = "Syndicate"
	assignment = "Syndicate Agent"
	access = list(access_syndicate, access_external_airlocks)

/obj/item/weapon/card/id/digested
	name = "digested ID card"
	desc = "A partially digested card that has seen better days.  Much of it's data has been destroyed."
	icon_state = "digested"
	access = list() // No access

/obj/item/weapon/card/id/digested/digest()
	//Don't double-digest things. Just prevents spending time for anything that might try this.
	return

/obj/item/weapon/card/id/digested/New()
	//Just overriding to prevent the normal ID New() from running
	return

/*==========================
====ID department Colors====
==========================*/

/obj/item/weapon/card/id/centcom/ERT
	name = "\improper Emergency Response Team ID"
	desc = "This can't be good."
	assignment = "Emergency Response Team"

/obj/item/weapon/card/id/centcom/ERT/New()
	..()
	access += get_all_accesses()

/obj/item/weapon/card/id/centcom
	name = "\improper CentCom. ID"
	desc = "An ID straight from Central Command."
	icon_state = "centcom"
	registered_name = "Central Command"
	assignment = "General"
	New()
		access = get_all_centcom_access()
		..()

/obj/item/weapon/card/id/gold
	name = "identification card"
	desc = "A golden card which shows power and might."
	icon_state = "gold"
	item_state = "gold_id"

/obj/item/weapon/card/id/captains_spare
	name = "captain's spare ID"
	desc = "The spare ID of the High Lord himself."
	icon_state = "gold"
	item_state = "gold_id"
	registered_name = "Captain"
	assignment = "Captain"
	New()
		var/datum/job/captain/J = new/datum/job/captain
		access = J.get_access()
		..()

/obj/item/weapon/card/id/silver
	name = "identification card"
	desc = "A silver card which shows honour and dedication."
	icon_state = "silver"
	item_state = "silver_id"

/obj/item/weapon/card/id/medical
	name = "identification card"
	desc = "A card issued to station medical staff."
	icon_state = "med"
	primary_color = rgb(189,237,237)
	secondary_color = rgb(223,255,255)

/obj/item/weapon/card/id/medical/head
	name = "identification card"
	desc = "A card which represents care and compassion."
	icon_state = "medGold"
	primary_color = rgb(189,237,237)
	secondary_color = rgb(255,223,127)

/obj/item/weapon/card/id/security
	name = "identification card"
	desc = "A card issued to station security staff."
	icon_state = "sec"
	primary_color = rgb(189,47,0)
	secondary_color = rgb(223,127,95)

/obj/item/weapon/card/id/security/head
	name = "identification card"
	desc = "A card which represents honor and protection."
	icon_state = "secGold"
	primary_color = rgb(189,47,0)
	secondary_color = rgb(255,223,127)

/obj/item/weapon/card/id/engineering
	name = "identification card"
	desc = "A card issued to station engineering staff."
	icon_state = "eng"
	primary_color = rgb(189,94,0)
	secondary_color = rgb(223,159,95)

/obj/item/weapon/card/id/engineering/head
	name = "identification card"
	desc = "A card which represents creativity and ingenuity."
	icon_state = "engGold"
	primary_color = rgb(189,94,0)
	secondary_color = rgb(255,223,127)

/obj/item/weapon/card/id/science
	name = "identification card"
	desc = "A card issued to station science staff."
	icon_state = "sci"
	primary_color = rgb(142,47,142)
	secondary_color = rgb(191,127,191)

/obj/item/weapon/card/id/science/head
	name = "identification card"
	desc = "A card which represents knowledge and reasoning."
	icon_state = "sciGold"
	primary_color = rgb(142,47,142)
	secondary_color = rgb(255,223,127)

/obj/item/weapon/card/id/cargo
	name = "identification card"
	desc = "A card issued to station cargo staff."
	icon_state = "car"
	primary_color = rgb(142,94,0)
	secondary_color = rgb(191,159,95)

/obj/item/weapon/card/id/cargo/head
	name = "identification card"
	desc = "A card which represents service and planning."
	icon_state = "carGold"
	primary_color = rgb(142,94,0)
	secondary_color = rgb(255,223,127)

/obj/item/weapon/card/id/civilian
	name = "identification card"
	desc = "A card issued to station civilian staff."
	icon_state = "civ"
	primary_color = rgb(0,94,142)
	secondary_color = rgb(95,159,191)

/obj/item/weapon/card/id/civilian/head //This is not the HoP. There's no position that uses this right now.
	name = "identification card"
	desc = "A card which represents common sense and responsibility."
	icon_state = "civHead"
	primary_color = rgb(0,94,142)
	secondary_color = rgb(255,223,127)