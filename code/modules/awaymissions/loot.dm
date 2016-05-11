/obj/effect/spawner/lootdrop
	icon = 'icons/mob/screen1.dmi'
	icon_state = "x2"
	var/lootcount = 1		//how many items will be spawned
	var/lootdoubles = 0		//if the same item can be spawned twice
	var/loot = ""			//a list of possible items to spawn- a string of paths

/obj/effect/spawner/lootdrop/initialize()
	var/list/things = params2list(loot)

	if(things && things.len)
		for(var/i = lootcount, i > 0, i--)
			if(!things.len)
				return

			var/loot_spawn = pick(things)
			var/loot_path = text2path(loot_spawn)

			if(!loot_path || !lootdoubles)
				things.Remove(loot_spawn)
				continue

			new loot_path(get_turf(src))
	del(src)

// Legacy version. Need to investigate what the hell the one above does later. -Ace
/obj/effect/landmark/loot_spawn
	name = "loot spawner"
	icon_state = "grabbed1"
	var/live_cargo = 1 // So you can turn off aliens.
	var/low_probability = 0
	var/spawned_faction = "hostile" // Spawned mobs can have their faction changed.
	New()

		switch(pick( \
		low_probability * 1000;"nothing", \
		200 - low_probability * 175;"treasure", \
		25 + low_probability * 75;"remains", \
		5; "blob", \
		50 + low_probability * 50;"clothes", \
		"glasses", \
		100 - low_probability * 50;"weapons", \
		100 - low_probability * 50;"spacesuit", \
		"health", \
		25 + low_probability * 75;"snacks", \
		25;"alien", \
		"lights", \
		25 - low_probability * 25;"engineering", \
		25 - low_probability * 25;"coffin", \
		25;"mimic", \
		25;"viscerator", \
		))
			if("treasure")
				var/obj/structure/closet/crate/C = new(src.loc)
				if(prob(33))
					// Smuggled goodies.
					new /obj/item/mysteryBox(C)

				if(prob(33))
					//coins
					var/amount = rand(2,6)
					var/list/possible_spawns = list()
					for(var/coin_type in typesof(/obj/item/weapon/coin))
						possible_spawns += coin_type
					var/coin_type = pick(possible_spawns)
					for(var/i=0,i<amount,i++)
						new coin_type(C)

				else if(prob(50))
					//bars
					var/amount = rand(2,6)
					var/quantity = rand(10,50)
					var/list/possible_spawns = list()
					for(var/bar_type in typesof(/obj/item/stack/sheet/mineral) - /obj/item/stack/sheet/mineral)
						possible_spawns += bar_type

					var/bar_type = pick(possible_spawns)
					for(var/i=0,i<amount,i++)
						var/obj/item/stack/sheet/mineral/M = new bar_type(C)
						M.amount = quantity
				else
					//credits
					var/amount = rand(2,6)
					var/list/possible_spawns = list()
					for(var/cash_type in typesof(/obj/item/stack/sheet/mineral))
						possible_spawns += cash_type

					var/cash_type = pick(possible_spawns)
					for(var/i=0,i<amount,i++)
						new cash_type(C)
			if("remains")
				if(prob(50))
					new /obj/effect/decal/remains/human(src.loc)
				else if(prob(50))
					new /obj/effect/decal/remains/mouse(src.loc)
				else
					new /obj/effect/decal/remains/xeno(src.loc)
			if("blob")
				new /obj/effect/blob/core(src.loc)
			if("clothes")
				var/obj/structure/closet/C = new(src.loc)
				C.icon_state = "blue"
				C.icon_closed = "blue"
				if(prob(33))
					new /obj/item/clothing/under/rainbow(C)
					new /obj/item/clothing/shoes/rainbow(C)
					new /obj/item/clothing/head/soft/rainbow(C)
					new /obj/item/clothing/gloves/rainbow(C)
				else if(prob(50))
					new /obj/item/clothing/under/chameleon(C)
				else
					new /obj/item/clothing/under/syndicate/combat(C)
					new /obj/item/clothing/shoes/swat(C)
					new /obj/item/clothing/gloves/swat(C)
					new /obj/item/clothing/mask/balaclava(C)
			if("glasses")
				var/obj/structure/closet/C = new(src.loc)
				var/new_type = pick(
				/obj/item/clothing/glasses/material,\
				/obj/item/clothing/glasses/thermal,\
				/obj/item/clothing/glasses/meson,\
				/obj/item/clothing/glasses/night,\
				/obj/item/clothing/glasses/hud/health)
				new new_type(C)
			if("weapons")
				var/obj/structure/closet/crate/secure/weapon/C = new(src.loc)
				if(prob(50))
					var/new_gun = pick( // Copied from Random.dm
						prob(11);/obj/item/weapon/gun/energy/laser,\
						prob(10);/obj/item/weapon/twohanded/spear,\
						prob(10);/obj/item/weapon/gun/energy/stunrevolver,\
						prob(10);/obj/item/weapon/gun/energy/taser,\
						prob(10);/obj/item/weapon/gun/launcher/crossbow,\
						prob(10);/obj/item/weapon/gun/projectile/shotgun/doublebarrel,\
						prob(10);/obj/item/weapon/kitchenknife,\
						prob(10);/obj/item/weapon/kitchenknife/tacknife,\
						prob(10);/obj/item/weapon/kitchenknife/tacknife/unathiknife,\
						prob(10);/obj/item/weapon/butterfly,\
						prob(10);/obj/item/weapon/butterfly/switchblade,\
						prob(10);/obj/item/weapon/gun/projectile/hl2_pistol,\
						prob(10);/obj/item/weapon/gun/projectile/luger,\
						prob(10);/obj/item/weapon/gun/projectile/pipegun,\
						prob(10);/obj/item/weapon/gun/projectile/revolver,\
						prob(10);/obj/item/weapon/gun/projectile/revolver/detective,\
						prob(10);/obj/item/weapon/gun/projectile/revolver/mateba,\
						prob(10);/obj/item/weapon/gun/projectile/revolver/shotgun,\
						prob(11);/obj/item/weapon/gun/projectile/sec,\
						prob(10);/obj/item/weapon/gun/projectile/sec/wood,\
						prob(10);/obj/item/weapon/gun/projectile/shotgun/pump,\
						prob(10);/obj/item/weapon/gun/projectile/shotgun/pump/rifle,\
						prob(10);/obj/item/weapon/gun/projectile/shotgun/pump/rifle/mosin,\
						prob(10);/obj/item/weapon/melee/baton,\
						prob(10);/obj/item/weapon/melee/telebaton,\
						prob(10);/obj/item/weapon/melee/classic_baton,\
						prob(10);/obj/item/weapon/scythe,\
						prob(10);/obj/item/weapon/twohanded/baseballbat,\
						prob(10);/obj/item/weapon/twohanded/baseballbat/metal,\
						prob(9);/obj/item/weapon/gun/projectile/automatic/wt550/syndicate,\
						prob(9);/obj/item/weapon/gun/projectile/revolver/derringer,\
						prob(9);/obj/item/weapon/gun/energy/crossbow/largecrossbow,\
						prob(9);/obj/item/weapon/gun/projectile/automatic/mini_uzi,\
						prob(9);/obj/item/weapon/gun/projectile/fiveseven,\
						prob(9);/obj/item/weapon/gun/projectile/pistol,\
						prob(9);/obj/item/weapon/gun/projectile/shotgun/pump/combat,\
						prob(9);/obj/item/weapon/gun/projectile/hl2_pistol/silenced,\
						prob(9);/obj/item/weapon/twohanded/fireaxe,\
						prob(9);/obj/item/weapon/katana,\
						prob(9);/obj/item/weapon/claymore,\
						prob(9);/obj/item/weapon/kitchenknife/ritual,\
						prob(9);/obj/item/weapon/cane/concealed,\
						prob(9);/obj/item/weapon/gun/energy/gun,\
						prob(8);/obj/item/weapon/gun/energy/ionrifle,\
						prob(8);/obj/item/weapon/gun/energy/lasercannon,\
						prob(8);/obj/item/weapon/gun/energy/retro,\
						prob(8);/obj/item/weapon/gun/energy/gun/eluger,\
						prob(8);/obj/item/weapon/gun/energy/xray,\
						prob(8);/obj/item/weapon/gun/projectile/automatic/c20r,\
						prob(8);/obj/item/weapon/gun/projectile/automatic/stg,\
						prob(8);/obj/item/weapon/melee/energy/sword,\
						prob(8);/obj/item/weapon/gun/projectile/automatic/m41a,\
						prob(7);/obj/item/weapon/gun/energy/captain,\
						prob(7);/obj/item/weapon/gun/energy/gun/nuclear,\
						prob(7);/obj/item/weapon/gun/energy/sniperrifle,\
						prob(7);/obj/item/weapon/gun/projectile/automatic/p90,\
						prob(7);/obj/item/weapon/gun/projectile/automatic/shotgun,\
						prob(7);/obj/item/weapon/gun/projectile/automatic/battlerifle,\
						prob(7);/obj/item/weapon/gun/projectile/automatic/sts35,\
						prob(7);/obj/item/weapon/gun/projectile/automatic/z8,\
						prob(7);/obj/item/weapon/gun/projectile/shotgun/pump/unsc,\
						prob(7);/obj/item/weapon/gun/projectile/deagle,\
						prob(7);/obj/item/weapon/gun/launcher/grenade,\
						prob(6);/obj/item/weapon/gun/projectile/SVD,\
						prob(6);/obj/item/weapon/gun/projectile/automatic/l6_saw,\
						prob(5);/obj/item/weapon/gun/energy/pulse_rifle,\
						prob(3);/obj/item/weapon/gun/projectile/deagle/camo,\
						prob(2);/obj/item/weapon/gun/projectile/deagle/gold,\
						prob(1);/obj/item/weapon/gun/launcher/rocket,\
						prob(1);/obj/item/weapon/gun/projectile/gyropistol,\
						prob(1);/obj/item/weapon/gun/projectile/heavysniper,\
						prob(1);/obj/item/weapon/plastique)
					new new_gun(C)
				if(prob(50))
					var/new_ammo = pick( // Copied from Random.dm
						prob(5);/obj/item/weapon/storage/fancy/shotgun_ammo/beanbag,\
						prob(5);/obj/item/weapon/storage/fancy/shotgun_ammo/pellet,\
						prob(5);/obj/item/weapon/storage/fancy/shotgun_ammo/flash,\
						prob(5);/obj/item/weapon/storage/fancy/shotgun_ammo/slug,\
						prob(5);/obj/item/ammo_magazine/a357,\
						prob(5);/obj/item/ammo_magazine/a762_clip,\
						prob(5);/obj/item/ammo_magazine/c45m,\
						prob(5);/obj/item/ammo_magazine/c45m/rubber,\
						prob(5);/obj/item/ammo_magazine/c38,\
						prob(5);/obj/item/ammo_magazine/c38/rubber,\
						prob(5);/obj/item/weapon/storage/box/flashbangs,\
						prob(4);/obj/item/ammo_magazine/c45,\
						prob(4);/obj/item/ammo_magazine/c9mm,\
						prob(4);/obj/item/ammo_magazine/mc9mm,\
						prob(4);/obj/item/ammo_magazine/mc9mmt,\
						prob(4);/obj/item/ammo_magazine/mc9mmt/rubber,\
						prob(4);/obj/item/ammo_magazine/c28mm,\
						prob(4);/obj/item/ammo_magazine/c45uzi,\
						prob(4);/obj/item/ammo_magazine/c45uzi/rubber,\
						prob(4);/obj/item/ammo_magazine/a10mmc,\
						prob(4);/obj/item/ammo_magazine/p90,\
						prob(4);/obj/item/ammo_magazine/m14,\
						prob(4);/obj/item/ammo_magazine/m14/large,\
						prob(4);/obj/item/ammo_magazine/c762,\
						prob(4);/obj/item/ammo_magazine/a556,\
						prob(4);/obj/item/ammo_magazine/a556/mid,\
						prob(4);/obj/item/ammo_magazine/a12mm,\
						prob(3);/obj/item/ammo_magazine/stg,\
						prob(3);/obj/item/ammo_magazine/a762,\
						prob(3);/obj/item/ammo_magazine/SVD,\
						prob(3);/obj/item/ammo_magazine/a50,\
						prob(3);/obj/item/weapon/storage/box/emps,\
						prob(2);/obj/item/ammo_magazine/battlerifle,\
						prob(1);/obj/item/ammo_casing/rocket,\
						prob(1);/obj/item/weapon/storage/box/sniperammo)
					new new_ammo(C)
			if("spacesuit")
				var/obj/structure/closet/syndicate/C = new(src.loc)
				if(prob(25))
					new /obj/item/clothing/suit/space/syndicate/black(C)
					new /obj/item/clothing/head/helmet/space/syndicate/black(C)
					new /obj/item/weapon/tank/oxygen/red(C)
					new /obj/item/clothing/mask/breath(C)
				else if(prob(33))
					new /obj/item/clothing/suit/space/syndicate/blue(C)
					new /obj/item/clothing/head/helmet/space/syndicate/blue(C)
					new /obj/item/weapon/tank/oxygen/red(C)
					new /obj/item/clothing/mask/breath(C)
				else if(prob(50))
					new /obj/item/clothing/suit/space/syndicate/green(C)
					new /obj/item/clothing/head/helmet/space/syndicate/green(C)
					new /obj/item/weapon/tank/oxygen/red(C)
					new /obj/item/clothing/mask/breath(C)
				else
					new /obj/item/clothing/suit/space/syndicate/orange(C)
					new /obj/item/clothing/head/helmet/space/syndicate/orange(C)
					new /obj/item/weapon/tank/oxygen/red(C)
					new /obj/item/clothing/mask/breath(C)
			if("health")
				//hopefully won't be necessary, but there were an awful lot of traps to get through...
				var/obj/structure/closet/crate/medical/C = new(src.loc)
				if(prob(50))
					new /obj/item/weapon/storage/firstaid/regular(C)
				if(prob(50))
					new /obj/item/weapon/storage/firstaid/fire(C)
				if(prob(50))
					new /obj/item/weapon/storage/firstaid/o2(C)
				if(prob(50))
					new /obj/item/weapon/storage/firstaid/toxin(C)
				if(prob(25))
					new /obj/item/weapon/storage/firstaid/combat(C)
				if(prob(25))
					new /obj/item/weapon/storage/firstaid/adv(C)
			if("snacks")
				//you're come so far, you must be in need of refreshment
				var/obj/structure/closet/crate/freezer/C = new(src.loc)
				var/num = rand(2,6)
				var/new_type = pick(
				/obj/item/weapon/reagent_containers/food/drinks/cans/beer, \
				/obj/item/weapon/reagent_containers/food/drinks/tea, \
				/obj/item/weapon/reagent_containers/food/drinks/dry_ramen, \
				/obj/item/weapon/reagent_containers/food/snacks/candiedapple, \
				/obj/item/weapon/reagent_containers/food/snacks/chocolatebar, \
				/obj/item/weapon/reagent_containers/food/snacks/cookie, \
				/obj/item/weapon/reagent_containers/food/snacks/meatball, \
				/obj/item/weapon/reagent_containers/food/snacks/plump_pie)
				for(var/i=0,i<num,i++)
					new new_type(C)
			if("alien")
				//ancient aliens
				var/obj/structure/closet/acloset/C = new(src.loc)
				if(prob(33))
					if(live_cargo) // Facehuggers!
						var/num = rand(1,3)
						for(var/i=0,i<num,i++)
							new /obj/item/clothing/mask/facehugger(C)
					else // Just a hat.
						new /obj/item/clothing/head/collectable/slime(C)
				else if(prob(50))
					if(live_cargo) // Something else very much alive and angry.
						var/spawn_type = pick(/mob/living/simple_animal/hostile/vore/alien, /mob/living/simple_animal/hostile/vore/alien/drone, /mob/living/simple_animal/hostile/vore/alien/sentinel)
						new spawn_type(C)
					else // Just a costume.
						new /obj/item/clothing/head/xenos(C)
						new /obj/item/clothing/suit/xenos(C)

				//33% chance of nothing

			if("lights")
				//flares, candles, matches
				var/obj/structure/closet/crate/secure/gear/C = new(src.loc)
				var/num = rand(2,6)
				for(var/i=0,i<num,i++)
					var/spawn_type = pick(/obj/item/device/flashlight/flare, /obj/item/weapon/flame/candle, /obj/item/weapon/storage/box/matches)
					new spawn_type(C)
			if("engineering")
				var/obj/structure/closet/crate/secure/gear/C = new(src.loc)

				//chance to have any combination of up to two electrical/mechanical toolboxes and one cell
				if(prob(33))
					new /obj/item/weapon/storage/toolbox/electrical(C)
				else if(prob(50))
					new /obj/item/weapon/storage/toolbox/mechanical(C)

				if(prob(33))
					new /obj/item/weapon/storage/toolbox/mechanical(C)
				else if(prob(50))
					new /obj/item/weapon/storage/toolbox/electrical(C)

				if(prob(25))
					new /obj/item/weapon/cell(C)

			if("coffin")
				new /obj/structure/closet/coffin(src.loc)
				if(prob(33))
					new /obj/effect/decal/remains/human(src)
				else if(prob(50))
					new /obj/effect/decal/remains/xeno(src)
			if("mimic")
				//a guardian of the tomb!
				var/mob/living/simple_animal/hostile/vore/mimic/crate/mimic = new(src.loc)
				mimic.faction = spawned_faction
			if("viscerator")
				//more tomb guardians!
				var/num = rand(1,3)
				var/obj/structure/closet/crate/secure/gear/C = new(src.loc)
				for(var/i=0,i<num,i++)
					new /mob/living/simple_animal/hostile/viscerator(C)

		del(src)

/obj/effect/landmark/loot_spawn/low
	name = "low prob loot spawner"
	icon_state = "grabbed"
	low_probability = 1