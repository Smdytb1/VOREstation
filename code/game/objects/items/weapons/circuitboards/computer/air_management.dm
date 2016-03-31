#ifndef T_BOARD
#error T_BOARD macro is not defined but we need it!
#endif

/obj/item/weapon/circuitboard/air_management
	name = T_BOARD("atmosphere monitoring console")
	build_path = /obj/machinery/computer/general_air_control
	var/frequency = 1439
	var/list/sensors = list()

/obj/item/weapon/circuitboard/air_management/tank_control
	name = T_BOARD("tank control")
	build_path = /obj/machinery/computer/general_air_control/large_tank_control
	frequency = 1441
/obj/item/weapon/circuitboard/air_management/supermatter_core
	name = T_BOARD("core control")
	build_path = /obj/machinery/computer/general_air_control/supermatter_core
	frequency = 1438
/obj/item/weapon/circuitboard/air_management/injector_control
	name = T_BOARD("injector control")
	build_path = /obj/machinery/computer/general_air_control/fuel_injection

/obj/item/weapon/circuitboard/air_management/construct(var/obj/machinery/computer/general_air_control/C)
	if (..(C))
		C.set_frequency(frequency)
		C.sensors = sensors

/obj/item/weapon/circuitboard/air_management/deconstruct(var/obj/machinery/computer/general_air_control/C)
	if (..(C))
		frequency = C.frequency
		sensors = C.sensors.Copy()

/obj/item/weapon/circuitboard/air_management/attackby(var/obj/I, var/mob/user)
	if(istype(I, /obj/item/device/multitool))
		var/obj/item/device/multitool/MT = I
		if (MT.link_buffer && istype(MT.link_buffer, /obj/machinery/air_sensor))
			var/obj/machinery/air_sensor/sensor = MT.link_buffer
			playsound(src.loc, 'sound/items/Screwdriver2.ogg', 50, 1)
			frequency = sensor.frequency
			sensors[sensor.id_tag] = sensor.name
			user << "\blue Copied link data from multitool. Frequency set to [format_frequency(sensor.frequency)] and [sensor] added to the sensor list."
			return 1
	else
		return ..()

/obj/item/weapon/circuitboard/air_management/examine(mob/user)
	if(..(user, 1))
		user << "Dip switches show the frequency is set to [format_frequency(frequency)]"
