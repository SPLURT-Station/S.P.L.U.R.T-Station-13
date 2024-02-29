/datum/controller/subsystem/language/proc/AssignLanguage(mob/living/user, client/client)
	if(!CONFIG_GET(number/max_languages) == 0)	//Simply disables everything
		var/list/languages = client.prefs.language.Copy()
		var/list/valid_languages
		var/list/invalid_languages
		if(!length(languages))
			return
		for(var/language in languages)
			var/datum/language/language_datum = LAZYACCESS(SSlanguage.languages_by_name, language)
			if(language_datum)
				if(!language_datum.restricted || (language_datum.name in client.prefs.pref_species.languagewhitelist))
					user.grant_language(language_datum.type, TRUE, TRUE, LANGUAGE_ADDITIONAL)
					LAZYADD(valid_languages, language)
				else
					for(var/datum/quirk/quirk in client.prefs.all_quirks)
						if(language_datum.name in quirk.languagewhitelist)
							user.grant_language(language_datum.type, TRUE, TRUE, LANGUAGE_ADDITIONAL)
							LAZYADD(valid_languages, language)
							continue
					LAZYADD(invalid_languages, language)

			else
				continue
		var/valid_languages_len = LAZYLEN(valid_languages)
		if(valid_languages_len)
			to_chat(client, span_notice("You are able to speak in [english_list(sort_list(valid_languages))]. If you're actually good at [valid_languages_len > 1 ? "them" : "it"] or not, it's up to you."))
		var/invalid_languages_len = LAZYLEN(invalid_languages)
		if(invalid_languages_len)
			to_chat(client, span_warning("[english_list(sort_list(invalid_languages))] [invalid_languages_len > 1 ? "are" : "is a"] restricted language[invalid_languages_len > 1 ? "s" : ""], and ha[invalid_languages_len > 1 ? "ve" : "s"] not been assigned."))
