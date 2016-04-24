//
//	The belly object is what holds onto a mob while they're inside a predator.
//	It takes care of altering the pred's decription, digesting the prey, relaying struggles etc.
//	It is not, however, for printing messages about entering/exiting the belly. That is done in voretype etc.
//

/*
belly_prefs["name"] = STRING
belly_prefs["digest_mode"] = CONSTANT (see belly.dm)
belly_prefs["digest_modes"] = LIST
belly_prefs["inside_flavor"] = STRING
belly_prefs["vore_sound"] = FILE
belly_prefs["vore_verb"] = STRING
belly_prefs["human_prey_swallow_time"] = INTEGER
belly_prefs["nonhuman_prey_swallow_time"] = INTEGER
belly_prefs["digest_brute"] = INTEGER
belly_prefs["digest_burn"] = INTEGER
belly_prefs["digest_tickrate"] = INTEGER
belly_prefs["immutable"] = BOOLEAN
*/

#define DM_HOLD "Hold"
#define DM_DIGEST "Digest"
#define DM_HEAL "Heal"
#define DM_ABSORB "Absorb"

#define VORE_STRUGGLE_EMOTE_CHANCE 40

/**
* Parent type of all the various "belly" varieties.
*/
/datum/belly
	var/name								// Name of this location
	var/list/digest_modes = list(DM_HOLD,DM_DIGEST)	// Possible digest modes
	var/inside_flavor						// Flavor text description of inside sight/sound/smells/feels.
	var/vore_sound = 'sound/vore/gulp.ogg'	// Sound when ingesting someone
	var/vore_verb = "ingest"				// Verb for eating with this in messages
	var/human_prey_swallow_time = 100		// Time in deciseconds to swallow /mob/living/carbon/human
	var/nonhuman_prey_swallow_time = 30		// Time in deciseconds to swallow anything else
	var/digest_brute = 2					// Brute damage per tick in digestion mode
	var/digest_burn = 3						// Burn damage per tick in digestion mode
	var/digest_tickrate = 3					// Modulus this of air controller tick number to iterate gurgles on
	var/immutable = 0						// Prevents this belly from being deleted

	var/tmp/digest_mode = DM_HOLD				// Whether or not to digest. Default to not digest.
	var/tmp/mob/living/owner					// The mob whose belly this is.
	var/tmp/list/internal_contents = list()		// People/Things you've eaten into this belly!
	var/tmp/is_full								// Flag for if digested remeans are present. (for disposal messages)
	var/tmp/recent_struggle = 0					// Flag to prevent struggle emote spam

// Constructor that sets the owning mob
// @Override
/datum/belly/New(var/mob/living/owning_mob)
	owner = owning_mob

// Toggle digestion on/off and notify user of the new setting.
// If multiple digestion modes are avaliable (i.e. unbirth) then user should be prompted.
/datum/belly/proc/toggle_digestion()
	return

// Checks if any mobs are present inside the belly
// @return True if the belly is empty.
/datum/belly/proc/is_empty()
	return internal_contents.len == 0

// Release all contents of this belly into the owning mob's location.
// If that location is another mob, contents are transferred into whichever of its bellies the owning mob is in.
// Returns the number of mobs so released.
/datum/belly/proc/release_all_contents()
	var/tick = 0 //easiest way to check if the list has anything
	for (var/atom/movable/M in internal_contents)
		M.loc = owner.loc  // Move the belly contents into the same location as belly's owner.
		src.internal_contents -= M  // Remove from the belly contents

		if (iscarbon(owner.loc)) // This makes sure that the mob behaves properly if released into another mob
			var/mob/living/carbon/loc_mob = owner.loc
			for (var/bellytype in loc_mob.vore_organs)
				var/datum/belly/belly = loc_mob.vore_organs[bellytype]
				if (owner in belly.internal_contents)
					belly.internal_contents += M
		tick++
	return tick

// Release a specific atom from the contents of this belly into the owning mob's location.
// If that location is another mob, the atom is transferred into whichever of its bellies the owning mob is in.
// Returns the number of atoms so released.
/datum/belly/proc/release_specific_contents(var/atom/movable/M)
	if (!(M in internal_contents))
		return 0 // They weren't in this belly anyway
	M.loc = owner.loc  // Move the belly contents into the same location as belly's owner.
	src.internal_contents -= M  // Remove from the belly contents

	if (iscarbon(owner.loc)) // This makes sure that the mob behaves properly if released into another mob
		var/mob/living/carbon/loc_mob = owner.loc
		for (var/bellytype in loc_mob.vore_organs)
			var/datum/belly/belly = loc_mob.vore_organs[bellytype]
			if (owner in belly.internal_contents)
				belly.internal_contents += M
	return 1

// Actually perform the mechanics of devouring the tasty prey.
// The purpose of this method is to avoid duplicate code, and ensure that all necessary
// steps are taken.
// @param prey Mob to be eaten
// @param user Optional: 3rd party is the one making this happen.
/datum/belly/proc/nom_mob(var/mob/prey, var/mob/user = null)
	// Unbuckle the mob
	if (prey.buckled)
		prey.buckled.unbuckle_mob()

	// Actually put the prey where they belong.
	prey.loc = owner
	internal_contents += prey

// Process the predator's effects upon the contents of its belly (i.e digestion/transformation etc)
// Called from /mob/living/carbon/human/Life() proc.
// Default implementation does nothing!
/datum/belly/proc/process_Life()
	return

// Get the line that should show up in Examine message if the owner of this belly
// is examined.   By making this a proc, we not only take advantage of polymorphism,
// but can easily make the message vary based on how many people are inside, etc.
// Returns a string which shoul be appended to the Examine output.
/datum/belly/proc/get_examine_msg(t_He, t_his, t_him, t_has, t_is)
	return

// Relay the sounds of someone struggling in a belly to those outside!
// Called from /mob/living/carbon/relaymove()
/datum/belly/proc/relay_struggle(var/mob/user, var/direction)
	return

// Handle the death of a mob via digestion.
// Called from the process_Life() methods of bellies that digest prey.
// Default implementation calls M.death() and removes from internal contents.
// Indigestable items are removed, and M is deleted.
/datum/belly/proc/digestion_death(var/mob/living/M)
	is_full = 1
	M.death(1)
	internal_contents -= M

	// If digested prey is also a pred... anyone inside their bellies gets moved up.
	if (is_vore_predator(M))
		var/vore/pred_capable/P = M
		for (var/bellytype in P.vore_organs)
			var/datum/belly/belly = P.vore_organs[bellytype]
			for (var/obj/SubPrey in belly.internal_contents)
				SubPrey.loc = src.owner
				internal_contents += SubPrey
				if (istype(SubPrey, /mob))
					SubPrey << "As [M] melts away around you, you find yourself in [src.owner]'s [name]"
					// TODO - If SubPrey is digestable, tell them its their turn to die horribly

	//Drop all items into the belly.
	if (config.items_survive_digestion)
		for (var/obj/item/W in M)
			_handle_digested_item(W)

	// Delete the digested mob
	del(M)

// Recursive method - To recursively scan thru someone's inventory for digestable/indigestable.
/datum/belly/proc/_handle_digested_item(var/obj/item/W)
	// PDA's are handled specially in order to get the ID out of them.
	if (istype(W, /obj/item/device/pda))
		var/obj/item/device/pda/PDA = W
		if (PDA.id)
			W = PDA.id
			PDA.id = null
			del(PDA)

	if (istype(W, /obj/item/weapon/card/id))
		// Keep IDs around, but destroy them!
		var/obj/item/weapon/card/id/ID = W
		ID.desc = "A partially digested card that has seen better days.  Much of it's data has been destroyed."
		ID.icon_state = "digested"
		ID.access = list() // No access
		ID.loc = src.owner
		internal_contents += ID
	else if (!_is_digestable(W))
		W.loc = src.owner
		internal_contents += W
	else
		for (var/obj/item/SubItem in W)
			_handle_digested_item(SubItem)
		del(W)

/datum/belly/proc/_is_digestable(var/obj/item/I)
	for (var/T in important_items)
		if(istype(I, T))
			return 0
	return 1
