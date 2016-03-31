#ifndef T_BOARD
#error T_BOARD macro is not defined but we need it!
#endif

/obj/item/weapon/circuitboard/microwave
	name = T_BOARD("microwave")
	build_path = "/obj/machinery/microwave"
	contain_parts = 0
	board_type = "machine"
	origin_tech = "programming=1;magnets=2"
	req_components = list(
							"/obj/item/weapon/stock_parts/micro_laser" = 1,
							"/obj/item/weapon/stock_parts/matter_bin" = 1,
							"/obj/item/stack/cable_coil" = 2,
							"/obj/item/weapon/stock_parts/console_screen" = 1)

/obj/item/weapon/circuitboard/gibber
	name = T_BOARD("gibber")
	build_path = "/obj/machinery/gibber"
	contain_parts = 0
	board_type = "machine"
	origin_tech = "programming=1;materials=2"
	req_components = list(
							"/obj/item/weapon/stock_parts/matter_bin" = 1,
							"/obj/item/weapon/stock_parts/manipulator" = 1)

/obj/item/weapon/circuitboard/smartfridge
	name = T_BOARD("smartfridge")
	build_path = "/obj/machinery/smartfridge"
	contain_parts = 0
	board_type = "machine"
	origin_tech = "programming=1;magnets=2;engineering=2"
	req_components = list(
							"/obj/item/weapon/stock_parts/matter_bin" = 1,
							"/obj/item/weapon/stock_parts/manipulator" = 1)

/obj/item/weapon/circuitboard/smartfridge/attackby(var/obj/item/I, var/mob/user)
	if(istype(I, /obj/item/weapon/screwdriver))
		var/list/fridges = list( "/obj/machinery/smartfridge" = "default",
								 "/obj/machinery/smartfridge/seeds" = "seeds",
								 "/obj/machinery/smartfridge/drinks" = "drinks",
								 "/obj/machinery/smartfridge/secure/medbay" = "medicine",
								 "/obj/machinery/smartfridge/secure/extract" = "slimes",
								 "/obj/machinery/smartfridge/secure/virology" = "viruses")

		var/position = fridges.Find(build_path, fridges)
		position = (position == fridges.len) ? 1 : (position + 1)
		build_path = fridges[position]
		user << "<span class='notice'>You set the board to [fridges[build_path]].</span>"
