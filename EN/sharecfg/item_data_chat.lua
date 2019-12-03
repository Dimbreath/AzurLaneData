pg = pg or {}
pg.item_data_chat = {
	[0] = {
		name = "Default Appearance",
		time_second = 0,
		id = 0,
		time_limit_type = 0,
		desc = "When no portrait frame is set\n<color=#92fc63>and when an oathed ship is set as secretary ship, the oath portrait frame is displayable.</color>",
		scene = {}
	},
	[101] = {
		name = "1st Anniversary",
		time_second = 0,
		id = 101,
		time_limit_type = 0,
		desc = "Happy 1st Anniversary! \n<color=#A7A7AAFF>Unlocked by using the New Dawn item.</color>",
		scene = {}
	},
	[300] = {
		name = "Leader",
		time_second = 2592000,
		id = 300,
		time_limit_type = 1,
		desc = "Can be unlocked by collecting points from Returnee Missions. (Lasts for 30 days)",
		scene = {}
	},
	[301] = {
		name = "Returnee",
		time_second = 2592000,
		id = 301,
		time_limit_type = 1,
		desc = "Welcome back to the Admiralty, Commander. We expect great things from you.",
		scene = {}
	},
	all = {
		0,
		101,
		300,
		301
	}
}

return
