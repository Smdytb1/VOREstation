/obj/item/ammo_magazine/a357
	name = "speed loader (.357)"
	icon_state = "38"
	caliber = "357"
	ammo_type = /obj/item/ammo_casing/a357
	matter = list("metal" = 1080) // 1 .357 casing = 180 metal
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_magazine/a357r
	name = "speed loader (.357 wax)"
	icon_state = "38"
	caliber = "357"
	ammo_type = /obj/item/ammo_casing/a357r
	matter = list("metal" = 1080) // 1 .357 casing = 180 metal
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_magazine/c38
	name = "speed loader (.38)"
	icon_state = "38"
	caliber = "38"
	matter = list("metal" = 360)
	ammo_type = /obj/item/ammo_casing/c38
	max_ammo = 6
	multiple_sprites = 1

/obj/item/ammo_magazine/c38/rubber
	name = "speed loader (.38 rubber)"
	ammo_type = /obj/item/ammo_casing/c38r

/obj/item/ammo_magazine/c45m
	name = "magazine (.45)"
	icon_state = "45"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/c45
	matter = list("metal" = 525) //metal costs are very roughly based around 1 .45 casing = 75 metal
	caliber = ".45"
	max_ammo = 7
	multiple_sprites = 1

/obj/item/ammo_magazine/c45m/rubber
	name = "magazine (.45 rubber)"
	ammo_type = /obj/item/ammo_casing/c45r

/obj/item/ammo_magazine/c45m/flash
	name = "magazine (.45 flash)"
	ammo_type = "/obj/item/ammo_casing/c45f"


/obj/item/ammo_magazine/c45uzi
	name = "uzi magazine (.45)"
	icon_state = "uzi45"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/c45
	matter = list("metal" = 525) //metal costs are very roughly based around 1 .45 casing = 75 metal
	caliber = ".45"
	max_ammo = 16
	multiple_sprites = 1

/obj/item/ammo_magazine/c45uzi/rubber
	name = "uzi magazine (.45 rubber)"
	ammo_type = /obj/item/ammo_casing/c45r

/obj/item/ammo_magazine/c45uzi/flash
	name = "uzi magazine (.45 flash)"
	ammo_type = "/obj/item/ammo_casing/c45f"

/obj/item/ammo_magazine/mc9mm
	name = "magazine (9mm)"
	icon_state = "9x19p"
	origin_tech = "combat=2"
	mag_type = MAGAZINE
	matter = list("metal" = 600)
	caliber = "9mm"
	ammo_type = /obj/item/ammo_casing/c9mm
	max_ammo = 8
	multiple_sprites = 1

/obj/item/ammo_magazine/mc9mm/flash
	ammo_type = /obj/item/ammo_casing/c9mmf

/obj/item/ammo_magazine/c9mm
	name = "ammunition box (9mm)"
	icon_state = "9mm"
	origin_tech = "combat=2"
	matter = list("metal" = 1800)
	caliber = "9mm"
	ammo_type = /obj/item/ammo_casing/c9mm
	max_ammo = 30

/obj/item/ammo_magazine/mc9mmt
	name = "top mounted magazine (9mm)"
	icon_state = "9mmt"
	mag_type = MAGAZINE
	ammo_type = /obj/item/ammo_casing/c9mm
	matter = list("metal" = 1200)
	caliber = "9mm"
	max_ammo = 20
	multiple_sprites = 1

/obj/item/ammo_magazine/mc9mmt/rubber
	name = "top mounted magazine (9mm rubber)"
	ammo_type = /obj/item/ammo_casing/c9mmr

/obj/item/ammo_magazine/c45
	name = "ammunition Box (.45)"
	icon_state = "45box"
	origin_tech = "combat=2"
	caliber = ".45"
	matter = list("metal" = 2250)
	ammo_type = /obj/item/ammo_casing/c45
	max_ammo = 30

/obj/item/ammo_magazine/a12mm
	name = "magazine (12mm)"
	icon_state = "12mm"
	origin_tech = "combat=2"
	mag_type = MAGAZINE
	caliber = "12mm"
	matter = list("metal" = 1500)
	ammo_type = "/obj/item/ammo_casing/a12mm"
	max_ammo = 20
	multiple_sprites = 1

// Small capacity.
/obj/item/ammo_magazine/a556
	name = "10 round STANAG magazine (5.56mm)"
	icon_state = "5.56"
	origin_tech = "combat=2"
	mag_type = MAGAZINE
	caliber = "a556"
	matter = list("metal" = 1800)
	ammo_type = /obj/item/ammo_casing/a556
	max_ammo = 10
	multiple_sprites = 1

// Medium capacity.
/obj/item/ammo_magazine/a556/mid
	name = "20 round STANAG magazine (5.56mm)"
	icon_state = "5.56mid"
	origin_tech = "combat=2"
	mag_type = MAGAZINE
	caliber = "a556"
	matter = list("metal" = 3600)
	ammo_type = /obj/item/ammo_casing/a556
	max_ammo = 20
	multiple_sprites = 1

/* // Can't make a good sprite.
// High capacity
/obj/item/ammo_magazine/a556/high
	name = "30 round STANAG magazine (5.56mm)"
	icon_state = "5.56high"
	origin_tech = "combat=3"
	mag_type = MAGAZINE
	caliber = "a556"
	matter = list("metal" = 5400)
	ammo_type = /obj/item/ammo_casing/a556
	max_ammo = 30
	multiple_sprites = 1
*/

/obj/item/ammo_magazine/a50
	name = "magazine (.50)"
	icon_state = "50ae"
	origin_tech = "combat=2"
	mag_type = MAGAZINE
	caliber = ".50"
	matter = list("metal" = 1260)
	ammo_type = /obj/item/ammo_casing/a50
	max_ammo = 7
	multiple_sprites = 1

/obj/item/ammo_magazine/a75
	name = "ammo magazine (20mm)"
	icon_state = "75"
	mag_type = MAGAZINE
	caliber = "75"
	ammo_type = /obj/item/ammo_casing/a75
	multiple_sprites = 1
	max_ammo = 4

/obj/item/ammo_magazine/a762
	name = "magazine box (7.62mm)"
	icon_state = "a762"
	origin_tech = "combat=2"
	mag_type = MAGAZINE
	caliber = "a762"
	matter = list("metal" = 4500)
	ammo_type = /obj/item/ammo_casing/a762
	max_ammo = 50
	multiple_sprites = 1

/obj/item/ammo_magazine/c762
	name = "magazine (7.62mm)"
	icon_state = "c762"
	mag_type = MAGAZINE
	caliber = "a762"
	matter = list("metal" = 1800)
	ammo_type = /obj/item/ammo_casing/a762
	max_ammo = 20
	multiple_sprites = 1

/obj/item/ammo_magazine/chameleon
	name = "magazine (.45)"
	icon_state = "45"
	mag_type = MAGAZINE
	caliber = ".45"
	ammo_type = /obj/item/ammo_casing/chameleon
	max_ammo = 7
	multiple_sprites = 1
	matter = list()

/obj/item/ammo_magazine/c28mm
	name = "pistol magazine (5.7×28mm)"
	icon_state = "45"
	ammo_type = /obj/item/ammo_casing/c28mm
	max_ammo = 10
	multiple_sprites = 1
	mag_type = MAGAZINE
	caliber = "5.7×28mm"

/obj/item/ammo_magazine/p90
	name = "\improper P90 magazine (5.7×28mm)"
	icon_state = "p90"
	ammo_type = /obj/item/ammo_casing/c28mm
	max_ammo = 35
	multiple_sprites = 1
	mag_type = MAGAZINE
	caliber = "5.7×28mm"

/obj/item/ammo_magazine/m14
	name = "10-round magazine (7.62mm)"
	icon_state = "75"
	ammo_type = /obj/item/ammo_casing/a762
	mag_type = MAGAZINE
	multiple_sprites = 1
	max_ammo = 10
	caliber = "a762"

/obj/item/ammo_magazine/m14/large
	name = "20-round magazine (7.62mm)"
	max_ammo = 20

/obj/item/ammo_magazine/a762_clip
	name = "clip (7.62mm)"
	desc = "A clip of 7.62mm rifle rounds."
	icon_state = "762"
	ammo_type = /obj/item/ammo_casing/a762
	max_ammo = 5
	caliber = "a762"
	multiple_sprites = 1

/obj/item/ammo_magazine/a762_clip/chalk
	desc = "A clip of 7.62mm rifle rounds with chalk bullets."
	ammo_type = /obj/item/ammo_casing/a762/chalk

/obj/item/ammo_magazine/a762_clip/blank
	desc = "A clip of 7.62mm rifle rounds with no bullets."
	ammo_type = /obj/item/ammo_casing/a762/blank

/obj/item/ammo_magazine/a762_clip/empty
	initial_ammo = 0

/obj/item/ammo_magazine/a10mmc
	name = "magazine (10mm caseless)"
	icon_state = "M41A_Mag"
	ammo_type = /obj/item/ammo_casing/a10mmc
	mag_type = MAGAZINE
	multiple_sprites = 1
	max_ammo = 40
	caliber = "10mmCaseless"

/obj/item/ammo_magazine/a10mmc/empty
	initial_ammo = 0

/obj/item/ammo_magazine/SVD
	name = "magazine (7.62mm)"
	icon_state = "SVD"
	mag_type = MAGAZINE
	caliber = "a762"
	matter = list("metal" = 900)
	ammo_type = /obj/item/ammo_casing/a762
	max_ammo = 10
	multiple_sprites = 1

/*
//unused garbage

/obj/item/ammo_magazine/a418
	name = "ammo box (.418)"
	icon_state = "418"
	ammo_type = "/obj/item/ammo_casing/a418"
	max_ammo = 7
	multiple_sprites = 1

/obj/item/ammo_magazine/a666
	name = "ammo box (.666)"
	icon_state = "666"
	ammo_type = "/obj/item/ammo_casing/a666"
	max_ammo = 4
	multiple_sprites = 1
*/
