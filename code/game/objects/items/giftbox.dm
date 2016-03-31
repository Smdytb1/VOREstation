/obj/item/mysteryBox
	name = "Mystery Box"
	desc = "What's in the box?"
	icon = 'icons/obj/storage.dmi'
	icon_state = "deliverycrate4"
	item_state = "table_parts"
	w_class = 4

	attack_self(mob/user as mob)
		// Another way of doing this. Commented out because the other method is better for this application.
		/*var/spawn_chance = rand(1,100)
		switch(spawn_chance)
			if(0 to 49)
				new /obj/random/gun/guarenteed(usr.loc)
				usr << "You got a thing!"
			if(50 to 99)
				new /obj/item/weapon/bikehorn/rubberducky(usr.loc)
				new /obj/item/weapon/bikehorn(usr.loc)
				usr << "You got two things!"
			if(100)
				usr << "The box contained nothing!"
				return
		*/
		var/loot = pick(/obj/item/weapon/book/manual/engineering_hacking,
						/obj/item/weapon/cloaking_device,
						/obj/item/device/chameleon,
						/obj/item/weapon/contraband/poster,
						/obj/item/weapon/banhammer,
						/obj/item/seeds/ambrosiadeusseed,
						/obj/item/seeds/ambrosiavulgarisseed,
						/obj/item/seeds/libertymycelium,
						/obj/item/xenos_claw,
						/obj/item/stack/sheet/animalhide/xeno,
						/obj/item/weapon/reagent_containers/food/snacks/xenomeat,
						/obj/item/weapon/reagent_containers/food/snacks/clownstears,
						/obj/item/weapon/reagent_containers/food/snacks/carpmeat,
						/obj/item/clothing/glasses/thermal/monocle,
						/obj/item/clothing/gloves/combat,
						/obj/item/clothing/head/bearpelt,
						/obj/item/clothing/mask/balaclava,
						/obj/item/clothing/mask/smokable/cigarette/cigar/havana
						/obj/item/clothing/mask/horsehead,
						/obj/item/clothing/mask/muzzle,
						/obj/item/weapon/storage/toolbox/syndicate,
						/obj/item/weapon/stamp/CentCom
						/obj/item/weapon/storage/bible/booze,
						/obj/item/weapon/pen/paralysis,
						/obj/item/weapon/scythe,
						/obj/item/weapon/weldpack,
						/obj/item/weapon/silencer,
						/obj/item/weapon/grenade/flashbang/clusterbang,
						/obj/item/weapon/storage/pill_bottle/zoom,
						/obj/item/weapon/storage/pill_bottle/happy,
						/obj/item/weapon/reagent_containers/food/drinks/bottle/pwine,
						/obj/item/weapon/reagent_containers/glass/beaker/neurotoxin,
						/obj/item/weapon/reagent_containers/food/snacks/mysterysoup,
						/obj/item/weapon/grenade/flashbang/clusterbang,
						/obj/item/weapon/grenade/spawnergrenade/spesscarp,
						/obj/item/weapon/card/emag,
						/obj/item/weapon/card/emag_broken,
						/obj/item/device/pda/syndicate,
						/obj/item/weapon/shield/energy,
						/obj/item/weapon/melee/energy/sword,
						/obj/item/weapon/twohanded/dualsaber,
						/obj/item/weapon/melee/telebaton,
						/obj/item/weapon/melee/classic_baton,
						/obj/item/clothing/suit/armor/heavy,
						/obj/item/clothing/suit/armor/vest,
						/obj/item/clothing/suit/armor/laserproof,
						/obj/random/weapon/guarenteed,
						/obj/effect/landmark/costume,
						/obj/item/mecha_parts/chassis/phazon,
						/obj/item/mecha_parts/part/phazon_torso,
						/obj/item/mecha_parts/part/phazon_head,
						/obj/item/mecha_parts/part/phazon_left_arm,
						/obj/item/mecha_parts/part/phazon_right_arm,
						/obj/item/mecha_parts/part/phazon_left_leg,
						/obj/item/mecha_parts/part/phazon_right_leg,
						/obj/item/weapon/reagent_containers/hypospray/autoinjector/shrink)
		new loot(usr.loc)
		usr << "You unwrap the box."
		del(src)