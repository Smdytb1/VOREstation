/obj/item/weapon/rig/fluff/zeke_sturm

	name = "CHIMERA control module"
	suit_type = "chimera hardsuit"
	desc = "A hardsuit designed for the Containment of Hazardous Influences, Managing Emergencies, and Researching Anomalies. It appears to have been heavily personalized by its owner."
	icon_state = "chimera_rig"
	armor = list(melee = 15, bullet = 15, laser = 80, energy = 80, bomb = 60, bio = 100, rad = 100)
	slowdown = 1
	offline_vision_restriction = 1

	helm_type = /obj/item/clothing/head/helmet/space/rig/ert

	allowed = list(/obj/item/device/flashlight,/obj/item/weapon/tank,/obj/item/device/suit_cooling_unit,/obj/item/stack/flag,/obj/item/weapon/storage/box/excavation,/obj/item/weapon/pickaxe,/obj/item/device/healthanalyzer,/obj/item/device/measuring_tape,/obj/item/device/ano_scanner,/obj/item/device/depth_scanner,/obj/item/device/core_sampler,/obj/item/device/gps,/obj/item/device/beacon_locator,/obj/item/device/radio/beacon,/obj/item/weapon/pickaxe/hand,/obj/item/weapon/storage/bag/fossils,/obj/item/weapon/storage/backpack)

	req_access = list(access_rd)

	initial_modules = list(
		/obj/item/rig_module/ai_container,
		/obj/item/rig_module/maneuvering_jets,
		/obj/item/rig_module/device/anomaly_scanner
		)