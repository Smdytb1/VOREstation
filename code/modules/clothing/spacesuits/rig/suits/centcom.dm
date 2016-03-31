/obj/item/weapon/rig/centcom_noncombat
	name = "centcom non-combat control module"
	suit_type = "centcom non-combat hardsuit"
	desc = "A Nanotrasen powered hardsuit designed for prolonged EVA. This is the version for non-combat CentCom staff."
	icon_state = "ccnoncombat_rig"
	armor = list(melee = 30, bullet = 20, laser = 20, energy = 10, bomb = 30, bio = 100, rad = 30)
	slowdown = 2
	offline_vision_restriction = 1

	helm_type = /obj/item/clothing/head/helmet/space/rig/ert

	allowed = list(/obj/item/device/flashlight,/obj/item/device/suit_cooling_unit)

	req_access = list(access_cent_general)

/obj/item/weapon/rig/ccmed_rig
	name = "centcom medrig module"
	suit_type = "centcom medrig"
	desc = "A Nanotrasen-designed rigsuit designed for regional/centcom medical staff."
	icon_state = "ccmed_rig"
	armor = list(melee = 30, bullet = 20, laser = 20, energy = 60, bomb = 30, bio = 100, rad = 100)
	slowdown = 1
	offline_vision_restriction = 1

	allowed = list(/obj/item/device/flashlight,/obj/item/device/suit_cooling_unit,/obj/item/weapon/storage/backpack,/obj/item/roller,/obj/item/weapon/storage/firstaid)

	req_access = list(access_cent_general)

	initial_modules = list(
		/obj/item/rig_module/chem_dispenser/injector,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/healthscanner
	)
