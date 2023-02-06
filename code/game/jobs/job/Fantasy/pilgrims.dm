/datum/job/artificer
	title = "Artificer"
	department_flag = PIL
	social_class = SOCIAL_CLASS_MIN
	total_positions = 1
	spawn_positions = 1
	supervisors = "rock n stone"
	selection_color = "#848484"
	outfit_type = /decl/hierarchy/outfit/job/penitent
	latejoin_at_spawnpoints = TRUE
	announced = FALSE

/decl/hierarchy/outfit/job/artificer
	name = OUTFIT_JOB_NAME("Artificer")
	uniform = /obj/item/clothing/under/rank/victorian/redbl
	suit = /obj/item/clothing/suit/innapron
	id_type = /obj/item/card/id/pilgrim/innkeeper
	pda_type = /obj/item/device/pda/penitent
	back = /obj/item/storage/backpack/satchel/warfare
	neck = /obj/item/reagent_containers/food/drinks/canteen
	head = /obj/item/clothing/head/bardhat
	l_ear = /obj/item/device/radio/headset/headset_service
	r_ear = null
	pda_slot = null
	shoes = /obj/item/clothing/shoes/vigilante
	suit_store = /obj/item/gun/projectile/shotgun/pump/voxlegis
	backpack_contents = list(
	/obj/item/ammo_box/shotgun/stunshell = 1,
	/obj/item/ammo_box/shotgun = 1,
	/obj/item/stack/thrones = 1,
	/obj/item/stack/thrones2 = 1,
	/obj/item/stack/thrones3/twenty = 1,
)