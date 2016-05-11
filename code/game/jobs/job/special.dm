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
	//access = list() // See New() below.
	//minimal_access = list() // See New() below.
	alt_titles = list("NT Impartial Observer")
	job_whitelisted = 1

	New() // Work-around for getting all access plus Human Affairs access at CentCom. The original code wasn't meant to do this.
		..()
		access = get_all_accesses() + get_centcom_access("Human Affairs Representative")
		minimal_access = get_all_accesses() + get_centcom_access("Human Affairs Representative")

	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_to_slot_or_del(new /obj/item/device/radio/headset/ert(H), slot_l_ear)
		H.equip_to_slot_or_del(new /obj/item/clothing/under/rank/centcom(H), slot_w_uniform)
		H.equip_to_slot_or_del(new /obj/item/clothing/head/beret/centcom/officer(H), slot_head)
		H.equip_to_slot_or_del(new /obj/item/clothing/shoes/laceup(H), slot_shoes)
		H.equip_to_slot_or_del(new /obj/item/clothing/gloves/white(H), slot_gloves)
		H.equip_to_slot_or_del(new /obj/item/device/pda/clear(H), slot_belt)
		H.equip_to_slot_or_del(new /obj/item/weapon/pen/blue(H), slot_r_store)
		H.equip_to_slot_or_del(new /obj/item/weapon/pen/red(H), slot_l_store)
		switch(H.backbag)
			if(1) H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H), slot_r_hand)
			if(2) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack(H), slot_back)
			if(3) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
			if(4) H.equip_to_slot_or_del(new /obj/item/weapon/storage/backpack/satchel(H), slot_back)
		H.equip_to_slot_or_del(new /obj/item/weapon/storage/box/survival(H.back), slot_in_backpack)
		if(H.backbag == 1)
			H.equip_to_slot_or_del(new /obj/item/weapon/clipboard(H), slot_r_hand)
			H.equip_to_slot_or_del(new /obj/item/weapon/stamp/CentCom(H), slot_l_hand)
		else
			H.equip_to_slot_or_del(new /obj/item/weapon/clipboard(H.back), slot_in_backpack)
			H.equip_to_slot_or_del(new /obj/item/weapon/stamp/CentCom(H), slot_in_backpack)

		H.implant_loyalty()
		return 1