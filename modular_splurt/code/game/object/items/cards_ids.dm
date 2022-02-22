/obj/item/card/id
	var/last_job_switch	/// Last job switch for card's owner

/obj/item/card/id/syndicate/slaver
	name = "\improper Slaver Trader ID"
	desc = "A cheap ID used by slave traders."
	access = list(ACCESS_MAINT_TUNNELS, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_SLAVER)

/obj/item/card/id/syndicate/slaver/leader
	name = "\improper Slaver Master ID"
	desc = "A cheap ID used by slave traders. This guy seems to run the show."
