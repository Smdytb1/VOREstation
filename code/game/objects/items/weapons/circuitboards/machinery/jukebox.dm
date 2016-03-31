#ifndef T_BOARD
#error T_BOARD macro is not defined but we need it!
#endif

/obj/item/weapon/circuitboard/jukebox
	name = T_BOARD("jukebox")
	build_path = "/obj/machinery/media/jukebox"
	board_type = "machine"
	origin_tech = "programming=1"
	frame_desc = "Requires 1 Micro Laser, 1 Console Screen, and 5 Wires."
	req_components = list(	"/obj/item/weapon/stock_parts/micro_laser" = 1,
							"/obj/item/weapon/stock_parts/console_screen" = 1,
							"/obj/item/stack/cable_coil" = 5)