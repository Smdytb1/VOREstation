// TODO: Add a vending machine for these.

/obj/item/device/pda_mod
	name = "Basic PDA case"
	desc = "A snap-on case with a removable fake screen. Use it to change the look of your PDA."
	icon = 'icons/obj/pda.dmi'
	icon_state = "pda"
	var/newdesc = "A portable microcomputer by Thinktronic Systems, LTD. Functionality determined by a preprogrammed ROM cartridge." // in case we have a custom description

/obj/item/device/pda_mod/afterattack(obj/O, mob/user as mob)
	var/new_icon = src.icon_state
	if(istype(O,/obj/item/device/pda) && O.icon_state != new_icon)
		O.desc = src.newdesc
		O.icon = src.icon // just in case we're using custom sprite paths with fluff items.
		O.icon_state = new_icon // Changes the icon without changing the conrents.
		playsound(user.loc, 'sound/items/Screwdriver.ogg', 100, 1)
		user.visible_message("\red [user] replaces \the [O] casing with a new [src].")
		del(src)
	else if(O.icon_state == new_icon)
		user << "<span class='notice'>[O] already has this PDA casing.</span>"
		return
	else
		user << "<span class='warning'>This isn't even a PDA you idiot.</span>"
		return

/obj/item/device/pda_mod/medical
	name = "Medical PDA case"
	icon_state = "pda-m"

/obj/item/device/pda_mod/viro
	name = "Virology PDA case"
	icon_state = "pda-v"

/obj/item/device/pda_mod/engineering
	name = "Engineer PDA case"
	icon_state = "pda-e"

/obj/item/device/pda_mod/security
	name = "Security PDA case"
	icon_state = "pda-s"

/obj/item/device/pda_mod/detective
	name = "Detective PDA case"
	icon_state = "pda-det"

/obj/item/device/pda_mod/warden
	name = "Warden PDA case"
	icon_state = "pda-warden"

/obj/item/device/pda_mod/janitor
	name = "Janitor PDA case"
	icon_state = "pda-j"

/obj/item/device/pda_mod/toxins
	name = "Scientist PDA case"
	icon_state = "pda-tox"

/obj/item/device/pda_mod/clown
	name = "Clown PDA case"
	icon_state = "pda-clown"
	newdesc = "A portable microcomputer by Thinktronic Systems, LTD. The surface is coated with polytetrafluoroethylene and banana drippings."

/obj/item/device/pda_mod/mime
	name = "Mime PDA case"
	icon_state = "pda-mime"

/obj/item/device/pda_mod/heads
	name = "Command PDA case"
	icon_state = "pda-h"

/obj/item/device/pda_mod/heads/hop
	name = "Head of Personnel PDA case"
	icon_state = "pda-hop"

/obj/item/device/pda_mod/heads/hos
	name = "Head of Security PDA case"
	icon_state = "pda-hos"

/obj/item/device/pda_mod/heads/ce
	name = "Chief Engineer PDA case"
	icon_state = "pda-ce"

/obj/item/device/pda_mod/heads/cmo
	name = "Chief Medical Officer PDA case"
	icon_state = "pda-cmo"

/obj/item/device/pda_mod/heads/rd
	name = "Research Director PDA case"
	icon_state = "pda-rd"

/obj/item/device/pda_mod/captain
	name = "Captain Gold PDA case"
	icon_state = "pda-c"

/obj/item/device/pda_mod/cargo
	name = "Cargo PDA case"
	icon_state = "pda-cargo"

/obj/item/device/pda_mod/quartermaster
	name = "Quartermaster PDA case"
	icon_state = "pda-q"

/obj/item/device/pda_mod/shaftminer
	name = "Shaft Miner PDA case"
	icon_state = "pda-miner"

/obj/item/device/pda_mod/syndicate
	name = "Military PDA case"
	icon_state = "pda-syn"

/obj/item/device/pda_mod/chaplain
	name = "Holy PDA case"
	icon_state = "pda-holy"

/obj/item/device/pda_mod/lawyer
	name = "Lawyer PDA case"
	icon_state = "pda-lawyer"

/obj/item/device/pda_mod/botanist
	name = "Botany PDA case"
	icon_state = "pda-hydro"

/obj/item/device/pda_mod/roboticist
	name = "Robotics PDA case"
	icon_state = "pda-robot"

/obj/item/device/pda_mod/librarian
	name = "E-Reader PDA case"
	icon_state = "pda-libb"
	newdesc = "A portable microcomputer by Thinktronic Systems, LTD. This is model is a WGW-11 series e-reader."

/obj/item/device/pda_mod/clear
	name = "Deluxe Special Max Turbo Limited Edition PDA case"
	icon_state = "pda-transp"
	newdesc = "A portable microcomputer by Thinktronic Systems, LTD. This is model is a special edition with a transparent case."

/obj/item/device/pda_mod/chef
	name = "Chef PDA case"
	icon_state = "pda-chef"

/obj/item/device/pda_mod/bar
	name = "Barkeeper PDA case"
	icon_state = "pda-bar"

/obj/item/device/pda_mod/atmos
	name = "Atmospherics PDA case"
	icon_state = "pda-atmo"

/obj/item/device/pda_mod/chemist
	name = "Chemistry PDA case"
	icon_state = "pda-chem"

/obj/item/device/pda_mod/geneticist
	name = "Genetics PDA case"
	icon_state = "pda-gene"

/obj/item/device/pda_mod/tablet
	name = "PDA to Tablet conversion kit"
	icon_state = "pda-libc"
	desc = "A conversion kit to turn your PDA into a clunky oversized tablet! There's really no benefit to this other than being easier to push buttons."
	newdesc = "A portable tablet computer by Thinktronic Systems, LTD. Functionality determined by a preprogrammed ROM cartridge."

// Custom PDAs.
/obj/item/device/pda_mod/fluff/joanrisu
	name = "Custom PDA case"
	icon = 'icons/obj/custom_pda.dmi'
	icon_state = "pda-nut"

/obj/item/device/pda_mod/fluff/kligor
	name = "Custom PDA case"
	icon = 'icons/obj/custom_pda.dmi'
	icon_state = "pda-andy"
	newdesc = "A portable microcomputer by Thinktronic Systems, LTD. For some reason this one has fuzzy kitty ears."

/obj/item/device/pda_mod/fluff/sapphinarose
	name = "Custom PDA case"
	icon = 'icons/obj/custom_pda.dmi'
	icon_state = "pda-SapphinaRose"

/obj/item/device/pda_mod/fluff/vorrarkul
	name = "Custom PDA case"
	icon = 'icons/obj/custom_pda.dmi'
	icon_state = "pda-lucina"
	newdesc = "A portable microcomputer by Thinktronic Systems, LTD. This unique PDA has a plastic rose around the antenna and thorny vine decals across its casing."

/obj/item/device/pda_mod/fluff/warbrand2
	name = "Custom PDA case"
	icon = 'icons/obj/custom_pda.dmi'
	icon_state = "pda-warbrand2"
	newdesc = "A portable microcomputer by Thinktronic Systems, LTD. This PDA has been hacked by its owner to play some retro games like Doom, and has an additional cartrige slot for this purpose."


// Vending machine needs this to work. Kind of a hacky fix, but it works.
/obj/item/weapon/paper/pda_catalog
	name = "Premium PDA case catalog"
	info = {"
			<h2>PDA Case Catalog</h2>
			<ul>
			<li>Medical PDA case</li>
			<li>Virology PDA case</li>
			<li>Engineer PDA case</li>
			<li>Security PDA case</li>
			<li>Detective PDA case</li>
			<li>Warden PDA case</li>
			<li>PDA case</li>
			<li>Scientist PDA case</li>
			<li>Clown PDA case</li>
			<li>Mime PDA case</li>
			<li>Cargo PDA case</li>
			<li>Quartermaster PDA case</li>
			<li>Shaft Miner PDA case</li>
			<li>Holy PDA case</li>
			<li>Lawyer PDA case</li>
			<li>Botany PDA case</li>
			<li>Robotics PDA case</li>
			<li>E-Reader PDA case</li>
			<li>Chef PDA case</li>
			<li>Barkeeper PDA case</li>
			<li>Atmospherics PDA case</li>
			<li>Chemistry PDA case</li>
			<li>Genetics PDA case</li>
			<li>PDA to Tablet conversion kit</li>
			<li>Command PDA case</li>
			<li>Head of Personnel PDA case</li>
			<li>Head of Security PDA case</li>
			<li>Chief Engineer PDA case</li>
			<li>Chief Medical Officer PDA case</li>
			<li>Research Director PDA case</li>
			<li>Captain Gold PDA case</li>
			<li>Deluxe Special Max Turbo Limited Edition PDA case</li>
			</ul>
			"}

/obj/machinery/vending/pda_mods
	name = "PTech Cases"
	desc = "Colorful different cases for PDAs"
	product_slogans = "Carts to go!"
	icon_state = "cart"
	icon_deny = "cart-deny"
	products = list(/obj/item/weapon/paper/pda_catalog = 10,
					/obj/item/device/pda_mod = 10)  // The only reason these are here is because the code breaks if no products are loaded by default.
	contraband = list(/obj/item/device/pda_mod/syndicate = 5)
	premium = list(
				/obj/item/device/pda_mod/medical = 5,
				/obj/item/device/pda_mod/viro = 5,
				/obj/item/device/pda_mod/engineering = 5,
				/obj/item/device/pda_mod/security = 5,
				/obj/item/device/pda_mod/detective = 5,
				/obj/item/device/pda_mod/warden = 5,
				/obj/item/device/pda_mod/janitor = 5,
				/obj/item/device/pda_mod/toxins = 5,
				/obj/item/device/pda_mod/clown = 5,
				/obj/item/device/pda_mod/mime = 5,
				/obj/item/device/pda_mod/cargo = 5,
				/obj/item/device/pda_mod/quartermaster = 5,
				/obj/item/device/pda_mod/shaftminer = 5,
				/obj/item/device/pda_mod/chaplain = 5,
				/obj/item/device/pda_mod/lawyer = 5,
				/obj/item/device/pda_mod/botanist = 5,
				/obj/item/device/pda_mod/roboticist = 5,
				/obj/item/device/pda_mod/librarian = 5,
				/obj/item/device/pda_mod/chef = 5,
				/obj/item/device/pda_mod/bar = 5,
				/obj/item/device/pda_mod/atmos = 5,
				/obj/item/device/pda_mod/chemist = 5,
				/obj/item/device/pda_mod/geneticist = 5,
				/obj/item/device/pda_mod/tablet = 5,
				/obj/item/device/pda_mod/heads = 3,
				/obj/item/device/pda_mod/heads/hop = 3,
				/obj/item/device/pda_mod/heads/hos = 3,
				/obj/item/device/pda_mod/heads/ce = 3,
				/obj/item/device/pda_mod/heads/cmo = 3,
				/obj/item/device/pda_mod/heads/rd = 3,
				/obj/item/device/pda_mod/captain = 2,
				/obj/item/device/pda_mod/clear = 1
			)