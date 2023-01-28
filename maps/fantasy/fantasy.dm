#if !defined(using_map_DATUM)
	#include "warhammer_areas.dm"
	#include "warhammer_unit_testing.dm"
	#include "jobs/warhammer_jobs.dm"
	#include "../shared/items/clothing.dm"
	#include "../shared/items/cards_ids.dm"

	#include "fantasy-1-underground.dmm"
	#include "fantasy-2-surface.dmm"

	#include "../../code/modules/lobby_music/generic_songs.dm"

	#define using_map_DATUM /datum/map/fantasy

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Example

#endif
