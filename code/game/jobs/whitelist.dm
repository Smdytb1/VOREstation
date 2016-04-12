#define WHITELISTFILE "data/whitelist.txt"

// Original 'job whitelist', old style (for exec jobs).
var/list/whitelist = list()

/hook/startup/proc/loadWhitelist()
	if(config.usewhitelist)
		load_whitelist()
	return 1

/proc/load_whitelist()
	whitelist = file2list(WHITELISTFILE)
	if(!whitelist.len)	whitelist = null

/proc/check_whitelist(mob/M /*, var/rank*/)
	if(!whitelist)
		return 0
	return ("[M.ckey]" in whitelist)

// New 'job whitelist' for flagged jobs.
/var/list/job_whitelist = list()

/hook/startup/proc/loadJobWhitelist()
	if(config.usejobwhitelist)
		load_jobwhitelist()
	return 1

/proc/load_jobwhitelist()
	var/text = file2text("config/jobwhitelist.txt")
	if (!text)
		log_misc("Failed to load config/jobwhitelist.txt")
	else
		job_whitelist = text2list(text, "\n")

/proc/is_job_whitelisted(mob/M, var/job)
	if(!config.usejobwhitelist)
		return 1
	if(check_rights(R_ADMIN, 0))
		return 1
	if(!job_whitelist)
		return 0
	if(M && job)
		for (var/s in job_whitelist)
			if(findtext(s,"[M.ckey] - [job]"))
				return 1
			if(findtext(s,"[M.ckey] - All"))
				return 1
	return 0

// Alien whitelist for flagged species.
/var/list/alien_whitelist = list()

/hook/startup/proc/loadAlienWhitelist()
	if(config.usealienwhitelist)
		load_alienwhitelist()
	return 1

/proc/load_alienwhitelist()
	var/text = file2text("config/alienwhitelist.txt")
	if (!text)
		log_misc("Failed to load config/alienwhitelist.txt")
	else
		alien_whitelist = text2list(text, "\n")

/proc/is_alien_whitelisted(mob/M, var/species)
	if(!config.usealienwhitelist)
		return 1

	/* This is done in preferences.dm, where it checks the flags on the species, why have this?
	if(species in whitelisted_species)
		M << "DEBUG: Species isn't in global list."
		return 1
	*/

	if(check_rights(R_ADMIN, 0))
		return 1
	if(!alien_whitelist)
		return 0
	if(M && species)
		for (var/s in alien_whitelist)
			if(findtext(s,"[M.ckey] - [species]"))
				return 1
			if(findtext(s,"[M.ckey] - All"))
				return 1
	return 0

#undef WHITELISTFILE
