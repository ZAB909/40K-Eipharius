// THIS IS FOR JOB ORDER IN OCCUPATION !

/datum/map/fantasy
	allowed_jobs = list(
	/datum/job/prince,
	/datum/job/scion,
	/datum/job/sigmarpriest,
	/datum/job/morrspriest,
	/datum/job/hedge,
	/datum/job/gatekeeper,
	/datum/job/freecompany,
	/datum/job/physician,
	/datum/job/magister,
	/datum/job/apprentice,
	/datum/job/burgher,
	/datum/job/dockhand,
	/datum/job/knight,
	/datum/job/squire,
	/datum/job/witchhunter,
	/datum/job/adventurer,
	/datum/job/brigand,
	/datum/job/artificer,
	/datum/job/ironbreaker,
	/datum/job/miner,
	/datum/job/chieftain,
	/datum/job/stormvermin,
	/datum/job/warlock,
	/datum/job/clawleader,
	/datum/job/clanrat,
	/datum/job/prophet,
	/datum/job/sbigun,
	/datum/job/sork,
	/datum/job/ngobbo,
	)

/mob/living/carbon/human/proc/warfare_language_shit(var/language_name) //reworked from matts original intention, the default language is gothic, this will allow you to now add a faction specific language.
	if(aspect_chosen(/datum/aspect/one_word))
		return
	remove_language(LANGUAGE_GALCOM)
	add_language(language_name)
