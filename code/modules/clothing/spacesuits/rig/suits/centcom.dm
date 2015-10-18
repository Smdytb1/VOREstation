/obj/item/weapon/rig/centcom_noncombat
	name = "centcom non-combat control module"
	suit_type = "centcom non-combat hardsuit"
	desc = "A Nanotrasen powered hardsuit designed for prolonged EVA. This is the version for non-combat CentCom staff."
	icon_state = "ccnoncombat_rig"
	armor = list(melee = 30, bullet = 20, laser = 20, energy = 10, bomb = 30, bio = 100, rad = 30)
	slowdown = 2
	offline_vision_restriction = 1

	helm_type = /obj/item/clothing/head/helmet/space/rig/ert

	allowed = list(/obj/item/device/flashlight,/obj/item/device/suit_cooling_unit,)

	req_access = null
	req_one_access = null