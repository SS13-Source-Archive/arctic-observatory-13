/datum/job/leader
	title = "Expedition Leader"
	flag = CAPTAIN
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "Trasen-North Corporation"
	selection_color = "#ffeeff"


	equip(var/mob/living/carbon/human/H)
		if(!H)	return 0
		H.equip_if_possible(new /obj/item/clothing/under/det(H), H.slot_w_uniform)
		H.equip_if_possible(new /obj/item/clothing/shoes/brown(H), H.slot_shoes)
		return 1