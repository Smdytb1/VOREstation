/obj/item/ammo_casing/a357
	desc = "A .357 bullet casing."
	caliber = "357"
	projectile_type = /obj/item/projectile/bullet/pistol/strong

/obj/item/ammo_casing/a357r
	desc = "A wax .357 bullet casing." // It's wax but it's basically an archaic rubber round. Named for consistency.
	caliber = "357"
	projectile_type = /obj/item/projectile/bullet/pistol/rubber

/obj/item/ammo_casing/a50
	desc = "A .50AE bullet casing."
	caliber = ".50"
	projectile_type = /obj/item/projectile/bullet/pistol/strong

/obj/item/ammo_casing/a75
	desc = "A 20mm bullet casing."
	caliber = "75"
	projectile_type = /obj/item/projectile/bullet/gyro

/obj/item/ammo_casing/c28mm
	desc = "A 5.7×28mm bullet casing."
	caliber = "5.7×28mm"
	projectile_type = /obj/item/projectile/bullet/pistol/medium

/obj/item/ammo_casing/c38
	desc = "A .38 bullet casing."
	caliber = "38"
	projectile_type = /obj/item/projectile/bullet/pistol

/obj/item/ammo_casing/c38r
	desc = "A .38 rubber bullet casing."
	icon_state = "r-casing"
	caliber = "38"
	projectile_type = /obj/item/projectile/bullet/pistol/rubber

/obj/item/ammo_casing/c9mm
	desc = "A 9mm bullet casing."
	caliber = "9mm"
	projectile_type = /obj/item/projectile/bullet/pistol

/obj/item/ammo_casing/c9mmf
	desc = "A 9mm flash shell casing."
	icon_state = "r-casing"
	caliber = "9mm"
	projectile_type = /obj/item/projectile/energy/flash



/obj/item/ammo_casing/c9mmr
	desc = "A 9mm rubber bullet casing."
	icon_state = "r-casing"
	caliber = "9mm"
	projectile_type = /obj/item/projectile/bullet/pistol/rubber


/obj/item/ammo_casing/c45
	desc = "A .45 bullet casing."
	caliber = ".45"
	projectile_type = /obj/item/projectile/bullet/pistol/medium

/obj/item/ammo_casing/c45r
	desc = "A .45 rubber bullet casing."
	icon_state = "r-casing"
	caliber = ".45"
	projectile_type = /obj/item/projectile/bullet/pistol/rubber

/obj/item/ammo_casing/c45f
	desc = "A .45 flash shell casing."
	icon_state = "r-casing"
	caliber = ".45"
	projectile_type = /obj/item/projectile/energy/flash

/obj/item/ammo_casing/a12mm
	desc = "A 12mm bullet casing."
	caliber = "12mm"
	projectile_type = /obj/item/projectile/bullet/pistol/medium


/obj/item/ammo_casing/shotgun
	name = "shotgun slug"
	desc = "A 12 gauge slug."
	icon_state = "slshell"
	caliber = "shotgun"
	projectile_type = /obj/item/projectile/bullet/shotgun
	matter = list("metal" = 360)

/obj/item/ammo_casing/shotgun/pellet
	name = "shotgun shell"
	desc = "A 12 gauge shell."
	icon_state = "gshell"
	projectile_type = /obj/item/projectile/bullet/pellet/shotgun
	matter = list("metal" = 360)

/obj/item/ammo_casing/shotgun/blank
	name = "shotgun shell"
	desc = "A blank shell."
	icon_state = "blshell"
	projectile_type = /obj/item/projectile/bullet/blank
	matter = list("metal" = 90)

/obj/item/ammo_casing/shotgun/beanbag
	name = "beanbag shell"
	desc = "A beanbag shell."
	icon_state = "bshell"
	projectile_type = /obj/item/projectile/bullet/shotgun/beanbag
	matter = list("metal" = 180)

//Can stun in one hit if aimed at the head, but
//is blocked by clothing that stops tasers and is vulnerable to EMP
/obj/item/ammo_casing/shotgun/stunshell
	name = "stun shell"
	desc = "A 12 gauge taser cartridge."
	icon_state = "stunshell"
	projectile_type = /obj/item/projectile/energy/electrode/stunshot
	matter = list("metal" = 360, "glass" = 720)

/obj/item/ammo_casing/shotgun/stunshell/emp_act(severity)
	if(prob(100/severity)) BB = null
	update_icon()

//Does not stun, only blinds, but has area of effect.
/obj/item/ammo_casing/shotgun/flash
	name = "flash shell"
	desc = "A chemical shell used to signal distress or provide illumination."
	icon_state = "fshell"
	projectile_type = /obj/item/projectile/energy/flash/flare
	matter = list("metal" = 90, "glass" = 90)

/obj/item/ammo_casing/a762
	desc = "A 7.62mm bullet casing."
	icon_state = "762-casing"
	caliber = "a762"
	projectile_type = /obj/item/projectile/bullet/rifle/a762

/obj/item/ammo_casing/a762/blank
	name = "A 7.62mm blank round casing"
	desc = "A blank casing for rifles."
	projectile_type = /obj/item/projectile/bullet/blank

/obj/item/ammo_casing/a762/chalk
	name = "A 7.62mm chalk bullet casing"
	desc = "A round with a chalk bullet instead of metal. Good for target practice and warning shots."
	projectile_type = /obj/item/projectile/bullet/rifle/chalk

/obj/item/ammo_casing/a145
	name = "shell casing"
	desc = "A 14.5mm shell."
	icon_state = "lcasing"
	caliber = "14.5mm"
	w_class = 2
	projectile_type = /obj/item/projectile/bullet/rifle/a145
	matter = list("metal" = 1250)

/obj/item/ammo_casing/a556
	desc = "A 5.56mm bullet casing."
	caliber = "a556"
	projectile_type = /obj/item/projectile/bullet/rifle/a556

/obj/item/ammo_casing/rocket
	name = "rocket propelled grenade"
	desc = "A high explosive designed to be fired from a launcher."
	icon_state = "rocketshell"
	w_class = 3 // YOU SEE IVAN, ROCKET SHOULD NOT FIT BEHIND EARS. -Ace
	projectile_type = /obj/item/missile
	caliber = "rocket"

/obj/item/ammo_casing/chameleon
	name = "chameleon bullets"
	desc = "A set of bullets for the Chameleon Gun."
	projectile_type = /obj/item/projectile/bullet/chameleon
	caliber = ".45"

/obj/item/ammo_casing/a10mmc
	desc = "A 10mm bullet enclosed in a block of solid propellant."
	caliber = "10mmCaseless"
	caseless = 1
	projectile_type = /obj/item/projectile/bullet/pistol/medium

/*
/obj/item/ammo_casing/a418
	desc = "A .418 bullet casing."
	caliber = "357"
	projectile_type = /obj/item/projectile/bullet/suffocationbullet

/obj/item/ammo_casing/a666
	desc = "A .666 bullet casing."
	caliber = "357"
	projectile_type = /obj/item/projectile/bullet/cyanideround
*/