/mob/living/carbon/human/proc/monkeyize()
	if (transforming)
		return
	for(var/obj/item/W in src)
		if (W==w_uniform) // will be torn
			continue
		drop_from_inventory(W)
	regenerate_icons()
	transforming = 1
	canmove = 0
	stunned = 1
	icon = null
	set_invisibility(101)
	for(var/t in organs)
		qdel(t)
	var/atom/movable/overlay/animation = new /atom/movable/overlay( loc )
	animation.icon_state = "blank"
	animation.icon = 'icons/mob/mob.dmi'
	animation.master = src
	flick("h2monkey", animation)
	sleep(48)
	//animation = null

	transforming = 0
	stunned = 0
	update_canmove()
	set_invisibility(initial(invisibility))

	if(!species.primitive_form) //If the creature in question has no primitive set, this is going to be messy.
		gib()
		return

	for(var/obj/item/W in src)
		drop_from_inventory(W)
	set_species(species.primitive_form)
	dna.SetSEState(GLOB.MONKEYBLOCK,1)
	dna.SetSEValueRange(GLOB.MONKEYBLOCK,0xDAC, 0xFFF)

	to_chat(src, "<B>You are now [species.name]. </B>")
	qdel(animation)

	return src

/mob/new_player/AIize()
	spawning = 1
	return ..()

/mob/living/carbon/human/AIize(move=1) // 'move' argument needs defining here too because BYOND is dumb
	if (transforming)
		return
	for(var/t in organs)
		qdel(t)
	QDEL_NULL_LIST(worn_underwear)
	return ..(move)

/mob/living/carbon/AIize()
	if (transforming)
		return
	for(var/obj/item/W in src)
		drop_from_inventory(W)
	transforming = 1
	canmove = 0
	icon = null
	set_invisibility(101)
	return ..()

/mob/proc/AIize(move=1)
	if(client)
		sound_to(src, sound(null, repeat = 0, wait = 0, volume = 85, channel = 1))// stop the jams for AIs


	var/mob/living/silicon/ai/O = new (loc, GLOB.using_map.default_law_type,,1)//No MMI but safety is in effect.
	O.set_invisibility(0)
	O.aiRestorePowerRoutine = 0
	if(mind)
		mind.transfer_to(O)
		O.mind.original = O
	else
		O.key = key

	if(move)
		var/obj/loc_landmark
		for(var/obj/effect/landmark/start/sloc in landmarks_list)
			if (sloc.name != "AI")
				continue
			if ((locate(/mob/living) in sloc.loc) || (locate(/obj/structure/AIcore) in sloc.loc))
				continue
			loc_landmark = sloc
		if (!loc_landmark)
			for(var/obj/effect/landmark/tripai in landmarks_list)
				if (tripai.name == "tripai")
					if((locate(/mob/living) in tripai.loc) || (locate(/obj/structure/AIcore) in tripai.loc))
						continue
					loc_landmark = tripai
		if (!loc_landmark)
			to_chat(O, "Oh god sorry we can't find an unoccupied AI spawn location, so we're spawning you on top of someone.")
			for(var/obj/effect/landmark/start/sloc in landmarks_list)
				if (sloc.name == "AI")
					loc_landmark = sloc
		O.forceMove(loc_landmark.loc)
		O.on_mob_init()

	O.add_ai_verbs()

	O.rename_self("ai",1)
	spawn(0)	// Mobs still instantly del themselves, thus we need to spawn or O will never be returned
		qdel(src)
	return O

//human -> robot
/mob/living/carbon/human/proc/Robotize()
	if (transforming)
		return
	QDEL_NULL_LIST(worn_underwear)
	for(var/obj/item/W in src)
		drop_from_inventory(W)
	regenerate_icons()
	transforming = 1
	canmove = 0
	icon = null
	set_invisibility(101)
	for(var/t in organs)
		qdel(t)

	var/mob/living/silicon/robot/O = new /mob/living/silicon/robot( loc )

	O.gender = gender
	O.set_invisibility(0)

	if(mind)		//TODO
		mind.transfer_to(O)
		if(O.mind.assigned_role == "Cyborg")
			O.mind.original = O
		else if(mind && mind.special_role)
			O.mind.store_memory("In case you look at this after being borged, the objectives are only here until I find a way to make them not show up for you, as I can't simply delete them without screwing up round-end reporting. --NeoFite")
	else
		O.key = key

	O.loc = loc
	O.job = "Cyborg"
	if(O.mind.assigned_role == "Cyborg")
		if(O.mind.role_alt_title == "Android")
			O.mmi = new /obj/item/organ/internal/posibrain(O)
		else if(O.mind.role_alt_title == "Robot")
			O.mmi = new /obj/item/device/mmi/digital/robot(O)
		else
			O.mmi = new /obj/item/device/mmi(O)

		O.mmi.transfer_identity(src)

	callHook("borgify", list(O))
	O.Namepick()

	spawn(0)	// Mobs still instantly del themselves, thus we need to spawn or O will never be returned
		qdel(src)
	return O

/mob/living/carbon/human/proc/corgize()
	if (transforming)
		return
	for(var/obj/item/W in src)
		drop_from_inventory(W)
	regenerate_icons()
	transforming = 1
	canmove = 0
	icon = null
	set_invisibility(101)
	for(var/t in organs)	//this really should not be necessary
		qdel(t)

	var/mob/living/simple_animal/corgi/new_corgi = new /mob/living/simple_animal/corgi (loc)
	new_corgi.a_intent = I_HURT
	new_corgi.key = key

	to_chat(new_corgi, "<B>You are now a Corgi. Yap Yap!</B>")
	qdel(src)
	return

/mob/living/carbon/human/Animalize()

	var/list/mobtypes = typesof(/mob/living/simple_animal)
	var/mobpath = input("Which type of mob should [src] turn into?", "Choose a type") in mobtypes

	if(!safe_animal(mobpath))
		to_chat(usr, "<span class='warning'>Sorry but this mob type is currently unavailable.</span>")
		return

	if(transforming)
		return
	for(var/obj/item/W in src)
		drop_from_inventory(W)

	regenerate_icons()
	transforming = 1
	canmove = 0
	icon = null
	set_invisibility(101)

	for(var/t in organs)
		qdel(t)

	var/mob/new_mob = new mobpath(src.loc)

	new_mob.key = key
	new_mob.a_intent = I_HURT


	to_chat(new_mob, "You suddenly feel more... animalistic.")
	spawn()
		qdel(src)
	return

/mob/proc/Animalize()

	var/list/mobtypes = typesof(/mob/living/simple_animal)
	var/mobpath = input("Which type of mob should [src] turn into?", "Choose a type") in mobtypes

	if(!safe_animal(mobpath))
		to_chat(usr, "<span class='warning'>Sorry but this mob type is currently unavailable.</span>")
		return

	var/mob/new_mob = new mobpath(src.loc)

	new_mob.key = key
	new_mob.a_intent = I_HURT
	to_chat(new_mob, "You feel more... animalistic")

	qdel(src)

/* Certain mob types have problems and should not be allowed to be controlled by players.
 *
 * This proc is here to force coders to manually place their mob in this list, hopefully tested.
 * This also gives a place to explain -why- players shouldnt be turn into certain mobs and hopefully someone can fix them.
 */
/mob/proc/safe_animal(var/MP)

//Bad mobs! - Remember to add a comment explaining what's wrong with the mob
	if(!MP)
		return 0	//Sanity, this should never happen.

	if(ispath(MP, /mob/living/simple_animal/space_worm))
		return 0 //Unfinished. Very buggy, they seem to just spawn additional space worms everywhere and eating your own tail results in new worms spawning.

	if(ispath(MP, /mob/living/simple_animal/construct/behemoth))
		return 0 //I think this may have been an unfinished WiP or something. These constructs should really have their own class simple_animal/construct/subtype

	if(ispath(MP, /mob/living/simple_animal/construct/armoured))
		return 0 //Verbs do not appear for players. These constructs should really have their own class simple_animal/construct/subtype

	if(ispath(MP, /mob/living/simple_animal/construct/wraith))
		return 0 //Verbs do not appear for players. These constructs should really have their own class simple_animal/construct/subtype

	if(ispath(MP, /mob/living/simple_animal/construct/builder))
		return 0 //Verbs do not appear for players. These constructs should really have their own class simple_animal/construct/subtype

//Good mobs!
	if(ispath(MP, /mob/living/simple_animal/cat))
		return 1
	if(ispath(MP, /mob/living/simple_animal/corgi))
		return 1
	if(ispath(MP, /mob/living/simple_animal/crab))
		return 1
	if(ispath(MP, /mob/living/simple_animal/hostile/carp))
		return 1
	if(ispath(MP, /mob/living/simple_animal/mushroom))
		return 1
	if(ispath(MP, /mob/living/simple_animal/shade))
		return 1
	if(ispath(MP, /mob/living/simple_animal/tomato))
		return 1
	if(ispath(MP, /mob/living/simple_animal/mouse))
		return 1 //It is impossible to pull up the player panel for mice (Fixed! - Nodrak)
	if(ispath(MP, /mob/living/simple_animal/hostile/bear))
		return 1 //Bears will auto-attack mobs, even if they're player controlled (Fixed! - Nodrak)
	if(ispath(MP, /mob/living/simple_animal/parrot))
		return 1 //Parrots are no longer unfinished! -Nodrak

	//Not in here? Must be untested!
	return 0


//This is barely a transformation but probably best file for it.
/mob/living/carbon/human/proc/zombieze()
	ChangeToHusk()
	mutations |= CLUMSY //cause zombie
	add_flies()
	src.apply_effects(stun = 5, stutter = 5)
	src.visible_message("<span class='danger'>\The </big>[src]'s flesh decays before your very eyes, THEY'VE TURNED INTO A PLAGUE ZOMBIE!</big></span>", "<span class='phobia'<big>You... hunger. Not only for flesh, but to spread your disease..FOR GRANDFATHER NURGLE!</big></span>")
	if(src.mind)
		src.mind.special_role = "Poxwalker"
	if(src.stat != DEAD && src.mind)
		var/datum/heretic_deity/nurgle/N = GOD(GOD_NURGLE)
		N.join_forced(src)
	log_admin("[key_name(src)] has transformed into a Poxwalker!")
	Weaken(5)
	if(should_have_organ(BP_HEART))
		vessel.add_reagent(/datum/reagent/blood,species.blood_volume-vessel.total_volume)
	for(var/o in organs)
		var/obj/item/organ/organ = o
		organ.vital = 0
		organ.rejuvenate(1)
		organ.max_damage *= 5
		organ.min_broken_damage *= 5
	verbs += /mob/living/proc/breath_death
	verbs += /mob/living/proc/zombie_eat
/*	verbs += /mob/living/proc/claws */
	src.species.species_flags += SPECIES_FLAG_NO_PAIN|SPECIES_FLAG_NO_POISON|SPECIES_FLAG_NO_SLIP
	src.species.slowdown += 1.5

	if (r_hand)
		drop_from_inventory(r_hand)
	if (l_hand)
		drop_from_inventory(l_hand)
	if (gloves)
		drop_from_inventory(gloves)
	if (wear_id)
		drop_from_inventory(wear_id)
	if (wear_mask)
		drop_from_inventory(wear_mask)
	if (head)
		drop_from_inventory(head)
	if (glasses)
		drop_from_inventory(glasses)

	equip_to_slot(new /obj/item/melee/sword/zombie_claw/zombie_clawr, slot_l_hand)
	equip_to_slot(new /obj/item/melee/sword/zombie_claw, slot_r_hand)
	src.setClickCooldown(DEFAULT_ATTACK_COOLDOWN)
	return
