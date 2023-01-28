
/datum/map/fantasy
	name = "Border Princes"
	full_name = "Border Princes"
	path = "fantasy"
	station_name  = "Border Prince's Principality of Heldenstadt"
	station_short = "Border Princes"
	dock_name     = "Border Princes"
	boss_name     = "The Empire"
	boss_short    = "Empire"
	company_name  = "The Empire"
	company_short = "The Empire"
	system_name = "The Old World"

	lobby_icon = 'maps/fantasy/fullscreen.dmi'
	lobby_screens = list("lobby1","lobby2","lobby3")

	station_levels = list(1,2,3,4)
	contact_levels = list(1,2,3,4)
	player_levels = list(1,2,3,4)

	allowed_spawns = list("Arrivals Shuttle")
	base_turf_by_z = list("1" = /turf/simulated/floor/dirty, "2" = /turf/simulated/floor/dirty, "3" = /turf/simulated/floor/dirty,"4" = /turf/simulated/floor/dirty)
	shuttle_docked_message = "The slipstream has been opened."
	shuttle_leaving_dock = "The slipstream is closing."
	shuttle_called_message = "A requested slipstream is being opened."
	shuttle_recall_message = "The slipstream opening has been aborted"
	emergency_shuttle_docked_message = "The emergency escape shuttle has docked."
	emergency_shuttle_leaving_dock = "The emergency escape shuttle has departed from %dock_name%."
	emergency_shuttle_called_message = "An emergency escape shuttle has been sent."
	emergency_shuttle_recall_message = "The emergency shuttle has been recalled"
	map_lore = "The Prince has left the free city of Marienburg with their Free Company Mercenaries to take over the Principality of Heldenstadt, and has been governing the thriving port city, growing fat in wealth. More immigrants from Brettonia and the Empire visit to make a new life for themselves every day. Even a pilgrimage of Brettonian Knights have called his humble domain home. But all is not at ease, as the Empire has dispatched a witch hunter to keep watch. The Greenskins have seen the large influx of newcomers as well, itchin' for a fight. Weird furred, tailed creatures lurk in the shadows, too big to be a cat..."

/*

//Overriding event containers to remove random events.
/datum/event_container/mundane
	available_events = list(
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars1",/datum/event/mortar,100),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars2",/datum/event/mortar,100),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars3",/datum/event/mortar,100),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars4",/datum/event/mortar,100)
		)

/datum/event_container/moderate
	available_events = list(
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars1",/datum/event/mortar,100),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars2",/datum/event/mortar,100),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars3",/datum/event/mortar,100),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars4",/datum/event/mortar,100)
	)

/datum/event_container/major
	available_events = list(
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars1",/datum/event/mortar,100),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars2",/datum/event/mortar,100),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars3",/datum/event/mortar,100),
		new /datum/event_meta(EVENT_LEVEL_MUNDANE, "Mortars4",/datum/event/mortar,100)
	)

*/