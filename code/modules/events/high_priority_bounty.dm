/datum/round_event_control/high_priority_bounty
	name = "High Priority Bounty"
	typepath = /datum/round_event/high_priority_bounty
	max_occurrences = 4
	weight = 50
	earliest_start = 10

/datum/round_event/high_priority_bounty/announce(fake)
	priority_announce("Центральное командование выставило заявку с Наградой за Высокоприоритетный Груз. Подробности были отправлены на все Консоли Баунти.", "Программа Баунти Nanotrasen!")

/datum/round_event/high_priority_bounty/start()
	var/datum/bounty/B
	for(var/attempts = 0; attempts < 50; ++attempts)
		B = random_bounty()
		if(!B)
			continue
		B.mark_high_priority(3)
		if(try_add_bounty(B))
			break

