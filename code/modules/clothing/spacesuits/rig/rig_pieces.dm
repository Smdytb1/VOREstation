/*
 * Defines the helmets, gloves and shoes for rigs.
 */

/obj/item/clothing/head/helmet/space/rig
	name = "helmet"
	flags = HEADCOVERSEYES | BLOCKHAIR | HEADCOVERSMOUTH | THICKMATERIAL
	flags_inv = 		 HIDEEARS|HIDEEYES|HIDEFACE
	body_parts_covered = HEAD|FACE|EYES
	heat_protection =    HEAD|FACE|EYES
	cold_protection =    HEAD|FACE|EYES
	brightness_on = 4
	sprite_sheets = list("Tajara" = 'icons/mob/species/tajaran/helmet.dmi', "Sergal" = 'icons/mob/species/sergal/helmet.dmi',"Skrell" = 'icons/mob/species/skrell/helmet.dmi',"Unathi" = 'icons/mob/species/unathi/helmet.dmi',"Akula" = 'icons/mob/species/akula/helmet.dmi',"Nevrean" = 'icons/mob/species/nevrean/helmet.dmi') //Temporary suits. You only need to update the .dmi files in their respective folders.
	species_restricted = null

/obj/item/clothing/gloves/rig
	name = "gauntlets"
	flags = THICKMATERIAL
	body_parts_covered = HANDS
	heat_protection =    HANDS
	cold_protection =    HANDS
	species_restricted = null
	gender = PLURAL

/obj/item/clothing/shoes/magboots/rig
	name = "boots"
	cold_protection = FEET
	heat_protection = FEET
	species_restricted = null
	gender = PLURAL
	icon_base = null

/obj/item/clothing/suit/space/rig
	name = "chestpiece"
	allowed = list(/obj/item/device/flashlight,/obj/item/weapon/tank,/obj/item/device/suit_cooling_unit,/obj/item/weapon/storage/backpack) // ToDo: Add a compact backpack for rigsuits.
	body_parts_covered = UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	heat_protection =    UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	cold_protection =    UPPER_TORSO|LOWER_TORSO|LEGS|ARMS
	flags_inv =          HIDEJUMPSUIT|HIDETAIL
	flags =              STOPPRESSUREDAMAGE | THICKMATERIAL | AIRTIGHT
	slowdown = 0
	//will reach 10 breach damage after 25 laser carbine blasts, 3 revolver hits, or ~1 PTR hit. Completely immune to smg or sts hits.
	breach_threshold = 38
	resilience = 0.2
	can_breach = 1
	sprite_sheets = list("Tajara" = 'icons/mob/species/tajaran/suit.dmi',"Unathi" = 'icons/mob/species/unathi/suit.dmi', "Sergal" = 'icons/mob/species/sergal/suit.dmi',"Akula" = 'icons/mob/species/akula/suit.dmi',"Nevrean" = 'icons/mob/species/nevrean/suit.dmi') //Temporary suits. I found it weird that skrells didn't have chestpieces in the original
	supporting_limbs = list()

//TODO: move this to modules
/obj/item/clothing/head/helmet/space/rig/proc/prevent_track()
	return 0

/obj/item/clothing/gloves/rig/Touch(var/atom/A, var/proximity)

	if(!A || !proximity)
		return 0

	var/mob/living/carbon/human/H = loc
	if(!istype(H) || !H.back)
		return 0

	var/obj/item/weapon/rig/suit = H.back
	if(!suit || !istype(suit) || !suit.installed_modules.len)
		return 0

	for(var/obj/item/rig_module/module in suit.installed_modules)
		if(module.active && module.activates_on_touch)
			if(module.engage(A))
				return 1

	return 0
