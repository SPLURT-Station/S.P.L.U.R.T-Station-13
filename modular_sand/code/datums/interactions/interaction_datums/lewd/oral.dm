/datum/interaction/lewd/oral
	description = "Куннилингус."
	require_user_mouth = TRUE
	require_target_vagina = REQUIRE_EXPOSED
	write_log_user = "gave head to"
	write_log_target = "was given head by"
	interaction_sound = null
	max_distance = 1
	var/fucktarget = "vagina"

/datum/interaction/lewd/oral/blowjob
	description = "Отсосать член своего партнёра."
	require_target_vagina = null
	require_target_penis = REQUIRE_EXPOSED
	fucktarget = "penis"

/datum/interaction/lewd/oral/display_interaction(mob/living/user, mob/living/partner)
	var/message
	var/obj/item/organ/genital/genital = null
	var/lust_increase = NORMAL_LUST

	if(partner.is_fucking(user, CUM_TARGET_MOUTH))
		if(prob(partner.get_sexual_potency()))
			user.adjustOxyLoss(3)
			message = "раз за разом проникает всё глубже в \the <b>[partner]</b>."
			lust_increase += 5
		else
			var/improv = FALSE
			switch(fucktarget)
				if("vagina")
					if(partner.has_vagina())
						message = pick(
							"вылизывает киску \the <b>[partner]</b> и громко чавкает.",
							"проводит своим язычком вдоль половых губ \the <b>[partner]</b> и заостряет своё внимание на клиторе.",
							"обводит щель \the <b>[partner]</b> своим горячим язычком.",
							"толкается своим языком к киске \the <b>[partner]</b> и проводит его кончик к самому клитору.",
							"медленно делает круги своим язычком, увлажняя киску \the <b>[partner]</b>.",
							"целует нежные лепестки \the <b>[partner]</b> и миловидно улыбается.",
							"пробует \the <b>[partner]</b> на вкус, шутливо касаясь нежных лепестков зубами.",
						)
					else
						improv = TRUE
				if("penis")
					if(partner.has_penis() || partner.has_strapon())
						message = pick(
							"довольно отсасывает мясо \the <b>[partner]</b>, крепко удерживая орган рукой.",
							"нежно проводит своим язычком вдоль всего органа \the <b>[partner]</b>.",
							"обводит орган \the <b>[partner]</b> своим горячим язычком.",
							"обхватывает головку члена \the <b>[partner]</b> своими губками и с нежностью производит круговые движения язычком.",
							"медленно погружает орган \the <b>[partner]</b> в своё горло вплоть до тугого вздоха и резко вытаскивает его, громко вдыхая",
							"ласково целует орган \the <b>[partner]</b> и миловидно улыбается.",
							"с силой обхватывает орган \the <b>[partner]</b> и пару раз бьёт им себя по рту.",
						)
					else
						improv = TRUE
			if(improv)
				// get confused about how to do the sex
				message = pick(
					"облизывает \the <b>[partner]</b>.",
					"выглядит немного неуверенно в том, куда лизать \the <b>[partner]</b>.",
					"трётся своим язычком в промежности \the <b>[partner]</b> и оставляет после себя слюни.",
					"целует бедро \the <b>[partner]</b> в лёгкой улыбке.",
					"старательно водит своими губами вдоль промежности \the <b>[partner]</b>.",
				)
	else
		var/improv = FALSE
		switch(fucktarget)
			if("vagina")
				if(partner.has_vagina())
					message = pick(
						"довольно облизывается и зарывается своим лицом в киску \the <b>[partner]</b>.",
						"прижимается своим мокрым и достаточно тёплым носиком к промежности \the <b>[partner]</b>.",
						"обнаруживает себя между бёдрами \the <b>[partner]</b> и раз за разом пытается сделать партнёру хорошо.",
						"держится на коленях перед \the <b>[partner]</b> и работает своим язычком.",
						"с силой хватается за ножки \the <b>[partner]</b> и разводит их в стороны.",
						"погружает своё лицо между бёдрами \the <b>[partner]</b> и активно облизывается, проявляя всё больше влаги.",
					)
				else
					improv = TRUE
			if("penis")
				if(partner.has_penis() || partner.has_strapon())
					message = pick(
						"довольно отсасывает мясо \the <b>[partner]</b>, крепко удерживая орган рукой.",
						"нежно проводит своим язычком вдоль всего органа \the <b>[partner]</b>.",
						"обводит орган \the <b>[partner]</b> своим горячим язычком.",
						"обхватывает головку члена \the <b>[partner]</b> своими губками и с нежностью производит круговые движения язычком.",
						"медленно погружает орган \the <b>[partner]</b> в своё горло вплоть до тугого вздоха и резко вытаскивает его, громко вдыхая",
						"ласково целует орган \the <b>[partner]</b> и миловидно улыбается.",
						"с силой обхватывает орган \the <b>[partner]</b> и пару раз бьёт им себя по рту.",
					)
				else
					improv = TRUE
		if(improv)
			message = pick(
				"облизывает \the <b>[partner]</b>.",
				"целует бедро \the <b>[partner]</b> в лёгкой улыбке.",
				"трётся своим язычком в промежности \the <b>[partner]</b> и оставляет после себя слюни.",
				"бросает короткий и довольно озадаченный взгляд между бёдрами \the <b>[partner]</b>.",
				"выглядит немного неуверенно в том, куда лизать \the <b>[partner]</b>. Как же быть в отсутствии гениталий?",
				"хлопает глазами при взгляде в промежность \the <b>[partner]</b> и ожидает, что здесь будет член, киска... или что-то в этом роде.",
			)
			genital = null
		else
			switch(fucktarget)
				if("vagina")
					genital = partner.getorganslot(ORGAN_SLOT_VAGINA)
				if("penis")
					genital = partner.getorganslot(ORGAN_SLOT_PENIS)
		partner.set_is_fucking(user, CUM_TARGET_MOUTH, genital)

	playlewdinteractionsound(get_turf(user), pick('modular_sand/sound/interactions/bj1.ogg',
									'modular_sand/sound/interactions/bj2.ogg',
									'modular_sand/sound/interactions/bj3.ogg',
									'modular_sand/sound/interactions/bj4.ogg',
									'modular_sand/sound/interactions/bj5.ogg',
									'modular_sand/sound/interactions/bj6.ogg',
									'modular_sand/sound/interactions/bj7.ogg',
									'modular_sand/sound/interactions/bj8.ogg',
									'modular_sand/sound/interactions/bj9.ogg',
									'modular_sand/sound/interactions/bj10.ogg',
									'modular_sand/sound/interactions/bj11.ogg'), 50, 1, -1)
	user.visible_message("<span class='lewd'><b>\The [user]</b> [message]</span>", ignored_mobs = user.get_unconsenting())
	if(fucktarget != "penis" || partner.can_penetrating_genital_cum())
		partner.handle_post_sex(lust_increase, CUM_TARGET_MOUTH, user)
