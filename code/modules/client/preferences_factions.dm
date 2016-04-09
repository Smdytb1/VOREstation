var/global/list/seen_citizenships = list()
var/global/list/seen_systems = list()
var/global/list/seen_factions = list()
var/global/list/seen_religions = list()

//Commenting this out for now until I work the lists it into the event generator/journalist/chaplain.
/proc/UpdateFactionList(mob/living/carbon/human/M)
	/*if(M && M.client && M.client.prefs)
		seen_citizenships |= M.client.prefs.citizenship
		seen_systems      |= M.client.prefs.home_system
		seen_factions     |= M.client.prefs.faction
		seen_religions    |= M.client.prefs.religion*/
	return

var/global/list/citizenship_choices = list( // Planets
	"Earth",
	"Mars",
	"Titan",
	"Europa",
	"Ahdomai",
	"Moghes",
	"Qerr'balak",
	"Eltus",
	"Tal",
	"Virgo-Prime",
	"Other"
	)

var/global/list/home_system_choices = list( // Star systems
	"Virgo-Erigone",
	"Epsilon Ursae Majoris",
	"Qerr'Vallis",
	"S'randarr",
	"Sol",
	"Tau Ceti",
	"Uueoa-Esa",
	"Vilous",
	"Other"
	)

var/global/list/faction_choices = list(
	"NanoTrasen Systems Inc.",
	"3rd Union of Soviet Socialist Republics",
	"Aether Atmospherics",
	"Einstein Engines",
	"Free Trade Union",
	"Gilthari Exports",
	"Grayson Manufactories Ltd.",
	"Hesphaistos Industries",
	"Sol Central",
	"Vey Med",
	"Ward-Takahashi GMB",
	"United Federation",
	"Zeng-Hu Pharmaceuticals"
	)

var/global/list/religion_choices = list(
	"Agnostic",
	"Atheist",
	"Buddhist",
	"Christian",
	"Deist",
	"Hindu",
	"Islamic",
	"Pagan",
	"Pastafarian",
	"Unitarian",
	"Other"
	)