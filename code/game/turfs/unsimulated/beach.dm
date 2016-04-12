/turf/unsimulated/beach
	name = "Beach"
	icon = 'icons/misc/beach.dmi'

/turf/unsimulated/beach/sand
	name = "Sand"
	icon_state = "sand"

/turf/unsimulated/beach/sand/New()
	var/palmchance = rand(1,100)
	if(palmchance >= 1 && palmchance <= 10)
		new /obj/effect/overlay/palmtree_r(loc)
	if(palmchance >= 11 && palmchance <= 20)
		new /obj/effect/overlay/palmtree_l(loc)
	if(palmchance >= 21 && palmchance <= 25)
		new /obj/effect/overlay/coconut(loc)
	if(palmchance == 100) // Tourists like to litter. :(
		var/trash = pick(/obj/item/trash/raisins, /obj/item/trash/candy, /obj/item/trash/cheesie, /obj/item/trash/chips,
						/obj/item/trash/popcorn, /obj/item/trash/sosjerky, /obj/item/trash/syndi_cakes, /obj/item/trash/plate,
						/obj/item/trash/pistachios, /obj/item/trash/semki, /obj/item/trash/tray, /obj/item/trash/liquidfood,
						/obj/item/trash/tastybread, /obj/item/trash/snack_bowl)
		new trash(loc)

/turf/unsimulated/beach/coastline
	name = "Coastline"
	icon = 'icons/misc/beach2.dmi'
	icon_state = "sandwater"

/turf/unsimulated/beach/water
	name = "Water"
	icon_state = "water"

/turf/unsimulated/beach/water/New()
	..()
	overlays += image("icon"='icons/misc/beach.dmi',"icon_state"="water2","layer"=MOB_LAYER+0.1)
