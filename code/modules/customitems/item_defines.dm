// Add custom items you give to people here, and put their icons in custom_items.dmi
// Remember to change 'icon = 'icons/obj/custom_items.dmi'' for items not using /obj/item/fluff as a base
// Clothing item_state doesn't use custom_items.dmi. Just add them to the normal clothing files.

/obj/item/fluff // so that they don't spam up the object tree
	icon = 'icons/obj/custom_items.dmi'
	w_class = 1.0

//////////////////////////////////
////////// Fluff Items ///////////
//////////////////////////////////

/obj/item/weapon/paper/fluff/sue_donem // aikasan: Sue Donem
	name = "cyborgification waiver"
	desc = "It's some kind of official-looking contract."

/obj/item/weapon/paper/fluff/sue_donem/New()
	..()

	info = "<B>Organic Carrier AIA and Standard Cyborgification Agreement</B><BR>\n<BR>\nUnder the authority of Nanotrasen Synthetic Intelligence Division, this document hereby authorizes an accredited Roboticist of the NSS V.O.R.E. or a deputized authority to perform a regulation lobotomisation upon the person of one '<I>Sue Donem</I>' (hereafter referred to as the Subject) with intent to enact a live Artificial Intelligence Assimilation (AIA) or live Cyborgification proceedure.<BR>\n<BR>\nNo further station authorization is required, and the Subject waives all rights as a human under Nanotrasen internal and external legal protocol. This document is subject to amendment under Nanotrasen internal protocol \[REDACTED\].<BR>\n<BR>\nSigned: <I>Sue Donem</I><BR>\n"

	stamps = (stamps=="" ? "<HR>" : "<BR>") + "<i>This paper has been stamped with the NanoTrasen Synthetic Intelligence Division rubber stamp.</i>"

	var/image/stampoverlay = image('icons/obj/bureaucracy.dmi')
	stampoverlay.pixel_x = rand(-2, 2)
	stampoverlay.pixel_y = rand(-3, 2)
	stampoverlay.icon_state = "paper_stamp-rd"
	overlays += stampoverlay

	update_icon()

/obj/item/fluff/wes_solari_1 //tzefa: Wes Solari
	name = "family photograph"
	desc = "A family photograph of a couple and a young child, Written on the back it says \"See you soon Dad -Roy\"."
	icon_state = "wes_solari_1"

/obj/item/fluff/sarah_calvera_1 //fniff: Sarah Calvera
	name = "old photo"
	desc = "Looks like it was made on a really old, cheap camera. Low quality. The camera shows a young hispanic looking girl with red hair wearing a white dress is standing in front of\
 an old looking wall. On the back there is a note in black marker that reads \"Sara, Siempre pensé que eras tan linda con ese vestido. Tu hermano, Carlos.\""
	icon_state = "sarah_calvera_1"

/obj/item/fluff/angelo_wilkerson_1 //fniff: Angleo Wilkerson
	name = "fancy watch"
	desc = "An old and expensive pocket watch. Engraved on the bottom is \"Odium est Source De Dolor\". On the back, there is an engraving that does not match the bottom and looks more recent.\
 \"Angelo, If you find this, you shall never see me again. Please, for your sake, go anywhere and do anything but stay. I'm proud of you and I will always love you. Your father, Jacob Wilkerson.\"\
  Jacob Wilkerson... Wasn't he that serial killer?"
	icon_state = "angelo_wilkerson_1"

/obj/item/fluff/sarah_carbrokes_1 //gvazdas: Sarah Carbrokes
	name = "locket"
	desc = "A grey locket with a picture of a black haired man in it. The text above it reads: \"Edwin Carbrokes\"."
	icon_state = "sarah_carbrokes_1"

/obj/item/fluff/ethan_way_1 //whitellama: Ethan Way
	name = "old ID"
	desc = "A scratched and worn identification card; it appears too damaged to inferface with any technology. You can almost make out \"Tom Cabinet\" in the smeared ink."
	icon_state = "ethan_way_1"

/obj/item/fluff/val_mcneil_1 //silentthunder: Val McNeil
	name = "rosary pendant"
	desc = "A cross on a ring of beads, has McNeil etched onto the back."
	icon_state = "val_mcneil_1"

/obj/item/fluff/steve_johnson_1 //thebreadbocks: Steve Johnson
	name = "bottle of hair dye"
	desc = "A bottle of pink hair dye. So that's how he gets his beard so pink..."
	icon_state = "steve_johnson_1"
	item_state = "steve_johnson_1"

/obj/item/fluff/david_fanning_1 //sicktrigger: David Fanning
	name = "golden scalpel"
	desc = "A fine surgical cutting tool covered in thin gold leaf. Does not seem able to cut anything."
	icon_state = "david_fanning_1"
	item_state = "david_fanning_1"

/obj/item/fluff/john_mckeever_1 //kirbyelder: John McKeever
	name = "Suspicious Paper"
	desc = "A piece of paper reading: Smash = 1/3 Leaf Juice, 1/3 Tricker, 1/3 Aajkli Extract"
	icon_state = "paper"
	item_state = "paper"

/obj/item/fluff/maurice_bedford_1
	name = "Monogrammed Handkerchief"
	desc = "A neatly folded handkerchief embroidered with a 'M'."
	icon_state = "maurice_bedford_1"

/obj/item/weapon/book/fluff/johnathan_falcian_1
	name = "sketchbook"
	desc = "A small, well-used sketchbook."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "johnathan_notebook"
	dat = "In the notebook there are numerous drawings of various crew-mates, locations, and scenes on the ship. They are of fairly good quality."
	author = "Johnathan Falcian"
	title = "Falcian's sketchbook"

//////////////////////////////////
////////// Usable Items //////////
//////////////////////////////////

/obj/item/weapon/folder/blue/fluff/matthew_riebhardt //Matthew Riebhardt - ZekeSulastin
	name = "academic journal"
	desc = "An academic journal, seemingly pertaining to medical genetics. This issue is for the second quarter of 2557. Paper flags demarcate some articles the owner finds interesting."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "matthewriebhardt"

/////////////////////// Serveris: Officer's Notebook ////////////////////

/obj/item/weapon/folder/blue/fluff/officer_notebook
	name = "Officer's Notebook"
	desc = "A simple, spiral bound notebook. A holographic crescent moon is printed on the cover, as well as 'S. Seto' beneath it. Numerous paper flags divide the pages, titled everything from incident reports to personal notes."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "syrus_notebook"

/////////////////////// Cataguettes - Lucy's Stethoscope - Lucy Kemmerer //////

/obj/item/clothing/accessory/stethoscope/fluff/lucystethos
   name = "Lucy's Stethoscope"
   desc = "A medical apparatus intended to ease in listening to the sounds of the human body. This one looks cleaner and sparklier than the rest. There is a small silver plaque attached to the tubing, with the words 'Lucy Kemmerer' engraved on it."
   icon_state = "lucystethos"
   item_state = "lucystethos"
   item_color ="lucystethos"
   icon = 'icons/obj/custom_items.dmi'

/obj/item/weapon/pen/fluff/multi //spaceman96: Trenna Seber
	name = "multicolor pen"
	desc = "It's a cool looking pen. Lots of colors!"

//////////////////////// AIsForAxolotl - Tea Flask - Margaret Stewart //////////

/obj/item/weapon/reagent_containers/food/drinks/flask/vacuumflask/fluff/margaret
	name = "Tea Flask"
	desc = "A plastic vacuum flask with an ugly tartan pattern. 'M.S.' has been written on the bottom with a silver marker."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "margaret_flask"

/obj/item/weapon/pen/fluff/fancypen //orangebottle: Lillian Levett, Lilliana Reade
	name = "fancy pen"
	desc = "A fancy metal pen. It uses blue ink. An inscription on one side reads,\"L.L. - L.R.\""
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "fancypen"

/obj/item/weapon/pen/fluff/eugene_bissegger_1 //metamorp: eugene bisseger
	name = "Gilded Pen"
	desc = "A golden pen that is gilded with a meager amount of gold material. The word 'NanoTrasen' is etched on the clip of the pen."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "eugene_pen"

/obj/item/weapon/pen/fluff/fountainpen //paththegreat: Eli Stevens
	name = "Engraved Fountain Pen"
	desc = "An expensive looking pen with the initials E.S. engraved into the side."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "fountainpen"

/obj/item/fluff/victor_kaminsky_1 //chinsky: Victor Kaminski
	name = "golden detective's badge"
	desc = "NanoTrasen Security Department detective's badge, made from gold. Badge number is 564."
	icon_state = "victor_kaminsky_1"

/obj/item/fluff/victor_kaminsky_1/attack_self(mob/user as mob)
	for(var/mob/O in viewers(user, null))
		O.show_message(text("[] shows you: \icon[] [].", user, src, src.name), 1)
	src.add_fingerprint(user)

/obj/item/fluff/ana_issek_2 //suethecake: Ana Issek
	name = "Faded Badge"
	desc = "A faded badge, backed with leather, that reads 'NT Security Force' across the front. It bears the emblem of the Forensic division."
	icon_state = "ana_badge"
	item_state = "ana_badge"
	item_color = "ana_badge"

/obj/item/fluff/ana_issek_2/attack_self(mob/user as mob)
	if(isliving(user))
		user.visible_message("\red [user] flashes their golden security badge.\nIt reads: Ana Issek, NT Security.","\red You display the faded bage.\nIt reads: Ana Issek, NT Security.")

/obj/item/fluff/ana_issek_2/attack(mob/living/carbon/human/M, mob/living/user)
	if(isliving(user))
		user.visible_message("\red [user] invades [M]'s personal space, thrusting [src] into their face insistently.","\red You invade [M]'s personal space, thrusting [src] into their face insistently. You are the law.")

/obj/item/weapon/soap/fluff/azare_siraj_1 //mister fox: Azare Siraj
	name = "S'randarr's Tongue Leaf"
	desc = "A waxy, scentless leaf."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "siraj_tongueleaf"
	item_state = "siraj_tongueleaf"

/obj/item/weapon/clipboard/fluff/smallnote //lexusjjss: Lexus Langg, Zachary Tomlinson
	name = "small notebook"
	desc = "A generic small spiral notebook that flips upwards."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "smallnotetext"
	item_state = "smallnotetext"

/obj/item/weapon/storage/fluff/maye_daye_1 //morrinn: Maye Day
	name = "pristine lunchbox"
	desc = "A pristine stainless steel lunch box. The initials M.D. are engraved on the inside of the lid."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "maye_daye_1"

/obj/item/weapon/reagent_containers/food/drinks/flask/fluff/william_hackett
	name = "handmade flask"
	desc = "A wooden flask with a silver lid and bottom. It has a matte, dark blue paint on it with the initials \"W.H.\" etched in black."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "williamhackett"

/obj/item/weapon/storage/firstaid/fluff/asus_rose //Kerbal22 - Asus Rose
	name = "rugged medkit"
	desc = "A dinged up medkit, it seems to have seen quite a bit of use."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "asusrose"

/obj/item/weapon/reagent_containers/food/drinks/flask/fluff/johann_erzatz_1 //leonheart11:  Johann Erzatz
	name = "vintage thermos"
	desc = "An older thermos with a faint shine."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "johann_erzatz_1"
	volume = 50

/obj/item/weapon/flame/lighter/zippo/fluff/li_matsuda_1 //mangled: Li Matsuda
	name = "blue zippo lighter"
	desc = "A zippo lighter made of some blue metal."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "bluezippo"
	icon_on = "bluezippoon"
	icon_off = "bluezippo"

/obj/item/weapon/flame/lighter/zippo/fluff/michael_guess_1 //Dragor23: Michael Guess
	name = "engraved lighter"
	desc = "A golden lighter, engraved with some ornaments and a G."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "guessip"
	icon_on = "guessipon"
	icon_off = "guessip"

///////////////////////////// Jarcolr - Uberto Dandolo - Painted secure briefcase /////////////

/obj/item/weapon/storage/secure/briefcase/fluff/uberto_dandolo
	name = "painted secure briefcase"
	desc = "A bulky briefcase with a combination lock. It features the color green, white and red, and a golden eagle in the middle."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "painted_secure"
	item_state = "painted_secure"

///////////////////////////// Ziepes - Janis Godmanis - Red Zippo //////////////////////

/obj/item/weapon/flame/lighter/zippo/fluff/janis_godmanis
	name = "Red-White-Red Zippo"
	desc = "A badass zippo that looks like the Austrian flag. Upon closer inspection it is revealed that it's a different shade of red than the Austrian flag.."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "redzippo"
	icon_on = "redzippoon"
	icon_off = "redzippo"

////////////////////////////// Tudoreleuu - Emilia Scotts - Customized pAI /////////////

/obj/item/device/paicard/fluff/emilia_scotts
	name = "Customized pAI unit"
	desc = "It seems to be a pAI Unit, albeit in a different shell. It acts exactly like the normal one. "
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "customized_pai"

////////////////////////////// Vivallion - Isaac Jachym - Butterfly Lighter ////////////

/obj/item/weapon/flame/lighter/zippo/fluff/isaac_jachym
	name = "Butterfly lighter"
	desc = "A custom-made zippo lighter, looks rather expensive. On one of it's sides, a clean inscription has been made, 'Butterfly, what is your wisdom?' And I looked down at it's majestic form, flexing it's wings as if to show it's strength. 'Fuck chechenya.' Had it whispered, before fluttering away, and so we went to war."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "che_zippo"
	icon_on = "che_zippoon"
	icon_off = "che_zippo"

/obj/item/weapon/flame/lighter/zippo/fluff/riley_rohtin_1 //rawrtaicho: Riley Rohtin
	name = "Riley's black zippo"
	desc = "A black zippo lighter, which holds some form of sentimental value."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "blackzippo"
	icon_on = "blackzippoon"
	icon_off = "blackzippo"

/obj/item/weapon/flame/lighter/zippo/fluff/fay_sullivan_1 //furohman: Fay Sullivan
	name = "Graduation Lighter"
	desc = "A silver engraved lighter with 41 on one side and Tharsis University on the other. The lid reads Fay Sullivan, Cybernetic Engineering, 2541"
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "gradzippo"
	icon_on = "gradzippoon"
	icon_off = "gradzippo"

/obj/item/weapon/flame/lighter/zippo/fluff/executivekill_1 //executivekill: Hunter Duke
	name = "Gonzo Fist zippo"
	desc = "A Zippo lighter with the iconic Gonzo Fist on a matte black finish."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "gonzozippo"
	icon_on = "gonzozippoon"
	icon_off = "gonzozippo"

/obj/item/weapon/flame/lighter/zippo/fluff/naples_1 //naples: Russell Vierson
	name = "Engraved zippo"
	desc = "A intricately engraved Zippo lighter."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "engravedzippo"
	icon_on = "engravedzippoon"
	icon_off = "engravedzippo"

/obj/item/weapon/haircomb/fluff/cado_keppel_1 //sparklysheep: Cado Keppel
	name = "purple comb"
	desc = "A pristine purple comb made from flexible plastic. It has a small K etched into its side."

/obj/item/weapon/fluff/hugo_cinderbacth_1 //thatoneguy: Hugo Cinderbatch
	name = "Old Cane"
	desc = "An old brown cane made from wood. It has a a large, itallicized H on it's handle."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "special_cane"

/obj/item/device/camera/fluff/orange //chinsky: Summer Springfield
	name = "orange camera"
	icon = 'icons/obj/custom_items.dmi'
	desc = "A modified detective's camera, painted in bright orange. On the back you see \"Have fun\" written in small accurate letters with something black."
	icon_state = "orangecamera"
	icon_on = "orangecamera"
	icon_off = "camera_off"
	pictures_left = 30

/obj/item/device/camera/fluff/oldcamera //magmaram: Maria Crash
	name = "Old Camera"
	icon = 'icons/obj/custom_items.dmi'
	desc = "An old, slightly beat-up digital camera, with a cheap photo printer taped on. It's a nice shade of blue."
	icon_state = "oldcamera"
	icon_on = "oldcamera"
	icon_off = "oldcamera_off"
	pictures_left = 30

/obj/item/weapon/id_wallet/fluff/reese_mackenzie  //Reese MacKenzie - ThoseDernSquirrels

	name = "ID wallet"
	desc = "A wallet made of black leather, holding an ID and a gold badge that reads 'NT.' The ID has a small picture of a man, with the caption Reese James MacKenzie, with other pieces of information to the right of the picture."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "reesemackenzie"

/obj/item/weapon/card/id/fluff/lifetime	//fastler: Fastler Greay; it seemed like something multiple people would have
	name = "Lifetime ID Card"
	desc = "A modified ID card given only to those people who have devoted their lives to the better interests of NanoTrasen. It sparkles blue."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "lifetimeid"

/obj/item/weapon/reagent_containers/food/drinks/flask/fluff/shinyflask //lexusjjss: Lexus Langg & Zachary Tomlinson
	name = "shiny flask"
	desc = "A shiny metal flask. It appears to have a Greek symbol inscribed on it."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "shinyflask"
	volume = 50

/obj/item/weapon/reagent_containers/food/drinks/flask/fluff/lithiumflask //mcgulliver: Wox Derax
	name = "Lithium Flask"
	desc = "A flask with a Lithium Atom symbol on it."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "lithiumflask"
	volume = 50

/obj/item/weapon/reagent_containers/glass/beaker/large/fluff/nashida_bishara_1 //rukral:Nashida Bisha'ra
	name = "Nashida's Etched Beaker"
	desc = "The message: 'Please do not be removing this beaker from the chemistry lab. If lost, return to Nashida Bisha'ra' can be seen etched into the side of this large beaker."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "beakerlarge"
	matter = list("glass" = 5000)
	volume = 100

/obj/item/weapon/reagent_containers/glass/beaker/fluff/eleanor_stone //Rkf45: Eleanor Stone
	name = "teapot"
	desc = "An elegant teapot. The engraving on the bottom reads 'ENS'"
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "eleanorstone"
	item_state = "eleanorstone"

	volume = 150
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = list(5,10,15,25,30,50,150)

/obj/item/weapon/storage/pill_bottle/fluff/listermedbottle //compactninja: Lister Black
	name = "Pill bottle (anti-depressants)"
	desc = "Contains pills used to deal with depression. They appear to be prescribed to Lister Black"
	New()
		..()
		new /obj/item/weapon/reagent_containers/pill/fluff/listermed( src )
		new /obj/item/weapon/reagent_containers/pill/fluff/listermed( src )
		new /obj/item/weapon/reagent_containers/pill/fluff/listermed( src )
		new /obj/item/weapon/reagent_containers/pill/fluff/listermed( src )
		new /obj/item/weapon/reagent_containers/pill/fluff/listermed( src )
		new /obj/item/weapon/reagent_containers/pill/fluff/listermed( src )
		new /obj/item/weapon/reagent_containers/pill/fluff/listermed( src )

/obj/item/weapon/reagent_containers/pill/fluff/listermed
	name = "anti-depressant pill"
	desc = "Used to deal with depression."
	icon_state = "pill9"
	New()
		..()
		reagents.add_reagent("stoxin", 5)
		reagents.add_reagent("sugar", 10)
		reagents.add_reagent("ethanol", 5)

/obj/item/clothing/mask/fluff/electriccig //CubeJackal: Barry Sharke
	name = "Electronic cigarette"
	desc = "An electronic cigarette. Most of the relief of a real cigarette with none of the side effects. Often used by smokers who are trying to quit the habit."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "cigon"
	throw_speed = 0.5
	item_state = "ciglit"
	w_class = 1
	body_parts_covered = null

//Strange penlight, Nerezza: Asher Spock

/obj/item/weapon/reagent_containers/hypospray/fluff/asher_spock_1
	name = "strange penlight"
	desc = "Besides the coloring, this penlight looks rather normal and innocent. However, you get a nagging feeling whenever you see it..."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "asher_spock_1"
	amount_per_transfer_from_this = 5
	volume = 15

/obj/item/weapon/reagent_containers/hypospray/fluff/asher_spock_1/New()
	..()
	reagents.remove_reagent("tricordrazine", 30)
	reagents.add_reagent("oxycodone", 15)
	update_icon()
	return

/obj/item/weapon/reagent_containers/hypospray/fluff/asher_spock_1/attack_self(mob/user as mob)
	user << "\blue You click \the [src] but get no reaction. Must be dead."

/obj/item/weapon/reagent_containers/hypospray/fluff/asher_spock_1/attack(mob/M as mob, mob/user as mob)
	if (user.ckey != "nerezza") //Because this can end up in the wrong hands, let's make it useless for them!
		user << "\blue You click \the [src] but get no reaction. Must be dead."
		return
	if(!reagents.total_volume)
		user << "\red \The [src] is empty."
		return
	if (!( istype(M, /mob) ))
		return
	if (reagents.total_volume)
		if (M == user && user.ckey == "nerezza") //Make sure this is being used by the right person, for the right reason (self injection)
			visible_message("\blue [user] presses their \
				penlight against their skin, quickly clicking the button once.", \
				"\blue You press the disguised autoinjector against your skin and click the button. There's a sharp pain at the injection site that rapidly fades.", \
				"You hear a rustle as someone moves nearby, then a sharp click.")
		if (M != user && user.ckey == "nerezza") //Woah now, you better be careful partner
			user << "\blue You don't want to contaminate the autoinjector."
			return
		src.reagents.reaction(M, INGEST)
		if(M.reagents)
			var/trans = reagents.trans_to(M, amount_per_transfer_from_this)
			user << "\blue [trans] units injected. [reagents.total_volume] units remaining in \the [src]."
	return

/obj/item/weapon/reagent_containers/hypospray/fluff/asher_spock_1/examine(mob/user as mob)
	..()
	if(user.ckey != "nerezza") return //Only the owner knows how to examine the contents.
	if(reagents && reagents.reagent_list.len)
		for(var/datum/reagent/R in reagents.reagent_list)
			usr << "\blue You examine the penlight closely and see that it has [R.volume] units of [R.name] stored."
	else
		usr << "\blue You examine the penlight closely and see that it is currently empty."

//End strange penlight

/obj/item/weapon/card/id/fluff/asher_spock_2 //Nerezza: Asher Spock
	name = "Odysses Specialist ID card"
	desc = "A special identification card with a red cross signifying an emergency physician has specialised in Odysseus operations and maintenance.\nIt grants the owner recharge bay access."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "odysseus_spec_id"

/obj/item/weapon/clipboard/fluff/mcreary_journal //sirribbot: James McReary
	name = "McReary's journal"
	desc = "A journal with a warning sticker on the front cover. The initials \"J.M.\" are written on the back."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "mcreary_journal"
	item_state = "mcreary_journal"

/obj/item/device/flashlight/fluff/thejesster14_1 //thejesster14: Rosa Wolff
	name = "old red flashlight"
	desc = "A very old, childlike flashlight."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "wolfflight"
	item_state = "wolfflight"

/obj/item/weapon/crowbar/fluff/zelda_creedy_1 //daaneesh: Zelda Creedy
	name = "Zelda's Crowbar"
	desc = "A pink crow bar that has an engraving that reads, 'To Zelda. Love always, Dawn'"
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "zeldacrowbar"
	item_state = "crowbar"

////// Ripley customisation kit - Butchery Royce - MayeDay

/obj/item/weapon/paintkit/fluff/butcher_royce_1
	name = "Ripley customisation kit"
	desc = "A kit containing all the needed tools and parts to turn an APLU Ripley into a Titan's Fist worker mech."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "royce_kit"

	new_name = "APLU \"Titan's Fist\""
	new_desc = "This ordinary mining Ripley has been customized to look like a unit of the Titans Fist."
	new_icon = "titan"
	allowed_types = list("ripley","firefighter")

////// Ripley customisation kit - Sven Fjeltson - Mordeth221

/obj/item/weapon/paintkit/fluff/sven_fjeltson_1
	name = "Mercenary APLU kit"
	desc = "A kit containing all the needed tools and parts to turn an APLU Ripley into an old Mercenaries APLU."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "sven_kit"

	new_name = "APLU \"Strike the Earth!\""
	new_desc = "Looks like an over worked, under maintained Ripley with some horrific damage."
	new_icon = "earth"
	allowed_types = list("ripley","firefighter")

// Root hardsuit kit defines.
// Icons for modified hardsuits need to be in the proper .dmis because suit cyclers may cock them up.
/obj/item/device/kit/suit/fluff

	name = "hardsuit modification kit"
	desc = "A kit for modifying a hardsuit."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "salvage_kit"

	var/new_name        // Modifier for new item name - '[new_name] hardsuit'.
	var/new_helmet_desc // Sets helmet desc.
	var/new_suit_desc   // Sets suit desc.
	var/helmet_icon     // Sets helmet icon_state and item_state.
	var/suit_icon       // Sets suit icon_state and item_state.
	var/helmet_color    // Sets item_color.
	var/uses = 2        // Uses before the kit deletes itself.
	var/new_light_overlay

/obj/item/clothing/head/helmet/space/void/attackby(var/obj/item/O as obj, mob/user as mob)
	..()

	if(istype(O,/obj/item/device/kit/suit/fluff))

		var/obj/item/device/kit/suit/fluff/kit = O
		name = "[kit.new_name] suit helmet"
		desc = kit.new_helmet_desc
		icon_state = kit.helmet_icon
		item_state = kit.helmet_icon
		item_color = kit.helmet_color

		if(kit.new_light_overlay)
			light_overlay = kit.new_light_overlay

		user << "You set about modifying the helmet into [src]."
		playsound(user.loc, 'sound/items/Screwdriver.ogg', 50, 1)

		kit.uses--
		if(kit.uses<1)
			user.drop_item()
			del(O)

/obj/item/clothing/suit/space/void/attackby(var/obj/item/O as obj, mob/user as mob)
	..()

	if(istype(O,/obj/item/device/kit/suit/fluff))

		var/obj/item/device/kit/suit/fluff/kit = O
		name = "[kit.new_name] voidsuit"
		desc = kit.new_suit_desc
		icon_state = kit.suit_icon
		item_state = kit.suit_icon

		user << "You set about modifying the suit into [src]."
		playsound(user.loc, 'sound/items/Screwdriver.ogg', 50, 1)

		kit.uses--
		if(kit.uses<1)
			user.drop_item()
			del(O)

///////// Salvage crew hardsuit - Cybele Petit - solaruin ///////////////
/obj/item/device/kit/suit/fluff/salvage
	name = "salvage hardsuit modification kit"
	desc = "A kit containing all the needed tools and parts to modify a hardsuit into a salvage hardsuit."

	new_name = "salvage"
	new_suit_desc = "An orange hardsuit used by salvage flotillas. Has reinforced plating."
	new_helmet_desc = "An orange hardsuit helmet used by salvage flotillas. Has reinforced plating."
	helmet_icon = "salvage_helmet"
	suit_icon = "salvage_suit"
	helmet_color = "salvage"

///////// Weathered hardsuit - Callum Leamas - roaper ///////////////
/obj/item/device/kit/suit/fluff/roaper
	name = "Callum's hardsuit modification kit"
	desc = "A kit containing all the needed tools and parts to modify a hardsuit."

	new_name = "weathered"
	new_suit_desc = " A jury-rigged and modified engineering hardsuit. It looks slightly damaged and dinged."
	new_helmet_desc = "A jury-rigged and modified engineering hardsuit helmet. It looks slightly damaged and dinged"
	helmet_icon = "rig0-roaper"
	suit_icon = "rig-roaper"
	helmet_color = "roaper"

///////// Hazard Hardsuit - Ronan Harper - Raptor1628 //////////////////
/obj/item/device/kit/suit/fluff/ronan_harper
	name = "hazard hardsuit modification kit"
	desc = "A kit containing all the needed tools and parts to modify a hardsuit."

	new_name = "hazard"
	new_suit_desc = "An older model of armored NT Hardsuit emblazoned in security colors. The crest of the NAS Rhodes, a copper rose, is painted onto the chestplate."
	new_helmet_desc = "An older NT Hardsuit Helmet with built-in atmospheric filters. The name HARPER has been printed on the back."
	helmet_icon = "rig0-hazardhardsuit"
	suit_icon = "rig-hazardhardsuit"
	helmet_color = "hazardhardsuit"
	new_light_overlay = "helmet_light_dual"

//////// Meat Hook - Korom Bhararaya - Matthew951 ////////////////////////

/obj/item/device/kit/weapon/fluff/hook
	name = "hook modification kit"
	desc = "A kit containing all the needed tools and parts to modify a knife or a butcher's knife into a hook."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "hook_kit"

/obj/item/weapon/kitchenknife/attackby(var/obj/item/O as obj, mob/user as mob)
	..()

	if(istype(O,/obj/item/device/kit/weapon/fluff/hook))
		name = "meat hook"
		desc = "A sharp, metal hook what sticks into things."
		icon = 'icons/obj/custom_items.dmi'
		icon_state = "hook_knife"
		item_state = "hook_knife"

/obj/item/weapon/butch/attackby(var/obj/item/O as obj, mob/user as mob)
	..()

	if(istype(O,/obj/item/device/kit/weapon/fluff/hook))
		name = "meat hook"
		desc = "A sharp, metal hook what sticks into things."
		icon = 'icons/obj/custom_items.dmi'
		icon_state = "hook_knife"
		item_state = "hook_knife"

//////////////////////////////////
//////////// Clothing ////////////
//////////////////////////////////

//////////// Gloves ////////////

/obj/item/clothing/gloves/fluff/murad_hassim_1
	name = "Tajaran Surgical Gloves"
	desc = "Reinforced sterile gloves custom tailored to comfortably accommodate Tajaran claws."
	icon_state = "latex"
	item_state = "lgloves"
	siemens_coefficient = 0.30
	permeability_coefficient = 0.01
	item_color="white"
	species_restricted = list("exclude","Unathi")

/obj/item/clothing/gloves/fluff/walter_brooks_1 //botanistpower: Walter Brooks
	name = "mittens"
	desc = "A pair of well worn, blue mittens."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "walter_brooks_1"
	item_state = "bluegloves"
	item_color="blue"

/obj/item/clothing/gloves/fluff/chal_appara_1 //furlucis: Chal Appara
	name = "Left Black Glove"
	desc = "The left one of a pair of black gloves. Wonder where the other one went..."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "chal_appara_1"

//////////// Earpieces ////////////////

////////////////////////// Skrellian Tailwear - Qokkri Xilo - Paradoxon /////////////

/obj/item/clothing/ears/fluff/qokkri
	name = "Skrellian Tailwear"
	desc = "An ensemble of sophisticated jewels and bands, most likely belonging to a scientific Skrell."
	icon_state = "xilobeads"
	icon = 'icons/obj/custom_items.dmi'
	item_state = "xilobeads"

//////////// Eye Wear ////////////

/obj/item/clothing/glasses/meson/fluff/book_berner_1 //asanadas: Book Berner
	name = "bespectacled mesonic surveyors"
	desc = "One of the older meson scanner models retrofitted to perform like its modern counterparts."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "book_berner_1"

/obj/item/clothing/glasses/fluff/uzenwa_sissra_1 //sparklysheep: Uzenwa Sissra
	name = "Scanning Goggles"
	desc = "A very oddly shaped pair of goggles with bits of wire poking out the sides. A soft humming sound emanates from it."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "uzenwa_sissra_1"

////// Medical eyepatch - Thysse Ezinwa - Jadepython
/obj/item/clothing/glasses/eyepatch/fluff/thysse_1
	name = "medical eyepatch"
	desc = "On the strap, EZINWA is written in white block letters."

////// Safety Goggles - Arjun Chopra - MindPhyre - APPROVED
/obj/item/clothing/glasses/fluff/arjun_chopra_1
	name = "safety goggles"
	desc = "A used pair of leather safety goggles."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "arjun_chopra"
	item_state = "arjun_chopra"

/////////////////////////////////// GSTQ - Monogrammed Eyepatch - Edmund Flashman Adler /////////////////////////

/obj/item/clothing/glasses/eyepatch/fluff/edmund
	name = "Monogrammed Eyepatch"
	desc = "A black velvet eyepatch monogrammed in dark purple thread with the initials 'E. A.'"

//////////// Hats ////////////

/obj/item/clothing/head/welding/fluff/alice_mccrea_1 //madmalicemccrea: Alice McCrea
	name = "flame decal welding helmet"
	desc = "A welding helmet adorned with flame decals, and several cryptic slogans of varying degrees of legibility. \"Fly the Friendly Skies\" is clearly visible, written above the visor, for some reason."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "alice_mccrea_1"

/obj/item/clothing/head/welding/fluff/yuki_matsuda_1 //searif: Yuki Matsuda
	name = "white decal welding helmet"
	desc = "A white welding helmet with a character written across it."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "yuki_matsuda_1"

/obj/item/clothing/head/welding/fluff/norah_briggs_1 //bountylord13: Norah Briggs
	name = "blue flame decal welding helmet"
	desc = "A welding helmet with blue flame decals on it."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "norah_briggs_1"

//////////////// Painted Welding Mask - Kuratas Dotaavi - supercotton ////////////////////

/obj/item/clothing/head/welding/fluff/kuratas
	name =	"Painted Welding Mask"
	desc =  "A blood-red welding mask with an intricate pattern. Smells like burnt rubber."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "paintedwelding"

/obj/item/clothing/head/orangebandana/fluff/taryn_kifer_1 //themij: Taryn Kifer
	name = "orange bandana"
	desc = "Hey, I think we're missing a hazard vest..."

/obj/item/clothing/head/fluff
	body_parts_covered = 0

/obj/item/clothing/head/fluff/edvin_telephosphor_1 //foolamancer: Edvin Telephosphor
	name = "Edvin's Hat"
	desc = "A hat specially tailored for Skrellian anatomy. It has a yellow badge on the front, with a large red 'T' inscribed on it."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "edvin_telephosphor_1"

/obj/item/clothing/head/fluff/krinnhat //Shirotyrant: Krinn Seeskale
	name = "saucepan hat"
	desc = "This hat is the shiniest shiny Krinn has ever owned."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "krinn_hat"

/obj/item/clothing/head/fluff/bruce_hachert //Stup1dg33kz: Bruce Hachert
	name = "worn hat"
	desc = "A worn-looking hat. It is slightly faded in color."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "brucehachert"

/obj/item/clothing/head/fluff/kaine_kalim_1
    name = "Formal Medical Cap"
    desc = "An unusually sterile and folded cap. It seems to bare the Nanotrasen logo."
    icon = 'icons/obj/custom_items.dmi'
    icon_state = "kainecap"


/obj/item/clothing/head/beret/fluff/marine_beret	//Von2531: Jack Washington
	name = "colonial marine beret"
	desc = "A well-worn navy blue beret. The insignia of the Martian Colonial Marine Corps is affixed to the front."
	icon_state = "officerberet"

////////////////////////////// Serithi - Adapted Security Helmet //////////////////////////////

/obj/item/clothing/head/helmet/fluff/adapted
	name = "Adapted helmet"
	desc = "Standard Security gear. Protects the head from impacts. This helmet is specially made for horned Unathi."
	item_state = "adapted_h"
	icon_state = "adapted_h"
	icon = 'icons/obj/custom_items.dmi'

////////////////////////////// Jarcolr - Uberto Dandolo - Feathered trilby /////////////////////

/obj/item/clothing/head/feather/fluff/uberto_dandolo
	name = "Feathered trilby"
	desc = "A sharp, stylish hat with a feather."

//////////////////////////////////////////////////////////
///////////////////// Belts //////////////////////////////
//////////////////////////////////////////////////////////

/obj/item/weapon/storage/belt/medical/fluff/ems
	name = "EMS utility belt"
	desc = "A sturdy black webbing belt with attached pouches. H. ISHIMARU is scratched on the interior of the buckle."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "emsbelt"
	item_state = "emsbelt"

/obj/item/weapon/storage/belt/utility/full/fluff/sophie
	name = "Sophie's belt"
	desc = "A tool-belt in Atmos colours."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "sophie_belt"
	item_state = "sophie_belt"

/obj/item/weapon/storage/belt/medical/fluff/nashi_belt
	name = "rainbow medical belt"
	desc = "A somewhat-worn, modified, rainbow belt."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "nashi_belt"
	item_state = "fluff_rbelt"

	New()
		..()
		new /obj/item/weapon/reagent_containers/glass/bottle/fluff/nashi_bottle(src, 14, "Bicaridine")
		new /obj/item/weapon/reagent_containers/glass/bottle/fluff/nashi_bottle(src, 15, "Dermaline")
		new /obj/item/weapon/reagent_containers/glass/bottle/fluff/nashi_bottle(src, 16, "Dylovene")
		new /obj/item/weapon/reagent_containers/glass/bottle/fluff/nashi_bottle(src, 17, "Dexalin Plus")
		new /obj/item/weapon/reagent_containers/glass/bottle/fluff/nashi_bottle(src, 18, "Tricordrazine")
		new /obj/item/weapon/reagent_containers/syringe/(src)
		new /obj/item/device/healthanalyzer(src)

/obj/item/weapon/reagent_containers/glass/bottle/fluff/nashi_bottle
	icon = 'icons/obj/chemical.dmi'
	New(loc, var/color, var/labeled)
		..()
		name = "[labeled] bottle"
		desc = "A small bottle.  Contains [labeled]"
		icon_state = "bottle[color]"

//////////// Suits ////////////
/obj/item/clothing/suit/storage/labcoat
	name = "labcoat"
	desc = "A plain labcoat."
	icon_state = "labcoat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS|LEGS

/obj/item/clothing/suit/storage/labcoat/fluff/aeneas_rinil //Robotics Labcoat - Aeneas Rinil [APPR]
	name = "Robotics labcoat"
	desc = "A labcoat with a few markings denoting it as the labcoat of roboticist."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "aeneasrinil"

/obj/item/clothing/suit/storage/labcoat/fluff/pink //spaceman96: Trenna Seber
	name = "pink labcoat"
	desc = "A suit that protects against minor chemical spills. Has a pink stripe down from the shoulders."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "labcoat_pink_open"

/obj/item/clothing/suit/storage/labcoat/fluff/mit
	name = "MiT Labcoat"
	desc = "A lab coat from the Martian Institute of Technology with the name 'Dr. Lucina Franco' embroidered onto the right breast pocket."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "mitlabcoat"
	item_state = "mitlabcoat"

/obj/item/clothing/suit/storage/toggle/labcoat/fluff/epsilon //Devildabeast: Looping Song
	name = "e UMi labcoat"
	desc = "A suit that protects against minor chemical spills. Has a black stripe on the shoulder. The abbreviation \"e UMi\" is written on the back in bold text."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "labcoat_black_open"
	icon_open = "labcoat_black_open"
	icon_closed = "labcoat_black"
	item_state = "labcoat_black"

/obj/item/clothing/suit/storage/det_suit/fluff/leatherjack //atomicdog92: Seth Sealis
	name = "leather jacket"
	desc = "A black leather coat, popular amongst punks, greasers, and other galactic scum."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "leatherjack"
	item_state = "leatherjack"
	item_color = "leatherjack"

/obj/item/clothing/suit/armor/vest/fluff/deus_blueshield //deusdactyl
	name = "blue shield security armor"
	desc = "An armored vest with the badge of a Blue Shield Security lieutenant."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "deus_blueshield"
	item_state = "deus_blueshield"

/obj/item/clothing/suit/fluff/oldscarf //Writerer2: Javaria Zara
	name = "old scarf"
	desc = "An old looking scarf, it seems to be fairly worn."
	icon = 'icons/obj/clothing/suits.dmi'
	icon_state = "mantle-unathi"
	item_state = "mantle-unathi"
	body_parts_covered = 0

/////////////////////////////// 50_n00b - R.A.N.G.E.'s blue dress //////////////////////////

/obj/item/clothing/suit/fluff/b_dress
	name = "Blue dress"
	desc = "A blue dress, worn with a white blouse. It is small, and looks like it won't fit a full grown human."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "br_dress"
	item_state = "br_dress"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS

//////////////////////////////// Broseph Stylin - Lombardi's Jacket ///////////////////////////

/obj/item/clothing/suit/storage/fluff/lombardi
	name = "Lombardi's Jacket"
	desc = "A dark blue, martian-pattern, EMS jacket. It sports high-visibility reflective stripes, a star of life on the back, and has a nametag on the right side of the chest that reads 'Lombardi B-'."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "lombardi_jacket"
	item_state = "lombardi_jacket"
	body_parts_covered = UPPER_TORSO|ARMS

	verb/toggle()
		set name = "Toggle Jacket Buttons"
		set category = "Object"
		set src in usr

		if(!usr.canmove || usr.stat || usr.restrained())
			return 0

		switch(icon_state)
			if("lombardi_jacket")
				src.icon_state = "lombardi_jacket_open"
				usr << "You unbutton the jacket."
			if("lombardi_jacket_open")
				src.icon_state = "lombardi_jacket"
				usr << "You button up the jacket."
		update_clothing_icon()

//////////// Uniforms ////////////

/obj/item/clothing/under/fluff/milo_hachert //Field Dress Uniform - Milo Hachert - Commissar_Drew
	name = "field dress uniform"
	desc = "A uniform jacket, its buttons polished to a shine, coupled with a dark pair of trousers. 'Hachert' is embroidered upon the jacket�s shoulder bar."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "milohachert"
	item_state = "milohachert"
	item_color = "milohachert"


/obj/item/clothing/under/fluff/kaine_kalim_2
    name = "Formal Medical Uniform"
    desc = "An unusually sterile and pressed uniform. It seems to have a string of vials crossing the chest."
    icon = 'icons/obj/custom_items.dmi'
    icon_state = "kaineuniform"
    item_state = "kaineuniform"
    item_color = "kaineuniform"

/obj/item/clothing/under/fluff/jumpsuitdown //searif: Yuki Matsuda
	name = "rolled down jumpsuit"
	desc = "A rolled down jumpsuit. Great for mechanics."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "jumpsuitdown"
	item_state = "jumpsuitdown"
	item_color = "jumpsuitdown"

/obj/item/clothing/under/fluff/lilith_vinous_1 //slyhidden: Lilith Vinous
	name = "casual security uniform"
	desc = "A less formal version of the traditional dark red Security uniform. It has the top button undone, rolled up sleeves and different belt."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "lilith_uniform"
	item_state = "lilith_uniform"
	item_color = "lilith_uniform"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS

/obj/item/clothing/under/fluff/ana_issek_1 //suethecake: Ana Issek
	name = "retired uniform"
	desc = "A silken blouse paired with dark-colored slacks. It has the words 'Chief Investigator' embroidered into the shoulder bar."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "ana_uniform"
	item_state = "ana_uniform"
	item_color = "ana_uniform"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS

/obj/item/clothing/under/fluff/olddressuniform //desiderium: Momiji Inubashiri
	name = "retired dress uniform"
	desc = "A retired Station Head of Staff uniform, phased out twenty years ago for the newer jumpsuit design, but still acceptable dress. Lovingly maintained."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "olddressuniform"
	item_state = "olddressuniform"
	item_color = "olddressuniform"

/obj/item/clothing/under/rank/security/fluff/jeremy_wolf_1 //whitewolf41: Jeremy Wolf
	name = "worn officer's uniform"
	desc = "An old red security jumpsuit. Seems to have some slight modifications."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "jeremy_wolf_1"
	item_color = "jeremy_wolf_1"

//////////////////// PRC Uniform - Ronan Harper - Raptor1628 ///////////////////

/obj/item/clothing/under/rank/security/fluff/ronan_harper
	name = "PRC Uniform"
	desc = "A well maintained uniform from one of the many Private Security firms Nanotrasen hires from. The name Harper is printed on the back."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "harper_uniform"
	item_state = "jensensuit"
	item_color = "harper_uniform"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS

//////////////////// Corporate Cap - Robert Mason - Masterrbc ////////////////////

/obj/item/clothing/head/soft/sec/corp/fluff/robert_mason
	name = "Corporate Cap"
	desc = "It's baseball hat in corporate colors."

/obj/item/clothing/under/fluff/tian_dress //phaux: Tian Yinhu
	name = "purple dress"
	desc = "A nicely tailored purple dress made for the taller woman."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "tian_dress"
	item_state = "tian_dress"
	item_color = "tian_dress"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

/obj/item/clothing/under/rank/bartender/fluff/classy	//searif: Ara Al-Jazari
	name = "classy bartender uniform"
	desc = "A prim and proper uniform that looks very similar to a bartender's, the only differences being a red tie, waistcoat and a rag hanging out of the back pocket."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "ara_bar_uniform"
	item_state = "ara_bar_uniform"
	item_color = "ara_bar_uniform"

/obj/item/clothing/under/fluff/callum_suit //roaper: Callum Leamus
	name = "knockoff suit"
	desc = "A knockoff of a suit commonly worn by the upper class."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "callum_suit"
	item_state = "callum_suit"
	item_color = "callum_suit"

/obj/item/clothing/under/fluff/solara_light_1 //bluefishie: Solara Born-In-Light
	name = "Elaborate Purple Dress"
	desc = "An expertly tailored dress, made out of fine fabrics. The interwoven necklace appears to be made out of gold, with three complicated symbols engraved in the front."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "solara_dress"
	item_state = "solara_dress"
	item_color = "solara_dress"

/obj/item/clothing/under/rank/nursesuit/fluff/sasha
	name = "RN Uniform"
	desc = "A nurse's uniform that is dark blue and gold. It looks like it's been tailored for a short person."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "sasha"
	item_state = "sasha"
	item_color = "sasha"

/////// NT-SID Suit //Zuhayr: Jane Doe

/obj/item/clothing/under/fluff/jane_sidsuit
	name = "NT-SID jumpsuit"
	desc = "A NanoTrasen Synthetic Intelligence Division jumpsuit, issued to 'volunteers'. On other people it looks fine, but right here a scientist has noted: on you it looks stupid."

	icon = 'icons/obj/custom_items.dmi'
	icon_state = "jane_sid_suit"
	item_state = "jane_sid_suit"
	item_color = "jane_sid_suit"
	has_sensor = 2
	sensor_mode = 3

//Suit roll-down toggle.
/obj/item/clothing/under/fluff/jane_sidsuit/verb/toggle_zipper()
	set name = "Toggle Jumpsuit Zipper"
	set category = "Object"
	set src in usr

	if(!usr.canmove || usr.stat || usr.restrained())
		return 0

	if(src.icon_state == "jane_sid_suit_down")
		src.item_color = "jane_sid_suit"
		usr << "You zip up the [src]."
	else
		src.item_color = "jane_sid_suit_down"
		usr << "You unzip and roll down the [src]."

	src.icon_state = "[item_color]"
	src.item_state = "[item_color]"
	update_clothing_icon()

////// Wyatt's Ex-Commander Jumpsuit - RawrTaicho
/obj/item/clothing/under/fluff/wyatt_1

	name = "ex-commander jumpsuit"
	desc = "A standard Central Command Engineering Commander jumpsuit tailored to fight the wearer tightly. It has a Medal of Service pinned onto the left side of it."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "wyatt_uniform"
	item_state = "wyatt_uniform"
	item_color = "wyatt_uniform"

////// Black Dress - Lillian Amsel - PapaDrow
/obj/item/clothing/under/fluff/lillian_amsel_1
	name = "Black Dress"
	desc = "A knee-length, dark gray and black dress made of a soft, velvety material."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "lillian_dress"
	item_state = "lillian_dress"
	item_color = "lillian_dress"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO

////// Tailored Security Uniform - Parker Eliza - MrSnapwalk

/obj/item/clothing/under/fluff/parkereliza
	name = "tailored security uniform"
	desc = "A red uniform shirt (tailored for easy access to the shoulder joint) and black cargo pants, paired with a set of somewhat bulky white casings for robotic limbs. The arms have a small label on the inner elbow, which reads \"Bishop Corporation Cybernetic Solutions\"."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "parker_eliza"
	item_state = "parker_eliza"
	item_color = "parker_eliza"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS|HANDS

////// Bishop "GOLEM" V2200 Industrial Limb Augments - Parker Eliza - MrSnapwalk

/obj/item/clothing/suit/fluff/parkereliza
	name = "Bishop \"GOLEM\" V2200 Industrial Limb Augments"
	desc = "A set of top-of-the-line cyberlimbs, only usable to someone with extensive bone structure augmentation. Often used in industrial applications, they are capable of throwing a man clear across a room. The load limitation circuit in this set appears to be modified."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "parker_eliza_arms"
	item_state = "parker_eliza_arms"
	item_color = "parker_eliza_arms"
	body_parts_covered = 0 //technicially it's underneath everything
	canremove = 0


////////////// Accessories /////

//////////////////// Blood Red Pendant - Mewth - Mu'taz Radi ////////////////

/obj/item/clothing/accessory/fluff/radi
	name = "Blood Red Pendant"
	desc = "A blue chained necklace with a ruby in the middle, it looks pretty!"
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "radi_pendant"
	item_state = "radi_pendant"
	item_color = "radi_pendant"
	w_class = 2.0

//////////// Masks ////////////

/*
/obj/item/clothing/mask/fluff/flagmask //searif: Tsiokeriio Tarbell
	name = "\improper First Nations facemask"
	desc = "A simple cloth rag that bears the flag of the first nations."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "flagmask"
	item_state = "flagmask"
	flags = MASKCOVERSMOUTH
	w_class = 2
	gas_transfer_coefficient = 0.90
*/

/obj/item/clothing/mask/mara_kilpatrick_1 //staghorn: Mara Kilpatrick
	name = "shamrock pendant"
	desc = "A silver and emerald shamrock pendant. It has the initials \"M.K.\" engraved on the back."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "mara_kilpatrick_1"
	w_class = 2

/////////////// Oen'g Issek Medical Mask //////////////////////////

/obj/item/clothing/mask/surgical/fluff/primitive
	name = "primitive mask"
	desc = "A decorated and creepy gas mask with the filters removed."
	icon = 'icons/obj/custom_items.dmi'
	item_state = "head_m"
	icon_state = "head_m"
	body_parts_covered = FACE|EYES

//Painted mask: Dante Cicero - andrewmeyCredit

/obj/item/clothing/mask/andrewmeyCredit
	name = "painted mask"
	desc = "A ghoulish mask with a stylized painting of a flame over the left eye, and a painted tear stream coming from the right eye."
	icon = 'icons/obj/custom_items.dmi'
	item_state = "cicero"
	icon_state = "cicero"
	body_parts_covered = FACE|EYES

////// Small locket - Altair An-Nasaqan - Serithi

/obj/item/clothing/accessory/fluff/altair_locket
	name = "small locket"
	desc = "A small golden locket attached to an Ii'rka-reed string. Inside the locket is a holo-picture of a female Tajaran, and an inscription writtin in Siik'mas."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "altair_locket"
	item_state = "altair_locket"
	item_color = "altair_locket"
	slot_flags = 0
	w_class = 2
	slot_flags = SLOT_MASK | SLOT_TIE

////// Silver locket - Konaa Hirano - Konaa_Hirano

/obj/item/clothing/accessory/fluff/konaa_hirano
	name = "silver locket"
	desc = "This oval shaped, argentium sterling silver locket hangs on an incredibly fine, refractive string, almost thin as hair and microweaved from links to a deceptive strength, of similar material. The edges are engraved very delicately with an elegant curving design, but overall the main is unmarked and smooth to the touch, leaving room for either remaining as a stolid piece or future alterations. There is an obvious internal place for a picture or lock of some sort, but even behind that is a very thin compartment unhinged with the pinch of a thumb and forefinger."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "konaahirano"
	item_state = "konaahirano"
	item_color = "konaahirano"
	slot_flags = 0
	w_class = 2
	slot_flags = SLOT_MASK | SLOT_TIE
	var/obj/item/held //Item inside locket.

/obj/item/clothing/accessory/fluff/konaa_hirano/attack_self(mob/user as mob)
	if(held)
		user << "You open [src] and [held] falls out."
		held.loc = get_turf(user)
		src.held = null

/obj/item/clothing/accessory/fluff/konaa_hirano/attackby(var/obj/item/O as obj, mob/user as mob)
	if(istype(O,/obj/item/weapon/paper))
		if(held)
			usr << "[src] already has something inside it."
		else
			usr << "You slip [O] into [src]."
			user.drop_item()
			O.loc = src
			src.held = O
		return
	..()

//////  Medallion - Nasir Khayyam - Jamini

/obj/item/clothing/accessory/fluff/nasir_khayyam_1
	name = "medallion"
	desc = "This silvered medallion bears the symbol of the Hadii Clan of the Tajaran."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "nasir_khayyam_1"
	w_class = 2
	slot_flags = SLOT_MASK | SLOT_TIE

////// Emerald necklace - Ty Foster - Nega

/obj/item/clothing/mask/mara_kilpatrick_1
	name = "emerald necklace"
	desc = "A brass necklace with a green emerald placed at the end. It has a small inscription on the top of the chain, saying \'Foster\'"
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "ty_foster"
	w_class = 2

////// Apollon Pendant - Michael Guess - Dragor23
/obj/item/clothing/mask/michael_guess_1
	name = "Apollon Pendant"
	desc = "A pendant with the form of a sacrificial tripod, used in acient greece. It's a symbol of the Olympian Apollon, a god associated with oracles, poetry, the sun and healing."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "michael_guess_1"
	w_class = 2
	slot_flags = SLOT_MASK
	body_parts_covered = 0

//////////// Shoes ////////////

/obj/item/clothing/shoes/magboots/fluff/susan_harris_1 //sniperyeti: Susan Harris
	name = "Susan's Magboots"
	desc = "A colorful pair of magboots with the name Susan Harris clearly written on the back."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "atmosmagboots0"

/obj/item/clothing/shoes/jackboots/fluff/hal_ishimaru_1	//YankeeSamurai: Hal Ishimaru
	name = "duty boots"
	desc = "Eight-inch black leather boots with side zips and NT-approved safety toes."

////////////////////////////////////////// Vivallion - Kecer Eldraran - Toe-less Jackboots //////////////

/obj/item/clothing/shoes/jackboots/fluff/kecer_eldraran
	name = "Toe-less Jackboots"
	desc = "Modified pair of jackboots, particularly friendly to those species whose toes hold claws."
	icon = 'icons/obj/custom_items.dmi'
	item_state = "digiboots"
	icon_state = "digiboots"
	species_restricted = null

/obj/item/clothing/shoes/jackboots/fluff/harmony_singh_1 //Bromuzl: Harmony Singh
	name = "Springjacks"
	desc = "A pair of highly modified jackboots in medical white, with some type of spring assembly on the ankle and heels, painted orange."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "springjacks"
	item_state = "springjacks"
	slowdown = SHOES_SLOWDOWN+1 //Slowing down because of her injured foot, these are for ease of pain so she can get off painkillers.
	siemens_coefficient = 0.7 //copied from Jackboots under code/modules/clothing/shoes/miscellaneous.dm

//////////// Sets ////////////

/*
/obj/item/clothing/suit/storage/labcoat/fluff/cdc_labcoat
	name = "\improper CDC labcoat"
	desc = "A standard-issue CDC labcoat that protects against minor chemical spills.  It has the name \"Wiles\" sewn on to the breast pocket."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "labcoat_cdc_open"
*/
////// Short Sleeve Medical Outfit //erthilo: Farah Lants

/obj/item/clothing/under/rank/medical/fluff/short
	name = "short sleeve medical jumpsuit"
	desc = "Made of a special fiber that gives special protection against biohazards. Has a cross on the chest denoting that the wearer is trained medical personnel and short sleeves."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "medical_short"
	item_state = "medical_short"
	item_color = "medical_short"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS

/obj/item/clothing/suit/storage/labcoat/fluff/red
	name = "red labcoat"
	desc = "A suit that protects against minor chemical spills. Has a red stripe on the shoulders and rolled up sleeves."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "labcoat_red_open"

////// Retired Patrol Outfit //desiderium: Rook Maudlin

/obj/item/clothing/suit/storage/det_suit/fluff/retpolcoat
	name = "retired colony patrolman's coat"
	desc = "A clean, black nylon windbreaker with the words \"OUTER LIGHT POLICE\" embroidered in gold-dyed thread on the back. \"RETIRED\" is tastefully embroidered below in a smaller font."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "retpolcoat"
	item_state = "retpolcoat"
	item_color = "retpolcoat"

/obj/item/clothing/head/det_hat/fluff/retpolcap
	name = "retired colony patrolman's cap"
	desc = "A clean and properly creased colony police cap. The badge is shined and polished, the word \"RETIRED\" engraved professionally under the words \"OUTER LIGHT POLICE.\""
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "retpolcap"

/obj/item/clothing/under/det/fluff/retpoluniform
	name = "retired colony patrolman's uniform"
	desc = "A meticulously clean police uniform belonging to Precinct 31, Outer Light Colony. The word \"RETIRED\" is engraved tastefully and professionally in the badge below the number, 501."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "retpoluniform"
	item_color = "retpoluniform"

//////////// Weapons ////////////

///// Well-used baton - Oen'g Issek - Donofnyc3

/obj/item/weapon/melee/baton/fluff/oeng_baton
	name = "well-used stun baton"
	desc = "A stun baton used for incapacitating targets; there seems to be a bunch of tally marks set into the handle."

/obj/item/weapon/reagent_containers/food/drinks/flask/fluff/yuri_kornienkovich_flask
	name = "Yuri's Flask"
	desc = "An old gold plated flask. Nothing noteworthy about it besides it being gold and the red star on the worn out leather around it. There is also an engraving on the cap that is rather hard to see but it looks like \"Kornienkovich\" "
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "yuri_kornienkovich_flask"

/obj/item/clothing/under/cheongsam/fluff/mai_yang_dress // Mai Yang's pretty pretty dress.
	name = "White Cheongsam"
	desc = "It is a white cheongsam dress."

/obj/item/clothing/under/fluff/sakura_hokkaido_kimono
	name = "Sakura Kimono"
	desc = "A pale-pink, nearly white, kimono with a red and gold obi. There is a embroidered design of cherry blossom flowers covering the kimono."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "sakura_hokkaido_kimono"
	item_state = "sakura_hokkaido_kimono"
	item_color = "sakura_hokkaido_kimono"

///////////////////////////// Astronovus - Harold's Cane ////////////////////////////

/obj/item/weapon/cane/fluff/harold
	name = "Harold's Cane"
	desc = "A cane with a wooden handle and a plastic frame capable of folding itself to make it more storable."
	w_class = 1.0
	icon = 'icons/obj/custom_items.dmi'
	item_state = "foldcane"
	icon_state = "foldcane"


//////////////////////////// Footman - Farwa  Plush Doll //////////////////////////////////

/obj/item/weapon/fluff/farwadoll
	name = "Farwa plush doll"
	desc = "A Farwa plush doll. It's soft and comforting!"
	w_class = 1.0
	icon = 'icons/obj/custom_items.dmi'
	item_state = "farwaplush"
	icon_state = "farwaplush"

/obj/item/weapon/fluff/farwadoll/attack_self(mob/user as mob)
	user.visible_message("<span class='notice'>[user] hugs [src]! How cute! </span>", \
						 "<span class='notice'>You hug [src]. Dawwww... </span>")

////////////////////////////// Meyar - Cane /////////////////////////////////////////////////

/obj/item/weapon/cane/fluff/ryals
	 name = "cane"
	 desc = "This cane seems to have 'Ryals' engraved on its handle."
	 icon_state = "cane"
	 item_state = "stick"

////////////////////////////// Foxler - Erstatz Vryroxes /////////////////////////////////////////////////

//Use this subtype for spawning in the custom item.
/obj/item/weapon/holder/cat/fluff/bones/custom_item

/obj/item/weapon/holder/cat/fluff/bones/custom_item/New()
	if (!contents.len)
		new/mob/living/simple_animal/cat/fluff/bones (src)
	..()

/obj/item/weapon/holder/cat/fluff/bones
	name = "Bones"
	desc = "It's Bones! Meow."
	gender = MALE
	icon_state = "cat3"

/mob/living/simple_animal/cat/fluff/bones
	name = "Bones"
	desc = "That's Bones the cat. He's a laid back, black cat. Meow."
	gender = MALE
	icon_state = "cat3"
	icon_living = "cat3"
	icon_dead = "cat3_dead"
	holder_type = /obj/item/weapon/holder/cat/fluff/bones
	var/friend_name = "Erstatz Vryroxes"

/mob/living/simple_animal/cat/fluff/bones/handle_movement_target()
	if (!friend)
		for (var/mob/living/carbon/human/M in player_list)
			if (M.real_name == friend_name)
				friend = M
				break
	..()


//////////////////////////// VORE stuff beyond here ////////////////////////////

// Stuff by Joan Risu goes below.

/obj/item/weapon/flame/lighter/zippo/fluff/joan
	name = "Federation Zippo Lighter"
	desc = "A red zippo lighter with the United Federation Logo on it."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "joanzip"
	icon_on = "joanzipon"
	icon_off = "joanzip"

/obj/item/weapon/claymore/fluff/aria
	name = "Aria"
	desc = "A beautifully crafted rapier owned by Joan Risu. It has a thin blade and is used for quick attacks."
	icon = 'icons/obj/custom_items.dmi'
	origin_tech = "materials=7"
	icon_state = "aria"
	item_state = "aria"

/obj/item/weapon/twohanded/fireaxe/fluff/mjollnir //I promised this would be done a year ago before our update and forums came along. I thought it was time to actually put it in now. -Joan
	name = "Mjollnir"
	desc = "Large hammer that looks like it can do a great deal of damage if properly used."
	icon = 'icons/obj/custom_items.dmi'
	origin_tech = "materials=7"
	icon_state = "mjollnir0"
	attack_verb = list("attacked", "hammered", "smashed", "slammed", "crushed")

/obj/item/clothing/under/suit_jacket/female/fluff/asuna
	name = "Joan's Historia Uniform"
	desc = "A red and white outfit used by Joan during her explorer days. Looks almost like a red school uniform."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "asuna"
	item_state = "asuna"
	item_color = "asuna"

/obj/item/clothing/under/suit_jacket/female/fluff/miqote
	name = "Miqo'te Seperates"
	desc = "This two-part set of clothing is very popular on the planet Hydaelyn. While made of very robust materials, its usefulness as armor is negated by the exposed midriff."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "miqote"
	item_state = "miqote"
	item_color = "miqote"

/obj/item/weapon/card/id/gold/fluff/badge
	name = "Faded Badge"
	desc = "A faded badge, backed with leather, that reads 'NT Security Force' across the front."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "ana_badge"

/obj/item/weapon/card/id/gold/fluff/badge/attack_self(mob/user as mob)
	if(isliving(user))
		user.visible_message("\red [user] flashes their golden security badge.\nIt reads:NT Security.","\red You display the faded badge.\nIt reads: NT Security.")

/obj/item/weapon/card/id/gold/fluff/badge/attack(mob/living/carbon/human/M, mob/living/user)
	if(isliving(user))
		user.visible_message("\red [user] invades [M]'s personal space, thrusting [src] into their face insistently.","\red You invade [M]'s personal space, thrusting [src] into their face insistently.")

/obj/item/clothing/suit/storage/det_suit/fluff/peacoat
	name = "Blue peacoat"
	desc = "A nifty looking blue peacoat. The collar is popped to make the wearer look more mysterious."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "peacoat"
	item_state = "peacoat"
	item_color = "peacoat"

/obj/item/device/pda/heads/hos/joan
	icon = 'icons/obj/custom_pda.dmi'
	icon_state = "pda-nut"

/obj/item/clothing/under/fluff/nightgown
	name = "nightgown"
	desc = "A seethrough nightgown. For those intimate nights with your significant other."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "nightgown"
	item_state = "nightgown"
	item_color = "nightgown"


/obj/item/clothing/head/helmet/space/void/security/fluff/hos // ToDo: Rig version.
	name = "\improper prototype voidsuit helmet"
	desc = "A customized security voidsuit helmet customized to include the Head of Security's signature hat. Has additional composite armor."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "rig0-hos"
	item_state = "rig0-hos"
	armor = list(melee = 65, bullet = 30, laser = 50, energy = 10, bomb = 45, bio = 100, rad = 10)
	item_color = "hos"

/obj/item/clothing/suit/space/void/security/fluff/hos // ToDo: Rig version.
	name = "\improper prototype voidsuit"
	desc = "A customized security voidsuit made to match the Head of Security's obession with black. Has additional composite armor."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "rig-hos"
	item_state = "rig-hos"
	armor = list(melee = 65, bullet = 30, laser = 50, energy = 10, bomb = 45, bio = 100, rad = 10)
	item_color = "hos"

/obj/item/clothing/suit/armor/hos/fluff/brittrenchcoat
	name = "Britania Trench Coat"
	desc = "An armored trench coat from the Brittanian Empire. It looks so British."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "brittrenchcoat"
	item_state = "brittrenchcoat"
	item_color = "brittrenchcoat"

/obj/item/clothing/suit/armor/hos/nazi_greatcoat
	name = "great coat"
	desc = "Perfect attire for kicking down the doors of suspected dissidents; this coat gives off an imposing look, while offering a luxuriously plush fur liner."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "greatcoat"
	item_state = "greatcoat"

/obj/item/clothing/suit/storage/fluff/fedcoat
	name = "Federation Uniform Jacket"
	desc = "A uniform jacket from the United Federation. Starfleet still uses this uniform and there are variations of it. Set phasers to awesome."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "fedcoat"
	item_state = "fedcoat"
	item_color = "fedcoat"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS
	allowed = list(
				/obj/item/weapon/tank/emergency_oxygen,
				/obj/item/device/flashlight,
				/obj/item/weapon/gun/energy,
				/obj/item/weapon/gun/projectile,
				/obj/item/ammo_magazine,
				/obj/item/ammo_casing,
				/obj/item/weapon/storage/fancy/shotgun_ammo,
				/obj/item/weapon/melee/baton,
				/obj/item/weapon/handcuffs,
				/obj/item/device/detective_scanner,
				/obj/item/device/taperecorder)
	armor = list(melee = 50, bullet = 15, laser = 25, energy = 10, bomb = 0, bio = 0, rad = 0)

	verb/toggle()
		set name = "Toggle coat Buttons"
		set category = "Object"
		set src in usr

		if(!usr.canmove || usr.stat || usr.restrained())
			return 0

		switch(icon_state)
			if("fedcoat_open")
				src.icon_state = "fedcoat"
				usr << "You button up the coat."
			if("fedcoat")
				src.icon_state = "fedcoat_open"
				usr << "You unbutton the coat."
			if("fedblue_open")
				src.icon_state = "fedblue"
				usr << "You button up the coat."
			if("fedblue")
				src.icon_state = "fedblue_open"
				usr << "You unbutton the coat."
			if("fedeng_open")
				src.icon_state = "fedeng"
				usr << "You button up the coat."
			if("fedeng")
				src.icon_state = "fedeng_open"
				usr << "You unbutton the coat."
			if("fedcapt")
				src.icon_state = "fedcapt_open"
				usr << "You unbutton the coat."
			else
				usr << "You attempt to button-up the velcro on your [src], before promptly realising how retarded you are."
				return
		usr.update_inv_wear_suit()	//so our overlays update

/obj/item/clothing/suit/storage/fluff/fedcoat/fedblue
	name = "Federation Uniform Jacket"
	desc = "A uniform jacket from the United Federation. Starfleet still uses this uniform and there are variations of it. Wearing this may make you feel all scientific."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "fedblue"
	item_state = "fedblue"
	item_color = "fedblue"
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 50, rad = 0)

/obj/item/clothing/suit/storage/fluff/fedcoat/fedeng
	name = "Federation Uniform Jacket"
	desc = "A uniform jacket from the United Federation. Starfleet still uses this uniform and there are variations of it.Wearing it may make you feel like checking a warp core, whatever that is."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "fedeng"
	item_state = "fedeng"
	item_color = "fedeng"
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 10, bomb = 0, bio = 30, rad = 35)

/obj/item/clothing/suit/storage/fluff/fedcoat/fedcapt
	name = "Federation Uniform Jacket"
	desc = "A uniform jacket from the United Federation. Starfleet still uses this uniform and there are variations of it. You feel like a commanding officer of Starfleet."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "fedcapt"
	item_state = "fedcapt"
	item_color = "fedcapt"
	armor = list(melee = 50, bullet = 5, laser = 15,energy = 10, bomb = 0, bio = 0, rad = 0)

/obj/item/clothing/glasses/fluff/yellow
	name = "Yellow Goggles"
	desc = "A neat looking pair of goggles"
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "yellow-g"
	item_state = "yellow-g"
	icon_action_button = "action_welding_g"
	var/up = 0

/obj/item/clothing/glasses/fluff/yellow/attack_self()
	toggle()


/obj/item/clothing/glasses/fluff/yellow/verb/toggle()
	set category = "Object"
	set name = "Adjust goggles"
	set src in usr

	if(usr.canmove && !usr.stat && !usr.restrained())
		if(src.up)
			src.up = !src.up
			flags_inv |= HIDEEYES
			icon_state = initial(icon_state)
			usr << "You flip the [src] down to protect your eyes."
		else
			src.up = !src.up
			flags_inv &= ~HIDEEYES
			icon_state = "[initial(icon_state)]up"
			usr << "You push the [src] up out of your face."

		usr.update_inv_glasses()

/obj/item/clothing/glasses/fluff/yellow/blue
	name = "Blue Goggles"
	desc = "A neat looking pair of blue goggles"
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "blue-g"
	item_state = "blue-g"
	icon_action_button = "action_welding_g"

/obj/item/clothing/tie/fluff/smilepin
	name = "Smiley Pin"
	desc = "A pin with a stupid grin on its face"
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "smilepin"
	item_color = "smilepin"

/obj/item/clothing/tie/fluff/heartpin
	name = "Love Pin"
	desc = "A cute heart pin."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "heartpin"
	item_color = "heartpin"

/obj/item/clothing/suit/armor/captain/fluff/harmsuit
	name = "Harmony's Captain Armor"
	desc = "A modified Captain Armor suit for Harmony Prechtl."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "harmarmor"
	item_state = "harmarmor"
	item_color = "harmarmor"

/obj/item/clothing/head/helmet/space/capspace/fluff/harmhelm
	name = "Harmony's Captain Helmet"
	desc = "A modified Captain helmet for Harmony Prechtl."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "harmspace"
	item_state = "harmspace"
	item_color = "harmspace"

/obj/item/clothing/under/rank/captain/fluff/harmuniform
	name = "Harmony's Captain uniform"
	desc = "A customized Captain uniform for Harmony Prechtl, given to her as a gift by Central Command for her service."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "harmcaptain"
	item_state = "dg_suit"
	item_color = "harmcaptain"

/obj/item/device/modkit_conversion/fluff/harmonyspace
	name = "Harmony's captain space suit modkit"
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "harm_kit"
	desc = "A kit containing all the needed tools and parts to modify a Captain's hardsuit. It has green and yellow parts inside."
	from_helmet = /obj/item/clothing/head/helmet/space/capspace
	from_suit = /obj/item/clothing/suit/armor/captain
	to_helmet = /obj/item/clothing/head/helmet/space/capspace/fluff/harmhelm
	to_suit = /obj/item/clothing/suit/armor/captain/fluff/harmsuit

/obj/item/device/modkit_conversion/fluff/harmonysuit
	name = "Harmony's captain suit modkit"
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "harm_kit"
	desc = "A sewing kit containing all the needed tools and fabric to modify a Captain's suit and hat. It has green and yellow fabrics inside."
	from_helmet = /obj/item/clothing/head/caphat
	from_suit = /obj/item/clothing/under/rank/captain
	to_helmet = /obj/item/clothing/head/centhat/fluff/harmhat
	to_suit = /obj/item/clothing/under/rank/captain/fluff/harmuniform

/obj/item/clothing/under/rank/captain/fluff/harmuniform/centcom
	name = "\improper CentCom administrator's uniform"
	desc = "It's a green jumpsuit with some gold markings denoting the rank of \"Administrator\"."

/obj/item/clothing/head/centhat/fluff/harmhat
	name = "Harmony's CentCom hat"
	desc = "It's good to be queen."

/obj/item/clothing/under/fluff/classic_kimono
	name = "Classic Kimono"
	desc = "A more classic kimono. You feel like using a bow and arrow or a katana."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "kimonorw_s"
	item_state = "kimonorw_s"
	item_color = "kimonorw_s"

/obj/item/clothing/under/det/fluff/tasald
	name = "Tasald's outfit"
	desc = "Tasald's outfit. Very green."
	icon_state = "tassuit"
	item_color = "tassuit"

/obj/item/clothing/under/det/fluff/tasald/verb/rollup()
	set name = "Roll suit sleeves"
	set category = "Object"
	set src in usr
	item_color = item_color == "tassuit" ? "tassuit_rolled" : "tassuit"
	if (ishuman(loc))
		var/mob/living/carbon/human/H = loc
		H.update_inv_w_uniform(1)

/obj/item/clothing/suit/storage/det_suit/fluff/tasald
	name = "Vest"
	desc = "A fancy looking vest. You look like a smooth operating officer in this."
	icon_state = "tasvest"
	item_state = "tasvest"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS

/obj/item/clothing/shoes/cuffs/octavious //Octavious Ward, tasald's char
	desc = "Dark leather leg wraps with sliver clasps on the sides. Stylish and functional."
	name = "silvered leg wraps"
	icon_state = "silvergildedcuffs"
	item_color = "silvergildedcuffs"
	body_parts_covered = 0
	species_restricted = null

/obj/item/clothing/head/squirrel/joan //Because I hate the ears matching hair color -Joan
	name = "squirrel ears"
	desc = "A pair of squirrel ears. NUTS!"
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "squirrel_old"

/obj/item/clothing/suit/storage/det_suit/fluff/tas_coat
	name = "Armored Colony coat"
	desc = "Dark green and grey colored sleeveless long coat with two thick metal shoulder pads. has seen some wear and tear, with noticeable patches in the fabric, scratches on the shoulder pads, but with a clean patch on the left upper chest. It has a red NT marked on the right shoulder pad and red Security on the left. "
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "tas_coat"
	item_state = "tas_coat"
	blood_overlay_type = "coat"
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS


// Custom guns now go in custom_guns.dm so don't put them here.

//Cult research book
/obj/item/weapon/tome/prettycultbook
	name = "Research Notebook"
	desc = "A well-kept spiral research notebook. The cover is decorated with symmetrical drawings and weird letters where its contents listings are supposed to be."
	icon_state ="prettycultbook"
	icon = 'icons/obj/custom_items.dmi'
	throw_speed = 1
	throw_range = 5
	w_class = 2.0

/obj/effect/decal/cleanable/prettyrune
	name = "Sigil"
	desc = "A symmetrical design laid out all in blue with weird symbols written in all over it."
	icon = 'icons/obj/custom_items.dmi'
	gender = PLURAL
	icon_state = "prettyrune"
	anchored = 1

// End Joan's stuff.

// Scree's custom stuff
/obj/item/clothing/head/helmet/space/void/engineering/fluff/screehelm
	name = "Modified Tajara Helmet"
	desc = "A special helmet designed for work in a hazardous, low-pressure environment. Has radiation shielding. This one doesn't look like it was made for humans. Its been modified to include headlights."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "rig0-scree"
	item_state = "rig0-scree"
	item_color = "scree"
	species_restricted = list("Tajara")

/obj/item/clothing/suit/space/void/engineering/fluff/screespess
	name = "Modified Winged Suit"
	desc = "A special suit that protects against hazardous, low pressure environments. Has radiation shielding. This one doesn't look like it was made for humans. This one was made with a special personal shielding for someone's wings."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "wingedsuit"
	item_state = "wingedsuit"
	item_color = "wingedsuit"
	species_restricted = list("Tajara")

/obj/item/clothing/under/fluff/screesuit
	name = "Scree's feathers"
	desc = "A mop of fluffy blue feathers, the honkmother only knows what kind of bird they originally came from."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "screesuit"
	item_state = "screesuit"
	item_color = "screesuit"

/obj/item/device/modkit_conversion/fluff/screekit
	name = "Scree's hardsuit modification kit"
	desc = "A kit containing all the needed tools and parts to modify a hardsuit for a specific user. This one looks like it's fitted for a winged creature."
	from_helmet = /obj/item/clothing/head/helmet/space/void/engineering
	from_suit = /obj/item/clothing/suit/space/void/engineering
	to_helmet = /obj/item/clothing/head/helmet/space/void/engineering/fluff/screehelm
	to_suit = /obj/item/clothing/suit/space/void/engineering/fluff/screespess

/obj/item/clothing/head/fluff/pompom
	name = "Pom-Pom"
	desc = "A fluffy little thingus on a thin stalk, ideal for impersonating moogles and anglerfish. Kupomnomnom."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "pom"
	item_state = "pom"
	w_class = 2.0
	on = 0
	brightness_on = 5
	light_overlay = null

/obj/item/clothing/head/fluff/pompom/attack_self(mob/user)
	if(brightness_on)
		if(!isturf(user.loc))
			user << "You cannot turn the light on while in this [user.loc]"
			return
		on = !on
		user << "You [on ? "light up" : "dim"] your pom-pom."
		update_light(user)
	else
		return ..(user)


/obj/item/clothing/head/fluff/pompom/update_icon(var/mob/user)
	if(on)
		icon_state = "pom-on"
		item_state = "pom-on"
	else
		icon_state = "pom"
		item_state = "pom"
	if(istype(user,/mob/living/carbon/human))
		var/mob/living/carbon/human/H = user
		H.update_inv_head()

//End Scree's stuff

//Caso's stuff

/obj/item/clothing/head/fluff/xeno
	name = "Xeno Accessories"
	desc = "My other cat is a Xenomorph."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "snag"
	item_state = "snag"
	item_color = "snag"

/* Intentionally removed until replacement sprites are made. Maker of this sprite didn't want this to be open source.
/obj/item/clothing/head/fluff/caso
	name = "Deathclaw Accessories"
	desc = "Big! Big! The size of three men! Claws as long as my forearm! Ripped apart! Ripped apart!"
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "caso"
	item_state = "caso"
	item_color = "caso"
*/

/obj/item/clothing/head/helmet/fluff/freddy
	name = "animatronic suit helmet"
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "freddyhead"
	item_state = "freddyhead"
	desc = "Votre toast, je peux vous le rendre."
	permeability_coefficient = 0.01
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	flags_inv = HIDEMASK|HIDEEARS
	cold_protection = HEAD
	siemens_coefficient = 0.9

/obj/item/clothing/suit/fluff/freddy
	name = "animatronic suit"
	desc = "Votre toast, je peux vous le rendre."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "freddysuit"
	item_state = "freddysuit"
	w_class = 3
	gas_transfer_coefficient = 0.01
	permeability_coefficient = 0.02
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|FEET|ARMS|HANDS
	allowed = list(/obj/item/device/flashlight,/obj/item/weapon/tank)
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)
	flags_inv = HIDEGLOVES|HIDESHOES|HIDEJUMPSUIT
	cold_protection = UPPER_TORSO | LOWER_TORSO | LEGS | FEET | ARMS | HANDS
	siemens_coefficient = 0.9

// These inherit the stats from freddy's helmet and suit.
/obj/item/clothing/head/helmet/fluff/freddy/bonnie
	desc = "Children's entertainer."
	icon_state = "bonniehead"
	item_state = "bonniehead"

/obj/item/clothing/suit/fluff/freddy/bonnie
	desc = "Children's entertainer."
	icon_state = "bonniesuit"
	item_state = "bonniesuit"

/obj/item/clothing/head/helmet/fluff/freddy/foxy
	desc = "I guess he doesn't like being watched."
	icon_state = "foxyhead"
	item_state = "foxyhead"

/obj/item/clothing/suit/fluff/freddy/foxy
	desc = "I guess he doesn't like being watched."
	icon_state = "foxysuit"
	item_state = "foxysuit"

/obj/item/clothing/head/helmet/fluff/freddy/chica
	desc = "<b><font color=red>LET'S EAT!</font></b>"
	icon_state = "chicahead"
	item_state = "chicahead"

/obj/item/clothing/suit/fluff/freddy/chica
	desc = "<b><font color=red>LET'S EAT!</font></b>"
	icon_state = "chicasuit"
	item_state = "chicasuit"

/obj/item/clothing/gloves/fluff/fingerless
	name = "fingerless gloves"
	desc = "A pair of gloves, they don't look special in any way."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "fingerlessgloves"
	item_state = "fingerlessgloves"
	clipped = 1 // Because they have no fingertips!

//End Caso's stuff

// JerTheAce : Jeremiah 'Ace' Acacius
/obj/item/weapon/storage/pill_bottle/fluff/acepills
	name = "Pill bottle (citalopram)"
	desc = "Contains pills used to deal with psychological disorders like PTSD. They appear to be prescribed to Jeremiah Acacius."
	New()
		..()
		new /obj/item/weapon/reagent_containers/pill/citalopram( src )
		new /obj/item/weapon/reagent_containers/pill/citalopram( src )
		new /obj/item/weapon/reagent_containers/pill/citalopram( src )
		new /obj/item/weapon/reagent_containers/pill/citalopram( src )
		new /obj/item/weapon/reagent_containers/pill/citalopram( src )
		new /obj/item/weapon/reagent_containers/pill/citalopram( src )
		new /obj/item/weapon/reagent_containers/pill/citalopram( src )

// JerTheAce : Jeremiah 'Ace' Acacius
/obj/item/clothing/suit/armor/tactical/officer/fluff/ace
	name = "officer jacket"
	desc = "An armored jacket used in special operations--or by special snowflake Captains. Fuck off, I like my coat."
	icon_state = "detective2"
	slowdown = 0

// JerTheAce : Jeremiah 'Ace' Acacius
/obj/item/weapon/storage/box/fluff/ace
	name = "Ace's stuff"
	desc = "A box of stuff owned by Jeremiah 'Ace' Acacius."
	New()
		new /obj/item/weapon/storage/pill_bottle/fluff/acepills(src)
		new /obj/item/clothing/accessory/medal/gold/heroism(src)
		new /obj/item/fluff/permit/jerace(src)
		..()
		return


/obj/item/weapon/flag
	name = "Nanotrasen Banner"
	desc = "I pledge allegiance to the flag of a megacorporation in space."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "Flag_Nanotrasen"
	item_state = "Flag_Nanotrasen"

/obj/item/weapon/flag/attack_self(mob/user as mob)
	if(isliving(user))
		user.visible_message("\red [user] waves their Banner around","\red You wave your Banner around")

/obj/item/weapon/flag/attack(mob/living/carbon/human/M, mob/living/user)
	if(isliving(user))
		user.visible_message("\red [user] invades [M]'s personal space, thrusting [src] into their face insistently.","\red You invade [M]'s personal space, thrusting [src] into their face insistently.")


/obj/item/weapon/flag/federation
	name = "Federation Banner"
	desc = "Space, The Final Frontier. Sorta. Just go with it and say the damn oath."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "flag_federation"
	item_state = "flag_federation"


/obj/item/weapon/reagent_containers/glass/beaker/neurotoxin
	New()
		..()
		reagents.add_reagent("neurotoxin",50)
		update_icon()

/obj/item/weapon/beach_ball/basketball
	icon = 'icons/obj/basketball.dmi'
	icon_state = "basketball"
	name = "basketball"
	item_state = "basketball"
	desc = "Here's your chance, do your dance at the Space Jam."

/obj/item/clothing/head/hardhat/justice
	name = "THE HELMET OF JUSTICE!"
	desc = "<b>YOU <i>ARE</i> THE LAW!</b>"
	icon_state = "hardhat0_justice"
	item_state = "hardhat0_justice"
	item_color = "justice"

/obj/item/device/radio/headset/fluff/zodiacshadow
	name = "Nehi's 'phones"
	desc = "A pair of old-fashioned purple headphones for listening to music that also double as an NT-approved headset; they connect nicely to any standard PDA. One side is engraved with the letters NEHI, the other having an elaborate inscription of the words \"My voice is my weapon of choice\" in a fancy font. A modern polymer allows switching between modes to either allow one to hear one's surroundings or to completely block them out."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "headphones"
	item_state = "headphones"

// OrbisA Items

/obj/item/weapon/melee/fluff/holochain // OrbisA: Richard D'angelo
	name = "Holographic Chain"
	desc = "A High Tech solution to simple perversions. It has a red leather handle and the initials R.D. on the silver base."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "holochain"
	item_state = "holochain"
	flags = CONDUCT | NOBLOODY
	no_attack_log = 1 //if you want to turn on the attack log for this, comment/delete this line. Orbis.
	slot_flags = SLOT_BELT
	force = 10
	throwforce = 3
	w_class = 3
	damtype = HALLOSS
	attack_verb = list("flogged", "whipped", "lashed", "disciplined", "chastised", "flayed")

 // End OrbisA Items

//Weapon permits to spawn with players who have them.

// Template.
/obj/item/fluff/permit
	name = "Sample Permit"
	desc = {"There is a bright red <b><font color=red>SAMPLE PERMIT</font></b> stamped across the stock photo displayed on the card. Obviously this is only an example to educate security.
	<b>NAME:</b> First Last | <b>RACE:</b> Human | <b>HOMEWORLD:</b> Moon (if applicable), Planet, System
	<b>DOB:</b> DD/Month/YYYY | <b>HEIGHT:</b> XXcm | <b>SEX:</b> Female

	The individual named above is licensed by the Nanotrasen Department of Civil Protection to ___________________.
	This license expires on DD/Month/YYYY and must be renewed by CentCom prior to this date."}
	icon = 'icons/obj/card.dmi'
	icon_state = "permit"
	w_class = 1

// jertheace:Jeremiah 'Ace' Acacius
/obj/item/fluff/permit/jerace
	name = "Ace's Shotgun Permit"
	desc = {"
	<b>NAME:</b> Jeremiah Acacius | <b>RACE:</b> Human | <b>HOMEWORLD:</b> Earth, Sol
	<b>DOB:</b> 17/Jun/2532 | <b>HEIGHT:</b> 178cm | <b>SEX:</b> Male

	The individual named above is licensed by the Nanotrasen Department of Civil Protection to openly carry one M45D shotgun loaded with less-than-lethal munitions as a head of staff. Else this weapon is to be turned in to security for holding until the end of the shift.
	This license expires on 01/Jun/2560 and must be renewed by CentCom prior to this date."}

// sasoperative:Joseph Skinner
/obj/item/fluff/permit/josephskinner
	name = "Joseph Skinner's 12g Revolver Permit"
	desc = {"
	<b>NAME:</b> Joseph Cyrus Skinner | <b>RACE:</b> Human | <b>HOMEWORLD:</b> Earth, Sol
	<b>DOB:</b> 10/Jun/2532 | <b>HEIGHT:</b> 162.5cm | <b>SEX:</b> Male

	The individual named above is licensed by the Nanotrasen Department of Civil Protection to carry one 12 gauge revolver loaded with less-than-lethal munitions as a member of security or head of staff. Else this weapon is to be turned in to security for holding until the end of the shift.
	This license expires on 29/Nov/2559 and must be renewed by CentCom prior to this date."}


// wankersonofjerkin:Ryan Winz
/obj/item/fluff/permit/ryanwinz
	name = "Ryan Winz's Revolver Permit"
	desc = {"
	<b>NAME:</b> Ryan Winz | <b>RACE:</b> Human | <b>HOMEWORLD:</b>  New Ekaterina, Moskva
	<b>DOB:</b> 27/Oct/2536 | <b>HEIGHT:</b> 172cm | <b>SEX:</b> Male

	The individual named above is licensed by the Nanotrasen Department of Civil Protection to openly carry one Colt Single-Action Army revolver as a security officer or head of staff. Else this weapon is to be turned in to security for holding until the end of the shift.
	This license expires on 26/Dec/2559 and must be renewed by CentCom prior to this date."}

// bwoincognito:Tasald Corlethian
/obj/item/fluff/permit/tasald_corlethian
	name = "Tasald Ajax Corlethian's Sidearm Permit"
	desc = {"
	<b>NAME:</b> Tasald Ajax Corlethian | <b>RACE:</b> Vulpine | <b>HOMEWORLD:</b> Iscyn, Orta
	<b>DOB:</b> 09/Sep/2529 | <b>HEIGHT:</b> 187cm | <b>SEX:</b> Male

	The individual named above is licensed by the Nanotrasen Department of Civil Protection to carry one .38 pistol.
	This license expires on 30/March/2561 and must be renewed by CentCom prior to this date."}

// arokha:Aronai Kadigan
/obj/item/fluff/permit/aronai_kadigan
	name = "Aronai Kadigan's Sidearm Permit"
	desc = {"
	<b>NAME:</b> Aronai Kadigan | <b>RACE:</b> Cross Fox | <b>HOMEWORLD:</b> New Kitsuhana, KHI1
	<b>DOB:</b>  12/Jul/2530 | <b>HEIGHT:</b> 188cm | <b>SEX:</b> Male

	The individual named above is licensed by the Nanotrasen Department of Civil Protection to carry one KIN-H21 (Egun Variant).
	This license expires on 30/Sep/2560 and must be renewed by CentCom prior to this date."}

// joanrisu:Joan Risu
/obj/item/fluff/permit/joanrisu
	name = "Joan Risu's Sidearm Permit"
	desc = {"
	<b>NAME:</b> Joan Risu | <b>RACE:</b> Squirrelkin | <b>HOMEWORLD:</b> Luna, Gaia, Koi
	<b>DOB:</b> 16/Apr/2536 | <b>HEIGHT:</b> 161cm | <b>SEX:</b> Female

	The individual named above is licensed by the Nanotrasen Department of Civil Protection to carry one MWPSB Dominator.
	This license expires on 11/Dec/2560 and must be renewed by CentCom prior to this date."}

// molenar:Kari Akiren
/obj/item/fluff/permit/kari_akiren
	name = "Kari Akiren's Rifle Permit"
	desc = {"
	<b>NAME:</b> Kari Akiren | <b>RACE:</b> Inkling | <b>HOMEWORLD:</b> Supesu
	<b>DOB:</b>  26-Jun-2553 | <b>HEIGHT:</b> 163cm | <b>SEX:</b> Female

	The individual named above is licensed by the Nanotrasen Department of Civil Protection to carry one Clockwork Rifle (bolt-action variant).
	This license expires on 14/Dec/2560 and must be renewed by CentCom prior to this date."}

/*
// ?????:Greyson Maximus
/obj/item/fluff/permit/demi
	name = "Greyson Maximus's Sidearm Permit"
	desc = {"
	<b>NAME:</b> Greyson Maximus | <b>RACE:</b> Neko/Catgirl | <b>HOMEWORLD:</b> N/A
	<b>DOB:</b> 30/May/2536 | <b>HEIGHT:</b> 198cm | <b>SEX:</b> Herm

	The individual named above is licensed by the Nanotrasen Department of Civil Protection to carry one M1911.
	This license expires on 11/Dec/2559 and must be renewed by CentCom prior to this date."}
*/

//Boxes of goodies for veteran players.

// Can hold up to 7. This is a template.
/*
/obj/item/weapon/storage/box/fluff/medals
	name = "[template]'s medal collection"
	desc = "A box full of medals collected over [template]'s career."
	New()
		new /obj/item/path(src)
		..()
		return
*/



// SASoperative : Joseph Skinner
/obj/item/clothing/under/rank/security/fluff/formalsec //admins chipped in for this item to have normal values
	name = "Formal Camo Fatigues"
	desc = "A formal set of fatigues with red and black camo to resemble the colors of Nanotresen Security"
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "formalsec"
	item_color = "formalsec"

// wankersonofjerkin:Ryan Winz
/obj/item/weapon/storage/briefcase/fluff/ryan_winz
	name = "Ryan's Gun Case"
	desc = "Used to safely transport Ryan's two personal revolvers."
	storage_slots = 2

/obj/item/weapon/storage/briefcase/fluff/ryan_winz/New()
	new /obj/item/weapon/gun/projectile/revolver/fluff/ryan_winz_revolver(src)
	new /obj/item/weapon/gun/projectile/revolver/fluff/ryan_winz_revolver/redemption(src)
	..()
	return

// ardithprime:Natasha Moscovich
/obj/item/weapon/storage/box/fluff/soviet
	name = "Soviet Officer's Kit"
	desc = "Contains all the items needed to serve the Motherworld away from the Motherworld!"
	storage_slots = 4

/obj/item/weapon/storage/box/fluff/soviet/New()
	new /obj/item/clothing/head/hgpiratecap(src)
	new /obj/item/clothing/shoes/jackboots(src)
	new /obj/item/clothing/suit/hgpirate(src)
	new /obj/item/clothing/under/soviet(src)
	..()
	return

// jemli:Cirra Mayhem
/obj/item/weapon/storage/box/fluff/pirate // jemli:Cirra Mayhem
	name = "Instant Pirate Kit"
	desc = "Just add Akula!"
	storage_slots = 4

/obj/item/weapon/storage/box/fluff/pirate/New()
	new /obj/item/clothing/head/pirate(src)
	new /obj/item/clothing/glasses/eyepatch(src)
	new /obj/item/clothing/suit/pirate(src)
	new /obj/item/clothing/under/pirate(src)
	..()
	return

/obj/item/device/fluff/id_kit_mime // joey4298:Emoticon
	name = "Mime ID reprinter"
	desc = "Stick your ID in one end and it'll print a new ID out the other!"
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "labeler1"

/obj/item/device/fluff/id_kit_mime/afterattack(obj/O, mob/user as mob)
	var/new_icon = "mime"
	if(istype(O,/obj/item/weapon/card/id) && O.icon_state != new_icon)
		//O.icon = src.icon // just in case we're using custom sprite paths with fluff items.
		O.icon_state = new_icon // Changes the icon without changing the access.
		playsound(user.loc, 'sound/items/polaroid2.ogg', 100, 1)
		user.visible_message("\red [user] reprints their ID.")
		del(src)
	else if(O.icon_state == new_icon)
		user << "<span class='notice'>[O] already has been reprinted.</span>"
		return
	else
		user << "<span class='warning'>This isn't even an ID card you idiot.</span>"
		return

/obj/item/device/fluff/id_kit_clown // ToDo: Move these to a better location for more reusable code.
	name = "Clown ID reprinter"
	desc = "Stick your ID in one end and it'll print a new ID out the other!"
	icon = 'icons/obj/bureaucracy.dmi'
	icon_state = "labeler1"

/obj/item/device/fluff/id_kit_clown/afterattack(obj/O, mob/user as mob)
	var/new_icon = "clown"
	if(istype(O,/obj/item/weapon/card/id) && O.icon_state != new_icon)
		//O.icon = src.icon // just in case we're using custom sprite paths with fluff items.
		O.icon_state = new_icon // Changes the icon without changing the access.
		playsound(user.loc, 'sound/items/polaroid2.ogg', 100, 1)
		user.visible_message("\red [user] reprints their ID.")
		del(src)
	else if(O.icon_state == new_icon)
		user << "<span class='notice'>[O] already has been reprinted.</span>"
		return
	else
		user << "<span class='warning'>This isn't even an ID card you idiot.</span>"
		return

/obj/item/weapon/storage/box/fluff/emoticon // joey4298:Emoticon
	name = "Emoticon's Mime Kit"
	desc = "Specially packaged for the hungry catgirl mime with a taste for clown."

/obj/item/weapon/storage/box/fluff/mime/New()
	new /obj/item/device/fluff/id_kit_mime(src)
	new /obj/item/clothing/gloves/white(src)
	new /obj/item/clothing/head/beret(src)
	new /obj/item/weapon/reagent_containers/food/drinks/bottle/bottleofnothing(src)
	new /obj/item/clothing/shoes/black(src)
	new /obj/item/toy/crayon/mime(src)
	..()
	return

/obj/item/weapon/storage/box/fluff/joanrisu // joanrisu:Joan Risu
	name = "Federation Officer's Kit"
	desc = "A care package for every serving Federation officer serving away from the Federation."

/obj/item/weapon/storage/box/fluff/joanrisu/New()
	new /obj/item/clothing/gloves/white(src)
	new /obj/item/device/radio/headset/heads/captain(src)
	new /obj/item/weapon/storage/backpack/satchel(src)
	new /obj/item/clothing/suit/storage/fluff/fedcoat(src)
	new /obj/item/weapon/card/id/gold/fluff/badge/(src)
	new /obj/item/weapon/card/id/captains_spare(src)
	..()
	return

 // His clothes do exist, just under a different name. I had neglected to correct the typo here. -Joan
/obj/item/weapon/storage/box/fluff/tasaldkit // bwoincognito:Tasald Corlethian
	name = "Tasald's Kit"
	desc = "A kit containing Talsald's clothes."
	storage_slots = 7

/obj/item/weapon/storage/box/fluff/tasaldkit/New()
	new /obj/item/clothing/suit/storage/det_suit/fluff/tasald(src)
	new /obj/item/clothing/suit/storage/det_suit/fluff/tas_coat(src)
	new /obj/item/clothing/under/det/fluff/tasald(src)
	new /obj/item/fluff/permit/tasald_corlethian(src)
	new /obj/item/weapon/gun/projectile/revolver/detective/fluff/tasald_corlethian(src)
	new /obj/item/weapon/implanter/loyalty
	..()
	return

/obj/item/device/modkit_single/fluff/clockworkrifle // molenar:Kari Akiren
	name = "Clockwork Rifle Modkit"
	desc = "A kit containing all the tools and parts to modify a bolt-action rifle into a clockwork rifle."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "clockworkkit"
	from_object = /obj/item/weapon/gun/projectile/shotgun/pump/rifle
	to_object = /obj/item/weapon/gun/projectile/shotgun/pump/rifle/fluff/kari_akiren

/obj/item/clothing/suit/storage/toggle/labcoat/fluff/molenar // molenar:Giliana Gamish
	name = "Gili Custom Labcoat"
	desc = " Custom made, lengthened labcoat with water resistant, durable material. And a custom set of holes inserted for Deathclaw anatomy. A tag inside has 'G.G.' monogram on it"
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "molenar"
	icon_open = "molenar_open"
	icon_closed = "molenar"
	item_state = "molenar"


/obj/item/clothing/glasses/sunglasses/fluff/nerdglasses // kisukegema:Kisuke 'Nerd' Gema
	name = "Kamina Glasses"
	desc = "Some shades from an anime that aired long ago. They seem to encourage a type of manliness that no one but the wearer understands."
	icon = 'icons/obj/custom_items.dmi'
	prescription = 1
	icon_state = "nerdglasses"
	item_state = "nerdglasses"
	item_color = "nerdglasses"

/obj/item/weapon/melee/fluff/holochain/Zippy
	name = "Mistress Holographic Chain"
	desc = "A High Tech solution to simple perversions. It has a red leather handle and a message on the silver base. 'To Zippy, with love, R.D.'"

/obj/item/device/modkit_single/fluff/zekechimera // zekesturm:Sarah Arachi Lacecraft
	name = "Sarah's RD rig modkit"
	desc = "A kit containing all the tools and parts to modify an AMI rigsuit. It looks rather alien."
	from_object = /obj/item/weapon/rig/hazmat
	to_object = /obj/item/weapon/rig/fluff/zeke_sturm

/obj/item/weapon/reagent_containers/hypospray/autoinjector/shrink
	name = "autoinjector"
	desc = "A rapid and safe way to administer small amounts of drugs by untrained or trained personnel. Something seems off about this one..."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "shrinkinjector"
	//item_state = "shrinkinjector1"
	amount_per_transfer_from_this = 5
	volume = 5

/obj/item/weapon/reagent_containers/hypospray/autoinjector/shrink/New()
	..()
	reagents.remove_all_type(/datum/reagent,5)
	reagents.add_reagent("microcillin", 4)
	reagents.add_reagent("neurotoxin", 1)
	update_icon()
	return

//Tsunderenyaa items
/obj/item/weapon/scalpel/fluff/cultknife
	name ="Ramona's Blade"
	desc = "A steel, curved knife, looking sharp as a razor. Perfect for a ritual sacrifice!"
	icon = 'icons/obj/wizard.dmi'
	icon_state = "render"

/obj/item/clothing/under/rank/security/fluff/casualsec
	name = "Casual Uniform"
	desc = "A custom tailored security uniform, with shorts and the shirt's sleeves rolled up to the elbow."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "casey"
	item_color = "casey"

//Arokha items
/obj/item/weapon/reagent_containers/hypospray/fluff/aronai
	name = "worn hypospray"
	desc = "This hypospray seems a bit well-used. The blue band indicates it's from the CentCom medical division. There's an 'A' scratched into the bottom."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "aro_hypo"

/obj/item/weapon/reagent_containers/hypospray/fluff/aronai/New()
	..()
	reagents.add_reagent("inaprovaline", 5)
	reagents.add_reagent("tricordrazine", 25)
	update_icon()
	return

//wickedtemp:Chakat Tempest
/obj/item/clothing/glasses/hud/health/fluff/chakat_tempest
	name = "Custom Health Scanner HUD"
	desc = "A customized heads-up display that scans the humans in view and provides accurate data about their health status."
	icon_state = "phealthhud"
	icon = 'icons/obj/custom_items.dmi'
	item_state = "phealthhud"
	body_parts_covered = 0


/obj/item/clothing/glasses/hud/health/tempisthud/process_hud(var/mob/M)
	process_med_hud(M, 1)

//adk09:Lethe
/obj/item/clothing/head/helmet/hos/fluff/lethe
	name = "Lethe's Hat"
	desc = " This is Lethe's Hat! A little tag attached inside reads: 'If found please return to Lethe! Or else!' It looks rather worn in. It also lacks armor."
	icon_state = "hoscap"
	armor = list(melee = 0, bullet = 0, laser = 0,energy = 0, bomb = 0, bio = 0, rad = 0)

//BeyondMyLife:Kilano Soryu
/obj/item/clothing/under/dress/fluff/kilano
	name = "Bleached Dress"
	desc = "It appears that this was once a captain's dress, it's blueish color has been turned white by bleach, only the gold markings remain to slightly signify what it once was."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "kilanodress"
	item_state = "kilanodress"
	item_color = "kilanodress"
	species_restricted = null
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|ARMS

/obj/item/clothing/gloves/fluff/kilano
	name = "Bleached Gloves"
	desc = "Some old captain's gloves, bleached white, almost unrecognizable from the color change besides the gold trim."
	icon = 'icons/obj/custom_items.dmi'
	icon_state = "kilanogloves"
	item_state = "kilanogloves"
	item_color = "kilanogloves"
	species_restricted = null