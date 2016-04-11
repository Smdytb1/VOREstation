/datum/job/centcom_observer
	title = "CentCom Observer"
	flag = CCOBSERVER
	department_flag = UNIQUE
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "NanoTrasen Central Command"
	selection_color = "#c6f1ff"
	idtype = /obj/item/weapon/card/id/centcom
	//access = get_all_accesses() + get_centcom_access("Human Affairs Representative")
	//minimal_access = get_all_accesses() + get_centcom_access("Human Affairs Representative")
	alt_titles = list("NT Impartial Observer")
	job_whitelisted = 1

	New()
		..()
		access = get_all_accesses() + get_centcom_access("Human Affairs Representative")
		minimal_access = get_all_accesses() + get_centcom_access("Human Affairs Representative")

	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_to_slot_or_del(new /obj/item/device/radio/headset/ert(H), slot_l_ear)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/centcom_officer(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/clothing/gloves/white(H), slot_gloves)
		H.equip_to_slot_or_del(new /obj/item/device/pda/clear(H), slot_belt)
		H.equip_to_slot_or_del(new /obj/item/weapon/pen/blue(H), slot_r_store)
		H.equip_to_slot_or_del(new /obj/item/weapon/pen/red(H), slot_l_store)
		H.equip_to_slot_or_del(new /obj/item/weapon/clipboard(H), slot_l_hand)
		H.equip_to_slot_or_del(new /obj/item/weapon/paper(H), slot_r_hand)
		switch(H.backbag)
			if(1) H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H), slot_r_hand)
			if(2) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack(H), slot_back)
			if(3) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
			if(4) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H.back), slot_in_backpack)
		return 1

