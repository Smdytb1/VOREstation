//
//	Implementation of Absorption
//	Ck~ (Also, credit to Aronai.)
//

/datum/belly/absorbed
	belly_type = "Absorbed"
	belly_name = "absorbed"
	inside_flavor = "There is nothing interesting about this person's body."

/datum/belly/absorbed/get_examine_msg(t_He, t_his, t_him, t_has, t_is)
	if (internal_contents.len)
		return "[t_He] has an uncanny looking body.\n"

/datum/belly/absorbed/toggle_digestion()
	digest_mode = input("Absorption Mode") in list("Hold")
	switch (digest_mode)
		if("Hold")
			owner << "<span class='notice'>You will now harmlessly hold people.</span>"