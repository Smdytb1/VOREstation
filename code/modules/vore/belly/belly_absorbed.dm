//
//	Implementation of Absorption
//	Ck~ (Also, credit to Aronai.)
//

/datum/belly/absorbed
	belly_type = "Absorbed"
	belly_name = "absorbed"
	inside_flavor = "There is nothing interesting about this person's body."

/datum/belly/absorbed/toggle_digestion()
	digest_mode = input("Absorption Mode") in list("Hold")
	switch (digest_mode)
		if("Hold")
			owner << "<span class='notice'>You will now harmlessly hold people.</span>"